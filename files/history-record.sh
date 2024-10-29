# 历史命令执行记录文件路径.
LOGTIME=$(date +%Y%m%d-%H-%M-%S)
HISTFILESIZE=512
export HISTTIMEFORMAT="%F_%T $(whoami)#$(who -u am i 2>/dev/null| awk '{print $NF}'|sed -e 's/[()]//g'):"
export HISTFILE="/var/log/.history/${USER}.${LOGTIME}.history"
if [ ! -f ${HISTFILE} ];then
  touch ${HISTFILE}
fi
chmod 600 ${HISTFILE}
# 剔除连续重复的条目
export HISTCONTROL=ignoredups
# 实时的记录入文件
PROMPT_COMMAND='history -a'
# 多个终端同时操作时，共享history
shopt -s histappend