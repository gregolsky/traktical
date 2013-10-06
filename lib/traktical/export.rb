
require 'date'
require 'ri_cal'

require 'traktical/trakt'

module TraktICal

  class Exporter

    TIMEFRAME = 14

    def initialize(cfg)
      @cfg = cfg
    end

    def export
      api_key, user = @cfg['trakt']['api key'], @cfg['trakt']['user']
      trakt = TraktClient.new(api_key, user)
      episodes = trakt.shows_for(DateTime.now - TIMEFRAME, TIMEFRAME * 2)
      cal = export_to_ical episodes
      File.open(@cfg['export file'], 'w') { |f| f.write(cal.to_s) }
    end

    def export_to_ical(episodes)
      cal = RiCal.Calendar do |cal|
        episodes.each do |episode|
          make_event(cal, episode)  
        end
      end
    end

    def make_event(cal, episode)
      cal.event do |event|
        event.summary     = episode.summary
        event.description = episode.summary
        event.dtstart     = episode.airtime
        event.dtend       = episode.airtime + episode.runtime * 1.0/24/60
      end
    end

  end

end
