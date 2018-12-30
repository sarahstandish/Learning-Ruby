#exercise 40 from ruby the hard way
#https://learnrubythehardway.org/book/ex40.html

class Song

    def initialize(lyrics)
        @lyrics = lyrics
    end

    def sing_me_a_song
        puts "---------------------"
        @lyrics.each { |line| puts line }
        puts "---------------------"
    end

    def add_verse(more_lyrics)
        more_lyrics.each { |line| @lyrics.push(line) }
    end

end

jolene = ["Jolene, Jolene, Jolene, Jolene", "I'm begging of you please don't take my man", "Jolene, Jolene, Jolene, Jolene", "Please don't take him just because you can"]

jolene = Song.new(jolene)

cest_la_vie = ["On va s'aimer", "on va danser", "Oui c'est la vie", "lalalalala"]

cest_la_vie = Song.new(cest_la_vie)

jolene.sing_me_a_song

cest_la_vie.sing_me_a_song

more_jolene = ["Your beauty is beyond compare", "With flaming locks of auburn hair", "With ivory skin and eyes of emerald green"]

more_cest_la_vie = ["Rani manadem ela liyam", "Mahma tkuni beida elia", "Rani manadem ela liyamhdro", "Ana fik w fiya"]

jolene.add_verse(more_jolene)

jolene.sing_me_a_song

cest_la_vie.add_verse(more_cest_la_vie)

cest_la_vie.sing_me_a_song