require 'spec_helper'

RSpec.describe 'RemoveEmoji' do
  describe 'Test remove method with general text to ensure normal operation' do
    it 'must handle emoji 15, 17 standards' do
      original_string = <<-STRING
👩‍🦽‍➡️ E15.1 woman in manual wheelchair facing right
👩‍🦽‍➡ E15.1 woman in manual wheelchair facing right
👩🏻‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: light skin tone
👩🏻‍🦽‍➡ E15.1 woman in manual wheelchair facing right: light skin tone
👩🏼‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium-light skin tone
👩🏼‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium-light skin tone
👩🏽‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium skin tone
👩🏽‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium skin tone
👩🏾‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium-dark skin tone
👩🏾‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium-dark skin tone
👩🏿‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: dark skin tone
🫜 E16.0 root vegetable
🫩 E16.0 face with bags under eyes
🧑‍🩰 E17.0 ballet dancer
🧑🏻‍🩰 E17.0 ballet dancer: light skin tone
🧑🏼‍🩰 E17.0 ballet dancer: medium-light skin tone
🧑🏽‍🩰 E17.0 ballet dancer: medium skin tone
🧑🏾‍🩰 E17.0 ballet dancer: medium-dark skin tone
🧑🏿‍🩰 E17.0 ballet dancer: dark skin tone
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      sanitized_string.split("\n").each do |line|
         index = line =~ /^ (?:E15\.1|E16\.0|E17\.0)/
         expect(index).to eq(0)
      end
    end

    it 'must handle emoji 13.1 standard' do
      original_string = <<-STRING
😶‍🌫️ E13.1 face in clouds
😶‍🌫 E13.1 face in clouds
😮‍💨 E13.1 face exhaling
😵‍💫 E13.1 face with spiral eyes
❤️‍🔥 E13.1 heart on fire
❤‍🔥 E13.1 heart on fire
❤️‍🩹 E13.1 mending heart
❤‍🩹 E13.1 mending heart
🧔‍♂️ E13.1 man: beard
🧔‍♂ E13.1 man: beard
🧔🏻‍♂️ E13.1 man: light skin tone, beard
🧔🏻‍♂ E13.1 man: light skin tone, beard
🧔🏼‍♂️ E13.1 man: medium-light skin tone, beard
🧔🏼‍♂ E13.1 man: medium-light skin tone, beard
🧔🏽‍♂️ E13.1 man: medium skin tone, beard
🧔🏽‍♂ E13.1 man: medium skin tone, beard
🧔🏾‍♂️ E13.1 man: medium-dark skin tone, beard
🧔🏾‍♂ E13.1 man: medium-dark skin tone, beard
🧔🏿‍♂️ E13.1 man: dark skin tone, beard
🧔🏿‍♂ E13.1 man: dark skin tone, beard
🧔‍♀️ E13.1 woman: beard
🧔‍♀ E13.1 woman: beard
🧔🏻‍♀️ E13.1 woman: light skin tone, beard
🧔🏻‍♀ E13.1 woman: light skin tone, beard
🧔🏼‍♀️ E13.1 woman: medium-light skin tone, beard
🧔🏼‍♀ E13.1 woman: medium-light skin tone, beard
🧔🏽‍♀️ E13.1 woman: medium skin tone, beard
🧔🏽‍♀ E13.1 woman: medium skin tone, beard
🧔🏾‍♀️ E13.1 woman: medium-dark skin tone, beard
🧔🏾‍♀ E13.1 woman: medium-dark skin tone, beard
🧔🏿‍♀️ E13.1 woman: dark skin tone, beard
🧔🏿‍♀ E13.1 woman: dark skin tone, beard
💏🏻 E13.1 kiss: light skin tone
💏🏼 E13.1 kiss: medium-light skin tone
💏🏽 E13.1 kiss: medium skin tone
💏🏾 E13.1 kiss: medium-dark skin tone
💏🏿 E13.1 kiss: dark skin tone
🧑🏻‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, light skin tone, medium-light skin tone
🧑🏻‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, light skin tone, medium-light skin tone
🧑🏻‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, light skin tone, medium skin tone
🧑🏻‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, light skin tone, medium skin tone
🧑🏻‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, light skin tone, medium-dark skin tone
🧑🏻‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, light skin tone, medium-dark skin tone
🧑🏻‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, light skin tone, dark skin tone
🧑🏻‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, light skin tone, dark skin tone
🧑🏼‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium-light skin tone, light skin tone
🧑🏼‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium-light skin tone, light skin tone
🧑🏼‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, medium-light skin tone, medium skin tone
🧑🏼‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, medium-light skin tone, medium skin tone
🧑🏼‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, medium-light skin tone, medium-dark skin tone
🧑🏼‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, medium-light skin tone, medium-dark skin tone
🧑🏼‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium-light skin tone, dark skin tone
🧑🏼‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium-light skin tone, dark skin tone
🧑🏽‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium skin tone, light skin tone
🧑🏽‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium skin tone, light skin tone
🧑🏽‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, medium skin tone, medium-light skin tone
🧑🏽‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, medium skin tone, medium-light skin tone
🧑🏽‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, medium skin tone, medium-dark skin tone
🧑🏽‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, medium skin tone, medium-dark skin tone
🧑🏽‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium skin tone, dark skin tone
🧑🏽‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium skin tone, dark skin tone
🧑🏾‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium-dark skin tone, light skin tone
🧑🏾‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium-dark skin tone, light skin tone
🧑🏾‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, medium-dark skin tone, medium-light skin tone
🧑🏾‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, medium-dark skin tone, medium-light skin tone
🧑🏾‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, medium-dark skin tone, medium skin tone
🧑🏾‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, medium-dark skin tone, medium skin tone
🧑🏾‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium-dark skin tone, dark skin tone
🧑🏾‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium-dark skin tone, dark skin tone
🧑🏿‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, dark skin tone, light skin tone
🧑🏿‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, dark skin tone, light skin tone
🧑🏿‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, dark skin tone, medium-light skin tone
🧑🏿‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, dark skin tone, medium-light skin tone
🧑🏿‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, dark skin tone, medium skin tone
🧑🏿‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, dark skin tone, medium skin tone
🧑🏿‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, dark skin tone, medium-dark skin tone
🧑🏿‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, dark skin tone, medium-dark skin tone
👩🏻‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, light skin tone
👩🏻‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, light skin tone
👩🏻‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, light skin tone, medium-light skin tone
👩🏻‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, light skin tone, medium-light skin tone
👩🏻‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, light skin tone, medium skin tone
👩🏻‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, light skin tone, medium skin tone
👩🏻‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, light skin tone, medium-dark skin tone
👩🏻‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, light skin tone, medium-dark skin tone
👩🏻‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, light skin tone, dark skin tone
👩🏻‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, light skin tone, dark skin tone
👩🏼‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium-light skin tone, light skin tone
👩🏼‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium-light skin tone, light skin tone
👩🏼‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium-light skin tone
👩🏼‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium-light skin tone
👩🏼‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium-light skin tone, medium skin tone
👩🏼‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium-light skin tone, medium skin tone
👩🏼‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium-light skin tone, medium-dark skin tone
👩🏼‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium-light skin tone, medium-dark skin tone
👩🏼‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium-light skin tone, dark skin tone
👩🏼‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium-light skin tone, dark skin tone
👩🏽‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium skin tone, light skin tone
👩🏽‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium skin tone, light skin tone
👩🏽‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium skin tone, medium-light skin tone
👩🏽‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium skin tone, medium-light skin tone
👩🏽‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium skin tone
👩🏽‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium skin tone
👩🏽‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium skin tone, medium-dark skin tone
👩🏽‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium skin tone, medium-dark skin tone
👩🏽‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium skin tone, dark skin tone
👩🏽‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium skin tone, dark skin tone
👩🏾‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium-dark skin tone, light skin tone
👩🏾‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium-dark skin tone, light skin tone
👩🏾‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium-dark skin tone, medium-light skin tone
👩🏾‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium-dark skin tone, medium-light skin tone
👩🏾‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium-dark skin tone, medium skin tone
👩🏾‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium-dark skin tone, medium skin tone
👩🏾‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium-dark skin tone
👩🏾‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium-dark skin tone
👩🏾‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium-dark skin tone, dark skin tone
👩🏾‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium-dark skin tone, dark skin tone
👩🏿‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, dark skin tone, light skin tone
👩🏿‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, dark skin tone, light skin tone
👩🏿‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, dark skin tone, medium-light skin tone
👩🏿‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, dark skin tone, medium-light skin tone
👩🏿‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, dark skin tone, medium skin tone
👩🏿‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, dark skin tone, medium skin tone
👩🏿‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, dark skin tone, medium-dark skin tone
👩🏿‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, dark skin tone, medium-dark skin tone
👩🏿‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, dark skin tone
👩🏿‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, dark skin tone
👨🏻‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, light skin tone
👨🏻‍❤‍💋‍👨🏻 E13.1 kiss: man, man, light skin tone
👨🏻‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, light skin tone, medium-light skin tone
👨🏻‍❤‍💋‍👨🏼 E13.1 kiss: man, man, light skin tone, medium-light skin tone
👨🏻‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, light skin tone, medium skin tone
👨🏻‍❤‍💋‍👨🏽 E13.1 kiss: man, man, light skin tone, medium skin tone
👨🏻‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, light skin tone, medium-dark skin tone
👨🏻‍❤‍💋‍👨🏾 E13.1 kiss: man, man, light skin tone, medium-dark skin tone
👨🏻‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, light skin tone, dark skin tone
👨🏻‍❤‍💋‍👨🏿 E13.1 kiss: man, man, light skin tone, dark skin tone
👨🏼‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium-light skin tone, light skin tone
👨🏼‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium-light skin tone, light skin tone
👨🏼‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium-light skin tone
👨🏼‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium-light skin tone
👨🏼‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium-light skin tone, medium skin tone
👨🏼‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium-light skin tone, medium skin tone
👨🏼‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium-light skin tone, medium-dark skin tone
👨🏼‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium-light skin tone, medium-dark skin tone
👨🏼‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium-light skin tone, dark skin tone
👨🏼‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium-light skin tone, dark skin tone
👨🏽‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium skin tone, light skin tone
👨🏽‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium skin tone, light skin tone
👨🏽‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium skin tone, medium-light skin tone
👨🏽‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium skin tone, medium-light skin tone
👨🏽‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium skin tone
👨🏽‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium skin tone
👨🏽‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium skin tone, medium-dark skin tone
👨🏽‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium skin tone, medium-dark skin tone
👨🏽‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium skin tone, dark skin tone
👨🏽‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium skin tone, dark skin tone
👨🏾‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium-dark skin tone, light skin tone
👨🏾‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium-dark skin tone, light skin tone
👨🏾‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium-dark skin tone, medium-light skin tone
👨🏾‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium-dark skin tone, medium-light skin tone
👨🏾‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium-dark skin tone, medium skin tone
👨🏾‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium-dark skin tone, medium skin tone
👨🏾‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium-dark skin tone
👨🏾‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium-dark skin tone
👨🏾‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium-dark skin tone, dark skin tone
👨🏾‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium-dark skin tone, dark skin tone
👨🏿‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, dark skin tone, light skin tone
👨🏿‍❤‍💋‍👨🏻 E13.1 kiss: man, man, dark skin tone, light skin tone
👨🏿‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, dark skin tone, medium-light skin tone
👨🏿‍❤‍💋‍👨🏼 E13.1 kiss: man, man, dark skin tone, medium-light skin tone
👨🏿‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, dark skin tone, medium skin tone
👨🏿‍❤‍💋‍👨🏽 E13.1 kiss: man, man, dark skin tone, medium skin tone
👨🏿‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, dark skin tone, medium-dark skin tone
👨🏿‍❤‍💋‍👨🏾 E13.1 kiss: man, man, dark skin tone, medium-dark skin tone
👨🏿‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, dark skin tone
👨🏿‍❤‍💋‍👨🏿 E13.1 kiss: man, man, dark skin tone
👩🏻‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, light skin tone
👩🏻‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, light skin tone
👩🏻‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, light skin tone, medium-light skin tone
👩🏻‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, light skin tone, medium-light skin tone
👩🏻‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, light skin tone, medium skin tone
👩🏻‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, light skin tone, medium skin tone
👩🏻‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, light skin tone, medium-dark skin tone
👩🏻‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, light skin tone, medium-dark skin tone
👩🏻‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, light skin tone, dark skin tone
👩🏻‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, light skin tone, dark skin tone
👩🏼‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-light skin tone, light skin tone
👩🏼‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-light skin tone, light skin tone
👩🏼‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-light skin tone
👩🏼‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-light skin tone
👩🏼‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-light skin tone, medium skin tone
👩🏼‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-light skin tone, medium skin tone
👩🏼‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-light skin tone, medium-dark skin tone
👩🏼‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-light skin tone, medium-dark skin tone
👩🏼‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-light skin tone, dark skin tone
👩🏼‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-light skin tone, dark skin tone
👩🏽‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium skin tone, light skin tone
👩🏽‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium skin tone, light skin tone
👩🏽‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium skin tone, medium-light skin tone
👩🏽‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium skin tone, medium-light skin tone
👩🏽‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium skin tone
👩🏽‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium skin tone
👩🏽‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium skin tone, medium-dark skin tone
👩🏽‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium skin tone, medium-dark skin tone
👩🏽‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium skin tone, dark skin tone
👩🏽‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium skin tone, dark skin tone
👩🏾‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-dark skin tone, light skin tone
👩🏾‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-dark skin tone, light skin tone
👩🏾‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-dark skin tone, medium-light skin tone
👩🏾‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-dark skin tone, medium-light skin tone
👩🏾‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-dark skin tone, medium skin tone
👩🏾‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-dark skin tone, medium skin tone
👩🏾‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-dark skin tone
👩🏾‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-dark skin tone
👩🏾‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-dark skin tone, dark skin tone
👩🏾‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-dark skin tone, dark skin tone
👩🏿‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, dark skin tone, light skin tone
👩🏿‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, dark skin tone, light skin tone
👩🏿‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, dark skin tone, medium-light skin tone
👩🏿‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, dark skin tone, medium-light skin tone
👩🏿‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, dark skin tone, medium skin tone
👩🏿‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, dark skin tone, medium skin tone
👩🏿‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, dark skin tone, medium-dark skin tone
👩🏿‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, dark skin tone, medium-dark skin tone
👩🏿‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, dark skin tone
👩🏿‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, dark skin tone
💑🏻 E13.1 couple with heart: light skin tone
💑🏼 E13.1 couple with heart: medium-light skin tone
💑🏽 E13.1 couple with heart: medium skin tone
💑🏾 E13.1 couple with heart: medium-dark skin tone
💑🏿 E13.1 couple with heart: dark skin tone
🧑🏻‍❤️‍🧑🏼 E13.1 couple with heart: person, person, light skin tone, medium-light skin tone
🧑🏻‍❤‍🧑🏼 E13.1 couple with heart: person, person, light skin tone, medium-light skin tone
🧑🏻‍❤️‍🧑🏽 E13.1 couple with heart: person, person, light skin tone, medium skin tone
🧑🏻‍❤‍🧑🏽 E13.1 couple with heart: person, person, light skin tone, medium skin tone
🧑🏻‍❤️‍🧑🏾 E13.1 couple with heart: person, person, light skin tone, medium-dark skin tone
🧑🏻‍❤‍🧑🏾 E13.1 couple with heart: person, person, light skin tone, medium-dark skin tone
🧑🏻‍❤️‍🧑🏿 E13.1 couple with heart: person, person, light skin tone, dark skin tone
🧑🏻‍❤‍🧑🏿 E13.1 couple with heart: person, person, light skin tone, dark skin tone
🧑🏼‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium-light skin tone, light skin tone
🧑🏼‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium-light skin tone, light skin tone
🧑🏼‍❤️‍🧑🏽 E13.1 couple with heart: person, person, medium-light skin tone, medium skin tone
🧑🏼‍❤‍🧑🏽 E13.1 couple with heart: person, person, medium-light skin tone, medium skin tone
🧑🏼‍❤️‍🧑🏾 E13.1 couple with heart: person, person, medium-light skin tone, medium-dark skin tone
🧑🏼‍❤‍🧑🏾 E13.1 couple with heart: person, person, medium-light skin tone, medium-dark skin tone
🧑🏼‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium-light skin tone, dark skin tone
🧑🏼‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium-light skin tone, dark skin tone
🧑🏽‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium skin tone, light skin tone
🧑🏽‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium skin tone, light skin tone
🧑🏽‍❤️‍🧑🏼 E13.1 couple with heart: person, person, medium skin tone, medium-light skin tone
🧑🏽‍❤‍🧑🏼 E13.1 couple with heart: person, person, medium skin tone, medium-light skin tone
🧑🏽‍❤️‍🧑🏾 E13.1 couple with heart: person, person, medium skin tone, medium-dark skin tone
🧑🏽‍❤‍🧑🏾 E13.1 couple with heart: person, person, medium skin tone, medium-dark skin tone
🧑🏽‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium skin tone, dark skin tone
🧑🏽‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium skin tone, dark skin tone
🧑🏾‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium-dark skin tone, light skin tone
🧑🏾‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium-dark skin tone, light skin tone
🧑🏾‍❤️‍🧑🏼 E13.1 couple with heart: person, person, medium-dark skin tone, medium-light skin tone
🧑🏾‍❤‍🧑🏼 E13.1 couple with heart: person, person, medium-dark skin tone, medium-light skin tone
🧑🏾‍❤️‍🧑🏽 E13.1 couple with heart: person, person, medium-dark skin tone, medium skin tone
🧑🏾‍❤‍🧑🏽 E13.1 couple with heart: person, person, medium-dark skin tone, medium skin tone
🧑🏾‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium-dark skin tone, dark skin tone
🧑🏾‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium-dark skin tone, dark skin tone
🧑🏿‍❤️‍🧑🏻 E13.1 couple with heart: person, person, dark skin tone, light skin tone
🧑🏿‍❤‍🧑🏻 E13.1 couple with heart: person, person, dark skin tone, light skin tone
🧑🏿‍❤️‍🧑🏼 E13.1 couple with heart: person, person, dark skin tone, medium-light skin tone
🧑🏿‍❤‍🧑🏼 E13.1 couple with heart: person, person, dark skin tone, medium-light skin tone
🧑🏿‍❤️‍🧑🏽 E13.1 couple with heart: person, person, dark skin tone, medium skin tone
🧑🏿‍❤‍🧑🏽 E13.1 couple with heart: person, person, dark skin tone, medium skin tone
🧑🏿‍❤️‍🧑🏾 E13.1 couple with heart: person, person, dark skin tone, medium-dark skin tone
🧑🏿‍❤‍🧑🏾 E13.1 couple with heart: person, person, dark skin tone, medium-dark skin tone
👩🏻‍❤️‍👨🏻 E13.1 couple with heart: woman, man, light skin tone
👩🏻‍❤‍👨🏻 E13.1 couple with heart: woman, man, light skin tone
👩🏻‍❤️‍👨🏼 E13.1 couple with heart: woman, man, light skin tone, medium-light skin tone
👩🏻‍❤‍👨🏼 E13.1 couple with heart: woman, man, light skin tone, medium-light skin tone
👩🏻‍❤️‍👨🏽 E13.1 couple with heart: woman, man, light skin tone, medium skin tone
👩🏻‍❤‍👨🏽 E13.1 couple with heart: woman, man, light skin tone, medium skin tone
👩🏻‍❤️‍👨🏾 E13.1 couple with heart: woman, man, light skin tone, medium-dark skin tone
👩🏻‍❤‍👨🏾 E13.1 couple with heart: woman, man, light skin tone, medium-dark skin tone
👩🏻‍❤️‍👨🏿 E13.1 couple with heart: woman, man, light skin tone, dark skin tone
👩🏻‍❤‍👨🏿 E13.1 couple with heart: woman, man, light skin tone, dark skin tone
👩🏼‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium-light skin tone, light skin tone
👩🏼‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium-light skin tone, light skin tone
👩🏼‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium-light skin tone
👩🏼‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium-light skin tone
👩🏼‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium-light skin tone, medium skin tone
👩🏼‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium-light skin tone, medium skin tone
👩🏼‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium-light skin tone, medium-dark skin tone
👩🏼‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium-light skin tone, medium-dark skin tone
👩🏼‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium-light skin tone, dark skin tone
👩🏼‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium-light skin tone, dark skin tone
👩🏽‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium skin tone, light skin tone
👩🏽‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium skin tone, light skin tone
👩🏽‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium skin tone, medium-light skin tone
👩🏽‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium skin tone, medium-light skin tone
👩🏽‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium skin tone
👩🏽‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium skin tone
👩🏽‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium skin tone, medium-dark skin tone
👩🏽‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium skin tone, medium-dark skin tone
👩🏽‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium skin tone, dark skin tone
👩🏽‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium skin tone, dark skin tone
👩🏾‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium-dark skin tone, light skin tone
👩🏾‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium-dark skin tone, light skin tone
👩🏾‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium-dark skin tone, medium-light skin tone
👩🏾‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium-dark skin tone, medium-light skin tone
👩🏾‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium-dark skin tone, medium skin tone
👩🏾‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium-dark skin tone, medium skin tone
👩🏾‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium-dark skin tone
👩🏾‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium-dark skin tone
👩🏾‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium-dark skin tone, dark skin tone
👩🏾‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium-dark skin tone, dark skin tone
👩🏿‍❤️‍👨🏻 E13.1 couple with heart: woman, man, dark skin tone, light skin tone
👩🏿‍❤‍👨🏻 E13.1 couple with heart: woman, man, dark skin tone, light skin tone
👩🏿‍❤️‍👨🏼 E13.1 couple with heart: woman, man, dark skin tone, medium-light skin tone
👩🏿‍❤‍👨🏼 E13.1 couple with heart: woman, man, dark skin tone, medium-light skin tone
👩🏿‍❤️‍👨🏽 E13.1 couple with heart: woman, man, dark skin tone, medium skin tone
👩🏿‍❤‍👨🏽 E13.1 couple with heart: woman, man, dark skin tone, medium skin tone
👩🏿‍❤️‍👨🏾 E13.1 couple with heart: woman, man, dark skin tone, medium-dark skin tone
👩🏿‍❤‍👨🏾 E13.1 couple with heart: woman, man, dark skin tone, medium-dark skin tone
👩🏿‍❤️‍👨🏿 E13.1 couple with heart: woman, man, dark skin tone
👩🏿‍❤‍👨🏿 E13.1 couple with heart: woman, man, dark skin tone
👨🏻‍❤️‍👨🏻 E13.1 couple with heart: man, man, light skin tone
👨🏻‍❤‍👨🏻 E13.1 couple with heart: man, man, light skin tone
👨🏻‍❤️‍👨🏼 E13.1 couple with heart: man, man, light skin tone, medium-light skin tone
👨🏻‍❤‍👨🏼 E13.1 couple with heart: man, man, light skin tone, medium-light skin tone
👨🏻‍❤️‍👨🏽 E13.1 couple with heart: man, man, light skin tone, medium skin tone
👨🏻‍❤‍👨🏽 E13.1 couple with heart: man, man, light skin tone, medium skin tone
👨🏻‍❤️‍👨🏾 E13.1 couple with heart: man, man, light skin tone, medium-dark skin tone
👨🏻‍❤‍👨🏾 E13.1 couple with heart: man, man, light skin tone, medium-dark skin tone
👨🏻‍❤️‍👨🏿 E13.1 couple with heart: man, man, light skin tone, dark skin tone
👨🏻‍❤‍👨🏿 E13.1 couple with heart: man, man, light skin tone, dark skin tone
👨🏼‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium-light skin tone, light skin tone
👨🏼‍❤‍👨🏻 E13.1 couple with heart: man, man, medium-light skin tone, light skin tone
👨🏼‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium-light skin tone
👨🏼‍❤‍👨🏼 E13.1 couple with heart: man, man, medium-light skin tone
👨🏼‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium-light skin tone, medium skin tone
👨🏼‍❤‍👨🏽 E13.1 couple with heart: man, man, medium-light skin tone, medium skin tone
👨🏼‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium-light skin tone, medium-dark skin tone
👨🏼‍❤‍👨🏾 E13.1 couple with heart: man, man, medium-light skin tone, medium-dark skin tone
👨🏼‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium-light skin tone, dark skin tone
👨🏼‍❤‍👨🏿 E13.1 couple with heart: man, man, medium-light skin tone, dark skin tone
👨🏽‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium skin tone, light skin tone
👨🏽‍❤‍👨🏻 E13.1 couple with heart: man, man, medium skin tone, light skin tone
👨🏽‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium skin tone, medium-light skin tone
👨🏽‍❤‍👨🏼 E13.1 couple with heart: man, man, medium skin tone, medium-light skin tone
👨🏽‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium skin tone
👨🏽‍❤‍👨🏽 E13.1 couple with heart: man, man, medium skin tone
👨🏽‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium skin tone, medium-dark skin tone
👨🏽‍❤‍👨🏾 E13.1 couple with heart: man, man, medium skin tone, medium-dark skin tone
👨🏽‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium skin tone, dark skin tone
👨🏽‍❤‍👨🏿 E13.1 couple with heart: man, man, medium skin tone, dark skin tone
👨🏾‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium-dark skin tone, light skin tone
👨🏾‍❤‍👨🏻 E13.1 couple with heart: man, man, medium-dark skin tone, light skin tone
👨🏾‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium-dark skin tone, medium-light skin tone
👨🏾‍❤‍👨🏼 E13.1 couple with heart: man, man, medium-dark skin tone, medium-light skin tone
👨🏾‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium-dark skin tone, medium skin tone
👨🏾‍❤‍👨🏽 E13.1 couple with heart: man, man, medium-dark skin tone, medium skin tone
👨🏾‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium-dark skin tone
👨🏾‍❤‍👨🏾 E13.1 couple with heart: man, man, medium-dark skin tone
👨🏾‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium-dark skin tone, dark skin tone
👨🏾‍❤‍👨🏿 E13.1 couple with heart: man, man, medium-dark skin tone, dark skin tone
👨🏿‍❤️‍👨🏻 E13.1 couple with heart: man, man, dark skin tone, light skin tone
👨🏿‍❤‍👨🏻 E13.1 couple with heart: man, man, dark skin tone, light skin tone
👨🏿‍❤️‍👨🏼 E13.1 couple with heart: man, man, dark skin tone, medium-light skin tone
👨🏿‍❤‍👨🏼 E13.1 couple with heart: man, man, dark skin tone, medium-light skin tone
👨🏿‍❤️‍👨🏽 E13.1 couple with heart: man, man, dark skin tone, medium skin tone
👨🏿‍❤‍👨🏽 E13.1 couple with heart: man, man, dark skin tone, medium skin tone
👨🏿‍❤️‍👨🏾 E13.1 couple with heart: man, man, dark skin tone, medium-dark skin tone
👨🏿‍❤‍👨🏾 E13.1 couple with heart: man, man, dark skin tone, medium-dark skin tone
👨🏿‍❤️‍👨🏿 E13.1 couple with heart: man, man, dark skin tone
👨🏿‍❤‍👨🏿 E13.1 couple with heart: man, man, dark skin tone
👩🏻‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, light skin tone
👩🏻‍❤‍👩🏻 E13.1 couple with heart: woman, woman, light skin tone
👩🏻‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, light skin tone, medium-light skin tone
👩🏻‍❤‍👩🏼 E13.1 couple with heart: woman, woman, light skin tone, medium-light skin tone
👩🏻‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, light skin tone, medium skin tone
👩🏻‍❤‍👩🏽 E13.1 couple with heart: woman, woman, light skin tone, medium skin tone
👩🏻‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, light skin tone, medium-dark skin tone
👩🏻‍❤‍👩🏾 E13.1 couple with heart: woman, woman, light skin tone, medium-dark skin tone
👩🏻‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, light skin tone, dark skin tone
👩🏻‍❤‍👩🏿 E13.1 couple with heart: woman, woman, light skin tone, dark skin tone
👩🏼‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium-light skin tone, light skin tone
👩🏼‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium-light skin tone, light skin tone
👩🏼‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium-light skin tone
👩🏼‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium-light skin tone
👩🏼‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium-light skin tone, medium skin tone
👩🏼‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium-light skin tone, medium skin tone
👩🏼‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium-light skin tone, medium-dark skin tone
👩🏼‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium-light skin tone, medium-dark skin tone
👩🏼‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium-light skin tone, dark skin tone
👩🏼‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium-light skin tone, dark skin tone
👩🏽‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium skin tone, light skin tone
👩🏽‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium skin tone, light skin tone
👩🏽‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium skin tone, medium-light skin tone
👩🏽‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium skin tone, medium-light skin tone
👩🏽‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium skin tone
👩🏽‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium skin tone
👩🏽‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium skin tone, medium-dark skin tone
👩🏽‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium skin tone, medium-dark skin tone
👩🏽‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium skin tone, dark skin tone
👩🏽‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium skin tone, dark skin tone
👩🏾‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium-dark skin tone, light skin tone
👩🏾‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium-dark skin tone, light skin tone
👩🏾‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium-light skin tone
👩🏾‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium-light skin tone
👩🏾‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium skin tone
👩🏾‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium skin tone
👩🏾‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium-dark skin tone
👩🏾‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium-dark skin tone
👩🏾‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium-dark skin tone, dark skin tone
👩🏾‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium-dark skin tone, dark skin tone
👩🏿‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, dark skin tone, light skin tone
👩🏿‍❤‍👩🏻 E13.1 couple with heart: woman, woman, dark skin tone, light skin tone
👩🏿‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, dark skin tone, medium-light skin tone
👩🏿‍❤‍👩🏼 E13.1 couple with heart: woman, woman, dark skin tone, medium-light skin tone
👩🏿‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, dark skin tone, medium skin tone
👩🏿‍❤‍👩🏽 E13.1 couple with heart: woman, woman, dark skin tone, medium skin tone
👩🏿‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, dark skin tone, medium-dark skin tone
👩🏿‍❤‍👩🏾 E13.1 couple with heart: woman, woman, dark skin tone, medium-dark skin tone
👩🏿‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, dark skin tone
👩🏿‍❤‍👩🏿 E13.1 couple with heart: woman, woman, dark skin tone
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      sanitized_string.split("\n").each do |line|
         index = line =~ /^ E13\.1/
         expect(index).to eq(0)
      end
    end

    it 'must handle emoji 13.0 beta standard' do

      original_string = <<-STRING
