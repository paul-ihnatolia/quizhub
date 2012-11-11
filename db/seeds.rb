# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Fill question table with questions and answer table with answers
#
  Question.delete_all
  Answer.delete_all

  if File.exist?('test.txt')
    file_lines = File.open("test.txt").readlines

    i = 0
    while i < file_lines.size do

      line = file_lines[i]
      if line =~ /^\d/
        puts "Question " + line
        line.gsub!(/\d*\./,'')
        line.strip
        question = Question.create(content: line)
        i+=1
        #temp
        3.times do |j|
          line = file_lines[i+j]
          puts  "  " + line
          content = line.split('.')[1].strip
          right = j == 0 ? true : false
          answer = Answer.create(content: content, right: right)
          question.answers << answer
        end
        i+=1
      end
      i+=1
    end
  else
    Logger.error('file doesn\'t exist')
  end
