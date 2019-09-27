#! /bin/bash
RemoteDIR="backups";
uploads[0]="/www/wwwroot/blog/usr/uploads";
uploads[1]="/root/sh";

function Init(){ 
    uploaded=`cat /root/sh/uploaded.log`
    #FileLoad=${File##*/};   #/www/wwwroot/blog/usr/uploads的结果为uploads
    if [[ $uploaded =~ $File ]]
    then
        echo "${File}早已创建";
    else
        echo "onedrive -c ${RemoteDIR}"/"${File##*/}";
        eval "onedrive -c ${RemoteDIR}"/"${File##*/}";  #创建文件夹
        if [[ $? == '0' ]]; then
            echo ${File} >> '/root/sh/uploaded.log';
        fi
    fi
}

function upload(){
    for file in `ls $1`
    do
        dir=$1"/"$file;
        remote_dir=${RemoteDIR}${1#`dirname $File`};
        if [ -d $dir ]
        then
            if [[ $uploaded =~ $dir ]]
            then
                echo "${dir}早已创建";
            else
                echo "onedrive -c ${remote_dir}"/"${file}";
                eval "onedrive -c ${remote_dir}"/"${file}";
                if [[ $? == '0' ]]; then
                    echo ${dir} >> '/root/sh/uploaded.log';
                fi
            fi
            upload $dir;
        else
            file_path=$1"/"$file;
            if [[ $uploaded =~ $file_path ]]
            then
                echo "${file_path}早已上传";
            else
                echo "onedrive -f ${remote_dir} '${file_path}'";
                eval "onedrive -f ${remote_dir} '${file_path}'";
                if [[ $? == '0' ]]; then
                    echo ${file_path} >> '/root/sh/uploaded.log';
                fi
            fi
        fi
    done
}

for File in "${uploads[@]}"
do
    Init;
    upload ${File};
done