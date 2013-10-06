
require 'traktical/export'
require 'traktical/config'

module TraktICal

  class Program

    def run
      cfg = Config.load
      Exporter.new(cfg).export
    end

  end

end


