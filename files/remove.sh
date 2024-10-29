#!/bin/bash

function fun(){
  tmp="$1"
  while true
  do
    if (( $# < 1 ));then
      break
    fi

    if [ "$1" = "-rf" -o "$1" = "-f" ];then
      shift
      continue;
    fi

    # 防止误操作
    if [[ $1 =~ ^/[^/]?+[/]?$ ]]; then
      echo -e "ERROR: 危险删除命令，不能删除 $1 目录，请确认删除命令！"
      exit -1
    fi

    # 定义时分秒
    deltime_hms=$(date +%H%M%S)
    TRASH_NAME=$(echo ${1%/} | awk -F '/' '{print $NF}')

    if [ "$tmp" = "-rf" ]; then
      createDir
      # 将输入的参数，对应文件/文件夹mv至.trash目录，文件后缀，为当前的时间戳
      mv $1 ${TRASH_DIR}/${TRASH_NAME}-${deltime_hms}
    elif [ -d "$1" ]; then
      echo "$1 是目录无法删除, 请使用 -rf 选项！"
    else
      createDir
      mv $1 ${TRASH_DIR}/${TRASH_NAME}-${deltime_hms}
    fi
    shift
  done
}

function createDir(){
    # 定义回收站目录 ~/.trash
    trash="/.trash"
    deltime_day=$(date +%Y-%m-%d)
    TRASH_DIR="${HOME}${trash}/${deltime_day}"
    # 建立回收站目录当不存在的时候
    if [ ! -e ${TRASH_DIR} ];then
       mkdir -p ${TRASH_DIR}
    fi
}

fun "$@"