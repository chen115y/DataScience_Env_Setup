#!/bin/sh
#!/bin/sh

# Data Science Environmental Setup
# Install Linux Ubuntu
# [Ubuntu Linux 18.04 LTS](https://www.ubuntu.com/download/desktop)
# [Windows Subsystem for Linux Ubuntu 18.04 LTS] (https://docs.microsoft.com/en-us/windows/wsl/install-win10)

echo
echo ----------Install basic packages----------
echo
    sudo apt update
    sudo apt -y install vim tmux
    sudo apt -y install wget curl
echo
echo ---------Install Git for Source Version Control----------
echo
    sudo apt -y install git-all
    sudo apt -y install git
echo
echo ----------Install Anaconda----------
echo
    cd /tmp
    curl -O -k https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
    sudo bash Anaconda3-2019.10-Linux-x86_64.sh
    sudo chmod -R 777 ~/anaconda3/
    CONDA_HOME=~/anaconda3/bin
    PATH=$CONDA_HOME:$PATH
    sudo source ~/.bashrc
    conda config --set ssl_verify false
    conda config --add channels conda-forge
    conda config --add channels pytorch
    conda config --add channels plotly
    conda config --add channels anaconda
    sudo chmod -R 777 ~/.conda/
echo
echo ----------iPython Data Science and Engineering Tools Installation----------
echo
    # standard and powerful data processing
    conda install numpy pandas scipy pystan statsmodels --yes
    # neural network deep learning
    conda install tensorflow pymc3 keras pytorch --yes
    # dealing with Excel or very large data set
    conda install xlrd pyarrow --yes
    conda install h5py pytables --yes
    # standard machine learning and preprocessing
    conda install scikit-learn xgboost --yes
    # image processing
    conda install pillow --yes
    # natural language processing
    conda install nltk textblob smart_open gensim --yes
    # parallel processing
    conda install dask dask-ml dask-searchcv numba multiprocess ipyparallel distributed joblib --yes
    # visualization
    conda install matplotlib seaborn plotly --yes
    # database and data profiling
    conda install sqlalchemy --yes
    conda install pandas-profiling --yes
    # for SQL magic function
    conda install ipython-sql --yes
    # for notebook extensions
    conda install jupyter_contrib_nbextensions --yes
    conda install autopep8 --yes
    # install and enable jupyter themes, especially dark one
    # for web scrawler
    conda install scrapy beautifulsoup4 --yes
    # time Series
    conda install fbprophet --yes

echo
echo ----------Jupyter Notebook Extension Configuration----------
echo
    sudo jupyter contrib nbextension install --user
    sudo chmod -R 777 ~/.local/share/
	sudo chmod -R 777 ~/.jupyter/
    sudo chmod a+rw ~/.jupyter/nbconfig/notebook.json
