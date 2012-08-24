Endlist
===============
Endlist allows you to persistantly store lists of data in Ruby through the endlist API.

    taco-party:endlist tylr$ bundle exec irb
    ruby-1.9.2-p290 :001 > require 'endlist'
     => true 
    ruby-1.9.2-p290 :002 > list = Endlist::List[1,2,3,4,"asshole"]
     => [1, 2, 3, 4, "asshole"] 
    ruby-1.9.2-p290 :003 > list.save
     => "MCbUb" 
    ruby-1.9.2-p290 :004 > list.find('MCbUb')
