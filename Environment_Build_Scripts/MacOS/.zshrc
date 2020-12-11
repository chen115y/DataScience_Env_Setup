
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PROMPT='%B%F{red}%3~ 🇨🇦 👉 %b%F{green}'
RPROMPT='%*'
alias ll='ls -la'
alias ps-zombies='ps aux | egrep "Z|defunct" '
alias kill-zombies='kill -SIGKILL'
setopt AUTO_CD
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt CORRECT
setopt CORRECT_ALL
export SPARK_HOME=/usr/local/Cellar/apache-spark/3.0.1/libexec
export PYTHONPATH=/usr/local/Cellar/apache-spark/3.0.1/libexec/python/:$PYTHONP$
export PATH=/usr/local/Cellar/apache-spark/2.4.4/bin:$PATH
export JAVA_HOME=/Library/java/JavaVirtualMachines/jdk1.8.0_271.jdk/contents/Home/
export JRE_HOME=/Library/java/JavaVirtualMachines/jdk1.8.0_271.jdk/contents/Home/jre/
export PYSPARK_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
