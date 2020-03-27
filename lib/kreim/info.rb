module Kreim
  module Info
    def self.cleared_to=(area)
      @@cleared_to = area
    end

    def self.cleared_to
      @@cleared_to ||= "village"
    end

    def self.cleared_to_index
      index_of(cleared_to)
    end

    def self.cleared_to_throne_room?
      cleared_to_index >= index_of("throne")
    end

    def self.index_of(area_name)
      area = Kreim::Area.find_by_area_name(area_name)

      if area
        area.index
      else
        echo "ERROR: couldn't find index of #{area_name}"
      end
    end

    def self.cleared?
      Kreim::Area.current.index < cleared_to_index
    end

    def self.scrip_count=(num)
      @@scrip_count = num
    end

    def self.scrip_count
      @@scrip_count ||= 0
    end

    def self.max_scrip=(num)
      @@max_scrip = num
    end

    def self.max_scrip
      @@max_scrip
    end

    def self.maxxed_scrip?
      self.scrip_count >= self.max_scrip
    end

    def self.last_wave_at=(wave_time)
      #echo "DEBUG: updating wave spawn time to #{wave_time}"
      @last_wave_at = wave_time
    end

    def self.last_wave_at
      @last_wave_at ||= Time.at(0)
    end

    def self.next_wave_at
      last_wave_at + TIME_BETWEEN_WAVES
    end

    def self.next_wave_in
      (next_wave_at - Time.now).ceil
    end

    TIME_BETWEEN_WAVES = 45

    def self.estimated_wave_interval
      TIME_BETWEEN_WAVES
    end
  end
end
