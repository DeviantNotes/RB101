require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def monthly_payment(loan_amount, monthly_interest, loan_duration)
  loan_amount * (monthly_interest / 
    (1 - (1 + monthly_interest)**(-loan_duration)))
end

def prompt(message)
  puts "=> #{message}"
end

def valid_number(num)
  (num.to_i.to_s == num || num.to_f.to_s == num) && num.to_f.positive?
end

def valid_apr(apr)
  valid_number(apr) && apr.to_f.between?(0, 100)
end

def y_n_format(answer)
  answer.downcase!
  case answer
  when 'yes', 'y' then true
  when 'no', 'n' then false
  end
end

loan_amount = ''
apr = ''
loan_duration = ''

loop do
  system 'clear'

  prompt(MESSAGES['welcome'])

  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.delete('$').delete(',')
    break if valid_number(loan_amount)
    prompt(MESSAGES['valid_input'])
  end

  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp.delete('%')
    break if valid_apr(apr)
    prompt(MESSAGES['valid_input'])
  end

  loop do
    prompt(MESSAGES['loan_duration'])
    loan_duration = gets.chomp
    break if valid_number(loan_duration)
    prompt(MESSAGES['valid_input'])
  end

  prompt("Your monthly payment will be: $#{monthly_payment(loan_amount.to_f, (
      (apr.to_f / 100) / 12), loan_duration.to_f).round(2)}.")

  prompt(MESSAGES['again?'])
  answer = y_n_format(gets.chomp)
  break unless answer
end