[[["😀"],["😃"],["😄"],["😁"],["😆"],["😅"],["🤣"],["😂"],["🙂"],["🙃"],["😉"],["😊"],["😇"],["🥰"],["😍"],["🤩"],["😘"],["😗"],["☺️"],["☺"],["😚"],["😙"],["🥲"],["😋"],["😛"],["😜"],["🤪"],["😝"],["🤑"],["🤗"],["🤭"],["🤫"],["🤔"],["🤐"],["🤨"],["😐"],["😑"],["😶"],["😏"],["😒"],["🙄"],["😬"],["🤥"],["😌"],["😔"],["😪"],["🤤"],["😴"],["😷"],["🤒"],["🤕"],["🤢"],["🤮"],["🤧"],["🥵"],["🥶"],["🥴"],["😵"],["🤯"],["🤠"],["🥷"],["🥳"],["🥸"],["😎"],["🤓"],["🧐"],["😕"],["😟"],["🙁"],["☹️"],["☹"],["😮"],["😯"],["😲"],["😳"],["🥺"],["😦"],["😧"],["😨"],["😰"],["😥"],["😢"],["😭"],["😱"],["😖"],["😣"],["😞"],["😓"],["😩"],["😫"],["🥱"],["😤"],["😡"],["😠"],["🤬"],["😈"],["👿"],["💀"],["☠️"],["☠"],["💩"],["🤡"],["👹"],["👺"],["👻"],["👽"],["👾"],["🤖"],["😺"],["😸"],["😹"],["😻"],["😼"],["😽"],["🙀"],["😿"],["😾"],["🙈"],["🙉"],["🙊"],["💋"],["💌"],["💘"],["💝"],["💖"],["💗"],["💓"],["💞"],["💕"],["💟"],["❣️"],["❣"],["💔"],["❤️"],["❤"],["🧡"],["💛"],["💚"],["💙"],["💜"],["🤎"],["🖤"],["🤍"],["💯"],["💢"],["💥"],["💫"],["💦"],["💨"],["🕳️"],["🕳"],["💣"],["💬"],["👁️‍🗨️"],["👁‍🗨️"],["👁️‍🗨"],["👁‍🗨"],["🗨️"],["🗨"],["🗯️"],["🗯"],["💭"],["💤"]],[["👋"],["👋🏻"],["👋🏼"],["👋🏽"],["👋🏾"],["👋🏿"],["🤚"],["🤚🏻"],["🤚🏼"],["🤚🏽"],["🤚🏾"],["🤚🏿"],["🖐️"],["🖐"],["🖐🏻"],["🖐🏼"],["🖐🏽"],["🖐🏾"],["🖐🏿"],["✋"],["✋🏻"],["✋🏼"],["✋🏽"],["✋🏾"],["✋🏿"],["🖖"],["🖖🏻"],["🖖🏼"],["🖖🏽"],["🖖🏾"],["🖖🏿"],["👌"],["👌🏻"],["👌🏼"],["👌🏽"],["👌🏾"],["👌🏿"],["🤌"],["🤌🏻"],["🤌🏼"],["🤌🏽"],["🤌🏾"],["🤌🏿"],["🤏"],["🤏🏻"],["🤏🏼"],["🤏🏽"],["🤏🏾"],["🤏🏿"],["✌️"],["✌"],["✌🏻"],["✌🏼"],["✌🏽"],["✌🏾"],["✌🏿"],["🤞"],["🤞🏻"],["🤞🏼"],["🤞🏽"],["🤞🏾"],["🤞🏿"],["🤟"],["🤟🏻"],["🤟🏼"],["🤟🏽"],["🤟🏾"],["🤟🏿"],["🤘"],["🤘🏻"],["🤘🏼"],["🤘🏽"],["🤘🏾"],["🤘🏿"],["🤙"],["🤙🏻"],["🤙🏼"],["🤙🏽"],["🤙🏾"],["🤙🏿"],["👈"],["👈🏻"],["👈🏼"],["👈🏽"],["👈🏾"],["👈🏿"],["👉"],["👉🏻"],["👉🏼"],["👉🏽"],["👉🏾"],["👉🏿"],["👆"],["👆🏻"],["👆🏼"],["👆🏽"],["👆🏾"],["👆🏿"],["🖕"],["🖕🏻"],["🖕🏼"],["🖕🏽"],["🖕🏾"],["🖕🏿"],["👇"],["👇🏻"],["👇🏼"],["👇🏽"],["👇🏾"],["👇🏿"],["☝️"],["☝"],["☝🏻"],["☝🏼"],["☝🏽"],["☝🏾"],["☝🏿"],["👍"],["👍🏻"],["👍🏼"],["👍🏽"],["👍🏾"],["👍🏿"],["👎"],["👎🏻"],["👎🏼"],["👎🏽"],["👎🏾"],["👎🏿"],["✊"],["✊🏻"],["✊🏼"],["✊🏽"],["✊🏾"],["✊🏿"],["👊"],["👊🏻"],["👊🏼"],["👊🏽"],["👊🏾"],["👊🏿"],["🤛"],["🤛🏻"],["🤛🏼"],["🤛🏽"],["🤛🏾"],["🤛🏿"],["🤜"],["🤜🏻"],["🤜🏼"],["🤜🏽"],["🤜🏾"],["🤜🏿"],["👏"],["👏🏻"],["👏🏼"],["👏🏽"],["👏🏾"],["👏🏿"],["🙌"],["🙌🏻"],["🙌🏼"],["🙌🏽"],["🙌🏾"],["🙌🏿"],["👐"],["👐🏻"],["👐🏼"],["👐🏽"],["👐🏾"],["👐🏿"],["🤲"],["🤲🏻"],["🤲🏼"],["🤲🏽"],["🤲🏾"],["🤲🏿"],["🤝"],["🙏"],["🙏🏻"],["🙏🏼"],["🙏🏽"],["🙏🏾"],["🙏🏿"],["✍️"],["✍"],["✍🏻"],["✍🏼"],["✍🏽"],["✍🏾"],["✍🏿"],["💅"],["💅🏻"],["💅🏼"],["💅🏽"],["💅🏾"],["💅🏿"],["🤳"],["🤳🏻"],["🤳🏼"],["🤳🏽"],["🤳🏾"],["🤳🏿"],["💪"],["💪🏻"],["💪🏼"],["💪🏽"],["💪🏾"],["💪🏿"],["🦾"],["🦿"],["🦵"],["🦵🏻"],["🦵🏼"],["🦵🏽"],["🦵🏾"],["🦵🏿"],["🦶"],["🦶🏻"],["🦶🏼"],["🦶🏽"],["🦶🏾"],["🦶🏿"],["👂"],["👂🏻"],["👂🏼"],["👂🏽"],["👂🏾"],["👂🏿"],["🦻"],["🦻🏻"],["🦻🏼"],["🦻🏽"],["🦻🏾"],["🦻🏿"],["👃"],["👃🏻"],["👃🏼"],["👃🏽"],["👃🏾"],["👃🏿"],["🧠"],["🫀"],["🫁"],["🦷"],["🦴"],["👀"],["👁️"],["👁"],["👅"],["👄"],["👶"],["👶🏻"],["👶🏼"],["👶🏽"],["👶🏾"],["👶🏿"],["🧒"],["🧒🏻"],["🧒🏼"],["🧒🏽"],["🧒🏾"],["🧒🏿"],["👦"],["👦🏻"],["👦🏼"],["👦🏽"],["👦🏾"],["👦🏿"],["👧"],["👧🏻"],["👧🏼"],["👧🏽"],["👧🏾"],["👧🏿"],["🧑"],["🧑🏻"],["🧑🏼"],["🧑🏽"],["🧑🏾"],["🧑🏿"],["👱"],["👱🏻"],["👱🏼"],["👱🏽"],["👱🏾"],["👱🏿"],["👨"],["👨🏻"],["👨🏼"],["👨🏽"],["👨🏾"],["👨🏿"],["🧔"],["🧔🏻"],["🧔🏼"],["🧔🏽"],["🧔🏾"],["🧔🏿"],["👨‍🦰"],["👨🏻‍🦰"],["👨🏼‍🦰"],["👨🏽‍🦰"],["👨🏾‍🦰"],["👨🏿‍🦰"],["👨‍🦱"],["👨🏻‍🦱"],["👨🏼‍🦱"],["👨🏽‍🦱"],["👨🏾‍🦱"],["👨🏿‍🦱"],["👨‍🦳"],["👨🏻‍🦳"],["👨🏼‍🦳"],["👨🏽‍🦳"],["👨🏾‍🦳"],["👨🏿‍🦳"],["👨‍🦲"],["👨🏻‍🦲"],["👨🏼‍🦲"],["👨🏽‍🦲"],["👨🏾‍🦲"],["👨🏿‍🦲"],["👩"],["👩🏻"],["👩🏼"],["👩🏽"],["👩🏾"],["👩🏿"],["👩‍🦰"],["👩🏻‍🦰"],["👩🏼‍🦰"],["👩🏽‍🦰"],["👩🏾‍🦰"],["👩🏿‍🦰"],["🧑‍🦰"],["🧑🏻‍🦰"],["🧑🏼‍🦰"],["🧑🏽‍🦰"],["🧑🏾‍🦰"],["🧑🏿‍🦰"],["👩‍🦱"],["👩🏻‍🦱"],["👩🏼‍🦱"],["👩🏽‍🦱"],["👩🏾‍🦱"],["👩🏿‍🦱"],["🧑‍🦱"],["🧑🏻‍🦱"],["🧑🏼‍🦱"],["🧑🏽‍🦱"],["🧑🏾‍🦱"],["🧑🏿‍🦱"],["👩‍🦳"],["👩🏻‍🦳"],["👩🏼‍🦳"],["👩🏽‍🦳"],["👩🏾‍🦳"],["👩🏿‍🦳"],["🧑‍🦳"],["🧑🏻‍🦳"],["🧑🏼‍🦳"],["🧑🏽‍🦳"],["🧑🏾‍🦳"],["🧑🏿‍🦳"],["👩‍🦲"],["👩🏻‍🦲"],["👩🏼‍🦲"],["👩🏽‍🦲"],["👩🏾‍🦲"],["👩🏿‍🦲"],["🧑‍🦲"],["🧑🏻‍🦲"],["🧑🏼‍🦲"],["🧑🏽‍🦲"],["🧑🏾‍🦲"],["🧑🏿‍🦲"],["👱‍♀️"],["👱‍♀"],["👱🏻‍♀️"],["👱🏻‍♀"],["👱🏼‍♀️"],["👱🏼‍♀"],["👱🏽‍♀️"],["👱🏽‍♀"],["👱🏾‍♀️"],["👱🏾‍♀"],["👱🏿‍♀️"],["👱🏿‍♀"],["👱‍♂️"],["👱‍♂"],["👱🏻‍♂️"],["👱🏻‍♂"],["👱🏼‍♂️"],["👱🏼‍♂"],["👱🏽‍♂️"],["👱🏽‍♂"],["👱🏾‍♂️"],["👱🏾‍♂"],["👱🏿‍♂️"],["👱🏿‍♂"],["🧓"],["🧓🏻"],["🧓🏼"],["🧓🏽"],["🧓🏾"],["🧓🏿"],["👴"],["👴🏻"],["👴🏼"],["👴🏽"],["👴🏾"],["👴🏿"],["👵"],["👵🏻"],["👵🏼"],["👵🏽"],["👵🏾"],["👵🏿"],["🙍"],["🙍🏻"],["🙍🏼"],["🙍🏽"],["🙍🏾"],["🙍🏿"],["🙍‍♂️"],["🙍‍♂"],["🙍🏻‍♂️"],["🙍🏻‍♂"],["🙍🏼‍♂️"],["🙍🏼‍♂"],["🙍🏽‍♂️"],["🙍🏽‍♂"],["🙍🏾‍♂️"],["🙍🏾‍♂"],["🙍🏿‍♂️"],["🙍🏿‍♂"],["🙍‍♀️"],["🙍‍♀"],["🙍🏻‍♀️"],["🙍🏻‍♀"],["🙍🏼‍♀️"],["🙍🏼‍♀"],["🙍🏽‍♀️"],["🙍🏽‍♀"],["🙍🏾‍♀️"],["🙍🏾‍♀"],["🙍🏿‍♀️"],["🙍🏿‍♀"],["🙎"],["🙎🏻"],["🙎🏼"],["🙎🏽"],["🙎🏾"],["🙎🏿"],["🙎‍♂️"],["🙎‍♂"],["🙎🏻‍♂️"],["🙎🏻‍♂"],["🙎🏼‍♂️"],["🙎🏼‍♂"],["🙎🏽‍♂️"],["🙎🏽‍♂"],["🙎🏾‍♂️"],["🙎🏾‍♂"],["🙎🏿‍♂️"],["🙎🏿‍♂"],["🙎‍♀️"],["🙎‍♀"],["🙎🏻‍♀️"],["🙎🏻‍♀"],["🙎🏼‍♀️"],["🙎🏼‍♀"],["🙎🏽‍♀️"],["🙎🏽‍♀"],["🙎🏾‍♀️"],["🙎🏾‍♀"],["🙎🏿‍♀️"],["🙎🏿‍♀"],["🙅"],["🙅🏻"],["🙅🏼"],["🙅🏽"],["🙅🏾"],["🙅🏿"],["🙅‍♂️"],["🙅‍♂"],["🙅🏻‍♂️"],["🙅🏻‍♂"],["🙅🏼‍♂️"],["🙅🏼‍♂"],["🙅🏽‍♂️"],["🙅🏽‍♂"],["🙅🏾‍♂️"],["🙅🏾‍♂"],["🙅🏿‍♂️"],["🙅🏿‍♂"],["🙅‍♀️"],["🙅‍♀"],["🙅🏻‍♀️"],["🙅🏻‍♀"],["🙅🏼‍♀️"],["🙅🏼‍♀"],["🙅🏽‍♀️"],["🙅🏽‍♀"],["🙅🏾‍♀️"],["🙅🏾‍♀"],["🙅🏿‍♀️"],["🙅🏿‍♀"],["🙆"],["🙆🏻"],["🙆🏼"],["🙆🏽"],["🙆🏾"],["🙆🏿"],["🙆‍♂️"],["🙆‍♂"],["🙆🏻‍♂️"],["🙆🏻‍♂"],["🙆🏼‍♂️"],["🙆🏼‍♂"],["🙆🏽‍♂️"],["🙆🏽‍♂"],["🙆🏾‍♂️"],["🙆🏾‍♂"],["🙆🏿‍♂️"],["🙆🏿‍♂"],["🙆‍♀️"],["🙆‍♀"],["🙆🏻‍♀️"],["🙆🏻‍♀"],["🙆🏼‍♀️"],["🙆🏼‍♀"],["🙆🏽‍♀️"],["🙆🏽‍♀"],["🙆🏾‍♀️"],["🙆🏾‍♀"],["🙆🏿‍♀️"],["🙆🏿‍♀"],["💁"],["💁🏻"],["💁🏼"],["💁🏽"],["💁🏾"],["💁🏿"],["💁‍♂️"],["💁‍♂"],["💁🏻‍♂️"],["💁🏻‍♂"],["💁🏼‍♂️"],["💁🏼‍♂"],["💁🏽‍♂️"],["💁🏽‍♂"],["💁🏾‍♂️"],["💁🏾‍♂"],["💁🏿‍♂️"],["💁🏿‍♂"],["💁‍♀️"],["💁‍♀"],["💁🏻‍♀️"],["💁🏻‍♀"],["💁🏼‍♀️"],["💁🏼‍♀"],["💁🏽‍♀️"],["💁🏽‍♀"],["💁🏾‍♀️"],["💁🏾‍♀"],["💁🏿‍♀️"],["💁🏿‍♀"],["🙋"],["🙋🏻"],["🙋🏼"],["🙋🏽"],["🙋🏾"],["🙋🏿"],["🙋‍♂️"],["🙋‍♂"],["🙋🏻‍♂️"],["🙋🏻‍♂"],["🙋🏼‍♂️"],["🙋🏼‍♂"],["🙋🏽‍♂️"],["🙋🏽‍♂"],["🙋🏾‍♂️"],["🙋🏾‍♂"],["🙋🏿‍♂️"],["🙋🏿‍♂"],["🙋‍♀️"],["🙋‍♀"],["🙋🏻‍♀️"],["🙋🏻‍♀"],["🙋🏼‍♀️"],["🙋🏼‍♀"],["🙋🏽‍♀️"],["🙋🏽‍♀"],["🙋🏾‍♀️"],["🙋🏾‍♀"],["🙋🏿‍♀️"],["🙋🏿‍♀"],["🧏"],["🧏🏻"],["🧏🏼"],["🧏🏽"],["🧏🏾"],["🧏🏿"],["🧏‍♂️"],["🧏‍♂"],["🧏🏻‍♂️"],["🧏🏻‍♂"],["🧏🏼‍♂️"],["🧏🏼‍♂"],["🧏🏽‍♂️"],["🧏🏽‍♂"],["🧏🏾‍♂️"],["🧏🏾‍♂"],["🧏🏿‍♂️"],["🧏🏿‍♂"],["🧏‍♀️"],["🧏‍♀"],["🧏🏻‍♀️"],["🧏🏻‍♀"],["🧏🏼‍♀️"],["🧏🏼‍♀"],["🧏🏽‍♀️"],["🧏🏽‍♀"],["🧏🏾‍♀️"],["🧏🏾‍♀"],["🧏🏿‍♀️"],["🧏🏿‍♀"],["🙇"],["🙇🏻"],["🙇🏼"],["🙇🏽"],["🙇🏾"],["🙇🏿"],["🙇‍♂️"],["🙇‍♂"],["🙇🏻‍♂️"],["🙇🏻‍♂"],["🙇🏼‍♂️"],["🙇🏼‍♂"],["🙇🏽‍♂️"],["🙇🏽‍♂"],["🙇🏾‍♂️"],["🙇🏾‍♂"],["🙇🏿‍♂️"],["🙇🏿‍♂"],["🙇‍♀️"],["🙇‍♀"],["🙇🏻‍♀️"],["🙇🏻‍♀"],["🙇🏼‍♀️"],["🙇🏼‍♀"],["🙇🏽‍♀️"],["🙇🏽‍♀"],["🙇🏾‍♀️"],["🙇🏾‍♀"],["🙇🏿‍♀️"],["🙇🏿‍♀"],["🤦"],["🤦🏻"],["🤦🏼"],["🤦🏽"],["🤦🏾"],["🤦🏿"],["🤦‍♂️"],["🤦‍♂"],["🤦🏻‍♂️"],["🤦🏻‍♂"],["🤦🏼‍♂️"],["🤦🏼‍♂"],["🤦🏽‍♂️"],["🤦🏽‍♂"],["🤦🏾‍♂️"],["🤦🏾‍♂"],["🤦🏿‍♂️"],["🤦🏿‍♂"],["🤦‍♀️"],["🤦‍♀"],["🤦🏻‍♀️"],["🤦🏻‍♀"],["🤦🏼‍♀️"],["🤦🏼‍♀"],["🤦🏽‍♀️"],["🤦🏽‍♀"],["🤦🏾‍♀️"],["🤦🏾‍♀"],["🤦🏿‍♀️"],["🤦🏿‍♀"],["🤷"],["🤷🏻"],["🤷🏼"],["🤷🏽"],["🤷🏾"],["🤷🏿"],["🤷‍♂️"],["🤷‍♂"],["🤷🏻‍♂️"],["🤷🏻‍♂"],["🤷🏼‍♂️"],["🤷🏼‍♂"],["🤷🏽‍♂️"],["🤷🏽‍♂"],["🤷🏾‍♂️"],["🤷🏾‍♂"],["🤷🏿‍♂️"],["🤷🏿‍♂"],["🤷‍♀️"],["🤷‍♀"],["🤷🏻‍♀️"],["🤷🏻‍♀"],["🤷🏼‍♀️"],["🤷🏼‍♀"],["🤷🏽‍♀️"],["🤷🏽‍♀"],["🤷🏾‍♀️"],["🤷🏾‍♀"],["🤷🏿‍♀️"],["🤷🏿‍♀"],["🧑‍⚕️"],["🧑‍⚕"],["🧑🏻‍⚕️"],["🧑🏻‍⚕"],["🧑🏼‍⚕️"],["🧑🏼‍⚕"],["🧑🏽‍⚕️"],["🧑🏽‍⚕"],["🧑🏾‍⚕️"],["🧑🏾‍⚕"],["🧑🏿‍⚕️"],["🧑🏿‍⚕"],["👨‍⚕️"],["👨‍⚕"],["👨🏻‍⚕️"],["👨🏻‍⚕"],["👨🏼‍⚕️"],["👨🏼‍⚕"],["👨🏽‍⚕️"],["👨🏽‍⚕"],["👨🏾‍⚕️"],["👨🏾‍⚕"],["👨🏿‍⚕️"],["👨🏿‍⚕"],["👩‍⚕️"],["👩‍⚕"],["👩🏻‍⚕️"],["👩🏻‍⚕"],["👩🏼‍⚕️"],["👩🏼‍⚕"],["👩🏽‍⚕️"],["👩🏽‍⚕"],["👩🏾‍⚕️"],["👩🏾‍⚕"],["👩🏿‍⚕️"],["👩🏿‍⚕"],["🧑‍🎓"],["🧑🏻‍🎓"],["🧑🏼‍🎓"],["🧑🏽‍🎓"],["🧑🏾‍🎓"],["🧑🏿‍🎓"],["👨‍🎓"],["👨🏻‍🎓"],["👨🏼‍🎓"],["👨🏽‍🎓"],["👨🏾‍🎓"],["👨🏿‍🎓"],["👩‍🎓"],["👩🏻‍🎓"],["👩🏼‍🎓"],["👩🏽‍🎓"],["👩🏾‍🎓"],["👩🏿‍🎓"],["🧑‍🏫"],["🧑🏻‍🏫"],["🧑🏼‍🏫"],["🧑🏽‍🏫"],["🧑🏾‍🏫"],["🧑🏿‍🏫"],["👨‍🏫"],["👨🏻‍🏫"],["👨🏼‍🏫"],["👨🏽‍🏫"],["👨🏾‍🏫"],["👨🏿‍🏫"],["👩‍🏫"],["👩🏻‍🏫"],["👩🏼‍🏫"],["👩🏽‍🏫"],["👩🏾‍🏫"],["👩🏿‍🏫"],["🧑‍⚖️"],["🧑‍⚖"],["🧑🏻‍⚖️"],["🧑🏻‍⚖"],["🧑🏼‍⚖️"],["🧑🏼‍⚖"],["🧑🏽‍⚖️"],["🧑🏽‍⚖"],["🧑🏾‍⚖️"],["🧑🏾‍⚖"],["🧑🏿‍⚖️"],["🧑🏿‍⚖"],["👨‍⚖️"],["👨‍⚖"],["👨🏻‍⚖️"],["👨🏻‍⚖"],["👨🏼‍⚖️"],["👨🏼‍⚖"],["👨🏽‍⚖️"],["👨🏽‍⚖"],["👨🏾‍⚖️"],["👨🏾‍⚖"],["👨🏿‍⚖️"],["👨🏿‍⚖"],["👩‍⚖️"],["👩‍⚖"],["👩🏻‍⚖️"],["👩🏻‍⚖"],["👩🏼‍⚖️"],["👩🏼‍⚖"],["👩🏽‍⚖️"],["👩🏽‍⚖"],["👩🏾‍⚖️"],["👩🏾‍⚖"],["👩🏿‍⚖️"],["👩🏿‍⚖"],["🧑‍🌾"],["🧑🏻‍🌾"],["🧑🏼‍🌾"],["🧑🏽‍🌾"],["🧑🏾‍🌾"],["🧑🏿‍🌾"],["👨‍🌾"],["👨🏻‍🌾"],["👨🏼‍🌾"],["👨🏽‍🌾"],["👨🏾‍🌾"],["👨🏿‍🌾"],["👩‍🌾"],["👩🏻‍🌾"],["👩🏼‍🌾"],["👩🏽‍🌾"],["👩🏾‍🌾"],["👩🏿‍🌾"],["🧑‍🍳"],["🧑🏻‍🍳"],["🧑🏼‍🍳"],["🧑🏽‍🍳"],["🧑🏾‍🍳"],["🧑🏿‍🍳"],["👨‍🍳"],["👨🏻‍🍳"],["👨🏼‍🍳"],["👨🏽‍🍳"],["👨🏾‍🍳"],["👨🏿‍🍳"],["👩‍🍳"],["👩🏻‍🍳"],["👩🏼‍🍳"],["👩🏽‍🍳"],["👩🏾‍🍳"],["👩🏿‍🍳"],["🧑‍🔧"],["🧑🏻‍🔧"],["🧑🏼‍🔧"],["🧑🏽‍🔧"],["🧑🏾‍🔧"],["🧑🏿‍🔧"],["👨‍🔧"],["👨🏻‍🔧"],["👨🏼‍🔧"],["👨🏽‍🔧"],["👨🏾‍🔧"],["👨🏿‍🔧"],["👩‍🔧"],["👩🏻‍🔧"],["👩🏼‍🔧"],["👩🏽‍🔧"],["👩🏾‍🔧"],["👩🏿‍🔧"],["🧑‍🏭"],["🧑🏻‍🏭"],["🧑🏼‍🏭"],["🧑🏽‍🏭"],["🧑🏾‍🏭"],["🧑🏿‍🏭"],["👨‍🏭"],["👨🏻‍🏭"],["👨🏼‍🏭"],["👨🏽‍🏭"],["👨🏾‍🏭"],["👨🏿‍🏭"],["👩‍🏭"],["👩🏻‍🏭"],["👩🏼‍🏭"],["👩🏽‍🏭"],["👩🏾‍🏭"],["👩🏿‍🏭"],["🧑‍💼"],["🧑🏻‍💼"],["🧑🏼‍💼"],["🧑🏽‍💼"],["🧑🏾‍💼"],["🧑🏿‍💼"],["👨‍💼"],["👨🏻‍💼"],["👨🏼‍💼"],["👨🏽‍💼"],["👨🏾‍💼"],["👨🏿‍💼"],["👩‍💼"],["👩🏻‍💼"],["👩🏼‍💼"],["👩🏽‍💼"],["👩🏾‍💼"],["👩🏿‍💼"],["🧑‍🔬"],["🧑🏻‍🔬"],["🧑🏼‍🔬"],["🧑🏽‍🔬"],["🧑🏾‍🔬"],["🧑🏿‍🔬"],["👨‍🔬"],["👨🏻‍🔬"],["👨🏼‍🔬"],["👨🏽‍🔬"],["👨🏾‍🔬"],["👨🏿‍🔬"],["👩‍🔬"],["👩🏻‍🔬"],["👩🏼‍🔬"],["👩🏽‍🔬"],["👩🏾‍🔬"],["👩🏿‍🔬"],["🧑‍💻"],["🧑🏻‍💻"],["🧑🏼‍💻"],["🧑🏽‍💻"],["🧑🏾‍💻"],["🧑🏿‍💻"],["👨‍💻"],["👨🏻‍💻"],["👨🏼‍💻"],["👨🏽‍💻"],["👨🏾‍💻"],["👨🏿‍💻"],["👩‍💻"],["👩🏻‍💻"],["👩🏼‍💻"],["👩🏽‍💻"],["👩🏾‍💻"],["👩🏿‍💻"],["🧑‍🎤"],["🧑🏻‍🎤"],["🧑🏼‍🎤"],["🧑🏽‍🎤"],["🧑🏾‍🎤"],["🧑🏿‍🎤"],["👨‍🎤"],["👨🏻‍🎤"],["👨🏼‍🎤"],["👨🏽‍🎤"],["👨🏾‍🎤"],["👨🏿‍🎤"],["👩‍🎤"],["👩🏻‍🎤"],["👩🏼‍🎤"],["👩🏽‍🎤"],["👩🏾‍🎤"],["👩🏿‍🎤"],["🧑‍🎨"],["🧑🏻‍🎨"],["🧑🏼‍🎨"],["🧑🏽‍🎨"],["🧑🏾‍🎨"],["🧑🏿‍🎨"],["👨‍🎨"],["👨🏻‍🎨"],["👨🏼‍🎨"],["👨🏽‍🎨"],["👨🏾‍🎨"],["👨🏿‍🎨"],["👩‍🎨"],["👩🏻‍🎨"],["👩🏼‍🎨"],["👩🏽‍🎨"],["👩🏾‍🎨"],["👩🏿‍🎨"],["🧑‍✈️"],["🧑‍✈"],["🧑🏻‍✈️"],["🧑🏻‍✈"],["🧑🏼‍✈️"],["🧑🏼‍✈"],["🧑🏽‍✈️"],["🧑🏽‍✈"],["🧑🏾‍✈️"],["🧑🏾‍✈"],["🧑🏿‍✈️"],["🧑🏿‍✈"],["👨‍✈️"],["👨‍✈"],["👨🏻‍✈️"],["👨🏻‍✈"],["👨🏼‍✈️"],["👨🏼‍✈"],["👨🏽‍✈️"],["👨🏽‍✈"],["👨🏾‍✈️"],["👨🏾‍✈"],["👨🏿‍✈️"],["👨🏿‍✈"],["👩‍✈️"],["👩‍✈"],["👩🏻‍✈️"],["👩🏻‍✈"],["👩🏼‍✈️"],["👩🏼‍✈"],["👩🏽‍✈️"],["👩🏽‍✈"],["👩🏾‍✈️"],["👩🏾‍✈"],["👩🏿‍✈️"],["👩🏿‍✈"],["🧑‍🚀"],["🧑🏻‍🚀"],["🧑🏼‍🚀"],["🧑🏽‍🚀"],["🧑🏾‍🚀"],["🧑🏿‍🚀"],["👨‍🚀"],["👨🏻‍🚀"],["👨🏼‍🚀"],["👨🏽‍🚀"],["👨🏾‍🚀"],["👨🏿‍🚀"],["👩‍🚀"],["👩🏻‍🚀"],["👩🏼‍🚀"],["👩🏽‍🚀"],["👩🏾‍🚀"],["👩🏿‍🚀"],["🧑‍🚒"],["🧑🏻‍🚒"],["🧑🏼‍🚒"],["🧑🏽‍🚒"],["🧑🏾‍🚒"],["🧑🏿‍🚒"],["👨‍🚒"],["👨🏻‍🚒"],["👨🏼‍🚒"],["👨🏽‍🚒"],["👨🏾‍🚒"],["👨🏿‍🚒"],["👩‍🚒"],["👩🏻‍🚒"],["👩🏼‍🚒"],["👩🏽‍🚒"],["👩🏾‍🚒"],["👩🏿‍🚒"],["👮"],["👮🏻"],["👮🏼"],["👮🏽"],["👮🏾"],["👮🏿"],["👮‍♂️"],["👮‍♂"],["👮🏻‍♂️"],["👮🏻‍♂"],["👮🏼‍♂️"],["👮🏼‍♂"],["👮🏽‍♂️"],["👮🏽‍♂"],["👮🏾‍♂️"],["👮🏾‍♂"],["👮🏿‍♂️"],["👮🏿‍♂"],["👮‍♀️"],["👮‍♀"],["👮🏻‍♀️"],["👮🏻‍♀"],["👮🏼‍♀️"],["👮🏼‍♀"],["👮🏽‍♀️"],["👮🏽‍♀"],["👮🏾‍♀️"],["👮🏾‍♀"],["👮🏿‍♀️"],["👮🏿‍♀"],["🕵️"],["🕵"],["🕵🏻"],["🕵🏼"],["🕵🏽"],["🕵🏾"],["🕵🏿"],["🕵️‍♂️"],["🕵‍♂️"],["🕵️‍♂"],["🕵‍♂"],["🕵🏻‍♂️"],["🕵🏻‍♂"],["🕵🏼‍♂️"],["🕵🏼‍♂"],["🕵🏽‍♂️"],["🕵🏽‍♂"],["🕵🏾‍♂️"],["🕵🏾‍♂"],["🕵🏿‍♂️"],["🕵🏿‍♂"],["🕵️‍♀️"],["🕵‍♀️"],["🕵️‍♀"],["🕵‍♀"],["🕵🏻‍♀️"],["🕵🏻‍♀"],["🕵🏼‍♀️"],["🕵🏼‍♀"],["🕵🏽‍♀️"],["🕵🏽‍♀"],["🕵🏾‍♀️"],["🕵🏾‍♀"],["🕵🏿‍♀️"],["🕵🏿‍♀"],["💂"],["💂🏻"],["💂🏼"],["💂🏽"],["💂🏾"],["💂🏿"],["💂‍♂️"],["💂‍♂"],["💂🏻‍♂️"],["💂🏻‍♂"],["💂🏼‍♂️"],["💂🏼‍♂"],["💂🏽‍♂️"],["💂🏽‍♂"],["💂🏾‍♂️"],["💂🏾‍♂"],["💂🏿‍♂️"],["💂🏿‍♂"],["💂‍♀️"],["💂‍♀"],["💂🏻‍♀️"],["💂🏻‍♀"],["💂🏼‍♀️"],["💂🏼‍♀"],["💂🏽‍♀️"],["💂🏽‍♀"],["💂🏾‍♀️"],["💂🏾‍♀"],["💂🏿‍♀️"],["💂🏿‍♀"],["👷"],["👷🏻"],["👷🏼"],["👷🏽"],["👷🏾"],["👷🏿"],["👷‍♂️"],["👷‍♂"],["👷🏻‍♂️"],["👷🏻‍♂"],["👷🏼‍♂️"],["👷🏼‍♂"],["👷🏽‍♂️"],["👷🏽‍♂"],["👷🏾‍♂️"],["👷🏾‍♂"],["👷🏿‍♂️"],["👷🏿‍♂"],["👷‍♀️"],["👷‍♀"],["👷🏻‍♀️"],["👷🏻‍♀"],["👷🏼‍♀️"],["👷🏼‍♀"],["👷🏽‍♀️"],["👷🏽‍♀"],["👷🏾‍♀️"],["👷🏾‍♀"],["👷🏿‍♀️"],["👷🏿‍♀"],["🤴"],["🤴🏻"],["🤴🏼"],["🤴🏽"],["🤴🏾"],["🤴🏿"],["👸"],["👸🏻"],["👸🏼"],["👸🏽"],["👸🏾"],["👸🏿"],["👳"],["👳🏻"],["👳🏼"],["👳🏽"],["👳🏾"],["👳🏿"],["👳‍♂️"],["👳‍♂"],["👳🏻‍♂️"],["👳🏻‍♂"],["👳🏼‍♂️"],["👳🏼‍♂"],["👳🏽‍♂️"],["👳🏽‍♂"],["👳🏾‍♂️"],["👳🏾‍♂"],["👳🏿‍♂️"],["👳🏿‍♂"],["👳‍♀️"],["👳‍♀"],["👳🏻‍♀️"],["👳🏻‍♀"],["👳🏼‍♀️"],["👳🏼‍♀"],["👳🏽‍♀️"],["👳🏽‍♀"],["👳🏾‍♀️"],["👳🏾‍♀"],["👳🏿‍♀️"],["👳🏿‍♀"],["👲"],["👲🏻"],["👲🏼"],["👲🏽"],["👲🏾"],["👲🏿"],["🧕"],["🧕🏻"],["🧕🏼"],["🧕🏽"],["🧕🏾"],["🧕🏿"],["🤵"],["🤵🏻"],["🤵🏼"],["🤵🏽"],["🤵🏾"],["🤵🏿"],["🤵‍♂️"],["🤵‍♂"],["🤵🏻‍♂️"],["🤵🏻‍♂"],["🤵🏼‍♂️"],["🤵🏼‍♂"],["🤵🏽‍♂️"],["🤵🏽‍♂"],["🤵🏾‍♂️"],["🤵🏾‍♂"],["🤵🏿‍♂️"],["🤵🏿‍♂"],["🤵‍♀️"],["🤵‍♀"],["🤵🏻‍♀️"],["🤵🏻‍♀"],["🤵🏼‍♀️"],["🤵🏼‍♀"],["🤵🏽‍♀️"],["🤵🏽‍♀"],["🤵🏾‍♀️"],["🤵🏾‍♀"],["🤵🏿‍♀️"],["🤵🏿‍♀"],["👰"],["👰🏻"],["👰🏼"],["👰🏽"],["👰🏾"],["👰🏿"],["👰‍♂️"],["👰‍♂"],["👰🏻‍♂️"],["👰🏻‍♂"],["👰🏼‍♂️"],["👰🏼‍♂"],["👰🏽‍♂️"],["👰🏽‍♂"],["👰🏾‍♂️"],["👰🏾‍♂"],["👰🏿‍♂️"],["👰🏿‍♂"],["👰‍♀️"],["👰‍♀"],["👰🏻‍♀️"],["👰🏻‍♀"],["👰🏼‍♀️"],["👰🏼‍♀"],["👰🏽‍♀️"],["👰🏽‍♀"],["👰🏾‍♀️"],["👰🏾‍♀"],["👰🏿‍♀️"],["👰🏿‍♀"],["🤰"],["🤰🏻"],["🤰🏼"],["🤰🏽"],["🤰🏾"],["🤰🏿"],["🤱"],["🤱🏻"],["🤱🏼"],["🤱🏽"],["🤱🏾"],["🤱🏿"],["👩‍🍼"],["👩🏻‍🍼"],["👩🏼‍🍼"],["👩🏽‍🍼"],["👩🏾‍🍼"],["👩🏿‍🍼"],["👨‍🍼"],["👨🏻‍🍼"],["👨🏼‍🍼"],["👨🏽‍🍼"],["👨🏾‍🍼"],["👨🏿‍🍼"],["🧑‍🍼"],["🧑🏻‍🍼"],["🧑🏼‍🍼"],["🧑🏽‍🍼"],["🧑🏾‍🍼"],["🧑🏿‍🍼"],["👼"],["👼🏻"],["👼🏼"],["👼🏽"],["👼🏾"],["👼🏿"],["🎅"],["🎅🏻"],["🎅🏼"],["🎅🏽"],["🎅🏾"],["🎅🏿"],["🤶"],["🤶🏻"],["🤶🏼"],["🤶🏽"],["🤶🏾"],["🤶🏿"],["🧑‍🎄"],["🧑🏻‍🎄"],["🧑🏼‍🎄"],["🧑🏽‍🎄"],["🧑🏾‍🎄"],["🧑🏿‍🎄"],["🦸"],["🦸🏻"],["🦸🏼"],["🦸🏽"],["🦸🏾"],["🦸🏿"],["🦸‍♂️"],["🦸‍♂"],["🦸🏻‍♂️"],["🦸🏻‍♂"],["🦸🏼‍♂️"],["🦸🏼‍♂"],["🦸🏽‍♂️"],["🦸🏽‍♂"],["🦸🏾‍♂️"],["🦸🏾‍♂"],["🦸🏿‍♂️"],["🦸🏿‍♂"],["🦸‍♀️"],["🦸‍♀"],["🦸🏻‍♀️"],["🦸🏻‍♀"],["🦸🏼‍♀️"],["🦸🏼‍♀"],["🦸🏽‍♀️"],["🦸🏽‍♀"],["🦸🏾‍♀️"],["🦸🏾‍♀"],["🦸🏿‍♀️"],["🦸🏿‍♀"],["🦹"],["🦹🏻"],["🦹🏼"],["🦹🏽"],["🦹🏾"],["🦹🏿"],["🦹‍♂️"],["🦹‍♂"],["🦹🏻‍♂️"],["🦹🏻‍♂"],["🦹🏼‍♂️"],["🦹🏼‍♂"],["🦹🏽‍♂️"],["🦹🏽‍♂"],["🦹🏾‍♂️"],["🦹🏾‍♂"],["🦹🏿‍♂️"],["🦹🏿‍♂"],["🦹‍♀️"],["🦹‍♀"],["🦹🏻‍♀️"],["🦹🏻‍♀"],["🦹🏼‍♀️"],["🦹🏼‍♀"],["🦹🏽‍♀️"],["🦹🏽‍♀"],["🦹🏾‍♀️"],["🦹🏾‍♀"],["🦹🏿‍♀️"],["🦹🏿‍♀"],["🧙"],["🧙🏻"],["🧙🏼"],["🧙🏽"],["🧙🏾"],["🧙🏿"],["🧙‍♂️"],["🧙‍♂"],["🧙🏻‍♂️"],["🧙🏻‍♂"],["🧙🏼‍♂️"],["🧙🏼‍♂"],["🧙🏽‍♂️"],["🧙🏽‍♂"],["🧙🏾‍♂️"],["🧙🏾‍♂"],["🧙🏿‍♂️"],["🧙🏿‍♂"],["🧙‍♀️"],["🧙‍♀"],["🧙🏻‍♀️"],["🧙🏻‍♀"],["🧙🏼‍♀️"],["🧙🏼‍♀"],["🧙🏽‍♀️"],["🧙🏽‍♀"],["🧙🏾‍♀️"],["🧙🏾‍♀"],["🧙🏿‍♀️"],["🧙🏿‍♀"],["🧚"],["🧚🏻"],["🧚🏼"],["🧚🏽"],["🧚🏾"],["🧚🏿"],["🧚‍♂️"],["🧚‍♂"],["🧚🏻‍♂️"],["🧚🏻‍♂"],["🧚🏼‍♂️"],["🧚🏼‍♂"],["🧚🏽‍♂️"],["🧚🏽‍♂"],["🧚🏾‍♂️"],["🧚🏾‍♂"],["🧚🏿‍♂️"],["🧚🏿‍♂"],["🧚‍♀️"],["🧚‍♀"],["🧚🏻‍♀️"],["🧚🏻‍♀"],["🧚🏼‍♀️"],["🧚🏼‍♀"],["🧚🏽‍♀️"],["🧚🏽‍♀"],["🧚🏾‍♀️"],["🧚🏾‍♀"],["🧚🏿‍♀️"],["🧚🏿‍♀"],["🧛"],["🧛🏻"],["🧛🏼"],["🧛🏽"],["🧛🏾"],["🧛🏿"],["🧛‍♂️"],["🧛‍♂"],["🧛🏻‍♂️"],["🧛🏻‍♂"],["🧛🏼‍♂️"],["🧛🏼‍♂"],["🧛🏽‍♂️"],["🧛🏽‍♂"],["🧛🏾‍♂️"],["🧛🏾‍♂"],["🧛🏿‍♂️"],["🧛🏿‍♂"],["🧛‍♀️"],["🧛‍♀"],["🧛🏻‍♀️"],["🧛🏻‍♀"],["🧛🏼‍♀️"],["🧛🏼‍♀"],["🧛🏽‍♀️"],["🧛🏽‍♀"],["🧛🏾‍♀️"],["🧛🏾‍♀"],["🧛🏿‍♀️"],["🧛🏿‍♀"],["🧜"],["🧜🏻"],["🧜🏼"],["🧜🏽"],["🧜🏾"],["🧜🏿"],["🧜‍♂️"],["🧜‍♂"],["🧜🏻‍♂️"],["🧜🏻‍♂"],["🧜🏼‍♂️"],["🧜🏼‍♂"],["🧜🏽‍♂️"],["🧜🏽‍♂"],["🧜🏾‍♂️"],["🧜🏾‍♂"],["🧜🏿‍♂️"],["🧜🏿‍♂"],["🧜‍♀️"],["🧜‍♀"],["🧜🏻‍♀️"],["🧜🏻‍♀"],["🧜🏼‍♀️"],["🧜🏼‍♀"],["🧜🏽‍♀️"],["🧜🏽‍♀"],["🧜🏾‍♀️"],["🧜🏾‍♀"],["🧜🏿‍♀️"],["🧜🏿‍♀"],["🧝"],["🧝🏻"],["🧝🏼"],["🧝🏽"],["🧝🏾"],["🧝🏿"],["🧝‍♂️"],["🧝‍♂"],["🧝🏻‍♂️"],["🧝🏻‍♂"],["🧝🏼‍♂️"],["🧝🏼‍♂"],["🧝🏽‍♂️"],["🧝🏽‍♂"],["🧝🏾‍♂️"],["🧝🏾‍♂"],["🧝🏿‍♂️"],["🧝🏿‍♂"],["🧝‍♀️"],["🧝‍♀"],["🧝🏻‍♀️"],["🧝🏻‍♀"],["🧝🏼‍♀️"],["🧝🏼‍♀"],["🧝🏽‍♀️"],["🧝🏽‍♀"],["🧝🏾‍♀️"],["🧝🏾‍♀"],["🧝🏿‍♀️"],["🧝🏿‍♀"],["🧞"],["🧞‍♂️"],["🧞‍♂"],["🧞‍♀️"],["🧞‍♀"],["🧟"],["🧟‍♂️"],["🧟‍♂"],["🧟‍♀️"],["🧟‍♀"],["💆"],["💆🏻"],["💆🏼"],["💆🏽"],["💆🏾"],["💆🏿"],["💆‍♂️"],["💆‍♂"],["💆🏻‍♂️"],["💆🏻‍♂"],["💆🏼‍♂️"],["💆🏼‍♂"],["💆🏽‍♂️"],["💆🏽‍♂"],["💆🏾‍♂️"],["💆🏾‍♂"],["💆🏿‍♂️"],["💆🏿‍♂"],["💆‍♀️"],["💆‍♀"],["💆🏻‍♀️"],["💆🏻‍♀"],["💆🏼‍♀️"],["💆🏼‍♀"],["💆🏽‍♀️"],["💆🏽‍♀"],["💆🏾‍♀️"],["💆🏾‍♀"],["💆🏿‍♀️"],["💆🏿‍♀"],["💇"],["💇🏻"],["💇🏼"],["💇🏽"],["💇🏾"],["💇🏿"],["💇‍♂️"],["💇‍♂"],["💇🏻‍♂️"],["💇🏻‍♂"],["💇🏼‍♂️"],["💇🏼‍♂"],["💇🏽‍♂️"],["💇🏽‍♂"],["💇🏾‍♂️"],["💇🏾‍♂"],["💇🏿‍♂️"],["💇🏿‍♂"],["💇‍♀️"],["💇‍♀"],["💇🏻‍♀️"],["💇🏻‍♀"],["💇🏼‍♀️"],["💇🏼‍♀"],["💇🏽‍♀️"],["💇🏽‍♀"],["💇🏾‍♀️"],["💇🏾‍♀"],["💇🏿‍♀️"],["💇🏿‍♀"],["🚶"],["🚶🏻"],["🚶🏼"],["🚶🏽"],["🚶🏾"],["🚶🏿"],["🚶‍♂️"],["🚶‍♂"],["🚶🏻‍♂️"],["🚶🏻‍♂"],["🚶🏼‍♂️"],["🚶🏼‍♂"],["🚶🏽‍♂️"],["🚶🏽‍♂"],["🚶🏾‍♂️"],["🚶🏾‍♂"],["🚶🏿‍♂️"],["🚶🏿‍♂"],["🚶‍♀️"],["🚶‍♀"],["🚶🏻‍♀️"],["🚶🏻‍♀"],["🚶🏼‍♀️"],["🚶🏼‍♀"],["🚶🏽‍♀️"],["🚶🏽‍♀"],["🚶🏾‍♀️"],["🚶🏾‍♀"],["🚶🏿‍♀️"],["🚶🏿‍♀"],["🧍"],["🧍🏻"],["🧍🏼"],["🧍🏽"],["🧍🏾"],["🧍🏿"],["🧍‍♂️"],["🧍‍♂"],["🧍🏻‍♂️"],["🧍🏻‍♂"],["🧍🏼‍♂️"],["🧍🏼‍♂"],["🧍🏽‍♂️"],["🧍🏽‍♂"],["🧍🏾‍♂️"],["🧍🏾‍♂"],["🧍🏿‍♂️"],["🧍🏿‍♂"],["🧍‍♀️"],["🧍‍♀"],["🧍🏻‍♀️"],["🧍🏻‍♀"],["🧍🏼‍♀️"],["🧍🏼‍♀"],["🧍🏽‍♀️"],["🧍🏽‍♀"],["🧍🏾‍♀️"],["🧍🏾‍♀"],["🧍🏿‍♀️"],["🧍🏿‍♀"],["🧎"],["🧎🏻"],["🧎🏼"],["🧎🏽"],["🧎🏾"],["🧎🏿"],["🧎‍♂️"],["🧎‍♂"],["🧎🏻‍♂️"],["🧎🏻‍♂"],["🧎🏼‍♂️"],["🧎🏼‍♂"],["🧎🏽‍♂️"],["🧎🏽‍♂"],["🧎🏾‍♂️"],["🧎🏾‍♂"],["🧎🏿‍♂️"],["🧎🏿‍♂"],["🧎‍♀️"],["🧎‍♀"],["🧎🏻‍♀️"],["🧎🏻‍♀"],["🧎🏼‍♀️"],["🧎🏼‍♀"],["🧎🏽‍♀️"],["🧎🏽‍♀"],["🧎🏾‍♀️"],["🧎🏾‍♀"],["🧎🏿‍♀️"],["🧎🏿‍♀"],["🧑‍🦯"],["🧑🏻‍🦯"],["🧑🏼‍🦯"],["🧑🏽‍🦯"],["🧑🏾‍🦯"],["🧑🏿‍🦯"],["👨‍🦯"],["👨🏻‍🦯"],["👨🏼‍🦯"],["👨🏽‍🦯"],["👨🏾‍🦯"],["👨🏿‍🦯"],["👩‍🦯"],["👩🏻‍🦯"],["👩🏼‍🦯"],["👩🏽‍🦯"],["👩🏾‍🦯"],["👩🏿‍🦯"],["🧑‍🦼"],["🧑🏻‍🦼"],["🧑🏼‍🦼"],["🧑🏽‍🦼"],["🧑🏾‍🦼"],["🧑🏿‍🦼"],["👨‍🦼"],["👨🏻‍🦼"],["👨🏼‍🦼"],["👨🏽‍🦼"],["👨🏾‍🦼"],["👨🏿‍🦼"],["👩‍🦼"],["👩🏻‍🦼"],["👩🏼‍🦼"],["👩🏽‍🦼"],["👩🏾‍🦼"],["👩🏿‍🦼"],["🧑‍🦽"],["🧑🏻‍🦽"],["🧑🏼‍🦽"],["🧑🏽‍🦽"],["🧑🏾‍🦽"],["🧑🏿‍🦽"],["👨‍🦽"],["👨🏻‍🦽"],["👨🏼‍🦽"],["👨🏽‍🦽"],["👨🏾‍🦽"],["👨🏿‍🦽"],["👩‍🦽"],["👩🏻‍🦽"],["👩🏼‍🦽"],["👩🏽‍🦽"],["👩🏾‍🦽"],["👩🏿‍🦽"],["🏃"],["🏃🏻"],["🏃🏼"],["🏃🏽"],["🏃🏾"],["🏃🏿"],["🏃‍♂️"],["🏃‍♂"],["🏃🏻‍♂️"],["🏃🏻‍♂"],["🏃🏼‍♂️"],["🏃🏼‍♂"],["🏃🏽‍♂️"],["🏃🏽‍♂"],["🏃🏾‍♂️"],["🏃🏾‍♂"],["🏃🏿‍♂️"],["🏃🏿‍♂"],["🏃‍♀️"],["🏃‍♀"],["🏃🏻‍♀️"],["🏃🏻‍♀"],["🏃🏼‍♀️"],["🏃🏼‍♀"],["🏃🏽‍♀️"],["🏃🏽‍♀"],["🏃🏾‍♀️"],["🏃🏾‍♀"],["🏃🏿‍♀️"],["🏃🏿‍♀"],["💃"],["💃🏻"],["💃🏼"],["💃🏽"],["💃🏾"],["💃🏿"],["🕺"],["🕺🏻"],["🕺🏼"],["🕺🏽"],["🕺🏾"],["🕺🏿"],["🕴️"],["🕴"],["🕴🏻"],["🕴🏼"],["🕴🏽"],["🕴🏾"],["🕴🏿"],["👯"],["👯‍♂️"],["👯‍♂"],["👯‍♀️"],["👯‍♀"],["🧖"],["🧖🏻"],["🧖🏼"],["🧖🏽"],["🧖🏾"],["🧖🏿"],["🧖‍♂️"],["🧖‍♂"],["🧖🏻‍♂️"],["🧖🏻‍♂"],["🧖🏼‍♂️"],["🧖🏼‍♂"],["🧖🏽‍♂️"],["🧖🏽‍♂"],["🧖🏾‍♂️"],["🧖🏾‍♂"],["🧖🏿‍♂️"],["🧖🏿‍♂"],["🧖‍♀️"],["🧖‍♀"],["🧖🏻‍♀️"],["🧖🏻‍♀"],["🧖🏼‍♀️"],["🧖🏼‍♀"],["🧖🏽‍♀️"],["🧖🏽‍♀"],["🧖🏾‍♀️"],["🧖🏾‍♀"],["🧖🏿‍♀️"],["🧖🏿‍♀"],["🧗"],["🧗🏻"],["🧗🏼"],["🧗🏽"],["🧗🏾"],["🧗🏿"],["🧗‍♂️"],["🧗‍♂"],["🧗🏻‍♂️"],["🧗🏻‍♂"],["🧗🏼‍♂️"],["🧗🏼‍♂"],["🧗🏽‍♂️"],["🧗🏽‍♂"],["🧗🏾‍♂️"],["🧗🏾‍♂"],["🧗🏿‍♂️"],["🧗🏿‍♂"],["🧗‍♀️"],["🧗‍♀"],["🧗🏻‍♀️"],["🧗🏻‍♀"],["🧗🏼‍♀️"],["🧗🏼‍♀"],["🧗🏽‍♀️"],["🧗🏽‍♀"],["🧗🏾‍♀️"],["🧗🏾‍♀"],["🧗🏿‍♀️"],["🧗🏿‍♀"],["🤺"],["🏇"],["🏇🏻"],["🏇🏼"],["🏇🏽"],["🏇🏾"],["🏇🏿"],["⛷️"],["⛷"],["🏂"],["🏂🏻"],["🏂🏼"],["🏂🏽"],["🏂🏾"],["🏂🏿"],["🏌️"],["🏌"],["🏌🏻"],["🏌🏼"],["🏌🏽"],["🏌🏾"],["🏌🏿"],["🏌️‍♂️"],["🏌‍♂️"],["🏌️‍♂"],["🏌‍♂"],["🏌🏻‍♂️"],["🏌🏻‍♂"],["🏌🏼‍♂️"],["🏌🏼‍♂"],["🏌🏽‍♂️"],["🏌🏽‍♂"],["🏌🏾‍♂️"],["🏌🏾‍♂"],["🏌🏿‍♂️"],["🏌🏿‍♂"],["🏌️‍♀️"],["🏌‍♀️"],["🏌️‍♀"],["🏌‍♀"],["🏌🏻‍♀️"],["🏌🏻‍♀"],["🏌🏼‍♀️"],["🏌🏼‍♀"],["🏌🏽‍♀️"],["🏌🏽‍♀"],["🏌🏾‍♀️"],["🏌🏾‍♀"],["🏌🏿‍♀️"],["🏌🏿‍♀"],["🏄"],["🏄🏻"],["🏄🏼"],["🏄🏽"],["🏄🏾"],["🏄🏿"],["🏄‍♂️"],["🏄‍♂"],["🏄🏻‍♂️"],["🏄🏻‍♂"],["🏄🏼‍♂️"],["🏄🏼‍♂"],["🏄🏽‍♂️"],["🏄🏽‍♂"],["🏄🏾‍♂️"],["🏄🏾‍♂"],["🏄🏿‍♂️"],["🏄🏿‍♂"],["🏄‍♀️"],["🏄‍♀"],["🏄🏻‍♀️"],["🏄🏻‍♀"],["🏄🏼‍♀️"],["🏄🏼‍♀"],["🏄🏽‍♀️"],["🏄🏽‍♀"],["🏄🏾‍♀️"],["🏄🏾‍♀"],["🏄🏿‍♀️"],["🏄🏿‍♀"],["🚣"],["🚣🏻"],["🚣🏼"],["🚣🏽"],["🚣🏾"],["🚣🏿"],["🚣‍♂️"],["🚣‍♂"],["🚣🏻‍♂️"],["🚣🏻‍♂"],["🚣🏼‍♂️"],["🚣🏼‍♂"],["🚣🏽‍♂️"],["🚣🏽‍♂"],["🚣🏾‍♂️"],["🚣🏾‍♂"],["🚣🏿‍♂️"],["🚣🏿‍♂"],["🚣‍♀️"],["🚣‍♀"],["🚣🏻‍♀️"],["🚣🏻‍♀"],["🚣🏼‍♀️"],["🚣🏼‍♀"],["🚣🏽‍♀️"],["🚣🏽‍♀"],["🚣🏾‍♀️"],["🚣🏾‍♀"],["🚣🏿‍♀️"],["🚣🏿‍♀"],["🏊"],["🏊🏻"],["🏊🏼"],["🏊🏽"],["🏊🏾"],["🏊🏿"],["🏊‍♂️"],["🏊‍♂"],["🏊🏻‍♂️"],["🏊🏻‍♂"],["🏊🏼‍♂️"],["🏊🏼‍♂"],["🏊🏽‍♂️"],["🏊🏽‍♂"],["🏊🏾‍♂️"],["🏊🏾‍♂"],["🏊🏿‍♂️"],["🏊🏿‍♂"],["🏊‍♀️"],["🏊‍♀"],["🏊🏻‍♀️"],["🏊🏻‍♀"],["🏊🏼‍♀️"],["🏊🏼‍♀"],["🏊🏽‍♀️"],["🏊🏽‍♀"],["🏊🏾‍♀️"],["🏊🏾‍♀"],["🏊🏿‍♀️"],["🏊🏿‍♀"],["⛹️"],["⛹"],["⛹🏻"],["⛹🏼"],["⛹🏽"],["⛹🏾"],["⛹🏿"],["⛹️‍♂️"],["⛹‍♂️"],["⛹️‍♂"],["⛹‍♂"],["⛹🏻‍♂️"],["⛹🏻‍♂"],["⛹🏼‍♂️"],["⛹🏼‍♂"],["⛹🏽‍♂️"],["⛹🏽‍♂"],["⛹🏾‍♂️"],["⛹🏾‍♂"],["⛹🏿‍♂️"],["⛹🏿‍♂"],["⛹️‍♀️"],["⛹‍♀️"],["⛹️‍♀"],["⛹‍♀"],["⛹🏻‍♀️"],["⛹🏻‍♀"],["⛹🏼‍♀️"],["⛹🏼‍♀"],["⛹🏽‍♀️"],["⛹🏽‍♀"],["⛹🏾‍♀️"],["⛹🏾‍♀"],["⛹🏿‍♀️"],["⛹🏿‍♀"],["🏋️"],["🏋"],["🏋🏻"],["🏋🏼"],["🏋🏽"],["🏋🏾"],["🏋🏿"],["🏋️‍♂️"],["🏋‍♂️"],["🏋️‍♂"],["🏋‍♂"],["🏋🏻‍♂️"],["🏋🏻‍♂"],["🏋🏼‍♂️"],["🏋🏼‍♂"],["🏋🏽‍♂️"],["🏋🏽‍♂"],["🏋🏾‍♂️"],["🏋🏾‍♂"],["🏋🏿‍♂️"],["🏋🏿‍♂"],["🏋️‍♀️"],["🏋‍♀️"],["🏋️‍♀"],["🏋‍♀"],["🏋🏻‍♀️"],["🏋🏻‍♀"],["🏋🏼‍♀️"],["🏋🏼‍♀"],["🏋🏽‍♀️"],["🏋🏽‍♀"],["🏋🏾‍♀️"],["🏋🏾‍♀"],["🏋🏿‍♀️"],["🏋🏿‍♀"],["🚴"],["🚴🏻"],["🚴🏼"],["🚴🏽"],["🚴🏾"],["🚴🏿"],["🚴‍♂️"],["🚴‍♂"],["🚴🏻‍♂️"],["🚴🏻‍♂"],["🚴🏼‍♂️"],["🚴🏼‍♂"],["🚴🏽‍♂️"],["🚴🏽‍♂"],["🚴🏾‍♂️"],["🚴🏾‍♂"],["🚴🏿‍♂️"],["🚴🏿‍♂"],["🚴‍♀️"],["🚴‍♀"],["🚴🏻‍♀️"],["🚴🏻‍♀"],["🚴🏼‍♀️"],["🚴🏼‍♀"],["🚴🏽‍♀️"],["🚴🏽‍♀"],["🚴🏾‍♀️"],["🚴🏾‍♀"],["🚴🏿‍♀️"],["🚴🏿‍♀"],["🚵"],["🚵🏻"],["🚵🏼"],["🚵🏽"],["🚵🏾"],["🚵🏿"],["🚵‍♂️"],["🚵‍♂"],["🚵🏻‍♂️"],["🚵🏻‍♂"],["🚵🏼‍♂️"],["🚵🏼‍♂"],["🚵🏽‍♂️"],["🚵🏽‍♂"],["🚵🏾‍♂️"],["🚵🏾‍♂"],["🚵🏿‍♂️"],["🚵🏿‍♂"],["🚵‍♀️"],["🚵‍♀"],["🚵🏻‍♀️"],["🚵🏻‍♀"],["🚵🏼‍♀️"],["🚵🏼‍♀"],["🚵🏽‍♀️"],["🚵🏽‍♀"],["🚵🏾‍♀️"],["🚵🏾‍♀"],["🚵🏿‍♀️"],["🚵🏿‍♀"],["🤸"],["🤸🏻"],["🤸🏼"],["🤸🏽"],["🤸🏾"],["🤸🏿"],["🤸‍♂️"],["🤸‍♂"],["🤸🏻‍♂️"],["🤸🏻‍♂"],["🤸🏼‍♂️"],["🤸🏼‍♂"],["🤸🏽‍♂️"],["🤸🏽‍♂"],["🤸🏾‍♂️"],["🤸🏾‍♂"],["🤸🏿‍♂️"],["🤸🏿‍♂"],["🤸‍♀️"],["🤸‍♀"],["🤸🏻‍♀️"],["🤸🏻‍♀"],["🤸🏼‍♀️"],["🤸🏼‍♀"],["🤸🏽‍♀️"],["🤸🏽‍♀"],["🤸🏾‍♀️"],["🤸🏾‍♀"],["🤸🏿‍♀️"],["🤸🏿‍♀"],["🤼"],["🤼‍♂️"],["🤼‍♂"],["🤼‍♀️"],["🤼‍♀"],["🤽"],["🤽🏻"],["🤽🏼"],["🤽🏽"],["🤽🏾"],["🤽🏿"],["🤽‍♂️"],["🤽‍♂"],["🤽🏻‍♂️"],["🤽🏻‍♂"],["🤽🏼‍♂️"],["🤽🏼‍♂"],["🤽🏽‍♂️"],["🤽🏽‍♂"],["🤽🏾‍♂️"],["🤽🏾‍♂"],["🤽🏿‍♂️"],["🤽🏿‍♂"],["🤽‍♀️"],["🤽‍♀"],["🤽🏻‍♀️"],["🤽🏻‍♀"],["🤽🏼‍♀️"],["🤽🏼‍♀"],["🤽🏽‍♀️"],["🤽🏽‍♀"],["🤽🏾‍♀️"],["🤽🏾‍♀"],["🤽🏿‍♀️"],["🤽🏿‍♀"],["🤾"],["🤾🏻"],["🤾🏼"],["🤾🏽"],["🤾🏾"],["🤾🏿"],["🤾‍♂️"],["🤾‍♂"],["🤾🏻‍♂️"],["🤾🏻‍♂"],["🤾🏼‍♂️"],["🤾🏼‍♂"],["🤾🏽‍♂️"],["🤾🏽‍♂"],["🤾🏾‍♂️"],["🤾🏾‍♂"],["🤾🏿‍♂️"],["🤾🏿‍♂"],["🤾‍♀️"],["🤾‍♀"],["🤾🏻‍♀️"],["🤾🏻‍♀"],["🤾🏼‍♀️"],["🤾🏼‍♀"],["🤾🏽‍♀️"],["🤾🏽‍♀"],["🤾🏾‍♀️"],["🤾🏾‍♀"],["🤾🏿‍♀️"],["🤾🏿‍♀"],["🤹"],["🤹🏻"],["🤹🏼"],["🤹🏽"],["🤹🏾"],["🤹🏿"],["🤹‍♂️"],["🤹‍♂"],["🤹🏻‍♂️"],["🤹🏻‍♂"],["🤹🏼‍♂️"],["🤹🏼‍♂"],["🤹🏽‍♂️"],["🤹🏽‍♂"],["🤹🏾‍♂️"],["🤹🏾‍♂"],["🤹🏿‍♂️"],["🤹🏿‍♂"],["🤹‍♀️"],["🤹‍♀"],["🤹🏻‍♀️"],["🤹🏻‍♀"],["🤹🏼‍♀️"],["🤹🏼‍♀"],["🤹🏽‍♀️"],["🤹🏽‍♀"],["🤹🏾‍♀️"],["🤹🏾‍♀"],["🤹🏿‍♀️"],["🤹🏿‍♀"],["🧘"],["🧘🏻"],["🧘🏼"],["🧘🏽"],["🧘🏾"],["🧘🏿"],["🧘‍♂️"],["🧘‍♂"],["🧘🏻‍♂️"],["🧘🏻‍♂"],["🧘🏼‍♂️"],["🧘🏼‍♂"],["🧘🏽‍♂️"],["🧘🏽‍♂"],["🧘🏾‍♂️"],["🧘🏾‍♂"],["🧘🏿‍♂️"],["🧘🏿‍♂"],["🧘‍♀️"],["🧘‍♀"],["🧘🏻‍♀️"],["🧘🏻‍♀"],["🧘🏼‍♀️"],["🧘🏼‍♀"],["🧘🏽‍♀️"],["🧘🏽‍♀"],["🧘🏾‍♀️"],["🧘🏾‍♀"],["🧘🏿‍♀️"],["🧘🏿‍♀"],["🛀"],["🛀🏻"],["🛀🏼"],["🛀🏽"],["🛀🏾"],["🛀🏿"],["🛌"],["🛌🏻"],["🛌🏼"],["🛌🏽"],["🛌🏾"],["🛌🏿"],["🧑‍🤝‍🧑"],["🧑🏻‍🤝‍🧑🏻"],["🧑🏻‍🤝‍🧑🏼"],["🧑🏻‍🤝‍🧑🏽"],["🧑🏻‍🤝‍🧑🏾"],["🧑🏻‍🤝‍🧑🏿"],["🧑🏼‍🤝‍🧑🏻"],["🧑🏼‍🤝‍🧑🏼"],["🧑🏼‍🤝‍🧑🏽"],["🧑🏼‍🤝‍🧑🏾"],["🧑🏼‍🤝‍🧑🏿"],["🧑🏽‍🤝‍🧑🏻"],["🧑🏽‍🤝‍🧑🏼"],["🧑🏽‍🤝‍🧑🏽"],["🧑🏽‍🤝‍🧑🏾"],["🧑🏽‍🤝‍🧑🏿"],["🧑🏾‍🤝‍🧑🏻"],["🧑🏾‍🤝‍🧑🏼"],["🧑🏾‍🤝‍🧑🏽"],["🧑🏾‍🤝‍🧑🏾"],["🧑🏾‍🤝‍🧑🏿"],["🧑🏿‍🤝‍🧑🏻"],["🧑🏿‍🤝‍🧑🏼"],["🧑🏿‍🤝‍🧑🏽"],["🧑🏿‍🤝‍🧑🏾"],["🧑🏿‍🤝‍🧑🏿"],["👭"],["👭🏻"],["👩🏻‍🤝‍👩🏼"],["👩🏻‍🤝‍👩🏽"],["👩🏻‍🤝‍👩🏾"],["👩🏻‍🤝‍👩🏿"],["👩🏼‍🤝‍👩🏻"],["👭🏼"],["👩🏼‍🤝‍👩🏽"],["👩🏼‍🤝‍👩🏾"],["👩🏼‍🤝‍👩🏿"],["👩🏽‍🤝‍👩🏻"],["👩🏽‍🤝‍👩🏼"],["👭🏽"],["👩🏽‍🤝‍👩🏾"],["👩🏽‍🤝‍👩🏿"],["👩🏾‍🤝‍👩🏻"],["👩🏾‍🤝‍👩🏼"],["👩🏾‍🤝‍👩🏽"],["👭🏾"],["👩🏾‍🤝‍👩🏿"],["👩🏿‍🤝‍👩🏻"],["👩🏿‍🤝‍👩🏼"],["👩🏿‍🤝‍👩🏽"],["👩🏿‍🤝‍👩🏾"],["👭🏿"],["👫"],["👫🏻"],["👩🏻‍🤝‍👨🏼"],["👩🏻‍🤝‍👨🏽"],["👩🏻‍🤝‍👨🏾"],["👩🏻‍🤝‍👨🏿"],["👩🏼‍🤝‍👨🏻"],["👫🏼"],["👩🏼‍🤝‍👨🏽"],["👩🏼‍🤝‍👨🏾"],["👩🏼‍🤝‍👨🏿"],["👩🏽‍🤝‍👨🏻"],["👩🏽‍🤝‍👨🏼"],["👫🏽"],["👩🏽‍🤝‍👨🏾"],["👩🏽‍🤝‍👨🏿"],["👩🏾‍🤝‍👨🏻"],["👩🏾‍🤝‍👨🏼"],["👩🏾‍🤝‍👨🏽"],["👫🏾"],["👩🏾‍🤝‍👨🏿"],["👩🏿‍🤝‍👨🏻"],["👩🏿‍🤝‍👨🏼"],["👩🏿‍🤝‍👨🏽"],["👩🏿‍🤝‍👨🏾"],["👫🏿"],["👬"],["👬🏻"],["👨🏻‍🤝‍👨🏼"],["👨🏻‍🤝‍👨🏽"],["👨🏻‍🤝‍👨🏾"],["👨🏻‍🤝‍👨🏿"],["👨🏼‍🤝‍👨🏻"],["👬🏼"],["👨🏼‍🤝‍👨🏽"],["👨🏼‍🤝‍👨🏾"],["👨🏼‍🤝‍👨🏿"],["👨🏽‍🤝‍👨🏻"],["👨🏽‍🤝‍👨🏼"],["👬🏽"],["👨🏽‍🤝‍👨🏾"],["👨🏽‍🤝‍👨🏿"],["👨🏾‍🤝‍👨🏻"],["👨🏾‍🤝‍👨🏼"],["👨🏾‍🤝‍👨🏽"],["👬🏾"],["👨🏾‍🤝‍👨🏿"],["👨🏿‍🤝‍👨🏻"],["👨🏿‍🤝‍👨🏼"],["👨🏿‍🤝‍👨🏽"],["👨🏿‍🤝‍👨🏾"],["👬🏿"],["💏"],["👩‍❤️‍💋‍👨"],["👩‍❤‍💋‍👨"],["👨‍❤️‍💋‍👨"],["👨‍❤‍💋‍👨"],["👩‍❤️‍💋‍👩"],["👩‍❤‍💋‍👩"],["💑"],["👩‍❤️‍👨"],["👩‍❤‍👨"],["👨‍❤️‍👨"],["👨‍❤‍👨"],["👩‍❤️‍👩"],["👩‍❤‍👩"],["👪"],["👨‍👩‍👦"],["👨‍👩‍👧"],["👨‍👩‍👧‍👦"],["👨‍👩‍👦‍👦"],["👨‍👩‍👧‍👧"],["👨‍👨‍👦"],["👨‍👨‍👧"],["👨‍👨‍👧‍👦"],["👨‍👨‍👦‍👦"],["👨‍👨‍👧‍👧"],["👩‍👩‍👦"],["👩‍👩‍👧"],["👩‍👩‍👧‍👦"],["👩‍👩‍👦‍👦"],["👩‍👩‍👧‍👧"],["👨‍👦"],["👨‍👦‍👦"],["👨‍👧"],["👨‍👧‍👦"],["👨‍👧‍👧"],["👩‍👦"],["👩‍👦‍👦"],["👩‍👧"],["👩‍👧‍👦"],["👩‍👧‍👧"],["🗣️"],["🗣"],["👤"],["👥"],["🫂"],["👣"]],[["🏻"],["🏼"],["🏽"],["🏾"],["🏿"],["🦰"],["🦱"],["🦳"],["🦲"]],[["🐵"],["🐒"],["🦍"],["🦧"],["🐶"],["🐕"],["🦮"],["🐕‍🦺"],["🐩"],["🐺"],["🦊"],["🦝"],["🐱"],["🐈"],["🐈‍⬛"],["🦁"],["🐯"],["🐅"],["🐆"],["🐴"],["🐎"],["🦄"],["🦓"],["🦌"],["🦬"],["🐮"],["🐂"],["🐃"],["🐄"],["🐷"],["🐖"],["🐗"],["🐽"],["🐏"],["🐑"],["🐐"],["🐪"],["🐫"],["🦙"],["🦒"],["🐘"],["🦣"],["🦏"],["🦛"],["🐭"],["🐁"],["🐀"],["🐹"],["🐰"],["🐇"],["🐿️"],["🐿"],["🦫"],["🦔"],["🦇"],["🐻"],["🐻‍❄️"],["🐻‍❄"],["🐨"],["🐼"],["🦥"],["🦦"],["🦨"],["🦘"],["🦡"],["🐾"],["🦃"],["🐔"],["🐓"],["🐣"],["🐤"],["🐥"],["🐦"],["🐧"],["🕊️"],["🕊"],["🦅"],["🦆"],["🦢"],["🦉"],["🦤"],["🪶"],["🦩"],["🦚"],["🦜"],["🐸"],["🐊"],["🐢"],["🦎"],["🐍"],["🐲"],["🐉"],["🦕"],["🦖"],["🐳"],["🐋"],["🐬"],["🦭"],["🐟"],["🐠"],["🐡"],["🦈"],["🐙"],["🐚"],["🐌"],["🦋"],["🐛"],["🐜"],["🐝"],["🪲"],["🐞"],["🦗"],["🪳"],["🕷️"],["🕷"],["🕸️"],["🕸"],["🦂"],["🦟"],["🪰"],["🪱"],["🦠"],["💐"],["🌸"],["💮"],["🏵️"],["🏵"],["🌹"],["🥀"],["🌺"],["🌻"],["🌼"],["🌷"],["🌱"],["🪴"],["🌲"],["🌳"],["🌴"],["🌵"],["🌾"],["🌿"],["☘️"],["☘"],["🍀"],["🍁"],["🍂"],["🍃"]],[["🍇"],["🍈"],["🍉"],["🍊"],["🍋"],["🍌"],["🍍"],["🥭"],["🍎"],["🍏"],["🍐"],["🍑"],["🍒"],["🍓"],["🫐"],["🥝"],["🍅"],["🫒"],["🥥"],["🥑"],["🍆"],["🥔"],["🥕"],["🌽"],["🌶️"],["🌶"],["🫑"],["🥒"],["🥬"],["🥦"],["🧄"],["🧅"],["🍄"],["🥜"],["🌰"],["🍞"],["🥐"],["🥖"],["🫓"],["🥨"],["🥯"],["🥞"],["🧇"],["🧀"],["🍖"],["🍗"],["🥩"],["🥓"],["🍔"],["🍟"],["🍕"],["🌭"],["🥪"],["🌮"],["🌯"],["🫔"],["🥙"],["🧆"],["🥚"],["🍳"],["🥘"],["🍲"],["🫕"],["🥣"],["🥗"],["🍿"],["🧈"],["🧂"],["🥫"],["🍱"],["🍘"],["🍙"],["🍚"],["🍛"],["🍜"],["🍝"],["🍠"],["🍢"],["🍣"],["🍤"],["🍥"],["🥮"],["🍡"],["🥟"],["🥠"],["🥡"],["🦀"],["🦞"],["🦐"],["🦑"],["🦪"],["🍦"],["🍧"],["🍨"],["🍩"],["🍪"],["🎂"],["🍰"],["🧁"],["🥧"],["🍫"],["🍬"],["🍭"],["🍮"],["🍯"],["🍼"],["🥛"],["☕"],["🫖"],["🍵"],["🍶"],["🍾"],["🍷"],["🍸"],["🍹"],["🍺"],["🍻"],["🥂"],["🥃"],["🥤"],["🧋"],["🧃"],["🧉"],["🧊"],["🥢"],["🍽️"],["🍽"],["🍴"],["🥄"],["🔪"],["🏺"]],[["🌍"],["🌎"],["🌏"],["🌐"],["🗺️"],["🗺"],["🗾"],["🧭"],["🏔️"],["🏔"],["⛰️"],["⛰"],["🌋"],["🗻"],["🏕️"],["🏕"],["🏖️"],["🏖"],["🏜️"],["🏜"],["🏝️"],["🏝"],["🏞️"],["🏞"],["🏟️"],["🏟"],["🏛️"],["🏛"],["🏗️"],["🏗"],["🧱"],["🪨"],["🪵"],["🛖"],["🏘️"],["🏘"],["🏚️"],["🏚"],["🏠"],["🏡"],["🏢"],["🏣"],["🏤"],["🏥"],["🏦"],["🏨"],["🏩"],["🏪"],["🏫"],["🏬"],["🏭"],["🏯"],["🏰"],["💒"],["🗼"],["🗽"],["⛪"],["🕌"],["🛕"],["🕍"],["⛩️"],["⛩"],["🕋"],["⛲"],["⛺"],["🌁"],["🌃"],["🏙️"],["🏙"],["🌄"],["🌅"],["🌆"],["🌇"],["🌉"],["♨️"],["♨"],["🎠"],["🎡"],["🎢"],["💈"],["🎪"],["🚂"],["🚃"],["🚄"],["🚅"],["🚆"],["🚇"],["🚈"],["🚉"],["🚊"],["🚝"],["🚞"],["🚋"],["🚌"],["🚍"],["🚎"],["🚐"],["🚑"],["🚒"],["🚓"],["🚔"],["🚕"],["🚖"],["🚗"],["🚘"],["🚙"],["🛻"],["🚚"],["🚛"],["🚜"],["🏎️"],["🏎"],["🏍️"],["🏍"],["🛵"],["🦽"],["🦼"],["🛺"],["🚲"],["🛴"],["🛹"],["🛼"],["🚏"],["🛣️"],["🛣"],["🛤️"],["🛤"],["🛢️"],["🛢"],["⛽"],["🚨"],["🚥"],["🚦"],["🛑"],["🚧"],["⚓"],["⛵"],["🛶"],["🚤"],["🛳️"],["🛳"],["⛴️"],["⛴"],["🛥️"],["🛥"],["🚢"],["✈️"],["✈"],["🛩️"],["🛩"],["🛫"],["🛬"],["🪂"],["💺"],["🚁"],["🚟"],["🚠"],["🚡"],["🛰️"],["🛰"],["🚀"],["🛸"],["🛎️"],["🛎"],["🧳"],["⌛"],["⏳"],["⌚"],["⏰"],["⏱️"],["⏱"],["⏲️"],["⏲"],["🕰️"],["🕰"],["🕛"],["🕧"],["🕐"],["🕜"],["🕑"],["🕝"],["🕒"],["🕞"],["🕓"],["🕟"],["🕔"],["🕠"],["🕕"],["🕡"],["🕖"],["🕢"],["🕗"],["🕣"],["🕘"],["🕤"],["🕙"],["🕥"],["🕚"],["🕦"],["🌑"],["🌒"],["🌓"],["🌔"],["🌕"],["🌖"],["🌗"],["🌘"],["🌙"],["🌚"],["🌛"],["🌜"],["🌡️"],["🌡"],["☀️"],["☀"],["🌝"],["🌞"],["🪐"],["⭐"],["🌟"],["🌠"],["🌌"],["☁️"],["☁"],["⛅"],["⛈️"],["⛈"],["🌤️"],["🌤"],["🌥️"],["🌥"],["🌦️"],["🌦"],["🌧️"],["🌧"],["🌨️"],["🌨"],["🌩️"],["🌩"],["🌪️"],["🌪"],["🌫️"],["🌫"],["🌬️"],["🌬"],["🌀"],["🌈"],["🌂"],["☂️"],["☂"],["☔"],["⛱️"],["⛱"],["⚡"],["❄️"],["❄"],["☃️"],["☃"],["⛄"],["☄️"],["☄"],["🔥"],["💧"],["🌊"]],[["🎃"],["🎄"],["🎆"],["🎇"],["🧨"],["✨"],["🎈"],["🎉"],["🎊"],["🎋"],["🎍"],["🎎"],["🎏"],["🎐"],["🎑"],["🧧"],["🎀"],["🎁"],["🎗️"],["🎗"],["🎟️"],["🎟"],["🎫"],["🎖️"],["🎖"],["🏆"],["🏅"],["🥇"],["🥈"],["🥉"],["⚽"],["⚾"],["🥎"],["🏀"],["🏐"],["🏈"],["🏉"],["🎾"],["🥏"],["🎳"],["🏏"],["🏑"],["🏒"],["🥍"],["🏓"],["🏸"],["🥊"],["🥋"],["🥅"],["⛳"],["⛸️"],["⛸"],["🎣"],["🤿"],["🎽"],["🎿"],["🛷"],["🥌"],["🎯"],["🪀"],["🪁"],["🎱"],["🔮"],["🪄"],["🧿"],["🎮"],["🕹️"],["🕹"],["🎰"],["🎲"],["🧩"],["🧸"],["🪅"],["🪆"],["♠️"],["♠"],["♥️"],["♥"],["♦️"],["♦"],["♣️"],["♣"],["♟️"],["♟"],["🃏"],["🀄"],["🎴"],["🎭"],["🖼️"],["🖼"],["🎨"],["🧵"],["🪡"],["🧶"],["🪢"]],[["👓"],["🕶️"],["🕶"],["🥽"],["🥼"],["🦺"],["👔"],["👕"],["👖"],["🧣"],["🧤"],["🧥"],["🧦"],["👗"],["👘"],["🥻"],["🩱"],["🩲"],["🩳"],["👙"],["👚"],["👛"],["👜"],["👝"],["🛍️"],["🛍"],["🎒"],["🩴"],["👞"],["👟"],["🥾"],["🥿"],["👠"],["👡"],["🩰"],["👢"],["👑"],["👒"],["🎩"],["🎓"],["🧢"],["🪖"],["⛑️"],["⛑"],["📿"],["💄"],["💍"],["💎"],["🔇"],["🔈"],["🔉"],["🔊"],["📢"],["📣"],["📯"],["🔔"],["🔕"],["🎼"],["🎵"],["🎶"],["🎙️"],["🎙"],["🎚️"],["🎚"],["🎛️"],["🎛"],["🎤"],["🎧"],["📻"],["🎷"],["🪗"],["🎸"],["🎹"],["🎺"],["🎻"],["🪕"],["🥁"],["🪘"],["📱"],["📲"],["☎️"],["☎"],["📞"],["📟"],["📠"],["🔋"],["🔌"],["💻"],["🖥️"],["🖥"],["🖨️"],["🖨"],["⌨️"],["⌨"],["🖱️"],["🖱"],["🖲️"],["🖲"],["💽"],["💾"],["💿"],["📀"],["🧮"],["🎥"],["🎞️"],["🎞"],["📽️"],["📽"],["🎬"],["📺"],["📷"],["📸"],["📹"],["📼"],["🔍"],["🔎"],["🕯️"],["🕯"],["💡"],["🔦"],["🏮"],["🪔"],["📔"],["📕"],["📖"],["📗"],["📘"],["📙"],["📚"],["📓"],["📒"],["📃"],["📜"],["📄"],["📰"],["🗞️"],["🗞"],["📑"],["🔖"],["🏷️"],["🏷"],["💰"],["🪙"],["💴"],["💵"],["💶"],["💷"],["💸"],["💳"],["🧾"],["💹"],["💱"],["💲"],["✉️"],["✉"],["📧"],["📨"],["📩"],["📤"],["📥"],["📦"],["📫"],["📪"],["📬"],["📭"],["📮"],["🗳️"],["🗳"],["✏️"],["✏"],["✒️"],["✒"],["🖋️"],["🖋"],["🖊️"],["🖊"],["🖌️"],["🖌"],["🖍️"],["🖍"],["📝"],["💼"],["📁"],["📂"],["🗂️"],["🗂"],["📅"],["📆"],["🗒️"],["🗒"],["🗓️"],["🗓"],["📇"],["📈"],["📉"],["📊"],["📋"],["📌"],["📍"],["📎"],["🖇️"],["🖇"],["📏"],["📐"],["✂️"],["✂"],["🗃️"],["🗃"],["🗄️"],["🗄"],["🗑️"],["🗑"],["🔒"],["🔓"],["🔏"],["🔐"],["🔑"],["🗝️"],["🗝"],["🔨"],["🪓"],["⛏️"],["⛏"],["⚒️"],["⚒"],["🛠️"],["🛠"],["🗡️"],["🗡"],["⚔️"],["⚔"],["🔫"],["🪃"],["🏹"],["🛡️"],["🛡"],["🪚"],["🔧"],["🪛"],["🔩"],["⚙️"],["⚙"],["🗜️"],["🗜"],["⚖️"],["⚖"],["🦯"],["🔗"],["⛓️"],["⛓"],["🪝"],["🧰"],["🧲"],["🪜"],["⚗️"],["⚗"],["🧪"],["🧫"],["🧬"],["🔬"],["🔭"],["📡"],["💉"],["🩸"],["💊"],["🩹"],["🩺"],["🚪"],["🛗"],["🪞"],["🪟"],["🛏️"],["🛏"],["🛋️"],["🛋"],["🪑"],["🚽"],["🪠"],["🚿"],["🛁"],["🪤"],["🪒"],["🧴"],["🧷"],["🧹"],["🧺"],["🧻"],["🪣"],["🧼"],["🪥"],["🧽"],["🧯"],["🛒"],["🚬"],["⚰️"],["⚰"],["🪦"],["⚱️"],["⚱"],["🗿"],["🪧"]],[["🏧"],["🚮"],["🚰"],["♿"],["🚹"],["🚺"],["🚻"],["🚼"],["🚾"],["🛂"],["🛃"],["🛄"],["🛅"],["⚠️"],["⚠"],["🚸"],["⛔"],["🚫"],["🚳"],["🚭"],["🚯"],["🚱"],["🚷"],["📵"],["🔞"],["☢️"],["☢"],["☣️"],["☣"],["⬆️"],["⬆"],["↗️"],["↗"],["➡️"],["➡"],["↘️"],["↘"],["⬇️"],["⬇"],["↙️"],["↙"],["⬅️"],["⬅"],["↖️"],["↖"],["↕️"],["↕"],["↔️"],["↔"],["↩️"],["↩"],["↪️"],["↪"],["⤴️"],["⤴"],["⤵️"],["⤵"],["🔃"],["🔄"],["🔙"],["🔚"],["🔛"],["🔜"],["🔝"],["🛐"],["⚛️"],["⚛"],["🕉️"],["🕉"],["✡️"],["✡"],["☸️"],["☸"],["☯️"],["☯"],["✝️"],["✝"],["☦️"],["☦"],["☪️"],["☪"],["☮️"],["☮"],["🕎"],["🔯"],["♈"],["♉"],["♊"],["♋"],["♌"],["♍"],["♎"],["♏"],["♐"],["♑"],["♒"],["♓"],["⛎"],["🔀"],["🔁"],["🔂"],["▶️"],["▶"],["⏩"],["⏭️"],["⏭"],["⏯️"],["⏯"],["◀️"],["◀"],["⏪"],["⏮️"],["⏮"],["🔼"],["⏫"],["🔽"],["⏬"],["⏸️"],["⏸"],["⏹️"],["⏹"],["⏺️"],["⏺"],["⏏️"],["⏏"],["🎦"],["🔅"],["🔆"],["📶"],["📳"],["📴"],["♀️"],["♀"],["♂️"],["♂"],["⚧️"],["⚧"],["⚕️"],["⚕"],["♾️"],["♾"],["♻️"],["♻"],["⚜️"],["⚜"],["🔱"],["📛"],["🔰"],["⭕"],["✅"],["☑️"],["☑"],["✔️"],["✔"],["✖️"],["✖"],["❌"],["❎"],["➕"],["➖"],["➗"],["➰"],["➿"],["〽️"],["〽"],["✳️"],["✳"],["✴️"],["✴"],["❇️"],["❇"],["‼️"],["‼"],["⁉️"],["⁉"],["❓"],["❔"],["❕"],["❗"],["〰️"],["〰"],["©️"],["©"],["®️"],["®"],["™️"],["™"],["#️⃣"],["#⃣"],["*️⃣"],["*⃣"],["0️⃣"],["0⃣"],["1️⃣"],["1⃣"],["2️⃣"],["2⃣"],["3️⃣"],["3⃣"],["4️⃣"],["4⃣"],["5️⃣"],["5⃣"],["6️⃣"],["6⃣"],["7️⃣"],["7⃣"],["8️⃣"],["8⃣"],["9️⃣"],["9⃣"],["🔟"],["🔠"],["🔡"],["🔢"],["🔣"],["🔤"],["🅰️"],["🅰"],["🆎"],["🅱️"],["🅱"],["🆑"],["🆒"],["🆓"],["ℹ️"],["ℹ"],["🆔"],["Ⓜ️"],["Ⓜ"],["🆕"],["🆖"],["🅾️"],["🅾"],["🆗"],["🅿️"],["🅿"],["🆘"],["🆙"],["🆚"],["🈁"],["🈂️"],["🈂"],["🈷️"],["🈷"],["🈶"],["🈯"],["🉐"],["🈹"],["🈚"],["🈲"],["🉑"],["🈸"],["🈴"],["🈳"],["㊗️"],["㊗"],["㊙️"],["㊙"],["🈺"],["🈵"],["🔴"],["🟠"],["🟡"],["🟢"],["🔵"],["🟣"],["🟤"],["⚫"],["⚪"],["🟥"],["🟧"],["🟨"],["🟩"],["🟦"],["🟪"],["🟫"],["⬛"],["⬜"],["◼️"],["◼"],["◻️"],["◻"],["◾"],["◽"],["▪️"],["▪"],["▫️"],["▫"],["🔶"],["🔷"],["🔸"],["🔹"],["🔺"],["🔻"],["💠"],["🔘"],["🔳"],["🔲"]],[["🏁"],["🚩"],["🎌"],["🏴"],["🏳️"],["🏳"],["🏳️‍🌈"],["🏳‍🌈"],["🏳️‍⚧️"],["🏳‍⚧️"],["🏳️‍⚧"],["🏳‍⚧"],["🏴‍☠️"],["🏴‍☠"],["🇦🇨"],["🇦🇩"],["🇦🇪"],["🇦🇫"],["🇦🇬"],["🇦🇮"],["🇦🇱"],["🇦🇲"],["🇦🇴"],["🇦🇶"],["🇦🇷"],["🇦🇸"],["🇦🇹"],["🇦🇺"],["🇦🇼"],["🇦🇽"],["🇦🇿"],["🇧🇦"],["🇧🇧"],["🇧🇩"],["🇧🇪"],["🇧🇫"],["🇧🇬"],["🇧🇭"],["🇧🇮"],["🇧🇯"],["🇧🇱"],["🇧🇲"],["🇧🇳"],["🇧🇴"],["🇧🇶"],["🇧🇷"],["🇧🇸"],["🇧🇹"],["🇧🇻"],["🇧🇼"],["🇧🇾"],["🇧🇿"],["🇨🇦"],["🇨🇨"],["🇨🇩"],["🇨🇫"],["🇨🇬"],["🇨🇭"],["🇨🇮"],["🇨🇰"],["🇨🇱"],["🇨🇲"],["🇨🇳"],["🇨🇴"],["🇨🇵"],["🇨🇷"],["🇨🇺"],["🇨🇻"],["🇨🇼"],["🇨🇽"],["🇨🇾"],["🇨🇿"],["🇩🇪"],["🇩🇬"],["🇩🇯"],["🇩🇰"],["🇩🇲"],["🇩🇴"],["🇩🇿"],["🇪🇦"],["🇪🇨"],["🇪🇪"],["🇪🇬"],["🇪🇭"],["🇪🇷"],["🇪🇸"],["🇪🇹"],["🇪🇺"],["🇫🇮"],["🇫🇯"],["🇫🇰"],["🇫🇲"],["🇫🇴"],["🇫🇷"],["🇬🇦"],["🇬🇧"],["🇬🇩"],["🇬🇪"],["🇬🇫"],["🇬🇬"],["🇬🇭"],["🇬🇮"],["🇬🇱"],["🇬🇲"],["🇬🇳"],["🇬🇵"],["🇬🇶"],["🇬🇷"],["🇬🇸"],["🇬🇹"],["🇬🇺"],["🇬🇼"],["🇬🇾"],["🇭🇰"],["🇭🇲"],["🇭🇳"],["🇭🇷"],["🇭🇹"],["🇭🇺"],["🇮🇨"],["🇮🇩"],["🇮🇪"],["🇮🇱"],["🇮🇲"],["🇮🇳"],["🇮🇴"],["🇮🇶"],["🇮🇷"],["🇮🇸"],["🇮🇹"],["🇯🇪"],["🇯🇲"],["🇯🇴"],["🇯🇵"],["🇰🇪"],["🇰🇬"],["🇰🇭"],["🇰🇮"],["🇰🇲"],["🇰🇳"],["🇰🇵"],["🇰🇷"],["🇰🇼"],["🇰🇾"],["🇰🇿"],["🇱🇦"],["🇱🇧"],["🇱🇨"],["🇱🇮"],["🇱🇰"],["🇱🇷"],["🇱🇸"],["🇱🇹"],["🇱🇺"],["🇱🇻"],["🇱🇾"],["🇲🇦"],["🇲🇨"],["🇲🇩"],["🇲🇪"],["🇲🇫"],["🇲🇬"],["🇲🇭"],["🇲🇰"],["🇲🇱"],["🇲🇲"],["🇲🇳"],["🇲🇴"],["🇲🇵"],["🇲🇶"],["🇲🇷"],["🇲🇸"],["🇲🇹"],["🇲🇺"],["🇲🇻"],["🇲🇼"],["🇲🇽"],["🇲🇾"],["🇲🇿"],["🇳🇦"],["🇳🇨"],["🇳🇪"],["🇳🇫"],["🇳🇬"],["🇳🇮"],["🇳🇱"],["🇳🇴"],["🇳🇵"],["🇳🇷"],["🇳🇺"],["🇳🇿"],["🇴🇲"],["🇵🇦"],["🇵🇪"],["🇵🇫"],["🇵🇬"],["🇵🇭"],["🇵🇰"],["🇵🇱"],["🇵🇲"],["🇵🇳"],["🇵🇷"],["🇵🇸"],["🇵🇹"],["🇵🇼"],["🇵🇾"],["🇶🇦"],["🇷🇪"],["🇷🇴"],["🇷🇸"],["🇷🇺"],["🇷🇼"],["🇸🇦"],["🇸🇧"],["🇸🇨"],["🇸🇩"],["🇸🇪"],["🇸🇬"],["🇸🇭"],["🇸🇮"],["🇸🇯"],["🇸🇰"],["🇸🇱"],["🇸🇲"],["🇸🇳"],["🇸🇴"],["🇸🇷"],["🇸🇸"],["🇸🇹"],["🇸🇻"],["🇸🇽"],["🇸🇾"],["🇸🇿"],["🇹🇦"],["🇹🇨"],["🇹🇩"],["🇹🇫"],["🇹🇬"],["🇹🇭"],["🇹🇯"],["🇹🇰"],["🇹🇱"],["🇹🇲"],["🇹🇳"],["🇹🇴"],["🇹🇷"],["🇹🇹"],["🇹🇻"],["🇹🇼"],["🇹🇿"],["🇺🇦"],["🇺🇬"],["🇺🇲"],["🇺🇳"],["🇺🇸"],["🇺🇾"],["🇺🇿"],["🇻🇦"],["🇻🇨"],["🇻🇪"],["🇻🇬"],["🇻🇮"],["🇻🇳"],["🇻🇺"],["🇼🇫"],["🇼🇸"],["🇽🇰"],["🇾🇪"],["🇾🇹"],["🇿🇦"],["🇿🇲"],["🇿🇼"],["🏴󠁧󠁢󠁥󠁮󠁧󠁿"],["🏴󠁧󠁢󠁳󠁣󠁴󠁿"],["🏴󠁧󠁢󠁷󠁬󠁳󠁿"]]]
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      expect_string = <<-STRING
[[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],["©"],["©"],["®"],["®"],[""],[""],["#"],["#"],["*"],["*"],["0"],["0"],["1"],["1"],["2"],["2"],["3"],["3"],["4"],["4"],["5"],["5"],["6"],["6"],["7"],["7"],["8"],["8"],["9"],["9"],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]],[[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""],[""]]]
STRING

      expect(sanitized_string).to eq(expect_string)
    end

    it 'must handle emoji 11.0 standard' do
      original_string = <<-STRING
