function[data] = deleteData(data,reduceData,size)

i = 0;
for i= 1:size
	data(i,:) = [];
end
