
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion1;\1\/\2\/\3/' estacion1.csv  > estacion1-1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion2;\1\/\2\/\3/' estacion2.csv  > estacion2-1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion3;\1\/\2\/\3/' estacion3.csv  > estacion3-1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion4;\1\/\2\/\3/' estacion4.csv  > estacion4-1.csv

csvstack estacion1-1.csv estacion2-1.csv estacion3-1.csv estacion4-1.csv > estaciones.csv
sed 's/FECHA;/ESTACION;FECHA;ANIO;MES;HORA;/' estaciones.csv > estaciones-1.csv
sed 's/;\([0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\);/;0\1\/\2\/\3;/' estaciones-1.csv > estaciones-2.csv 
sed 's/;\([0-9]\):\([0-9][0-9]\):\([0-9][0-9]\);/;0\1:\2:\3;/' estaciones-2.csv > estaciones-3.csv
sed 's/\/\([0-9][0-9]\)\/\([0-9][0-9]\);\([0-9][0-9]\)/\/\1\/\2;\2;\1;\3;\3/' estaciones-3.csv > estaciones-4.csv
sed -r 's/([0-9])\,([0-9])/\1.\2/g' estaciones-4.csv > estaciones-5.csv
sed 's/;/,/g' estaciones-5.csv > estaciones-6.csv
sed -r 's/([0-9]*)\/([0-9]{2})\/([0-9]{2})/\1-\2-\3/g' estaciones-6.csv > estaciones-7.csv
sed 's/\([0-9]*\)-\([0-9][0-9]\)-\([0-9]*\),\([0-9]*\),/20\3-\2-\1,20\4,/g' estaciones-7.csv > estaciones-8.csv
