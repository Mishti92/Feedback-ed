function[value] = searchData(data,item)

i=0;
sizedata= size(data,2);

for i=1:sizedata,
	if data(i) == item
		value = true;
		break;
	else
		value = false;
	end
end	
		
	