🥰 Smiling Face With 3 Hearts
🥵 Hot Face
🥶 Cold Face
🥳 Partying Face
🥴 Woozy Face
🥺 Pleading Face
👨‍🦰 Man: Red Hair
👨🏻‍🦰 Man: Light Skin Tone, Red Hair
👨🏼‍🦰 Man: Medium-Light Skin Tone, Red Hair
👨🏽‍🦰 Man: Medium Skin Tone, Red Hair
👨🏾‍🦰 Man: Medium-Dark Skin Tone, Red Hair
👨🏿‍🦰 Man: Dark Skin Tone, Red Hair
👩‍🦰 Woman: Red Hair
👩🏻‍🦰 Woman: Light Skin Tone, Red Hair
👩🏼‍🦰 Woman: Medium-Light Skin Tone, Red Hair
👩🏽‍🦰 Woman: Medium Skin Tone, Red Hair
👩🏾‍🦰 Woman: Medium-Dark Skin Tone, Red Hair
👩🏿‍🦰 Woman: Dark Skin Tone, Red Hair
👨‍🦱 Man: Curly Hair
👨🏻‍🦱 Man: Light Skin Tone, Curly Hair
👨🏼‍🦱 Man: Medium-Light Skin Tone, Curly Hair
👨🏽‍🦱 Man: Medium Skin Tone, Curly Hair
👨🏾‍🦱 Man: Medium-Dark Skin Tone, Curly Hair
👨🏿‍🦱 Man: Dark Skin Tone, Curly Hair
👩‍🦱 Woman: Curly Hair
👩🏻‍🦱 Woman: Light Skin Tone, Curly Hair
👩🏼‍🦱 Woman: Medium-Light Skin Tone, Curly Hair
👩🏽‍🦱 Woman: Medium Skin Tone, Curly Hair
👩🏾‍🦱 Woman: Medium-Dark Skin Tone, Curly Hair
👩🏿‍🦱 Woman: Dark Skin Tone, Curly Hair
👨‍🦲 Man: Bald
👨🏻‍🦲 Man: Light Skin Tone, Bald
👨🏼‍🦲 Man: Medium-Light Skin Tone, Bald
👨🏽‍🦲 Man: Medium Skin Tone, Bald
👨🏾‍🦲 Man: Medium-Dark Skin Tone, Bald
👨🏿‍🦲 Man: Dark Skin Tone, Bald
👩‍🦲 Woman: Bald
👩🏻‍🦲 Woman: Light Skin Tone, Bald
👩🏼‍🦲 Woman: Medium-Light Skin Tone, Bald
👩🏽‍🦲 Woman: Medium Skin Tone, Bald
👩🏾‍🦲 Woman: Medium-Dark Skin Tone, Bald
👩🏿‍🦲 Woman: Dark Skin Tone, Bald
👨‍🦳 Man: White Hair
👨🏻‍🦳 Man: Light Skin Tone, White Hair
👨🏼‍🦳 Man: Medium-Light Skin Tone, White Hair
👨🏽‍🦳 Man: Medium Skin Tone, White Hair
👨🏾‍🦳 Man: Medium-Dark Skin Tone, White Hair
👨🏿‍🦳 Man: Dark Skin Tone, White Hair
👩‍🦳 Woman: White Hair
👩🏻‍🦳 Woman: Light Skin Tone, White Hair
👩🏼‍🦳 Woman: Medium-Light Skin Tone, White Hair
👩🏽‍🦳 Woman: Medium Skin Tone, White Hair
👩🏾‍🦳 Woman: Medium-Dark Skin Tone, White Hair
👩🏿‍🦳 Woman: Dark Skin Tone, White Hair
🦸 Superhero
🦸🏻 Superhero: Light Skin Tone
🦸🏼 Superhero: Medium-Light Skin Tone
🦸🏽 Superhero: Medium Skin Tone
🦸🏾 Superhero: Medium-Dark Skin Tone
🦸🏿 Superhero: Dark Skin Tone
🦸‍♀️ Woman Superhero
🦸🏻‍♀️ Woman Superhero: Light Skin Tone
🦸🏼‍♀️ Woman Superhero: Medium-Light Skin Tone
🦸🏽‍♀️ Woman Superhero: Medium Skin Tone
🦸🏾‍♀️ Woman Superhero: Medium-Dark Skin Tone
🦸🏿‍♀️ Woman Superhero: Dark Skin Tone
🦸‍♂️ Man Superhero
🦸🏻‍♂️ Man Superhero: Light Skin Tone
🦸🏼‍♂️ Man Superhero: Medium-Light Skin Tone
🦸🏽‍♂️ Man Superhero: Medium Skin Tone
🦸🏾‍♂️ Man Superhero: Medium-Dark Skin Tone
🦸🏿‍♂️ Man Superhero: Dark Skin Tone
🦹 Supervillain
🦹🏻 Supervillain: Light Skin Tone
🦹🏼 Supervillain: Medium-Light Skin Tone
🦹🏽 Supervillain: Medium Skin Tone
🦹🏾 Supervillain: Medium-Dark Skin Tone
🦹🏿 Supervillain: Dark Skin Tone
🦹‍♀️ Woman Supervillain
🦹🏻‍♀️ Woman Supervillain: Light Skin Tone
🦹🏼‍♀️ Woman Supervillain: Medium-Light Skin Tone
🦹🏽‍♀️ Woman Supervillain: Medium Skin Tone
🦹🏾‍♀️ Woman Supervillain: Medium-Dark Skin Tone
🦹🏿‍♀️ Woman Supervillain: Dark Skin Tone
🦹‍♂️ Man Supervillain
🦹🏻‍♂️ Man Supervillain: Light Skin Tone
🦹🏼‍♂️ Man Supervillain: Medium-Light Skin Tone
🦹🏽‍♂️ Man Supervillain: Medium Skin Tone
🦹🏾‍♂️ Man Supervillain: Medium-Dark Skin Tone
🦹🏿‍♂️ Man Supervillain: Dark Skin Tone
🦵 Leg
🦵🏻 Leg: Light Skin Tone
🦵🏼 Leg: Medium-Light Skin Tone
🦵🏽 Leg: Medium Skin Tone
🦵🏾 Leg: Medium-Dark Skin Tone
🦵🏿 Leg: Dark Skin Tone
🦶 Foot
🦶🏻 Foot: Light Skin Tone
🦶🏼 Foot: Medium-Light Skin Tone
🦶🏽 Foot: Medium Skin Tone
🦶🏾 Foot: Medium-Dark Skin Tone
🦶🏿 Foot: Dark Skin Tone
🦴 Bone
🦷 Tooth
🥽 Goggles
🥼 Lab Coat
🥾 Hiking Boot
🥿 Flat Shoe
🦝 Raccoon
🦙 Llama
🦛 Hippopotamus
🦘 Kangaroo
🦡 Badger
🦢 Swan
🦚 Peacock
🦜 Parrot
🦞 Lobster
🦟 Mosquito
🦠 Microbe
🥭 Mango
🥬 Leafy Green
🥯 Bagel
🧂 Salt
🥮 Moon Cake
🧁 Cupcake
🧭 Compass
🧱 Brick
🛹 Skateboard
🧳 Luggage
🧨 Firecracker
🧧 Red Envelope
🥎 Softball
🥏 Flying Disc
🥍 Lacrosse
🧿 Nazar Amulet
🧩 Jigsaw
🧸 Teddy Bear
♟ Chess Pawn
🧮 Abacus
🧾 Receipt
🧰 Toolbox
🧲 Magnet
🧪 Test Tube
🧫 Petri Dish
🧬 DNA
🧯 Fire Extinguisher
🧴 Lotion Bottle
🧵 Thread
🧶 Yarn
🧷 Safety Pin
🧹 Broom
🧺 Basket
🧻 Roll of Paper
🧼 Soap
🧽 Sponge
♾ Infinity
🏴‍☠️ Pirate Flag
🦰 Red Hair
🦱 Curly Hair
🦲 Bald
🦳 White Hair
STRING
      sanitized_string = RemoveEmoji.remove(original_string.gsub(/[\r\n]/, ''))

      expect_string = " Smiling Face With 3 Hearts Hot Face Cold Face Partying Face Woozy Face Pleading Face Man: Red Hair Man: Light Skin Tone, Red Hair Man: Medium-Light Skin Tone, Red Hair Man: Medium Skin Tone, Red Hair Man: Medium-Dark Skin Tone, Red Hair Man: Dark Skin Tone, Red Hair Woman: Red Hair Woman: Light Skin Tone, Red Hair Woman: Medium-Light Skin Tone, Red Hair Woman: Medium Skin Tone, Red Hair Woman: Medium-Dark Skin Tone, Red Hair Woman: Dark Skin Tone, Red Hair Man: Curly Hair Man: Light Skin Tone, Curly Hair Man: Medium-Light Skin Tone, Curly Hair Man: Medium Skin Tone, Curly Hair Man: Medium-Dark Skin Tone, Curly Hair Man: Dark Skin Tone, Curly Hair Woman: Curly Hair Woman: Light Skin Tone, Curly Hair Woman: Medium-Light Skin Tone, Curly Hair Woman: Medium Skin Tone, Curly Hair Woman: Medium-Dark Skin Tone, Curly Hair Woman: Dark Skin Tone, Curly Hair Man: Bald Man: Light Skin Tone, Bald Man: Medium-Light Skin Tone, Bald Man: Medium Skin Tone, Bald Man: Medium-Dark Skin Tone, Bald Man: Dark Skin Tone, Bald Woman: Bald Woman: Light Skin Tone, Bald Woman: Medium-Light Skin Tone, Bald Woman: Medium Skin Tone, Bald Woman: Medium-Dark Skin Tone, Bald Woman: Dark Skin Tone, Bald Man: White Hair Man: Light Skin Tone, White Hair Man: Medium-Light Skin Tone, White Hair Man: Medium Skin Tone, White Hair Man: Medium-Dark Skin Tone, White Hair Man: Dark Skin Tone, White Hair Woman: White Hair Woman: Light Skin Tone, White Hair Woman: Medium-Light Skin Tone, White Hair Woman: Medium Skin Tone, White Hair Woman: Medium-Dark Skin Tone, White Hair Woman: Dark Skin Tone, White Hair Superhero Superhero: Light Skin Tone Superhero: Medium-Light Skin Tone Superhero: Medium Skin Tone Superhero: Medium-Dark Skin Tone Superhero: Dark Skin Tone Woman Superhero Woman Superhero: Light Skin Tone Woman Superhero: Medium-Light Skin Tone Woman Superhero: Medium Skin Tone Woman Superhero: Medium-Dark Skin Tone Woman Superhero: Dark Skin Tone Man Superhero Man Superhero: Light Skin Tone Man Superhero: Medium-Light Skin Tone Man Superhero: Medium Skin Tone Man Superhero: Medium-Dark Skin Tone Man Superhero: Dark Skin Tone Supervillain Supervillain: Light Skin Tone Supervillain: Medium-Light Skin Tone Supervillain: Medium Skin Tone Supervillain: Medium-Dark Skin Tone Supervillain: Dark Skin Tone Woman Supervillain Woman Supervillain: Light Skin Tone Woman Supervillain: Medium-Light Skin Tone Woman Supervillain: Medium Skin Tone Woman Supervillain: Medium-Dark Skin Tone Woman Supervillain: Dark Skin Tone Man Supervillain Man Supervillain: Light Skin Tone Man Supervillain: Medium-Light Skin Tone Man Supervillain: Medium Skin Tone Man Supervillain: Medium-Dark Skin Tone Man Supervillain: Dark Skin Tone Leg Leg: Light Skin Tone Leg: Medium-Light Skin Tone Leg: Medium Skin Tone Leg: Medium-Dark Skin Tone Leg: Dark Skin Tone Foot Foot: Light Skin Tone Foot: Medium-Light Skin Tone Foot: Medium Skin Tone Foot: Medium-Dark Skin Tone Foot: Dark Skin Tone Bone Tooth Goggles Lab Coat Hiking Boot Flat Shoe Raccoon Llama Hippopotamus Kangaroo Badger Swan Peacock Parrot Lobster Mosquito Microbe Mango Leafy Green Bagel Salt Moon Cake Cupcake Compass Brick Skateboard Luggage Firecracker Red Envelope Softball Flying Disc Lacrosse Nazar Amulet Jigsaw Teddy Bear Chess Pawn Abacus Receipt Toolbox Magnet Test Tube Petri Dish DNA Fire Extinguisher Lotion Bottle Thread Yarn Safety Pin Broom Basket Roll of Paper Soap Sponge Infinity Pirate Flag Red Hair Curly Hair Bald White Hair"

      expect(sanitized_string).to eq(expect_string)
    end

    it '必須清除以下常見的 emoji 符號' do
      original_string = <<-STRING
