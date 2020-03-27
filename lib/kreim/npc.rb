module Kreim
  class NPC < Delegator
    attr_reader :gameobj
    alias_method :__getobj__, :gameobj

    def initialize(gameobj)
      @gameobj = gameobj
    end

    BOSSES_IN = {
      "village" => [
        "Shopkeeper",   "Innkeeper",      "Bartender",      "Patrol Leader",
      ],
      "road"    => [
        "Bandit Lord",  "Bandit Lady",    "Gypsy Queen",    "Gypsy King",         "Guard Captain",
      ],
      "courtyard" => [
        "Wall Captain", "Drill Sergeant", "Stable Hostler", "Dungeon Master",     "Master Torturer",
      ],
      "servant" => [
        "Butler",       "Cook",
      ],
      "visitor" => [
        "Knight Captain", "Foreign Dignitary",
      ],
      "royal" => [
        "Royal Prince", "Royal Princess", "Royal Jester",
      ],
      "throne" => [
        "Royal Empress", "Royal Emperor",
        "berserk Royal Empress", "berserk Royal Emperor",
      ]
    }

    BOSS_NAMES = BOSSES_IN.values.flatten
    ROYAL_NAMES = BOSSES_IN["throne"]

    def boss?
      self.class.boss?(gameobj.name)
    end

    def self.boss?(npc_name)
      BOSS_NAMES.include?(npc_name)
    end

    def royal?
      self.class.royal?(gameobj.name)
    end

    def self.royal?(npc_name)
      ROYAL_NAMES.include?(npc_name)
    end

    def reim?
      gameobj.type.include?("reim")
    end

    def self.all
      GameObj.npcs.select do |npc|
        npc.type.include?("reim") &&
          !%w[gone dead].include?(npc.status)
      end.map do |gameobj|
        self.new(gameobj)
      end
    end

    def self.any?
      all.any?
    end

    def self.boss
      all.find { |npc| npc.boss? }
    end

    def self.royals
      all.select { |npc| npc.royal? }
    end

    def self.wing_of(boss_name)
      wing, names = BOSSES_IN.find do |(wing, names)|
        names.include?(boss_name)
      end
      wing
    end
  end
end
