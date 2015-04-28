module Enumerable
	def my_each
		for x in self
			yield x
		end
	end

	def my_each_with_index
		for i in 0...size do 
			yield i, self.to_a[i] 
		end
	end

	def my_select
		result = []
		self.my_each { |x| result << x if yield(x) }
		result
	end

	def my_all?
		self.my_each { |x| return false unless yield(x) }
		true	
	end

	def my_none? 
		self.my_each { |x| return false if yield(x) }
		true
	end

	def my_count *args, &block
		if block
			return self.my_select { |x| yield(x) }.size
		elsif args.length >= 1
			return self.my_select { |x| x == args[0] }.size
		else
			return self.length
		end
	end

	def my_map (proc = nil)
		mapped = []
		self.my_each{|x| mapped << yield(x)}
		mapped
	end

	def my_inject
		acc = self.first
		for i in 1...size do 
			acc = yield acc, self.to_a[i]
		end
		acc
	end
end

def multiply_els ar
	ar.my_inject {|p,x| p * x}
end


["hey","lol","fun"].my_each do |x|
	puts x.reverse
end

["hey","lol","fun"].my_each_with_index do |i,x|
	print "#{i}: "
	puts x.reverse
end