function [res_maxNVal] = funMaxNDayes(dateStr,val,N)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明


date=cell2mat(dateStr);
year= str2num(date(:,1:4));
unique_year = unique(year,'rows','stable');
static_year=histc(year,unique_year);
res_maxNVal=zeros(size(unique_year,1),2);

last_year=year(1);
maxNVal=0;
if size(val,1)<N
    disp('N value is larger than size of matrix!!!');
end

for i=1: size(unique_year,1)
    if static_year(i)<N
        str1=sprintf('N-value is larger than size of year-date(%d), so,result is ZERO.',unique_year(i));
        disp(str1);
        res_maxNVal(i,1)=unique_year(i);
        res_maxNVal(i,2)=0;
        last_year=unique_year(i);
        continue;% skip this year.
    end
    for j=1:size(val,1)
        if unique_year(i)>year(j)
            last_year=unique_year(i);
            continue;
        elseif year(j)>last_year % next year
            res_maxNVal(i,1)=last_year;
            res_maxNVal(i,2)=maxNVal;
            maxNVal=0;
            for tj=j:j+N
                maxNVal=maxNVal + val(tj);
            end
            last_year=year(j);
            break;
        elseif abs(unique_year(i)-year(j))<0.0001 && abs(unique_year(i)-last_year)<0.0001
            if j<=size(val,1)-N
                % tmp_val=val(j)+val(j+1)+val(j+2);
                tmp_val=0;
                for tj=j:j+N
                    tmp_val=tmp_val + val(tj);
                end
                if tmp_val>maxNVal
                    maxNVal=tmp_val;
                end
            end
            if j==size(val,1)-N
                res_maxNVal(i,1)=year(j);
                res_maxNVal(i,2)=maxNVal;
            end
            
        end
        
    end
    
end

end