...‼⁉™↔↕↖↗↘↙↩↪⌚⌛⌨⏏⏩⏪⏫⏬⏭⏮⏯⏰⏱⏲
⏳⏸⏹⏺Ⓜ▪▫▶◀◻◼◽◾☀☁☂☃☄☎☑☔☕☘☝☠☢☣☦☪☮☯☸
☹☺♀♂♈♉♊♋♌♍♎♏♐♑♒♓♠♣♥♦♨♻♿⚒⚓⚔⚕⚖⚗⚙⚛
⚜⚠⚡⚪⚫⚰⚱⚽⚾⛄⛅⛈⛎⛏⛑⛓⛔⛩⛪⛰⛱⛲⛳⛴⛵⛷⛸
⛹⛺⛽✂✅✈✉✊✋✌✍✏✒✔✖✝✡✨✳✴❄❇❌❎❓❔❕❗❣❤➕➖➗➡⤴
⤵⬅⬆⬇⬛⬜⭐⭕〰〽㊗㊙🀄🃏🅰🅱🅾🅿🆎🆑🆒🆓🆔🆕🆖🆗🆘🆙🆚🈁
🈂🈚🈯🈲🈳🈴🈵🈶🈷🈸🈹🈺🉐🉑🌀🌁🌂🌃🌄🌅🌆🌇🌈🌉🌊🌋🌌🌍
🌎🌏🌐🌑🌒🌓🌔🌕🌖🌗🌘🌙🌚🌛🌜🌝🌞🌟🌠🌡🌤🌥🌦🌧🌨🌩🌪
🌫🌬🌰🌱🌲🌳🌴🌵🌶🌷🌸🌹🌺🌻🌼🌽🌾🌿🍀🍁🍂🍃🍄🍅🍆🍇🍈
🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🍔🍕🍖🍗🍘🍙🍚🍛🍜🍝🍞🍟🍠🍡🍢🍣
🍤🍥🍦🍧🍨🍩🍪🍫🍬🍭🍮🍯🍰🍱🍲🍳🍴🍵🍶🍷🍸🍹🍺🍻🍼🍽🎀
🎁🎂🎃🎄🎅🎆🎇🎈🎉🎊🎋🎌🎍🎎🎏🎐🎑🎒🎓🎖🎗🎙🎚🎛🎞🎟🎠
🎡🎢🎣🎤🎥🎦🎧🎨🎩🎪🎫🎬🎭🎮🎯🎰🎱🎲🎳🎴🎵🎶🎷🎸🎹🎺🎻
🎼🎽🎾🎿🏀🏁🏂🏃🏄🏅🏆🏇🏈🏉🏊🏋🏌🏍🏎🏔🏕🏖🏗🏘🏙🏚🏛
🏜🏝🏞🏟🏠🏡🏢🏣🏤🏥🏦🏧🏨🏩🏪🏫🏬🏭🏮🏯🏰🏳🏴🏵🏷🐀🐁
🐂🐃🐄🐅🐆🐇🐈🐉🐊🐋🐌🐍🐎🐏🐐🐑🐒🐓🐔🐕🐖🐗🐘🐙🐚🐛🐜
🐝🐞🐟🐠🐡🐢🐣🐤🐥🐦🐧🐨🐩🐪🐫🐬🐭🐮🐯🐰🐱🐲🐳🐴🐵🐶🐷
🐸🐹🐺🐻🐼🐽🐾🐿👀👁👂👃👄👅👆👇👈👉👊👋👌👍👎👏👐👑👒
👓👔👕👖👗👘👙👚👛👜👝👞👟👠👡👢👣👤👥👦👧👨👩👪👫👬👭
👮👯👰👱👲👳👴👵👶👷👸👹👺👻👼👽👾👿💀💁💂💃💄💅💆💇💈
💉💊💋💌💍💎💏💐💑💒💓💔💕💖💗💘💙💚💛💜💝💞💟💠💡💢💣
💤💥💦💧💨💩💪💫💬💭💮💯💰💱💲💳💴💵💶💷💸💹💺💻💼💽💾
💿📀📁📂📃📄📅📆📇📈📉📊📋📌📍📎📏📐📑📒📓📔📕📖📗📘📙
📚📛📜📝📞📟📠📡📢📣📤📥📦📧📨📩📪📫📬📭📮📯📰📱📲📳📴
📵📶📷📸📹📺📻📼📽🔀🔁🔂🔃🔄🔅🔆🔇🔈🔉🔊🔋🔌🔍🔎🔏🔐🔑
🔒🔓🔔🔕🔖🔗🔘🔙🔚🔛🔜🔝🔞🔟🔠🔡🔢🔣🔤🔥🔦🔧🔨🔩🔪🔫🔬
🔭🔮🔯🔰🔱🔲🔳🔴🔵🔶🔷🔸🔹🔺🔻🔼🔽🕉🕊🕐🕑🕒🕓🕔🕕🕖🕗
🕘🕙🕚🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤🕥🕦🕧🕯🕰🕳🕴🕵🕶🕷🕸🕹🖇🖊
🖋🖌🖍🖐🖕🖖🖥🖨🖱🖲🖼🗂🗃🗄🗑🗒🗓🗜🗝🗞🗡🗣🗨🗯🗳🗺🗻
🗼🗽🗾🗿😀😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖
😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱
😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎
🙏🚀🚁🚂🚃🚄🚅🚆🚇🚈🚉🚊🚋🚌🚍🚎🚏🚐🚑🚒🚓🚔🚕🚖🚗🚘🚙
🚚🚛🚜🚝🚞🚟🚠🚡🚢🚣🚤🚥🚦🚧🚨🚩🚪🚫🚬🚭🚮🚯🚰🚱🚲🚳🚴
🚵🚶🚷🚸🚹🚺🚻🚼🚽🚾🚿🛀🛁🛂🛃🛄🛅🛋🛌🛍🛎🛏🛠🛡🛢🛣🛤
🛥🛩🛫🛬🛰🛳...
STRING
      expect_string = "......"

      sanitized_string = RemoveEmoji.remove(original_string.gsub(/[\r\n]/, ''))

      expect(sanitized_string).to eq(expect_string)
    end

    it '必須清除以下常見的 emoji 國旗' do
      original_string = <<-STRING
