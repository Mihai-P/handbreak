#!/usr/bin/env bash
echo '**************************************'
echo '*           INITIAL FINDINGS          *'
echo '**************************************'

IFS='
' # split on newline only
set -o noglob # disable globbing

SOURCE="/process/"
PRESET_NAME="Fast 480p30"

for FILE in `find ${SOURCE} -type f -regextype posix-extended -regex ".*(720p|1080p).*\.(mkv|avi|mp4)" | head -25 | xargs -I filename echo filename`; do
        if [ -e "$FILE" ]; then
                echo '**************************************'
                echo "processing file ${FILE}"
                FILENAME=$(basename -- "${FILE}")
                BASEPATH=$(dirname "${FILE}")
                NEWNAME=`echo "$FILENAME" | sed -e 's/720p/480p/' -e 's/1080p/480p/'`
                NEWFILE="${BASEPATH}/${NEWNAME}"
                echo "Converting ${FILE} to ${NEWFILE}"
                
                HandBrakeCLI -i "${FILE}" -o "${NEWFILE}" --preset="${PRESET_NAME}"
                if [ $? -eq 0 ]; then
                        echo "conversion successfull, deleting old file"
                        # rm ${FILE}
                else
                    	echo "conversion failed, removing the tmp file if it exists and sending an email"
                        # rm ${NEWFILE}
                        # mail -s “Enter the subject” user1@domain.com
                fi
                # mv -- "$FILE" "$NEWFILE"
        fi
done