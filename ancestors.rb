class Object
def ancestors_details
   details={}
   count=0
   for i in self.ancestors
      if i.instance_of?(Module) 
        details[count]={ancestor_type: i.class,ancestor_name: i,
                ancestor_instance_methods: i.instance_methods-i.class.instance_methods,
                ancestor_methods:i.methods-i.class.methods}
      elsif i.superclass.to_s.eql?("")
        details[count]={ancestor_type: i.class,ancestor_name: i,
                ancestor_instance_methods: i.instance_methods-i.class.instance_methods,
                ancestor_methods:i.methods-i.superclass.methods}
      else
        details[count]={ancestor_type: i.class,ancestor_name: i,
                ancestor_instance_methods: i.instance_methods-i.superclass.instance_methods,
                ancestor_methods:i.methods-i.superclass.methods}
    end
      count+=1
   end
   puts "{"
   details.each{|key,value|  puts key.to_s + ":\n "+ value.to_s + "\n\n" }
   puts "}"
  end
end

class Sample
def m1
end
end

puts "Array.ancestor_details"
Array.ancestors_details
puts "String.ancestor_details"
String.ancestors_details
puts "Fixnum.ancestors_details"
542.class.ancestors_details
s=Sample.new
s.class.ancestors_details
# like this we can find the ancestors details of any ruby class