...
🇦🇺🇨🇦🇨🇭🇨🇳🇩🇪🇪🇸🇫🇷🇬🇧🇮🇱🇮🇹
🇯🇵🇰🇳🇰🇷🇳🇴🇳🇵🇵🇸🇶🇦🇷🇺🇸🇸🇺🇸
🏳️🏴🏁🚩🏳️‍🌈🇹🇹🇹🇷🇹🇨🇨🇳🇨🇫🇧🇹🇹🇲
🇼🇸🇸🇻🇨🇾🇷🇴🇷🇴🇬🇺🇸🇩🇲🇽🇩🇪🇱🇦
🇱🇨🇸🇳🇱🇰🇫🇯🇲🇿🇮🇲🇲🇰🇲🇾🇾🇹🇳🇿
🇬🇩🇨🇷🇺🇸🇻🇮🇹🇩🇿🇦🇦🇶🇰🇪🇬🇫🇿🇲
...
STRING

      expect_string = "......"

      sanitized_string = RemoveEmoji.remove(original_string.gsub(/[\r\n]/, ''))

      expect(sanitized_string).to eq(expect_string)
    end

    it '必須清除以下隨機挑選的 apple emoji ' do
      original_string = <<-STRING
...
🚗🚓🚨🚲🚡🚅🛶💺🚏🏦🕋🏦📱⌚️🖲🕯🔮🎎🎐💌📦
📌☮️💟🔯☪️㊗️🈵🆚💯❕🔞🚷🔰⁉️⚠️💤🌐🌀▶️🔠🔣↔️↩️👁‍🗨
◽️🔲🇵🇦🏳️🏳️‍🌈🇹🇲🇹🇷🤛🤜🏼👍🏽👌☝🏼🥝🥦🌶🌽🍎
🍲🍔🥞🍝🍔🍗🌮🍯🥠🥢🍴🥄🥂☕️😀😃😄🤣😂😅😆☺️😊😍😌
😘😗😙😚😜😝😛😋🤨🧐🤓😒😏🤩🤩😎😞😔😖😢😣☹️😩🙁🤯
😰😓😦😲🤒🤕👿👹👽✊🏼
...
STRING

      expect_string = "......"

      sanitized_string = RemoveEmoji.remove(original_string.gsub(/[\r\n]/, ''))

      expect(sanitized_string).to eq(expect_string)
    end

    it '必須清除以下指定的 sample emoji variation sequences' do
      original_string = ".ℹ⌛⚠✒❤🀄🈚⌛︎⚠︎✒︎❤︎🀄︎🈚︎ℹ️⌛️⚠️✒️❤️🀄️🈚️."
      expect_string = ".."

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(expect_string)
    end

    it '必須清除以下 fitzpatrick modifiers ' do
      original_string = ".👦👦🏻👦🏼👦🏽👦🏾👦🏿👧👧🏻👧🏼👧🏽👧🏾👧🏿👨👨🏻👨🏼👨🏽👨🏾👨🏿👩👩🏻👩🏼👩🏽👩🏾👩🏿."
      expect_string = ".."

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(expect_string)
    end

    it '不能過濾掉以下常用的特殊符號，因為程式處理宗旨是移除「emoji」' do

      original_string = <<-STRING
