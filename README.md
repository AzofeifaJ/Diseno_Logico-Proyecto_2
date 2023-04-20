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

El objetivo fundamental de este proyecto es desarrollar de un sistema en FPGA para explorar el uso de periféricos de la Nexys4/Basys3 como el display de siete segmentos y los switches. Es mandatorio leer los respectivos apartados del manual de la tarjeta de desarrollo. Para que el usuario por medio de teclas ingrese un numero en binario y este el FPGA realice una transformación de base 

### Diagrama de bloques general del sistema

![Image](https://user-images.githubusercontent.com/111375712/231040286-a2a716a7-fee8-4359-a3a4-1a605ab350e3.png)


### Representación de una Nexys 4 DDR

![nexys-4-ddr-2](https://user-images.githubusercontent.com/111375712/233267532-c767c9a8-8a26-439e-a7d4-a855c1f0dba8.png)

 

###  Subsistema de lectura y sincronización.
La función es leer los valores de los 16 conmutadores que se encuentran en la placa de la FPGA y sincronizarlos con el reloj interno de la misma. De esta forma, se puede controlar el modo de operación del sistema y la entrada binaria que se desea procesar.
Los conmutadores 15 y 14 se usan como switches de selección de modo de operación. Estos switches permiten elegir entre cuatro modos posibles. Cada modo tiene una funcionalidad diferente y afecta a la forma en que se procesa la entrada binaria y se muestra en el display de siete segmentos.
Los 14 conmutadores restantes, del 13 al 0, representan la entrada binaria que se va a procesar. Esta entrada puede ser un número entero sin signo, un número entero con signo en complemento a dos, un número fraccionario sin signo o un número fraccionario con signo en complemento a dos. Dependiendo del modo de operación seleccionado, la entrada binaria se convertirá a un valor decimal o hexadecimal y se mostrará en el display de siete segmentos.

####  Diagrama de bloques




###  Subsistema de cálculo de código BCD.
El subsistema de cálculo de código BCD es un componente esencial para el funcionamiento del sistema de visualización de números en el panel de siete segmentos. Este bloque recibe 14 bits que representa un número en binario y la convierte en cuatro dígitos de 4 bits cada uno que corresponden al código BCD que se debe mostrar en el panel. 
1. En el modo de operación 0, el bloque calcula los dígitos de unidades, decenas, centenas y millares del número binario sin signo de 14 bits. El bit más significativo (MSB) se descarta y los 13 bits restantes se dividen en grupos de 4 bits. Cada grupo se convierte en un dígito decimal que se muestra en el panel. 
2. En el modo de operación 1, el bloque calcula los dígitos de dos números binarios sin signo de 6 bits cada uno. El bit 13 y el bit 6 se descartan y los bits restantes se dividen en dos grupos de 6 bits. Cada grupo se convierte en dos dígitos decimales que se muestran en el panel. 
3. En el modo de operación 2, el bloque muestra el número binario sin signo de 14 bits en hexadecimal en el panel. El bloque no realiza ninguna conversión sino que simplemente divide la entrada en cuatro grupos de 4 bits y los muestra como dígitos hexadecimales. 
4. En el modo de operación 3, el bloque invierte el signo del número binario con signo de 14 bits usando el método del complemento a dos y lo muestra en hexadecimal en el panel. El bloque extiende el signo del número a 16 bits añadiendo dos bits iguales al MSB al principio. Luego, invierte todos los bits y suma uno al resultado. Finalmente, divide el resultante en cuatro grupos de 4 bits y los muestra como dígitos hexadecimales. 

####  Diagrama de bloques




###  Subsistema de decodificado en display de 7 segmentos. 
La función es mostrar la información codificada en formato hexadecimal que proviene del subsistema anterior. Para ello, este subsistema toma los datos para los 4 dígitos de un bloque de 7 segmentos. Además cuenta con un temporizador que controla la frecuencia de actualización de los 4 dígitos, de forma que se evite el parpadeo y se facilite la lectura por parte del usuario. El subsistema se comunica con el resto del sistema mediante un bus de datos de 8 bits y un bus de control de 4 bits.

####  Diagrama de bloques



### Diagramas de estado de las FSM diseñadas
Los diagramas de estado de las máquinas de estados finitos (FSM) son una forma de representar gráficamente el comportamiento de un sistema que puede estar en uno de varios estados posibles. Las transiciones entre estados se representan por flechas con una etiqueta que indica la condición o evento que provoca el cambio de estado. Los diagramas de estado de las FSM permiten visualizar fácilmente el flujo de control y las acciones que se realizan en cada estado del sistema.



### Ejemplo y análisis de una simulación funcional



### Análisis de consumo de recursos en la FPGA (LUTs, FFs, etc.) y del consumo de potencia que reporta la herramienta Vivado.


### Reporte de velocidades máximas de reloj posibles en el diseño (mínima frecuencia de reloj para este diseño: 50 MHz).


### Análisis de principales problemas hallados durante el trabajo y de las soluciones aplicadas.
