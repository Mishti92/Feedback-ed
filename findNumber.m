function[number] = findNumber(data,value)

i=0;
n=size(data,1);
for i=1:n,
	if data(i)==value
		data(i)=1;
	else
		data(i)=0;
	end
end

number = sum(data);