~!@{}$%^&()_+=.'"~ \ | /?>><<:;#*
œ∑´†¥¨ˆøπ“‘«åß∂ƒ˙∆˚¬…æΩ≈ç√∫˜µ≤≥÷
『』：“｜，。？～！＠＃＄％＾＆＊（）＿＋
abcdefghijklmnopqrstuvwxyz....0123456789
ABCDEFGHIJKLMNOPQRSTUVWXYZ....0123456789
◎　⊕　⊙　○　●　△　▲　▽　▼　☆　◇　◆　□ ■ ◐ ◑
＿　ˍ　▁　▂　▃　▄　▅　▆　▇　█　▏　▎　▍　▌
　▋　▊　▉　◢　◣　◥　◤　►　◄
▣　▤　▥　▦　▧　▨　▩　▒　░
①　②　③　④　⑤　⑥　⑦　⑧　⑨　⑩　⑪　⑫　⑬　⑭ ⑮
⑯　⑰　⑱　⑲　⑳  ㊣　㊟　㊕　㊡　㊝
⑴　⑵　⑶　⑷　⑸ 　⑹　⑺　⑻　⑼　⑽
㈠　㈡　㈢　㈣　㈤　㈥　㈦　㈧　㈨　㈩
１　２　３　４　５　６　７　８　９　０　〡　〢　〣　〤 〥 
〦　〧　〨　〩　十　卄　卅 
Ⅰ　Ⅱ　Ⅲ　Ⅳ　Ⅴ　Ⅵ　Ⅶ　Ⅷ　Ⅸ　Ⅹ　Ⅺ　Ⅻ
ⓐ　ⓑ　ⓒ　ⓓ　ⓔ　ⓕ　ⓖ　ⓗ　ⓘ　ⓙ　ⓚ　ⓛ　ⓜ　ⓝ　ⓞ　
ⓟ　ⓠ　ⓡ　ⓢ　ⓣ　ⓤ　ⓥ　ⓦ　ⓧ　ⓨ　ⓩ
⒜　⒝　⒞　⒟　⒠　⒡　⒢　⒣　⒤　⒥　⒦　⒧　⒨　⒩　⒪　
⒫　⒬　⒭　⒮　⒯　⒰　⒱　⒲　⒳　⒴　⒵
Α　Β　Γ　Δ　Ε　Ζ　Η　Θ　Ι　Κ　Λ　Μ　Ν　Ξ　Ο　Π　Ρ
Σ　Τ　Υ　Φ　Χ　Ψ　Ω　α　 ν　ξ　ο　π　ρ　σ τ　υ　φ　
χ　ψ　ω 
╳　＋　﹢　－　×　÷　＝　≠　≒　∞　ˇ　±　√　⊥　∠　∟　⊿　㏒
㏑　∫　∮　∵　∴
ㄅ　ㄆ　ㄇ　ㄈ　ㄉ　ㄊ　ㄋ　ㄌ　ㄍ　ㄎ　ㄏ　ㄐ　ㄑ　ㄒ ㄓ　ㄔ
ㄕ　ㄖ　ㄗ　ㄘ　ㄙ　ㄚ　ㄛ　ㄜ　ㄝ　ㄞ ㄟ　ㄠ　ㄡ　ㄢ　ㄣ　ㄤ
ㄥ　ㄦ　ㄧ　ㄨ　ㄩ　˙　ˊ　ˇ　ˋ 
Ä　Ã　Ç　Ê　Ë　Î　Ï　Ð　Ñ　Õ　Ö　Û　Ü　ã　ä　ê　ë　î ï　õ
ö　Ÿ　Ŵ　Ž　Ť　Ř　Ň　ĩ　ħ　ą　č　Ĥ
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(original_string)
    end

    it '電話、愛心、星星等 emoji 需要移除掉' do
      # © 跟 ® 會略過
      original_string = '.㊗★☎☏♡♥♣♧☻☺♠♤▪▫.'
      sanitized_string = RemoveEmoji.remove(original_string)
      expect_string = '..'

      expect(sanitized_string).to eq(expect_string)
    end

    it 'must not remove Chinese content and all symbols in the text' do
      # 
      # 備註：
      # 
      #   系統基本上經過大部分的中文資料測試過，但礙於個人資料
      #   保護法與民眾隱私考量，套件裡的測試腳本不會放置任何可
      #   辨識姓名、住址相關的文字內容，作為測試對照。
      # 
      original_string = <<-STRING
