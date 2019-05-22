# Escriba su código aquí
#Organizo 1er archivo
sed 's/\r//g' data1.csv > data11.csv #Elimino el \r
ls data11.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=',' | sed 's/[[:space:]]\+/,/g' | awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' > out.1 #Genero el ciclo para replicar nombre y numero de columna 
sed 's/\r//g' data2.csv > data21.csv #Elimino el \r
ls data21.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=',' | sed 's/[[:space:]]\+/,/g' | awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' > out.2 #
sed 's/\r//g' data3.csv > data31.csv #Elimino el \r
ls data31.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=',' | sed 's/[[:space:]]\+/,/g' | awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' > out.3 #
cat out* > out.4 #Agrupo los archivos
sed 's/1.csv/.csv/g' out.4 > out.5 #Estandarizo el nombre
sed 's/$/\r/g' out.5 > datas.csv #Agrego \r al final de cada linea
rm out* #Remuevo los out
rm data21* #Remuevo
rm data11* #Remuevo
rm data31* #Remuevo
cat datas.csv #Imprimo resultado
