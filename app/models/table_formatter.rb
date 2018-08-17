class TableFormatter
  attr_reader :body, :header_format;

  def initialize(body,header_format)
  @body = body
  @header_format = header_format
  end

  def get_mail_box
  header = header_format#["Date", "From", "Subject"]
  body_arr = [header]
  content = []
  body.each do |row|
    content.push(row)
  end
  body_arr += content
  # p body_arr
  return [body_arr, header, content]
  end

  def getborder(width_arr)
  border_elem = width_arr.map do |elem|
    "-"*(elem+1)
  end
  return "+#{border_elem.join("+")}+"
  end

  def get_mail_strings
  body_arr, header, content = get_mail_box

  width = body_arr.transpose.map do |arr|
    arr.max  {|a,b| a.to_s.length <=> b.to_s.length}.to_s.length+1
  end
  # p width

  border = getborder(width)
  header_str_arr = header.map.with_index {|elem_str,idx| elem_str.to_s.ljust(width[idx])}
  header_str = "| #{header_str_arr.join("| ")}|"
  # puts header_str

  content_str_arr = content.map do |arr|
    row_arr = arr.map.with_index do |arr_elem,idx|
      arr_elem.to_s.ljust(width[idx])
    end
    "| #{row_arr.join("| ")}|"
  end
  # puts content_str_arr
  return [header_str, border, content_str_arr]
  end

  def format
  header_str, border, content_str_arr = get_mail_strings

  formated_str_arr =[]
  formated_str_arr.push(border, header_str, border, content_str_arr, border)

  return formated_str_arr.join("\n")
  end

  def self.prints(data_org)

    head = body =nil;
    data = data_org
    # binding.pry
    begin
      return puts " => []" if data.empty?  
    rescue
      data = [].push(data)
    end

    begin
      if( data[0].class == Array )

        head = Array.new(data[0].length)
        body = data

      elsif( data[0].class == Hash )

        head = data[0].keys
        body = data.map do |row| row.values end

      elsif( data[0].attributes.class == Hash )

        head = data[0].attributes.keys
        body = data.map do |row| row.attributes.values end

      else
        puts "invalid input"
      end
      
      puts TableFormatter.new(body,head).format
    rescue
      print "\n#{data_org}\n"
    end
  end
end

############################## Testing ##################################

# body = [[1,2,3,4],[4,5,6,4],[7,8,9,4],[4,10,11,12]]
# head = ["Date", "From", "Subject","d"]

# data = [{Date: 'dsa', From: 'dfsa', Subject: 'dfas', dasd: 'dsada' },{Date: 'dasdasds', From: 'asfas', Subject: 'dfagfhjs', dasd: 'dkjhkada' }]
# head = data[0].keys
# body = data.map do |row| row.values end
# p head
# p body


# formatter = TableFormatter.new(body,head)

# puts formatter.format

###########################################################################

################# Usage ################

# TableFormatter.prints(Hash.new)
# TableFormatter.prints(Array.new)

###########################################