clear
cat << "EOF"
================================================================================
Setup: Transfer NODE ID / wallet
To force exit this script press CTRL+C
================================================================================
EOF
printf "bat dau copy tu STT bao nhieu?\n"
read -r a

printf "copy den duoi STT bao nhieu?\n"
read -r b

while [ $a -lt $b ]; do 

	printf "Dia chi IP Paster STT "$a":\n"
	read -r remoteIP

	printf "\nsudo systemctl start nkn-commercial.service\n"
	printf "\n \n"
	
	if scp -p /home/nkn/"$a"/wallet.json /home/nkn/"$a"/wallet.pswd nkn@"$remoteIP":/home/nkn/nkn-commercial/services/nkn-node/
		then
		printf "\nWallet files copied!\n"
		ssh nkn@"$remoteIP"
	
		else
		printf "\nError while running rsync\n\n"
		fi
	a=`expr $a + 1`
done
read -s -r -p "Press Enter to continue!"
