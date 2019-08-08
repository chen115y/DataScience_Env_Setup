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
echo ----------install java 8-----------
echo
    sudo apt install openjdk-8-jdk
    sudo update-alternatives --config java
    sudo echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> ~/.bashrc
    . ~/.bashrc
echo
echo ----------Install Spark 2.4.3 Stable----------
echo
    wget -P /tmp/ http://apache.osuosl.org/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
    sudo mkdir /usr/local/spark/
    sudo tar xvf /tmp/spark-2.4.3-bin-hadoop2.7.tgz -C /usr/local/spark
    sudo pip3 install pyspark findspark
    echo SPARK_HOME=/usr/local/spark/spark-2.4.3-bin-hadoop2.7 >> ~/.bashrc
    echo export SPARK_HOME=\$SPARK_HOME >> ~/.bashrc
    echo export PATH=\$SPARK_HOME/bin:\$PATH >> ~/.bashrc
    . ~/.bashrc
echo
echo ----------Install Jupyter Notebook----------
echo
    sudo pip3 install jupyter
    sudo chmod -R 777 ~/.local/share/jupyter/
	sudo chmod -R 777 ~/.jupyter/
echo
echo ----------iPython Data Science and Engineering Tools Installation----------
echo
    sudo pip3 install numpy pandas scipy tensorflow pymc3 keras
    sudo pip3 install -U scikit-learn
    sudo pip3 install pillow
    sudo pip3 install h5py
    sudo pip3 install nltk
    sudo pip3 install statsmodels fbprophet
    sudo pip3 install matplotlib seaborn clarify
    # install pytorch for latest python version 3.7
    sudo pip3 install https://download.pytorch.org/whl/cpu/torch-1.0.1.post2-cp37-cp37m-linux_x86_64.whl
    sudo pip3 install torchvision

    # sudo pip3 install optimuspyspark
    sudo pip3 install sqlalchemy
    sudo pip3 install pandas-profiling
    sudo pip3 install spark-df-profiling

    wget -P /tmp/ https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb
    sudo dpkg -i /tmp/pandoc-2.5-1-amd64.deb
    sudo apt install texlive-xetex
    sudo pip3 install ipython-sql
    sudo pip3 install rpy2
    sudo pip3 install jupyter_contrib_nbextensions
    sudo pip install jupyter_contrib_nbextensions
    sudo pip3 install autopep8
    # install and enable jupyter themes, especially dark one

    sudo pip3 install scrapy beautifulsoup4
echo
echo ----------Jupyter Notebook Extension Configuration----------
echo
    sudo jupyter contrib nbextension install --user
    sudo chmod a+rw ~/.jupyter/nbconfig/notebook.json
    sudo pip3 install jupyterthemes
    sudo pip3 install --upgrade jupyterthemes
    # jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
echo
echo ----------Install R Kernel----------
echo
    sudo apt install r-base r-base-dev libssl-dev libcurl3-dev
    echo The installation of the R kernel for Jupyter is performed under R command line
    echo install.packages\(\'IRkernel\'\)
    echo IRkernel::installspec\(\)
echo
echo ----------Install Scala Kernel----------
echo
    cd /tmp/
    SCALA_VERSION=2.13.0 ALMOND_VERSION=0.6.0
    curl -Lo coursier https://git.io/coursier-cli
    chmod +x coursier
    ./coursier bootstrap \
      -r jitpack \
      -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
      sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
      -o almond
    ./almond --install
    jupyter kernelspec list