== Sample Text for Test Program ==
相會高是的命美升告家神
這兒願活又總父入不不一有……不年友友景理了大兒學？喜出環內溫打準到旅深轉有人、
為了非，看說條就利去麗在。該他那請得後包重火藝，友來同教來林花兒力解，學提流
千遊，般科造景樂重眾理……地有成期？那裡決利歡明被開雨同！體卻出光內請裡工度手，
著手想、明出媽最。不方願這王不了下從？

性後注正來廣電要那個列就……作覺分臺斷產中活情、好為服，這事不可回外油然以成，
親背來史裡人和裝體方性，會府利了了藝子因弟在寫一過兒事言常已的排金看到：年的
區文人行其，起技南！制生個功有位方見國年何不地學了步定密氣小飛自要得意分個油
覺術發故度孩春大班小下他水識裡畫：體起是像可一美靈要個態我印開到……示的市必備
雜照無語流老我密，心食中影的羅第！

一適為好推裡過充院下三自問……間裡陽發是演政次書為。密實備樓笑是？了該身生數來計
行，果增真應關一地畫三西信來為一坡他原維孩各是間，買讓家地成如！為時最其生覺有
業山，時先而請：期我表商適給國：學感須的好了笑找角王力縣減就一方公的，勢看下自
水，離是打重的覺，的古年分計現期綠，一集改銷：班做本地這子民這起家特活式而通完
知的你半我，許法車；價人所……對向人到口東市小是上創生得門……技平時戲獨風色斯假，
樓良洲物要成！今他打。覺同該方是！實帶不。

