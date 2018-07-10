# Program liczy odległosć edycyjną pomiędzy dwoma słowami.
# Użycie
# Bez argumentów prosi o podanie słów.
# s file1 file2 - liczy odległość pomiędzy dwoma plikami tekstowymi
# t - Tryb testowy. Liczy odległość pomiędzy dwoma ustalonymi słowami.

class Distance

  attr_accessor :first
  attr_accessor :second

  def initialize(params)

    if params[0] == nil
      puts "Please type two words:"
      @first = gets.chop!
      @second = gets.chop!
    elsif params[0].downcase == "s" && !params[1].empty? && !params[2].empty?
      require 'pathname'

      if Pathname.new(params[1]).exist? && Pathname.new(params[2]).exist?
        @first = IO.read(params[1]).chop!
        @second = IO.read(params[2]).chop!
      else
        puts "One of files \"#{params[1]}\", \"#{params[2]}\" don't exists!"
        puts "Use standard words."
      end
    elsif params[0].downcase == "i"
      @first = "some strange sentence"
      @second = "sentence"
    else
      return
    end

    puts "Edit distance for \"#{@first}\" and \"#{@second}\" is #{levenshtein_distance(@first, @second, first.length, second.length)}"
  end

  def levenshtein_distance(first, second, m, n)

    return n if m == 0
    return m if n == 0

    return levenshtein_distance(first, second, m-1, n-1) if first[m-1] == second[n-1]

    return 1 + [levenshtein_distance(first, second, m, n-1),
                levenshtein_distance(first, second, m-1, n),
                levenshtein_distance(first, second, m-1, n-1)].min
  end

end

Distance.new(ARGV)
