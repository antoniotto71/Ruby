=begin
class Student
   private def method_missing (symbol, *args)
     if symbol.to_s.start_with?("grade_for_")
      puts "You got an A in #{symbol.to_s.split("_").last.capitalize}!"
      else
        super
        end
   end
end

st = Student.new

st.grade_for_math

puts st.bererd
=end

class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends

  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def has_hobby(hobby)
    @hobbies << hobby
  end

  def has_friend(friend)
    @friends << friend
  end

  def Person.method_missing(m, *args)
    method = m.to_s
    if method.start_with?("all_with_")
      attr = method[9..-1]
      if Person.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Can't find #{attr} "
      end
    else
      super
    end
  end

  ant = Person.new("Antonio")
  joe = Person.new("Joe")

  ant.has_friend(joe)

  ant.has_hobby("rings")

  joe.has_hobby("running")


  Person.all_with_friends(p).each do |person|
    puts "#{person.name} is friends with #{p.name}"
  end
  Person.all_with_hobbies("rings").each do |person|
    puts "#{person.name} is into rings"
  end

end