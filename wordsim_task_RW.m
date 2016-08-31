function [] = read_evaluate_RW(vectorFile, vocabF, outputFile,modelName)
global searchmap;
global vocab;

addpath('./eval')

if nargin <= 3
    modelName = 'any';  % or whatever
end

	%Check cache for vocabulary
	disp(vocabF)
	if exist(vocabF,'file')
	    %disp('[ReadVocabulary.m]');
	    fid = fopen(vocabF);
	    vocab = textscan(fid, '%s %d');
	    vocabsize = length(vocab{1,1});
	    searchmap = containers.Map(vocab{1,1}, 1:size(vocab{1,1},1));  %sorts the words btw
	    %to access words words{1,1}(wordid) to access frequency: words{1,2}(3)
	else
	    error('Please create vocabulary file using c++ word2vec software. Terminating.');
	    %actually we would use wordcount but it takes too much time for bigdata
	end

	%To query occurance: isKey(searchmap, 'the')
	%To get index: idx = values(searchmap, {'the'}); idx = idx{1};
	%To get word's frequency: vocab{1,2}(idx)
	%To get word's name: vocab{1,1}{idx}

  vecs = ReadVectors(vectorFile);
  rho = evaluate_RW(vecs);
  fp = fopen(outputFile,'w');
  fprintf(fp, '%f',rho(1));
