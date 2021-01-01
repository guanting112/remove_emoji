Remove Emoji
=================================================

[![Gem Version](https://badge.fury.io/rb/remove_emoji.svg)](https://badge.fury.io/rb/remove_emoji)
[![Build Status](https://travis-ci.org/guanting112/remove_emoji.svg?branch=master)](https://travis-ci.org/guanting112/remove_emoji)
[![Code Climate](https://codeclimate.com/github/guanting112/remove_emoji/badges/gpa.svg)](https://codeclimate.com/github/guanting112/remove_emoji)

此為針對「移除」Unicode Emoji 圖示 所開發的專屬套件，
您可以透過該套件移除令人困擾的 Emoji 符號。
( It can remove any of the emoji supported by that package. )

![emoji](https://i.imgur.com/yA6WYmS.jpg)


Installation / 安裝方式
--------

via Rubygems

```shell
gem install remove_emoji
```

In your Gemfile:

```ruby
gem 'remove_emoji'
```

Usage / 使用方式
--------

使用方式很簡單，僅需要呼叫 RemoveEmoji::Sanitize.call 遞入你要過濾的字串即可過濾。

```ruby
require 'remove_emoji'

original_string = "Remove..😊😍😌🤕👿👹👧👧🏻👧🏼👧🏽🤜🏼👍🏽👌☝🏼🥝🥦🌶🌽🍎..Emoji"

puts RemoveEmoji::Sanitize.call(original_string)
```

```ruby
require 'remove_emoji'

# ==========
#   Input
# ==========
original_string = <<-STRING
abcdefghijklmnopqrstuvwxyz....0123456789
不極，物片類書車裡！十今果半接國先雄
ニッポン」「ニホン」両方使用される中
🚗🚓🚨🚲🚡🚅🛶💺🚏🏦🕋🏦📱⌚️🖲🕯🔮🎎🎐💌📦
📌☮️💟🔯☪️㊗️🈵🆚💯❕🔞🚷🔰⁉️⚠️💤🌐🌀▶️🔠🔣↔️↩️👁‍🗨
◽️🔲🇵🇦🏳️🏳️‍🌈🇹🇲🇹🇷🤛🤜🏼👍🏽👌☝🏼🥝🥦🌶🌽🍎
🍲🍔🥞🍝🍔🍗🌮🍯🥠🥢🍴🥄🥂☕️😀😃😄🤣😂😅😆☺️😊😍😌
😘😗😙😚😜😝😛😋🤨🧐🤓😒😏🤩🤩😎😞😔😖😢😣☹️😩🙁🤯
😰😓😦😲🤒🤕👿👹👽✊🏼
には文중국, 일본, 베트남 등 한자 문화권에 속하는 아시아 여러 국가에서는 
한국어的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原
لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن
STRING

# ==========
#   Output
# ==========
puts RemoveEmoji::Sanitize.call(original_string)

# Result:
# abcdefghijklmnopqrstuvwxyz....0123456789
# 不極，物片類書車裡！十今果半接國先雄
# ニッポン」「ニホン」両方使用される中
# 
# 
# 
# 
# 
# 
# には文중국, 일본, 베트남 등 한자 문화권에 속하는 아시아 여러 국가에서는
# 한국어的差异外，通常认为还存在词汇上的差异。例如繁体中文里多用的“原
# لمنطقة الشرق الأوسط هيلي: التحرك ضد إيران سيبدأ من مجلس الأمن

```

Demo ( Before / After )
------

![emoji_effect](https://i.imgur.com/OzcQYWL.jpg)

LICENSE
--------

本專案原始碼採 MIT LICENSE 授權 ( 詳見 LICENSE 檔案 )
