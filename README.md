# README

This project calculates the all answer to 24 consists of numbers and the operations(+, - ,* ,/)

eg.

```ruby
    rake 'game_24[3,3,6,6]' 
    #3*((6/3)+6)=24
    
    rake 'game_24[3,2,3,4]'
    #无解

    rake 'game_24[5,5,6,6]'
    #((5-6)+5)*6=24
    #((5+5)-6)*6=24
    #(5*5)-(6/6)=24
    #(5-(6-5))*6=24
    #(6-(6/5))*5=24
    
```
