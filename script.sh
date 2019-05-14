
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion1;\1\/\2\/\3/' estaciones/estacion1.csv  > estacion1_1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion2;\1\/\2\/\3/' estaciones/estacion2.csv  > estacion2_1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion3;\1\/\2\/\3/' estaciones/estacion3.csv  > estacion3_1.csv
sed 's/\([0-9]*\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/estacion4;\1\/\2\/\3/' estaciones/estacion4.csv  > estacion4_1.csv

csvstack estacion1_1.csv estacion2_1.csv estacion3_1.csv estacion4_1.csv > estaciones_0.csv
sed 's/FECHA;/ESTACION;FECHA;ANIO;MES;HORA;/' estaciones_0.csv > estaciones_1.csv
sed 's/;\([0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\);/;0\1\/\2\/\3;/' estaciones_1.csv > estaciones_2.csv 
sed 's/;\([0-9]\):\([0-9][0-9]\):\([0-9][0-9]\);/;0\1:\2:\3;/' estaciones_2.csv > estaciones_3.csv
sed 's/\/\([0-9][0-9]\)\/\([0-9][0-9]\);\([0-9][0-9]\)/\/\1\/\2;\2;\1;\3;\3/' estaciones_3.csv > estaciones_4.csv
sed -r 's/([0-9])\,([0-9])/\1.\2/g' estaciones_4.csv > estaciones_5.csv
sed 's/;/,/g' estaciones_5.csv > estaciones_6.csv
sed -r 's/([0-9]*)\/([0-9]{2})\/([0-9]{2})/\1-\2-\3/g' estaciones_6.csv > estaciones_7.csv
sed 's/\([0-9]*\)-\([0-9][0-9]\)-\([0-9]*\),\([0-9]*\),/20\3-\2-\1,20\4,/g' estaciones_7.csv > estaciones_8.csv

csvsql -v --query 'select ESTACION,MES,avg(VEL) as PROMEDIO from estaciones_8 GROUP BY ESTACION,MES' estaciones_8.csv > velocidad-por-mes.csv
csvsql -v --query 'select ESTACION,ANIO,avg(VEL) as PROMEDIO from estaciones_8 GROUP BY ESTACION,ANIO' estaciones_8.csv > velocidad-por-anio.csv
csvsql -v --query 'select ESTACION,HORA,avg(VEL) as PROMEDIO from estaciones_8 GROUP BY ESTACION,HORA' estaciones_8.csv > velocidad-por-hora.csv

rm estacion1_*
rm estacion2_*
rm estacion3_*
rm estacion4_*
rm estaciones_*
