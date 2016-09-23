#! /bin/bash  
  
#author: yinjian 
#date: 2016/09/23

oldfile=serialport.launch
rm $oldfile

str=([0]='ttyUSB')
pid=([0]='2-3.1:1.0' [1]='2-3.2:1.0' [2]='2-3.3:1.0' [3]='2-3.4:1.0')

array0=($(ls -l /sys/class/tty/ttyUSB* | grep ${pid[0]}))
array1=($(ls -l /sys/class/tty/ttyUSB* | grep ${pid[1]}))
array2=($(ls -l /sys/class/tty/ttyUSB* | grep ${pid[2]}))
array3=($(ls -l /sys/class/tty/ttyUSB* | grep ${pid[3]}))


# echo ${array0[10]}
# echo ${array1[10]}
# echo ${array2[10]}
# echo ${array3[10]}

# for i in ${array1[@]}
# do
#     echo $i
# done
port[0]=${array0[10]}
port[1]=${array1[10]}
port[2]=${array2[10]}
port[3]=${array3[10]}

portname[0]="gpsserialport"
portname[1]="mcuserialport"
portname[2]="appserialport"
portname[3]="others"


for j in {0..3..1}
do
    i=${port[$j]}
    # echo $i
    len=${#i}
    # echo $len
    m=$[$len-7]
    # echo $m
    n=$[$len-1]
    # echo $n
    output[$j]=${i:$m:$n}
    pre="/dev/"
    output[$j]=${pre}${output[$j]}
    # echo ${output[j]}
done

for i in ${output[@]}
do
    echo $i
done

source './create_xml.bash' 
# source './create_xml.bash'  
# put_head 'xml version='1.0' encoding="GBK"'  
put_head 'xml version="1.0" '  
tag_start 'launch'  
# tag_start 'param'  
tag_value 'param' ${portname[0]} ${output[0]} string
tag_value 'param' ${portname[1]} ${output[1]} string
tag_value 'param' ${portname[2]} ${output[2]} string
tag_value 'param' ${portname[3]} ${output[3]} string
# tag_end 'param'  
tag_end 'launch' 