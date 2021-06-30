#! /usr/bin/bash
format=*.mp4

# Array to keep track of file index

ar=()
for i in $format;
do
    ar+=("${i:3:4}")
done

#Removing duplicates

unset dupes
declare -A dupes

for i in "${ar[@]}"; do
    if [[ -z ${dupes[$i]} ]]; then
        arr+=("$i")
    fi
    dupes["$i"]=1
done
unset dupes

# for i in "${NEWARRAY[@]}"
# do
#     echo $i
# done


# for i in "${ar[@]}"
# do
#     echo $i
# done

declare -i x=0

for i in $format;
do 
    if [ "${i:3:4}" == "${arr[x]}" ] && [ "${i:24:2}" == "00" ];
    then
        for j in $format;
        do
            if [ "${j:3:4}" == "${arr[x]}" ];
            then
                echo "$i $j"
                ffmpeg -i "$j" -i "$i" -lavfi libvmaf="model_path='C\:/Users/anujp/OneDrive/Documents/ffmpeg/bin/vmaf_v0.6.1.json'" -f null -
            fi
        done
        ((x=x+1))
        echo "$x"
    fi
done