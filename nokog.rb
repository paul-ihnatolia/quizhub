require 'nokogiri'
require 'open-uri'

base_url = "http://cms.indygov.org/MyAssessedValue/Result.aspx?Parcel="
neccessary_ids = ["#ctl00_header_txtParcel", "#ctl00_header_txtPropertyLocation", "#ctl00_header_txtTotalAssessed2011"]

input_file_name = '2008 Unsold Tax Sale Properties as of 08-24-2010.txt'
output_file_name = input_file_name.split('.')[0] + "_detail"

if File.exist?(input_file_name)
  file_lines = File.open(input_file_name).read.split("\r")
  output_file = File.open(output_file_name, 'w')

  file_lines.each do |line|
    parcel_number = line.split("  ")[1].to_i
    puts "Parsing " + parcel_number.to_s
    url = base_url + parcel_number.to_s
    doc = Nokogiri::HTML(open(url))
    neccessary_values= []
    neccessary_ids.each do |nec_id|

      tag = doc.css("#{nec_id}").css('input')
      neccessary_values << tag.at('input')['value']

    end
    begin
     puts "For #{parcel_number} are " + neccessary_values.to_s
     output_file.puts neccessary_values[0] + " |  " + neccessary_values[1] +" |  " + neccessary_values[2]
    rescue NoMethodError
      puts "Not found ----------------"
    end
  end
  output_file.close

else
  puts "File doesn't exist!"
end
