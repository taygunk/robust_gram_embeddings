function [ind1, ind2, humAvgSim, maxNumQuestions] = loadRW(filename)

%Accessing global searchmap for word filtering queries
global searchmap;
global vocab;

fid = fopen(filename);

%do not Read header line
%tmp = fgets(fid);               
temp=textscan(fid,'%s%s%f');    %Read into 1x3 cell
fclose(fid);                    %Close the file

%Indices of the first word
ind1 = cellfun(@WordLookup,temp{1});

%Indices of the second word
ind2 = cellfun(@WordLookup,temp{2});

%Indices of the human based similarities
%similarity interval [0,50]
%bring that to [0,10]
%spearman is immune anyway

%temp{1}
humAvgSim = temp{3};

%Omit words that are not in vocabulary
if searchmap.isKey('<unk>')
    unkkey = searchmap('<unk>');
else
    unkkey = 0;
end
ind = (ind1 ~= unkkey) & (ind2 ~= unkkey);
ind1 = ind1(ind);
ind2 = ind2(ind);
humAvgSim = humAvgSim(ind);

maxNumQuestions = length(temp{1});
end
