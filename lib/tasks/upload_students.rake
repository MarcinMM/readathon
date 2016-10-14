desc "Upload Students"
task :upload_students => :environment do

  ['ando.csv', 'aubrecht.csv', 'biornstad.csv', 'farrell.csv', 'fujiwara.csv', 'gaynor.csv', 'gross.csv', 'hirahara.csv', 'kapranos_anna.csv', 'kapranos_jaina.csv', 'kawasaki.csv', 'iverson.csv',
   'marsh.csv', 'mccollister.csv', 'yoshida.csv', 'loveland.csv', 'martin.csv', 'mogi.csv', 'pineo.csv', 'rivera.csv', 'scheiman.csv', 'taya.csv', 'uchida.csv', 'wenger.csv']
      .each do |filename|

    teacher_name = filename.split('.')[0]
    last_name, first_name = teacher_name.split('_')

    if first_name != nil
      teacher = Teacher.where("lower(last)=? and lower(first)=?", last_name, first_name).first
p "1: #{last_name} #{first_name} #{teacher}"
    else
      teacher = Teacher.where("lower(last)=?", last_name).first
p "2: #{last_name} #{first_name} #{teacher}"
    end

    found_header = false

    File.open("tmp/#{filename}", "r") do |f|
      f.each_line do |line|
        unless found_header
          found_header = true
          next
        end
        columns = line.split(',')
        puts "#{filename}  =>  #{columns[0]}   #{columns[1]}   #{columns[2]}   #{columns[3]}   #{columns[4]}"

        Student.create(first: columns[0], last: columns[1], email: columns[3], email2: columns[4], teacher_id: teacher.id)
      end
    end

  end

end