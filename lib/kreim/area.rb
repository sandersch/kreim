module Kreim
  class Area
    attr_reader :name, :index, :rooms
    def initialize(index, name, rooms)
      @index = index
      @name  = name
      @rooms = rooms
    end

    def self.current
      find_by_room_id(Room.current.id)
    end

    def self.find_by_room_id(room_id)
      AREAS.find do |area|
        area.rooms.include?(room_id)
      end
    end

    def self.find_by_area_name(area_name)
      AREAS.find do |area|
        area.name == area_name
      end
    end

    def self.in?(room_id)
      find_by_room_id(room_id)
    end

    AREAS = [
      self.new(0, "village", [
        24888, 24900, 24904, 24909, 24935, 24936, 24912, 24919, 24946, 24945, 24952, 24964, 24971,
        24972, 24958, 24959, 24931, 24932, 24966, 24953, 25300, 24901, 24930, 23484, 24941, 23650
      ]),
      self.new(1, "road", [
        24977, 24978, 24989, 24990, 24991, 24994, 24995, 24996, 24998, 25003, 25004, 25020, 25019, 25021,
        24997, 25022, 25029, 25030, 25035, 25042, 25047, 25046, 25043, 25041, 25048, 25049, 25050, 25051,
        25052, 25053, 25054, 25056, 25057, 25058, 25059, 25064, 25055, 25060, 25061, 25062, 25063
      ]),
      self.new(2, "courtyard", [
        25104, 25103, 25101, 25100, 25105, 25102, 25106, 25107, 25108, 25099, 25098, 25097, 25069, 25068, 25070,
        25071, 25072, 25082, 25084, 25083, 25081, 25078, 25085, 25086, 25087, 25088, 25096, 25095, 25094, 25093,
        25092, 25091, 25090, 25089, 25080, 25079, 25077, 25075, 25073, 25076, 25074, 25067, 25066, 25065
      ]),
      self.new(3, "servant", [25113, 25114, 25115, 25119, 25118, 25117, 25116, 25112, 25111, 25110, 25109]),
      self.new(4, "visitor", [25125, 25124, 25123, 25129, 25128, 25127, 25126, 25122, 25121, 25120, 25123]),
      self.new(5, "royal", [25141, 25140, 25132, 25134, 25136, 25135, 25137, 25138, 25139, 25133, 25131, 25130]),
      self.new(6, "throne", [25142]),
      self.new(7, "treasure", [25143]),
      self.new(0, "misc", [24965]),
    ]
    ALL_ROOMS = AREAS.map(&:rooms).flatten
  end
end
