#! /usr/bin/bash
#
# Author: Bert Van Vreckem <bert.vanvreckem@gmail.com>
# Source (command options):
# https://www.udpcast.linux.lu/pipermail/udpcast/2003-April/000040.html
#
# Run UDPcast either as a sender, or a receiver, interactively.


set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

#{{{ Functions

#}}}
#{{{ Variables
file="/dev/sda"
#}}}

# Script proper

echo "Starting UDPcast for copying ${file}"

while [ ! -e "${file}" ]; do
  echo -n "File ${file} not found. Enter a file name: "
  read file
done

cat << _EOF_
Start as a:

  1. Sender
  2. Receiver (default)

  0. Exit to shell

_EOF_
echo -n "Choice: "

start_time="$(date -Is)"

read choice
case ${choice} in
  0)
    exit
    ;;
  1)
    udp-sender --pipe 'lzop --fast' --file "${file}"
    exit_status=$?
    ;;
  *)
    udp-receiver --pipe 'lzop --decompress' --file "${file}"
    exit_status=$?
    ;;
esac

end_time="$(date -Is)"

cat << _EOF_

Done! Exit status was: ${exit_status}
start: ${start_time}
end  : ${end_time}
_EOF_
