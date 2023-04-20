# Proyecto II: Introducción a diseño digital en HDL

### Instituto Tecnológico de Costa Rica
### EL 3307: Diseño Lógico
### Grupo 20
### Profesor: Ing. Kaleb Alfaro Badilla

### Integrantes
1. Azofeifa Jiménez Alonso
2. Luna Herrera José David
3. Vargas Arce Andrés


### I Semestre 2023

## Descripción general

 Desarrollo de un sistema en FPGA para explorar el uso de periféricos de la Nexys4/Basys3 como el display de siete segmentos y los switches. Es mandatorio leer los respectivos apartados del manual de la tarjeta de desarrollo. Para que el usuario por medio de teclas ingrese un numero en binario y este el FPGA realice una transformación de base 

#  Subsistema de lectura y sincronización.
La función es leer los valores de los 16 conmutadores que se encuentran en la placa de la FPGA y sincronizarlos con el reloj interno de la misma. De esta forma, se puede controlar el modo de operación del sistema y la entrada binaria que se desea procesar.
Los conmutadores 15 y 14 se usan como switches de selección de modo de operación. Estos switches permiten elegir entre cuatro modos posibles. Cada modo tiene una funcionalidad diferente y afecta a la forma en que se procesa la entrada binaria y se muestra en el display de siete segmentos.
Los 14 conmutadores restantes, del 13 al 0, representan la entrada binaria que se va a procesar. Esta entrada puede ser un número entero sin signo, un número entero con signo en complemento a dos, un número fraccionario sin signo o un número fraccionario con signo en complemento a dos. Dependiendo del modo de operación seleccionado, la entrada binaria se convertirá a un valor decimal o hexadecimal y se mostrará en el display de siete segmentos.

#  Diagrama de bloques


#  Subsistema de cálculo de código BCD.



#  Subsistema de decodificado en display de 7 segmentos. 


5. Diagramas de estado de todas las FSM diseñadas (si existen), según descritos en la sección 5.
6. Ejemplo y análisis de una simulación funcional del sistema completo, desde el estímulo de entrada
hasta el manejo de los 7 segmentos.
5. Análisis de consumo de recursos en la FPGA (LUTs, FFs, etc.) y del consumo de potencia que reporta
la herramienta Vivado.
6. Reporte de velocidades máximas de reloj posibles en el diseño (mínima frecuencia de reloj para este
diseño: 50 MHz).
7. Análisis de principales problemas hallados durante el trabajo y de las soluciones aplicadas.
