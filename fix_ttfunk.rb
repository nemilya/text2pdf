module TTFunk
  class File
    def self.open(file_url)
      #cnt = ::File.open(file, "rb") { |f| f.read }
      require 'open-uri'
      cnt = Kernel::open(file_url).read
      new(cnt)
    end
  end
end
