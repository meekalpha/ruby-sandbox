def bubble_sort ar
	return ar if ar.length == 1
	sorted = true
	for i in 0...ar.length-1 do 
		if ar[i] > ar[i+1]
			ar[i],ar[i+1]=ar[i+1],ar[i]
			sorted = false
		end
	end
	if sorted
		return ar
	else
		last = ar.pop
		return bubble_sort(ar).push(last)
	end
end

def bubble_sort_by ar, &block
	return ar if ar.length == 1
	sorted = true
	for i in 0...ar.length-1 do 
		if yield(ar[i],ar[i+1]) < 0
			ar[i],ar[i+1]=ar[i+1],ar[i]
			sorted = false
		end
	end
	if sorted
		return ar
	else
		last = ar.pop
		return bubble_sort_by(ar, &block).push(last)
	end
end