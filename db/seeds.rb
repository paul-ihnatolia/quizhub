# encoding: utf-8
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
  PollCategory.delete_all
  PollBoard.delete_all
#create new poll board
  poll_board = PollBoard.create(body: "Доступні тестування:")
   #temp code only for Civilna Oborona
  file_name = "./db/src/цивільна_оборона.txt"

  if File.exist?(file_name)
    file_lines = File.open(file_name).readlines
    #create new poll category
    new_poll_category = PollCategory.create(name: "Цивільна оборона", poll_board_id: poll_board.id)

    i = 1
    while i < file_lines.size do

      line = file_lines[i]
      if line =~ /^\d/
        puts "Question " + line
        original_question_position = line[/\d+/]
        line.gsub!(/\d*\./,'')
        line.strip
        question = Question.create(content: line, poll_category_id: new_poll_category.id, original_list_number: original_question_position)
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
    Rails.logger.error('file doesn\'t exist')
  end
#permanent code for data
#all files must be situated in db/src folders
############################################
  def is_right question_number, answer_number
    #puts "is_right    " + question_number.to_s + "-----" + answer_number.to_s
    number_regexp = Regexp.new('^' + question_number.to_s)
    answer = @answer_file_lines.select {|el| el =~ number_regexp}.first.strip
    #puts "#{answer_number} -- #{answer.split('-')[1].split(',')}"
    answer.split('-')[1].split(',').include?(answer_number.to_s)
  end
############################################
def change_image file_line
  if file_line =~ /\[img=(\d+_*\d+)*\]/
    file_line.gsub!(/\[img=(\d+_*\d+)*\]/,"<img src=/assets/metrolohija/#{$1}" + ".png>")
    file_line
  end
  file_line
end
############################################
def full_database directory, category_name, task_file, answer_file
  current_poll_category = PollCategory.create(name: category_name)
  task_file_lines = File.open(directory + '/' + task_file).readlines
  @answer_file_lines = File.open(directory + '/' + answer_file).readlines



  is_question = Regexp.new("\\d+\\.")
  is_answer = Regexp.new("\\d+\\)")

  @current_question = nil
  #count = 0
  puts task_file_lines.size
  task_file_lines.each do |file_line|
    #check if file is question
    #questons must start with (digit.)
    #break if count > 4
    if file_line =~ is_question
      #count += 1
      file_line = change_image file_line
      original_question_position = file_line[/\d+/]
      file_line.gsub!(is_question,'')
      question_content = file_line.strip
      @current_question = Question.create(content: question_content, poll_category_id: current_poll_category.id,original_list_number: original_question_position)
      puts @current_question

    elsif file_line =~ is_answer
      if @current_question
        file_line = change_image file_line
        original_number = file_line[/\d+/]
        file_line.gsub!(is_answer,'')
        answer_content = file_line.strip
        #puts  @current_question.to_s unless @current_question.nil?
        right = is_right(@current_question.original_list_number, original_number)
        answer = Answer.create(content: answer_content, right: right)
        @current_question.answers << answer
        puts '-' + answer.to_s
      else
        puts "Cannot find question for #{file_line}"
      end
    else
      puts "Unknown string!!!"
    end
  end

end
###########################################
directory = "db/src"

if File.directory?(directory)
 Dir.entries(directory).each do |task_file|
   unless task_file =~ /.swp/
     #puts "Ja tupuj interpretator vidkrivaju " + task_file
     if task_file =~ /_tasks/
      category_name = task_file.split("_")[0]
      answer_file = task_file.sub('tasks','answers')
      if File.file?(directory + '/' + answer_file)
        full_database directory, category_name, task_file, answer_file
      else
        puts "Can't find appropirate answer file for " + task_file
      end
     end
   end
 end
end
