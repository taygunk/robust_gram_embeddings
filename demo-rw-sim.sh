make

if [ ! -e data/text8 ]; then
  mkdir data
  wget http://mattmahoney.net/dc/text8.zip -O data/text8.gz
  cd data
  gzip -d text8.gz -f
  cd ..
fi

time ./robust_gram -train data/text8 -output vectors.bin -taroutput target-vectors.bin  -cbow 0 -size 300 -min-count 20 -window 10 -seed 1 -alpha 0.05 -negative 1 -hs 0 -sample 0 -threads 8 -binary 1 -iter 3 -save-vocab data/text8_vocab -lambda1 0.3 -lambda2 0.3

matlab -nodisplay -nojvm -r 'wordsim_task_RW 'vectors.bin' 'data/text8_vocab' 'wordsim_rw'; exit;'
