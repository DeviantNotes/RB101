require 'yaml'
MESSAGES = YAML.load_file('rpsls.yml')

VALID_CHOICES = %w[Rock Paper Scissors Lizard Spock]

OUTCOMES = { 'Rock' => ['Scissors', 'Lizard'], 'Paper' => ['Rock', 'Spock'],
             'Scissors' => ['Paper', 'Lizard'], 'Lizard' => ['Spock', 'Paper'],
             'Spock' => ['Rock', 'Scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def choice_format(choice)
  if choice.empty?
    choice
  elsif choice.start_with?('s')
    which_s_skip?(choice)
  else
    choice = choice.chars[0]
    VALID_CHOICES.each do |valid_choice|
      choice.replace(valid_choice) if valid_choice.downcase.start_with?(choice)
    end
    choice
  end
end

def which_s_skip?(choice)
  if choice.start_with?('sc')
    'Scissors'
  elsif choice.start_with?('sp')
    'Spock'
  elsif choice == 's'
    which_s?
  end
end

def which_s?
  clarification = ''
  loop do
    prompt(MESSAGES['which_s'])
    clarification = gets.chomp.downcase
    if clarification == 'c' || clarification == 'p'
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end
  clarification == 'c' ? 'Scissors' : 'Spock'
end

def win?(first, second)
  OUTCOMES.fetch(first).include?(second)
end

def display_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt(MESSAGES['pwin'])
  elsif win?(computer_choice, player_choice)
    prompt(MESSAGES['cwin'])
  else
    prompt(MESSAGES['tie'])
  end
end

def display_score(player_score, computer_score, ties)
  prompt("The current score is:")
  puts "   Player   - #{player_score}"
  puts "   Computer - #{computer_score}"
  puts "   Ties     - #{ties}"
end

loop do
  system 'clear'
  player_score = 0
  computer_score = 0
  ties = 0

  prompt(MESSAGES['welcome'])
  puts(MESSAGES['first3'])
  puts(MESSAGES['tips'])

  loop do
    if player_score == 3
      prompt(MESSAGES['pgwin'])
      break
    elsif computer_score == 3
      prompt(MESSAGES['cgwin'])
      break
    end

    player_choice = ''
    computer_choice = VALID_CHOICES.sample

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(' - ')}.")
      player_choice = choice_format(gets.chomp.downcase)
      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt(MESSAGES['invalid'])
      end
    end

    prompt("You chose: #{player_choice}. Computer chose: #{computer_choice}")

    display_results(player_choice, computer_choice)

    if win?(player_choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, player_choice)
      computer_score += 1
    else
      ties += 1
    end

    display_score(player_score, computer_score, ties)
    sleep(1.5)
    system('clear')
  end

  prompt(MESSAGES['again?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
