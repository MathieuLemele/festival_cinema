#!/bin/bash
# Conversion pour le Web
# reduction de la taille
# reduction de la qualite
# on enleve les metadonnées inutiles dans la photo
#convert maphoto.jpg -resize 1024x768 -strip -quality 50 -interlace line maphotoWeb.jpg

# on cree un sous-dossier web
if [ ! -d web ]
	then 
	mkdir web
fi

# on renomme les .JPG en .jpg dans web
# et on remplace les blancs par des _
for fic in *.JPG; do
    #mv "$file" "`basename $file .JPG`.jpg"
    newName=$(echo "$fic" | tr '[:blank:]' [_])
    echo $newName
    cp "$fic" web/$newName
    mv "web/$newName" "web/${newName%.JPG}.jpg"
done

# Renommage pour enlever les espaces dans les noms de fichiers .jpg et copie des fichiers d'origine dans le dossier web
for fic in *.jpg
	do
		newName=$(echo "$fic" | tr '[:blank:]' [_])
		echo $newName
		cp "$fic" web/$newName
	done


cd web
#Redimensionnement des fichiers dans le dossier Web
for fic in *.jpg
do
	echo $fic
	convert "$fic" -resize 1024x768 -strip -quality 50 -interlace line "$fic"
done