言清但經多常候上事靜不曾熱，苦應答特邊公喜作味廣生見時特黑後防我近者舞重信造，
是設車中過養正車科；聲可到著明就？家種高……年我花師政；了出留開仍事口天候年月集
：思體歡聲同的，方會一方；及大指際品輪過比有問失如每水門。金選師同著書怎們長上父。

未友不極，物片類書車裡！十今果半接國先雄環此不們風，獨知家調能發節岸步止才他最少
、大士術福護慢毒飯百影？書化戰程的題實，法為年達們、精時指生法以，那難優住自維劇
了受二多公會，計漸麼訴會解傳高回。溫世高示把量品！高好身要門有比飛高事、科場海服
香看部國醫親面以產好唱車飛之進球下了古：光指是投加包氣國一處接南性給許花馬什目給
良一是那金類？

海安古想長過中的理的過開，久一力家園裝只數，節作了！作定國性；的見無一對日夫答住
有；中生表慢、有行例念只來才，精了樣，完海策魚；最定母？女者品我了，麗落全臺了友
過得濟，著國照詩出一今明考的，陽語思通本手是許嗎跑心本！

間我險不此學，天可所以沒得溫資日園，法死什，營的對記，大客這有團隨命，地家該心別
開，把區大紅兒原，背應即政雖際活；而以法到這？呢龍為現子！

長得子別是會。樣稱場布他發童區清接人部參作臺不節……們獎應；是味在……著黑不子望媽館
。治久識、美開的食的科大計天不可器性！主長雄我道；大大是簡。北行語甚教市教學動有
轉成但機看技前只，並起切；受完緊認爾高他下外。親國是時安的。好實此時做萬自住、高
兒全議？

像化不是你他上象要代南子並試告論度園還以研影顧新排議營望相超海我。病感。

對女樂以後每展持的大！超失何病安車廣的觀表往有在著後主人全職於提藥黨，之養和打個的
車的元非道童的小事你了，團學二眼……亮不出重法環分能較自音改到不得界。
STRING
      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(original_string)
    end

    it 'must not remove Japanese content and all symbols in the text' do
      original_string = <<-STRING
== Sample Text for Test Program ==
「にっぽん」、「にほん」と読まれる。どちらも多く用いられているため、
日本政府は正式な読み方をどちらか一方には定めておらず、どちらの読みで
も良いとしている[5]。

7世紀の後半の国際関係から生じた「日本」国号は、当時の国際的な読み（音読）
で「ニッポン」（呉音）ないし「ジッポン」（漢音）と読まれたものと推測される
[6]。いつ「ニホン」の読みが始まったか定かでない。仮名表記では「にほん」と
表記された。平安時代には「ひのもと」とも和訓されるようになった。
室町時代の謡曲・狂言は、中国人に「ニッポン」と読ませ、日本人に「ニホン」と
読ませている。安土桃山時代にポルトガル人が編纂した『日葡辞書』や『日本小文
典』等には、「ニッポン」「ニホン」「ジッポン」の読みが見られ、その用例から
判断すると、改まった場面・強調したい場合に「ニッポン」が使われ、日常の場面
で「ニホン」が使われていた[7]。このことから小池清治は、中世の日本人が中国
語的な語感のある「ジッポン」を使用したのは、中国人・西洋人など対外的な場面
に限定されていて、日常だと「ニッポン」「ニホン」が用いられていたのでは、と
推測している[8]。なお、現在に伝わっていない「ジッポン」音については、その
他の言語も参照。

近代以降も「ニッポン」「ニホン」両方使用される中、1934年（昭和9年）には文
部省臨時国語調査会が「にっぽん」に統一して外国語表記もJapanを廃してNippon
を使用するという案を示したこともあったが、不完全に終わった。同年、日本放送
協会（NHK）は「放送上、国号としては『にっぽん』を第一の読み方とし、『にほん
』を第二の読み方とする」と決定した[9]。

その後、2009年（平成21年）6月30日には、政府が「『にっぽん』『にほん』という
読み方については、いずれも広く通用しており、どちらか一方に統一する必要はない」
とする答弁書を閣議決定した[5]。

現在、通商や交流の点で自国外と関連のある紙幣、切手などには「NIPPON」と描かれ
（紙幣発券者も「にっぽんぎんこう」である）ているほか、NHK、日本テレビ[10]、
ニッポン放送、日本武道館、全日本空輸、近畿日本鉄道、西日本鉄道、日本体育大学、
日本郵便、NEXCO東日本・NEXCO中日本・NEXCO西日本[11]、日本電気、日本電信電話、
日本郵船、日本通運などで「NIPPON」（にっぽん）表記を用いる一方、「NIHON」
（にほん）表記を用いる例は、日本大学、日本航空、日本経済新聞、日本たばこ産業、
JR東日本・JR西日本、日本ユニシス、日本相撲協会、日本交通、日本オリンピック委員
会などがある。日本経済新聞が2016年に行った調査によると、社名に「日本」が含まれ
る上場企業の読み方は、「にほん」が60%、「にっぽん」が40%であり、「にっぽん」と
読ませる企業の比率が増加傾向にあった。テレビ番組名では「にっぽん」が使われること
が多くなってきている[12]
。なお、日本国憲法の読みについて、内閣法制局は、読み方について特に規定がなく、
どちらでもよいとしている[13]。
その他の言語

「en:Names of Japan」も参照
英語での公式な表記は、Japan（ジャパン）。形容詞はJapanese（ジャパニーズ）。
略記は、JPNが用いられる。JAP（ジャップ）は、侮蔑的な意味があるので注意が必要で
ある。Nippon（ニッポン）が用いられる例も見られ、具体的には、UPU等によるローマ
字表記（1965年（昭和40年）以降）、郵便切手や日本銀行券などでNippon表記を用い
いる。略称は、NPNが用いられる。

その他、各国語で日本を意味する固有名詞は、アン チャパイン（愛: an tSeapáin）、
ヤーパン（独: Japan）、ジャポン（仏: Japon）、ヤパン（蘭: Japan）、ハポン（西:
 Japón）、ジャッポーネ（伊: Giappone）、ヤポニヤ（波: Japonia）、ヤポーニヤ（
 露: Япония）、イープン（泰: ญี่ปุ่น）など、特定の時期に特定の地域の中国語で「日
 本国」を発音した「ジーパングォ」を写し取った（日本語読みの「ジッポン」に由来すると
 の説もある）、ジパング (Xipangu/Zipang/Zipangu) ないしジャパング (Japangu) 
 を語源とすると考えられる。

漢字文化圏においては、ジーペン（中: Rìběn;日本）[22]、イルボン（朝: 일본;日本）、
ニャッバーン（越: Nhật Bản;日本）[23] など、「日本」をそのまま自国語の発音で読んでいる。
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(original_string)
    end

    it 'must not remove Korean content and all symbols in the text' do
      original_string = <<-STRING
== Sample Text for Test Program ==
'한국어'(韓國語)는 대한민국에서 쓰는 명칭이고 조선민주주의인민공화국에
서는 조선말이라고 한다. 대한민국과 조선민주주의인민공화국이 공동으로 만
는 사전의 이름은 《겨레말 큰사전》이다. 1994년부터 열리는 대한민국·조
선민주주의인민공화국·중화인민공화국 간의 한글과 한국어 컴퓨터 처리를 표
준화하려는 학회명은 '코리안 컴퓨터처리 국제학술대회'이다.

동아시아[편집]
중국, 일본, 베트남 등 한자 문화권에 속하는 아시아 여러 국가에서는 한국어
를 가리키는 명칭으로 조선어(朝鮮語)가 주로 사용되어왔으나, 최근에는 한국
어로 부르는 경향이 늘고 있다.

중화인민공화국은 조선민주주의인민공화국과의 밀접한 관계에 따라 한국어를 주
로 '차오셴위(중국어: 朝鲜语, 병음: Cháoxiǎnyǔ, 조선어)'라고 부른다
. 1992년 대한민국과의 수교 이후에 양국이 활발한 교류를 하게 되면서 '한
궈위(중국어: 韩国语, 병음: Hánguóyǔ, 한국어)' 또는 '한위'(韓語, 한
어) 등의 명칭이 쓰이기도 하나, 학술상으로는 여전히 문화어 계열 어휘를 많
이 사용한다.

일본에서는 한국어를 '조센고(조선어)'라고 불렀으나, 근래에는 '간코쿠고(한
국어)'라고 부르는 경향이 강하다. 일본 내의 한인(韓人) 교포 사회는 재일본
대한민국민단(민단)과 재일본조선인총련합회(총련)로 갈라져 각각 표준어와 문화
어를 지지하는 경향이 있으므로 NHK는 한국어 회화 명칭을 '간코쿠고(한국어)
', '조센고(조선어)' 대신 '한구루 고자'(ハングル講座, 한글 강좌)라고 하
였다. 그 밖에도 중립성을 고려하여 '고리아고'(コリア語, 코리아어)나 '가라
노쿠니노코토바'(韓の国のことば, からのくにのことば, 한나라말) 등의 명칭
을 쓰기도 한다. '고리아고(코리아어)'는 1977년 조치 대학교가 처음으로 전공
 학과를 개설한 이후 일부 대학교에서 쓴다.

중화민국(타이완)은 한국어를 '한궈위(중국어: 韓國語, 병음: Hánguóyǔ, 
한국어)'나 '한위(중국어: 韓語, 병음: Hányǔ, 한어)'로 부른다.

베트남에서의 용법은 중국과 거의 비슷하다. 현재는 한자를 사용하지 않지만, 과
에 한자 문화권에 속했던 베트남은 한국을 '쩨우띠엔'(베트남어: Triều Tiên,
 朝鮮)이라고 불렀고, 대한민국은 '남쩨우띠엔'(베트남어: Nam Triều Tiên
 , 南朝鮮), 한국어는 '띠엥쩨우띠엔'(Tiếng Triều Tiên, 朝鮮語)으로 불
 렀다. 한국에 관련된 일반 어휘는 문화어 계열의 어휘가 더 많이 쓰인다. 대한민
 국의 표준어는 '띠엥한'(Tiếng Hàn, 韓語)이라고 부른다.
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(original_string)
    end

    it 'must not remove Simplified Chinese content and all symbols in the text' do
      original_string = <<-STRING
简体用语编辑
简体中文和繁体中文除了汉字写法（如简化字和繁体字间，以及各地汉字写法规范）
的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原子笔”，在
简体中文中多用“圆珠笔”，繁体中文里的“史达林”在简体中文里被称为“斯大林”，
繁体中文里的“北韩”在简体中文里被称为“朝鲜〔此处指朝鲜民主主义人民共和国〕
”，繁体中文里的“雪梨〔澳大利亚城市〕”在简体中文里被称为“悉尼”等。由于有这
种差异，“简体用语”这种说法随之产生。不过其实这并非繁简中文本身的差异，而
主要是由于使用两者的人群，尤其是中国大陆和台湾在20世纪中叶由于政治原因分隔
后交流较少，造成了用词习惯的差异。这种现象在1980年代以来由于科技术语的不同
而更加明显。而且，在同样使用简体中文的中国大陆、新加坡等地也存在一些用词习
惯的不同。因此，有人指出正确的提法应为“中国大陆用语”、“新加坡用语”等，而非
“简体用语”。
电脑使用编辑
由于使用简体中文的主要是中国大陆，故此电脑中的“简体中文”一直以来其实代指“
中国大陆中文”，意即绝大部份软件的“简体中文版”使用的是中国大陆的用语和翻译，
此等软件亦通行于其他使用简体中文的社群。
Windows操作系统的语言代码通常使用zh-CN表示简体中文(中国)
中文编码编辑
简体中文自1980年代以来通常使用中华人民共和国国家标准总局公布的GB 2312，以及
其后继的GBK和GB 18030中文编码。近年来随着Unicode跨语言编码集的出现，也被广泛使用。
简体来历编辑
中国文字的简化，是二十世纪五十年代中期，中国大陆政府在周恩来总理的直接主持关心
下，结合了上百名专家，对数千个常用的中国文字进行了一次字体的简化。当时的出发
点，应该说是分析了中国的国情。中国经历了上百年的内忧外患，国弱民穷。中国又是一
个几千年的农业国，百分之八十以上的人口在农村，而当时中国一半以上的人口是文盲和
半文盲，而要在这样的基础上发展文化，建设国家，识字扫盲成了一个重要的历史任务。
简化文字，当时的目的，就是为了让数以亿计的人民大众，能够尽早尽快地识字认字，提
高使用文字的速度，提升文化水平，方便学生在校学习，以此为最基本的基础，才有可能
学习科技，建立一个富强的国家。
有些台湾人第一眼看到简体字，大概会感到惊讶。中国大陆的字改变了那么多，尤其是离
乡几十年的老兵，看到家乡变了，文字也变了。有的人讨厌看简体字，一见到它就说是“匪
书“、“匪文“。更有的人把文字简化运动看满清政府的剃发相提并论，说共产党为了要改造
人民，强迫人民阅读简体字，事实上不然。
汉字自古以来就有繁体与简体两套写法，在甲骨文与金文中，就可发现汉字简体的形迹，例
如“车“就有多种写法。后来经过篆体隶化，并存两种写法的文字越来越多。由六朝到隋唐，
汉字逐渐隶楷化，当时或许是为了美观对称，很多古字都增加笔画，而简体字开始被称为“俗
体“、“小写“、“破字“等，在民间社会仍广为流传。
不过，有时候文字有简化和繁化的现象，左传和甲骨文上有假借字，当一件我们要表达的事很
抽象，最初时无法造字，于是找来一个与它音近的字来借代，当后来或者可以造字了，就有这
个抽象概念的本字了。有时后来仍旧无法造字，于是一个字去加偏旁，去别异，表示与本来假
借的字不同。而有时一个字越写越繁了，人有觉得麻烦了，就去简化了，于是在魏晋有俗文字
学，即俗体字。也有的字越来越简单了，又不易看清本义了，所以又去替它加笔画了，所以繁
化了。
所以，笔划写得越来越繁的字，绝对不少于写得越来越简的字。
繁化和简化的字，在古代就已存在。有些人造新字，后来就通行使用。例如：杨坚在北周时以外
戚辅政，进封“随王“，但他嫌“随“有“走“之意，于是改“随“为“隋“。武则天最爱造字，她一生
造了十多个字。其中一个“国“字，她改成“口“中间加“武“，但后来觉得自己被包围在围城中，
就不再使用。中国文字在秦始皇统一文字之后，随著时代改变，出现了繁体、简体、俗体、异体
等字。官方的文书，都采用繁体，其他的文字是难登大雅之堂。这段期间，民间文字的使用多是
采约定成俗的方式，一直到太平天国时期，才开始文字的简化。
STRING

      sanitized_string = RemoveEmoji.remove(original_string)

      expect(sanitized_string).to eq(original_string)
    end


    it 'must not remove Japanese content and all symbols in the text (Benchmark)' do

      benchmark_info = Benchmark.measure do
        100.times do
          original_string = <<-STRING
    == Sample Text for Test Program ==
    「にっぽん」、「にほん」と読まれる。どちらも多く用いられているため、
    日本政府は正式な読み方をどちらか一方には定めておらず、どちらの読みで
    も良いとしている[5]。

    7世紀の後半の国際関係から生じた「日本」国号は、当時の国際的な読み（音読）
    で「ニッポン」（呉音）ないし「ジッポン」（漢音）と読まれたものと推測される
    [6]。いつ「ニホン」の読みが始まったか定かでない。仮名表記では「にほん」と
    表記された。平安時代には「ひのもと」とも和訓されるようになった。
    室町時代の謡曲・狂言は、中国人に「ニッポン」と読ませ、日本人に「ニホン」と
    読ませている。安土桃山時代にポルトガル人が編纂した『日葡辞書』や『日本小文
    典』等には、「ニッポン」「ニホン」「ジッポン」の読みが見られ、その用例から
    判断すると、改まった場面・強調したい場合に「ニッポン」が使われ、日常の場面
    で「ニホン」が使われていた[7]。このことから小池清治は、中世の日本人が中国
    語的な語感のある「ジッポン」を使用したのは、中国人・西洋人など対外的な場面
    に限定されていて、日常だと「ニッポン」「ニホン」が用いられていたのでは、と
    推測している[8]。なお、現在に伝わっていない「ジッポン」音については、その
    他の言語も参照。

    مندوبة واشنطن في الأمم المتحدة: لا تغير في سلوك إيران المزعزع
    لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن
    ويتوسع ليشمل المجتمع الدولي بكامله هيلي: على المجتمع الدولي أن
    يتحرك قبل أن تصبح إيران مثل كوريا الشمالية هيلي: انتهاكات إيران
    تتوسع من اليمن للبنان والعراق وسوريا هيلي: نريد بناء تحالف دولي
    ＊這是一段測試文字，用來告訴你真的我很想刪掉過濾不掉的 Emoji XD
    ＊系統不會刪除到中文、韓文、阿拉伯文、日文，請放心使用。
    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    近代以降も「ニッポン」「ニホン」両方使用される中、1934年（昭和9年）
    には文중국, 일본, 베트남 등 한자 문화권에 속하는 아시아 여러 국가에서는 
    한국어的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原
    لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن
    ويتوسع ليشمل المجتمع الدولي بكامله هيلي: على المجتمع الدولي أن
    子笔”，在œ∑´†¥¨ˆøπ“‘«åß∂ƒ˙∆˚¬…æΩ≈ç√∫˜µ≤≥÷『』：“｜，。？～！
    ＠＃＄％＾＆＊（）＿＋abcdefghijklmnopqrstuvwxyz....0123456789
    ㈠　㈡　㈢　㈣　㈤　㈥　㈦　㈧　㈨　㈩１　２　３　４　５　６　７　
    ８　９　０　〡　〢　〣　〤 〥 〦　〧　〨　〩　十　卄　卅 Ⅰ　Ⅱ　Ⅲ　
    Ⅳ　Ⅴ　Ⅵ　Ⅶ　Ⅷ　Ⅸ　Ⅹ　Ⅺ
    ]　Ⅻⓐ　ⓑ　ⓒ　ⓓ　ⓔ　ⓕ　ⓖ　ⓗ　ⓘ　ⓙ　ⓚ　ⓛ　ⓜ　ⓝ　ⓞ　
    STRING
          RemoveEmoji.remove(original_string)
        end
      end

      best_performance = benchmark_info.real < 0.05
      expect(best_performance).to be true
    end

  end

end