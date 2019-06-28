#!/bin/sh

echo
echo ----------Install Python 3.X----------
echo
    sudo apt update
    sudo apt install python3

    sudo apt install python3-pip python-dev build-essential
    sudo pip3 install --upgrade pip
    sudo pip3 install --upgrade virtualenv
    sudo pip3 install pyinstaller
echo
echo ----------Install Spark 2.4.3 Stable----------
echo
    wget -P /tmp/ http://apache.osuosl.org/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
    sudo mkdir /usr/local/spark/
    sudo tar xvf /tmp/spark-2.4.3-bin-hadoop2.7.tgz -C /usr/local/spark
    sudo pip3 install pyspark
    echo SPARK_HOME=/usr/local/spark/spark-2.4.3-bin-hadoop2.7 >> ~/.bashrc
    echo export SPARK_HOME=$SPARK_HOME >> ~/.bashrc
    echo export PATH=$SPARK_HOME/bin:$PATH >> ~/.bashrc
    source ~/.bashrc
echo
echo ----------Install Jupyter Notebook----------
echo
    sudo pip3 install jupyter
    sudo chmod 777 ~/.local/share/jupyter/
echo
echo ----------iPython Data Science and Engineering Tools Installation----------
echo
    sudo pip3 install numpy pandas scipy tensorflow pymc3
    sudo pip3 install -U scikit-learn
    sudo pip3 install pillow
    sudo pip3 install h5py
    sudo pip3 install keras
    sudo pip3 install statsmodels fbprophet
    sudo pip3 install matplotlib seaborn clarify findspark

    sudo pip3 install optimuspyspark
    sudo pip3 install sqlalchemy
    sudo pip3 install pandas-profiling
    sudo pip3 install spark-df-profiling

    wget -P /tmp/ https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb
    sudo dpkg -i /tmp/pandoc-2.5-1-amd64.deb
    sudo apt install texlive-xetex
    sudo pip3 install ipython-sql
    sudo pip3 install jupyter_contrib_nbextensions
    sudo pip install jupyter_contrib_nbextensions
    sudo pip3 install autopep8

    sudo pip3 install scrapy beautifulsoup4
echo
echo ----------Jupyter Notebook Extension Configuration----------
echo
    sudo jupyter contrib nbextension install --user
    sudo chmod a+rw ~/.jupyter/nbconfig/notebook.json
