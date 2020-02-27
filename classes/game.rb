require_relative './player'

class Game


  def initialize
    @player1 = Player.new("Mace Windu")
    @player2 = Player.new("Yoda")
    @player3 = Player.new("Kylo Ren")
    @player4 = Player.new("Ray")
    @players = [@player1, @player2, @player3, @player4].shuffle
    @round = 1
  end

  def next_round
    @players.rotate!
    @round += 1
    sleep 0.7
  end

  def display_round
    puts "---------------"
    puts "  Round: #{@round}   "
    puts "---------------"
    puts
  end

  def display_summary

    puts
    puts "--------------"
    puts " Round Summary"
    puts "--------------"

    @players.each {|player| puts "#{player.name} HP: #{player.dead? ? "DEAD" : player.hp}"}

  end

  def winner
    alive_players.first
  end

  def game_over?
    alive_players.count <= 1
  end

  def alive_players
    @players.select {|player| player.hp > 0}
  end

  def get_attack_jedi
    alive_players.sample
  end

  def get_ennemy_jedi(attack)
    alive_players.select{|player| player != attack}.sample
  end

  def play

    until (game_over?) do
      display_round
      attack_jedi = get_attack_jedi 
      enemy_jedi = get_ennemy_jedi(attack_jedi)

      attack_jedi.attacks(enemy_jedi)
      display_summary
      next_round
    end
    puts "#{winner.name} has won!"
  end


end