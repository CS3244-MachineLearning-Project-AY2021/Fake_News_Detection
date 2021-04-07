# Fake news detection using deep learning

### Data sources
* Fake News Corpus: https://github.com/several27/FakeNewsCorpus
* Getting Real About Fake News: https://www.kaggle.com/mrisdal/fake-news
* Fake News Detection: https://www.kaggle.com/jruvika/fake-news-detection
* News Dataset from TI-CNN: https://arxiv.org/abs/1806.00749

### Setup
* Install anaconda and use the Tensorflow environment (tf or tf-gpu)
* The followings are the packages needed to be installed: `gensim`, `swifter`, `tqdm` (non exhaustive)

### Folder structure
* **data**: This directory must be created with the necessary data for scripts to work.
            (Not uploaded to GH due to filesize restrictions).
  - GoogleNews-vectors-negative300.bin.gz: Word2Vec news trained model weights (*You can download online*)
  - `news_cleaned_2018_02_13.csv` (*Retrieved by unzipping the files from FakeNewsCorpus*)
* **notebooks**: Notebooks for prototyping
  - `FakeNewsCorpus.ipynb`: Preprocessing the data generated from FakeNewsCorpus
  - `BayesianOpt.ipynb`: Running the bayesian optimization to be used to train the model
  - `Train-categorical.ipynb`: Training a CNN model
  
### Steps to run the program
1. Download `GoogleNews-vectors-negative300.bin.gz` and unzip the files from FakeNewsCorpus (which result in `news_cleaned_2018_02_13.csv`) and put it under `/data`
2. Run `/data/click_bias_only` to generate a `click_bias_only.csv`
3. Run `/notebooks/FakeNewsCorpus.ipynb` to generate the `news_proc_12_3_19.pickle` and  `news_proc_8_3_19` files to be used for training
4. Run `/notebooks/BayesianOpt.ipynb` to find the optimal parameters
5. Change the CNN `params_cnn` in `/notebooks/Train-Categorical` based on the value outputted by `print("PARAMETERS: {}  RESULT {}".format(r.x, r.fun))` line in `BayesianOpt.ipynb`
6. Run `/notebooks/Train-Categorical`
7. `conv.h5` file will be generated in `/weights` directory