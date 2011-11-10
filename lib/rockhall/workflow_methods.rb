module Rockhall::WorkflowMethods

  def new_name(pid,file,opts={})
    elements = Array.new
    elements << pid.gsub(/:/,"_")
    elements << opts[:type]  unless opts[:type].nil?
    name = elements.join("_") + File.extname(file)
  end

  def move_content(src,dst,opts={})
    if File.exists?(dst)
      unless opts[:force]
        raise "Destination file exists"
      end
    end
    begin
      FileUtils.cp(src,dst)
    rescue Exception=>e
      raise "move_content for #{src} failed: #{e}"
    end
  end

  def get_file(path)
    if File.exists?(path)
      return File.split(path).last
    else
      return nil
    end
  end

  def parse_date(s)
    begin
      date = DateTime.parse(s)
    rescue
      return nil
    end
    return date.strftime("%Y-%m-%d")
  end

  def parse_ratio(r)
    if r.match(/^\d(.+)\d$/)
      return r.gsub(/ /,"").gsub(/[xX]/, ":")
    end
  end

  def parse_size(s)
    if s.match(/^\d(.+)\d$/)
      unless s.match(/ /)
        return s.gsub(/[xX]/, " x ")
      else
        return s.downcase
      end
    end
  end

  def parse_codec(t)
    terms = Hash.new
    terms = {
      "PCM"  => "Linear Pulse Code Modulation",
      "avc1" => "H.264/MPEG-4 AVC",
      "AAC"  => "MPEG-4: AAC"
    }
    return nil if t.nil?
    if terms.include?(t)
      return terms[t]
    else
      return t
    end
  end

end

