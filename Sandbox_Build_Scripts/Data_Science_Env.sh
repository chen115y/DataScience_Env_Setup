#!/bin/sh

echo
echo ----------Install Python 3.X----------
echo
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y python3
    echo export PYTHONPATH=/usr/bin/python3 >> ~/.bashrc
    . ~/.bashrc


    sudo apt install -y python3-pip python-dev build-essential python3-dev
    sudo pip3 install --upgrade pip
    sudo pip3 install --upgrade virtualenv
    sudo pip3 install pyinstaller pystan
    sudo pip3 install cpython
    sudo pip3 install --trusted-host pypi.org --trusted-host files.pythonhosted.org pip setuptools
    sudo pip3 install flask
echo
echo ----------install java 8-----------
echo
    sudo apt install -y openjdk-8-jdk
    sudo update-alternatives --config java
    sudo echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> ~/.bashrc
    . ~/.bashrc
echo
echo ----------Install Spark 3.0 Preview----------
echo
    wget -P /tmp/ http://us.mirrors.quenda.co/apache/spark/spark-3.0.0-preview2/spark-3.0.0-preview2-bin-hadoop2.7.tgz
    sudo mkdir /usr/local/spark/
    sudo tar xvf /tmp/spark-3.0.0-preview2-bin-hadoop2.7.tgz -C /usr/local/spark
    sudo pip3 install pyspark findspark
    echo SPARK_HOME=/usr/local/spark/spark-3.0.0-preview2-bin-hadoop2.7 >> ~/.bashrc
    echo export SPARK_HOME=\$SPARK_HOME >> ~/.bashrc
    echo export PATH=\$SPARK_HOME/bin:\$PATH >> ~/.bashrc
    echo export PYSPARK_PYTHON=/usr/bin/python3
    echo export PYSPARK_DRIVER_PYTHON=python3
    echo export SPARK_LOCAL_IP=127.0.0.1 >> ~/.bashrc
    . ~/.bashrc
echo
echo ----------Install Jupyter Notebook----------
echo
    sudo pip3 install jupyter
    sudo chmod -R 777 ~/.local/share/
	sudo chmod -R 777 ~/.jupyter/
echo
echo ----------iPython Data Science and Engineering Tools Installation----------
echo
    # standard and powerful data processing
    sudo pip3 install numpy pandas scipy
    # neural network deep learning
    sudo pip3 install tensorflow pymc3 keras
    # dealing with Excel or very large data set
    sudo pip3 install xlrd pyarrow vaex
    sudo pip3 install h5py pytable
    # standard machine learning and preprocessing
    sudo pip3 install -U scikit-learn xgboost
    # image processing
    sudo pip3 install pillow
    # natural language processing
    sudo pip3 install nltk textblob smart_open gensim
    sudo python3 -m textblob.download_corpora
    # parallel processing
    sudo pip3 install dask dask-ml dask-searchcv numba multiprocess ipyparallel distributed joblib
    # visualization
    sudo pip3 install matplotlib seaborn clarify
    # install pytorch for latest python version 3.7
    sudo pip3 install https://download.pytorch.org/whl/cpu/torch-1.0.1.post2-cp37-cp37m-linux_x86_64.whl
    sudo pip3 install torchvision
    # database and data profiling
    sudo pip3 install sqlalchemy
    sudo pip3 install pandas-profiling
    sudo pip3 install spark-df-profiling
    # convert jupyter notebook into pdf
    wget -P /tmp/ https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb
    sudo dpkg -i /tmp/pandoc-2.5-1-amd64.deb
    sudo apt install -y texlive-xetex
    # for SQL magic function
    sudo pip3 install ipython-sql
    # for R magic function
    sudo pip3 install rpy2 tzlocal
    # for notebook extensions
    sudo pip3 install jupyter_contrib_nbextensions
    sudo pip3 install autopep8
    # install and enable jupyter themes, especially dark one
    # for web scrawler
    sudo pip3 install scrapy beautifulsoup4
    # time Series
    sudo pip3 install pystan statsmodels fbprophet

echo
echo ----------Jupyter Notebook Extension Configuration----------
echo
    sudo jupyter contrib nbextension install --user
    sudo chmod -R 777 ~/.local/share/
	sudo chmod -R 777 ~/.jupyter/
    sudo chmod a+rw ~/.jupyter/nbconfig/notebook.json
    sudo pip3 install jupyterthemes
    sudo pip3 install --upgrade jupyterthemes
    # jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
    sudo pip3 install qgrid
    sudo jupyter nbextension enable --py --sys-prefix widgetsnbextension
    sudo jupyter nbextension enable --py --sys-prefix qgrid
echo
echo ----------Jupyter Scheme Configuration----------
echo
    sudo pip3 install jupyterthemes
    sudo pip3 install --upgrade jupyterthemes
    # dark
    sudo chmod -R 777 ~/.jupyter/
    # jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
echo
