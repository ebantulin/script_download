#!/bin/bash
#Made by ASIX_student
 
check_tool() {
	command -v $1 >/dev/null 2>&1
}

install_tools() {
	if ! check_tool "yt-dlp"; then
		echo "Instalando yt-dlp..."
		pip install yt-dlp
	fi
	if ! check_tool "ffmpeg"; then
		echo "Instalando  ffmpeg..."
		sudo apt-get install ffmpeg
	fi
}

choose_format() {
	echo "Formatos disponible para el video:"
	yt-dlp -F $1
	read -p "Escoge un formato de código para el video" format_code
}

main() {
	install_tools
	read -p "Pon la URL de Youtube: " youtube_url
	choose_format $youtube_url
	yt-dlp -f $format_ode $youtube_url
	echo "Información de audio:"
	ffmpeg -i *.mp3
	echo "Información de video:"
	ffmpeg -i *.mkv
	mv *.mkv video_con_audio.mkv
	echo "Hecho!"
}

main
