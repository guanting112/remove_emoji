require "remove_emoji/version"
require "remove_emoji/rules"

module RemoveEmoji

  def self.remove(string)
    string.gsub(RemoveEmoji::MATCH_EMOJI_CODEPOINTS_RULE, '')
  end
  
end
