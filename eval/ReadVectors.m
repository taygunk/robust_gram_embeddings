function [vecs, w_con] = ReadVectors(outputF, outputWF)

%% Wrapper for reading Word2Vec or Matlab Multiple Map Word2Vec software vectors

if nargin == 1
    multipleMaps = false;
    w_con = [];
else
    w_f = fopen(outputWF, 'rb');                        %Weight file
    if w_f == -1
        multipleMaps = false;
    w_con = [];
    else
        multipleMaps = true;
        line = fgets(w_f);
        dims = sscanf(line,'%d %d',[2, inf]);
        N = dims(1); M = dims(2);    
        w_con = double(zeros(N,M));
        for i = 1: N                                    %Read weights
            wordStr = fscanf(w_f,'%s',1);
            fscanf(w_f,'%c',1);
            %words{i} = wordStr;
            w_con(i,:) = fread(w_f,M,'float');
            fscanf(w_f,'%c',1);
        end
        fclose(w_f);            
    end
end

f = fopen(outputF,'rb');                            %Vector file
line = fgets(f);
dims = sscanf(line,'%d %d',[2, inf]);               %Read Header
N = dims(1); d = dims(2);                           %Parse Dimension and NumOfData


vecs = single(zeros(N,d));
for i = 1: N
    wordStr = fscanf(f,'%s',1); fscanf(f,'%c',1);   %Read word from the file
    someWord = strtrim(wordStr);                    %Remove character
    vecs(i,:) = fread(f,d,'float');                 %Read vector
    fscanf(f,'%c',1);                               %Remove character
    %wordStr
end   

fclose(f);

end
