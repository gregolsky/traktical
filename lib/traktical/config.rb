
require 'yaml'

module TraktICal

  class Config

    CFG_FILE = "~/.traktical"

    def self.cfg_path
      File.expand_path(CFG_FILE)
    end

    def self.create
        cfg = {
            'export file' => '/tmp/trakt.ics',
            'trakt' => { 'api key' => '', 'user' => '' }
        }
        
        File.open(self.cfg_path, 'w') { |f| f.write(YAML.dump(cfg)) }
        puts "Setup your #{CFG_FILE} file and run again."
        exit 0
    end

    def self.load
      path = self.cfg_path
      if File.exists? path
        cfg = YAML.load_file(path)
      else
        create
      end
    end

  end



end
