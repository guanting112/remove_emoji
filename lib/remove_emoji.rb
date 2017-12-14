require "remove_emoji/version"
require "remove_emoji/rules"

module RemoveEmoji
  class Sanitize

    def initialize(original_string)
      @original_string = original_string
    end

    def self.call(*args)
      new(*args).sanitize
    end

    def sanitize
      @original_string.gsub(RemoveEmoji::MATCH_EMOJI_CODEPOINTS_RULE, '')
    end

  end
end
