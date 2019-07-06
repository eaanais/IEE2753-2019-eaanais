# FIR 2N

Se realizó el módulo fir2N como se indicó en el enunciado, parametrizado y con los parámetros por defecto correspondientes

## Respuesta al impulso 🚀

Para poder realizar el testbench y, de esta forma, conocer la respuesta al impulso, se implementó en la entrada del filtro un impulso de tamaño 1 y luego solo 0's. De esta forma, la salida, por cada clock, corresponderá a los coeficientes del filtro (como es 2N se repetirá la secuencia pero decreciente)

Se debe ejecutar el archivo [fir2n_tb.v](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/testbench/fir2n_tb.v) que ya viene con los datos y el tiempo necesario para poder apreciar la salida (en mi caso utilizé vivado para las imágenes e iverilog para los logs)

En color **magenta** se puede observar la salida del filtro, esta concuerda con el clock pequeño que corresponde a la frecuencia o tasa de muestreo del audio

![testbenc_registro](/proyecto/testbench/respuesta_al_impulso.png)

![testbench_grafico](/proyecto/testbench/respuesta_al_impulso_grafico.png)

Al momento de realizar la simulación en iverilog no pude cargar los coeficientes mediante el archivo rom, por lo tanto, los introduje con un initial dentro de la memoria. El archivo [rom.mem](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/rtl/rom.mem) contiene los coeficientes utilizados, de igual forma se adjuntan en este informe a continuación

```
00000001
00000010
00000011
00000100
00000101
00000110
00000111
00001000
```

Para verificar el contenido, también se puede revisar el [log pre sintesis](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/testbench/fir2n_tb.v)

### Síntesis 📦

Se realizó la síntesis mediante **yosys**, [archivo sintetizado](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/yosys/synth.v), y se modificó los archivos para utilizar la librería adecuada. Los archivos modificados fueron [Makefile](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/yosys/Makefile) y [flow.ys](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/yosys/flow.ys)

Para ejecutar todo lo correspondiente a esta carpeta se utilizó el siguiente comando en la consola (terminal)

```
Make
```

Para verificar el correcto funcionamiento luego de sintetizar el módulo, se puede comparar el [log post síntesis](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/iverilog_sintetizado/log_fir_sintetizado.log) con el anterior que ya fue mencionado en el apartado de la respuesta al impulso

### QFLOW (STA) 📋
Mediante **qflow**, y su interfaz gráfica, se utilizó la librería correcta para este caso y se obtuvo el [log STA](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/qflow/log/sta.log). Además se puede revisar el [log post STA](https://github.com/eaanais/IEE2753-2019-eaanais/blob/master/proyecto/qflow/log/post_sta.log) por si resulta de interés.

En esta caso el comando utilizado fue

```
qflow gui
```

### MAGIC (GDS) 🖇️

_Una serie de ejemplos paso a paso que te dice lo que debes ejecutar para tener un entorno de desarrollo ejecutandose_

_Dí cómo será ese paso_

```
Da un ejemplo
```

_Y repite_

```
hasta finalizar
```

_Finaliza con un ejemplo de cómo obtener datos del sistema o como usarlos para una pequeña demo_

![gds_png](/proyecto/qflow/layout/imagen_final.png)

---
Plantilla ⌨️ con ❤️ por [Villanuevand](https://github.com/Villanuevand) 😊
