#!/bin/bash 
#Hackerito Tool v1 Coded by Hackerito Team

#Funciones

#Funcion banner inicial

function banner() {
	printf "\e[1;92m _   _    _    ____ _  _______ ____  ___ _____ ___  \n"
	printf "| | | |  / \  / ___| |/ | ____|  _ \|_ _|_   _/ _ \ \n"
	printf "| |_| | / _ \| |   | ' /|  _| | |_) || |  | || | | |\n"
	printf "|  _  |/ ___ | |___| . \| |___|  _ < | |  | || |_| |\n"
	printf "|_| |_/_/   \_\____|_|\_|_____|_| \_|___| |_| \___/ \n"
        printf "v1.0 \e[0m\n"

	printf "            \e[1;93m.:.\e[0m\e[1;92m Coded by\e[0m\e[1;77m  HACKERITO TEAM \e[0m\e[1;93m.:.\e[0m\n"
	printf "\n"

	#Options Menu 

	printf "\e[1;35m[01]\e[0m \e[1;33mFalta definir\e[0m \n"
	printf "\e[1;35m[02]\e[0m \e[1;33mFalta definir\e[0m \n"
	printf "\e[1;35m[03]\e[0m \e[1;33mFalta definir\e[0m \n"
	printf "\e[1;35m[04]\e[0m \e[1;33mIniciar Openvas\e[0m \n"
	printf "\e[1;35m[05]\e[0m \e[1;33mIniciar Nessus\e[0m \n"
	printf "\e[1;35m[06]\e[0m \e[1;33mEmail Spoofing\e[0m \n"
	printf "\n"
	printf "\e[1;35m[99]\e[0m \e[1;33mExit\e[0m \n"
	printf "\n"
	printf "\e[1;92m[*] Choose an option: \e[0m "

}

#Option wait
function wait() {
	read -p $'\e[1;92mPress a key to continue...\e[0m \n' wait 
	clear
}

#Option 99 - Exit

function fexit() {
	printf "\n"
        printf "\e[1;31mGoodbye hackerito! \e[0m \n"
        printf "\n"
        exit 1
}

#Funcion Iniciar Openvas

function openvas () {
	printf "Iniciando Openvas.\n"
	service openvas-scanner start
	printf "Iniciando Openvas..\n"
	service openvas-manager start
	printf "Iniciando Openvas...\n"
}

#Funcion Iniciar Nessus

function nessus() {
	service nessusd start
	printf "Iniciando Nessus.\n"
	sleep 2
	printf "Iniciando Nessus..\n"
	sleep 2
	printf "Iniciando Nessus...\n"
}

#Función 6 - Email Spoofing

#Funcion inputs basicos del spoof
function spoofargs() {

	read -p $'\e[1;92mIntroduce el nombre a suplantar:\e[0m ' nombre
        read -p $'\e[1;92mIntroduce el correo a suplantar:\e[0m ' spoof
        read -p $'\e[1;92mIntroduce el asunto del correo:\e[0m ' asunto
        read -p $'\e[1;92mIntroduce el nombre del fichero que se enviara como cuerpo:\e[0m ' fichero

}

function emailspoof() {
	
	printf "\e[1;92mEnvio de correo falso\e[1;92m\n"
	#IF para saber si es mas de un destinatario o no
	read -p $'\e[1;92mQuieres enviar a más de un destinatario?: \e[0m ' multiples
	spoofargs
	echo $nombre
	echo $asunto
	if [[ $multiples = 'no' ]] || [[ $multiples = 'n' ]];
	then
		read -p $'\e[1;92mIntroduce correo al que enviar el mail falso:\e[0m ' destinatario
		python /root/Herramientas/SimpleEmailSpoofer/SimpleEmailSpoofer.py -e $fichero -t $destinatario -f $spoof -n "$nombre" -j "$asunto"

	else
	  	read -p $'\e[1;92mIntroduce el nombre del fichero con los destinatarios: \e[0m ' destinatarios
		python /root/Herramientas/SimpleEmailSpoofer/SimpleEmailSpoofer.py -e $fichero -a $destinatarios -f $spoof -n "$nombre" -j "$asunto"
	fi


}

#----------------------------------------------------------------------------
clear

while :
do
	banner
	read option
	case $option in
		1)
			#Indicar funcion
			wait;; 
		2)
			#Indicar funcion
			wait;;
		3)	
			#Indicar funcion
			wait;;
		4)
			openvas
			wait;;
		5)
			nessus
			wait;;

		6)
			emailspoof
			wait;;

		99)
			fexit
	esac
done
