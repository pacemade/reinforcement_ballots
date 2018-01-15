require 'pry'
# Each hash represents a voting ballot, with three names in 1st, 2nd, and 3rd place.
# A first place vote is worth 3 points, a 2nd place vote is worth 2 points, and a 3rd place vote is worth 1 point.
#
# For example, the first ballot {1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'}
# shows that this voter chose Smudge for first place,Tigger for 2nd, and Simba for 3rd.
# Smudge would be awarded 3 points, Tigger would be awarded 2 points, and Simba would be awarded 1 point.
#
# Tally up all the votes and determine who won.

ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]

contestants = []

  ballots.each do |bal_hash|
    bal_hash.each_value do |value|
      contestants << {value => 0}
    end
  end

contestants.uniq!
contestants = contestants.reduce({}, :merge)

  ballots.each do |ballot|
    ballot.each do |points, name|
      contestants[name] += (4 - points)
    end
  end

contestants = contestants.sort_by {|key, value| value}.reverse

puts "And the winner is #{contestants.first.first}, winning with #{contestants.first.last} points!"

    # if the contestants key is equal to the hash value, add (4 - hash key) to the contestants value


# throw the contestant names into a hash {name => 0}
# check contestant key with key in ballots
# points awarded = 4 - key
