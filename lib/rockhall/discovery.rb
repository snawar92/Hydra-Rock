# Rockhall::Discovery
#
# Provides methods for extracting publically available items in Hydra and indexing them
# into our Blacklight solr index.  Solr documents are simply copied from the Hydra solr index
# to the Blacklight solr index. #addl_solr_fields fields adds additional fields
# that are not present in the Hydra solr document.

class Rockhall::Discovery

  attr_accessor :solr

  # Creates a new Rockhall::Discovery session with a solr connect to the url
  # given in config/rockhall.yml.  Can be overriden by specifying a url:
  #
  # > session = Rockhall::Discovery.new "http://localhost:8985/solr/blacklight-dev"
  # 
  def initialize url = nil
    @solr = url.nil? ? RSolr.connect(:url => RH_CONFIG["solr_discovery"]) : RSolr.connect(:url => url)
  end

  def update pid = nil
    if pid.nil?
      update_all
    else
      add_to_solr pid
    end
  end

  # delete any ActiveFedora objects from the Blacklight index
  def delete
    blacklight_items.each do |r|
      solr.delete_by_id r["id"]
      solr.commit
    end
  end

  # Returns an array of pids that can be exported to Blacklight
  def exports
    ActiveFedora::Base.where(read_access_group_ssim: "public").all.collect { |o| o.pid } + ActiveFedora::Base.where(discover_access_group_ssim: "public").all.collect { |o| o.pid }
  end

  def blacklight_items(solr_params = Hash.new)
    solr_params[:fl]   = "id"
    solr_params[:qt]   = "document"
    solr_params[:rows] = 1000
    solr_params[:q]    = 'active_fedora_model_ssi:"ArchivalVideo"'
    response = @solr.get 'select', :params => solr_params
    return response["response"]["docs"]
  end

  private

  # Deletes all existing Hydra-related documents in Blacklight and adds
  # newly queried ones from Hydra's solr index.
  def update_all
    delete if blacklight_items.count > 0
    self.exports.collect { |pid| add_to_solr(pid) }
    commit
  end

  def add_to_solr pid
    obj = ActiveFedora::Base.find(pid, :cast => true)
    solr.add obj.to_discovery if obj.respond_to? "to_discovery"
  end

  def commit
    solr.commit
    solr.optimize
  end

end
