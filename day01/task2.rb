# Program wypisuje piosenkę 99 bottles - http://www.99-bottles-of-beer.net/lyrics.html
# Użycie
# program [a]|[a] [b]
# a - ilość powtórzeń piosenki
# b - ilość butelek w piosence


class Song
  def initialize(args)
    bottles_song(args[0] == nil ? 1 : args[0].to_i, args[1] == nil ? 99 : args[1].to_i)
  end

  def bottles_song(amount = 1, bottles = 99)
    # Ilość powtórzeń piosenki
    (1..amount).each do
      # Dla każdej z butelek
    numbers = bottles..0
      (numbers.first).downto(numbers.last).each do |number|
          #Więcej niż 5 butelek
          if number > 5
            puts "#{number} bottles of beer on the wall, #{number} bottles of beer."
            puts "Take one down and pass it around, #{number-1} bottles of beer on the wall."
          #Dla od 5 do 1 butelki
          elsif number <=5 && number >= 1
            name = ""
            name2 = ""
            case number
              when 5
                name  = "five"
                name2 = "four"
              when 4
                name = "four"
                name2 = "three"
              when 3
                name = "three"
                name2 = "two"
              when 2
                name = "two"
                name2 = "one"
              when 1
                name = "one"
                name2 = "no more"
            end

            puts "#{name} #{number==1?"bottle": "bottles"} of beer on the wall, #{name} #{number==1?"bottle": "bottles"} of beer."
            puts "Take one down and pass it around, #{name2} #{number-1==1?"bottle": "bottles"} of beer on the wall."
          #Jeśli nic już nie pozostło
          else
            puts 'No more bottles of beer on the wall, no more bottles of beer.'
            puts 'Go to the store and buy some more, 99 bottles of beer on the wall.'
          end
      end
    end
    end
end

Song.new(ARGV)
