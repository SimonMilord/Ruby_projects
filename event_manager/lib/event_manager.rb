# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

# Assignment: Clean Phone Numbers
def clean_phone_number(phone_number)
  phone_number = phone_number.delete(' ').delete('-').delete('(').delete(')').delete('.')
  if phone_number.length == 10
    phone_number
  elsif phone_number.length == 11 && phone_number.split('')[0] == '1'
    phone_number[1..10]
  else
    '0000000000'
  end
end

# Assignment: Time Targeting
def time_targeting(contents)
  contents.rewind
  hour_array = []

  contents.each do |row|
    reg_date_string = row[:regdate]
    reg_date = Time.strptime(reg_date_string, '%m/%d/%y %R')
    reg_date_hour = reg_date.hour
    hour_array.push(reg_date_hour)
  end

  hour_count_hash = hour_array.tally.sort_by { |_k, v| -v }.to_h

  puts "Time Targeting: #{hour_count_hash}"
end

# rubocop:disable Metrics/MethodLength
def event_manager(contents)
  template_letter = File.read('form_letter.erb')
  erb_template = ERB.new template_letter

  contents.each do |row|
    contents.rewind
    id = row[0]
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    legislators = legislators_by_zipcode(zipcode)
    home_phone = clean_phone_number(row[:homephone])

    form_letter = erb_template.result(binding)

    save_thank_you_letter(id, form_letter)
  end
end
# rubocop:enable Metrics/MethodLength

# Assignment: Day of the Week Targeting
def day_of_the_week_targeting(contents)
  contents.rewind
  week_day_array = []

  contents.each do |row|
    reg_date_string = row[:regdate]
    reg_date = Time.strptime(reg_date_string, '%m/%d/%y %R')
    reg_date_week_day = reg_date.strftime('%A')
    week_day_array.push(reg_date_week_day)
  end

  week_day_count_hash = week_day_array.tally.sort_by { |_k, v| -v }.to_h

  puts "Day of the Week Targeting: #{week_day_count_hash}"
end

# rubocop:disable Metrics/MethodLength
def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end
# rubocop:enable Metrics/MethodLength

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'Event Manager Initialized!'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

event_manager(contents)

time_targeting(contents)

day_of_the_week_targeting(contents)