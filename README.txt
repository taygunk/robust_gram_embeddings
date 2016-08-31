Robust Gram Word Embeddings
------------------------------------------------------

1.What is it?
This is an implementation of the Robust Gram (RG) Word embeddings and few evaluation scripts for Word Similarity measurement. 

2.When should I use it?
Robust Gram is especially powerful when training data is limited. Competetive models such as SkipGram-Word2Vec risk losing their generalization abilities due to the complexity of the models and the overfitting to finite data. Regularized formulation of Robust Gram penalizes overfitting by suppressing the disparity between target and context embeddings. It is shown to be more robust to variations in the training set, and correlates well to human similarities in a set of word similarity tasks.

If you think the code is useful or you use it for research purposes, please cite the following work:

[1] Taygun Kekeç, D.M.J. Tax. Robust Gram Embeddings. Proceedings of the Conference on Empirical Methods in Natural Language Processing (EMNLP), 2016.

3.How to use it? 

Given a text corpus, the Robust Gram tool learns a vector for every word in the vocabulary using a shallow network architecture. The user should to specify the following:
 - desired vector dimensionality
 - the size of the context window for either the Robust Gram model
 - training algorithm as negative sampling
 - threshold for downsampling the frequent words 
 - number of threads to use
 - the format of the output word vector file (text or binary)
 - lambda1, lambda2 values for regularization (check the paper for details)

Run the demo script:
We provide the minimal demo-rw-sim.sh script. It downloads a small (100MB) Wikipedia text corpus from the web, and trains a word vector model. After the training is finished, it displays the Spearman Correlation Coefficient for Rare Words dataset. 

on the default setting Robust Gram should output something like this:
Spearman C. (Avg) on RW: 0.378097

