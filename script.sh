
# Escriba su código aquí
echo '-----------------------------------------'
echo '•	Data inicial'
echo '-----------------------------------------'
cat data.csv
echo '-------------------------------------------------------------------'
echo '•	Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD'
echo '------------------------------------------------------------------'
sed -r 's/([0-9]{2})\/([0-9]{2})\/([0-9]{2})/\1-\2-\3/g' data.csv > data1.csv
sed -r 's/([0-9]{2})\-([0-9]{2})\-([0-9]{2})/\3-\2-\1/g' data1.csv > data2.csv
cat data2.csv
echo '---------------------------------------------------------------------------'
echo '•	Transforme el archivo para que todos los campos nulos aparezcan como \N'
echo '---------------------------------------------------------------------------'
sed 's/;\([N]\);/;\\N;/g' data2.csv > data3.csv
sed 's/;\([N]\)/;\\N/g' data3.csv > data4.csv
cat data4.csv
echo '-----------------------------------------'
echo '•	Reemplace los ; por ,'
echo '-----------------------------------------'
sed 's/;/,/g' data4.csv > data5.csv
cat data5.csv
echo '-----------------------------------------'
echo '•	Use el . para indicar decimales'
echo '-----------------------------------------'
sed -r 's/([0-9]{3})\,([0-9])/\1.\2/g' data5.csv > data6.csv
cat data6.csv
echo '--------------------------------------------------------'
echo '•	Extraiga los registros que no tienen campos nulos'
echo '---------------------------------------------------------'
sed '/\N/d' data6.csv > data7.csv
cat data7.csv
echo '-----------------------------------------'
