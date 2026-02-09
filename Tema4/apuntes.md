Datos necesarios de encontrar en el enunciado:

Tamaño del archivo a mandar: 1000 bytes, 500Mb o similar
Tamaño de los paquetes que se pueden enviar: menos del total del tamaño del archivo y sumarle la cabecera
Cabecera que hay que añadir al tamaño del archivo
Velocidad de transmision: ( 100 Mbps o algo similar (MegaBit por segundo))
Distancia: X kilometros

## Formulas

Tiempo total (Tt) = Tt1 + Tt2 + Tt3... etc + Tp + Ttrack + Tp

Tt1: Tiempo transmision paquete 1
Tt2: Tiempo transmision paquete 2
Tp: Tiempo propagacion (siempre se ponen dos, el de envia y el de recepcion del ultimo)

Tt = Cantidad Bytes / Velocidad Transmision

Tp= Distancia de propagacion / velocidad propagacion (siempre es 3*10 5 (10 Elevado a 5))

## Ejercicio tamaño cabeceras:

**Un sistema tiene una jerarquía de protocolos de n capas. Las aplicaciones generan mensajes de M bytes de longitud. En cada capa se añade una cabecera de h bytes. ¿Qué fracción del ancho de banda de la red se llena con información de la capa de aplicación? Aplique el resultado a una conexión a 400 Kbps con tamaño de datos de 1000 Bytes y 7 capas, cada una de las cuales añade 64 Bytes de cabecera**


1. Datos del enunciado y conceptos previos. Para resolver esto, primero extraemos los números del texto y recordamos qué significan:
   
$M$ (Mensaje de aplicación): 1000 Bytes. Es la información real que quieres enviar (el "paquete de regalo").

$n$ (Número de capas): 7 capas. Piensa en esto como 7 cajas una dentro de otra.

$h$ (Cabecera por capa): 64 Bytes. Cada una de las 7 cajas añade este peso extra.

$R$ (Velocidad/Ancho de banda): 400 Kbps. (Aunque para calcular la fracción de eficiencia no es estrictamente necesario, nos da el contexto de la red).

**Lo que debes saber de antemano:**

Eficiencia ($\eta$): Es la relación entre los datos útiles y el tamaño total que acaba viajando por el cable.Unidades: En este ejercicio todo está en Bytes, así que no hace falta convertir a bits a menos que nos pidieran tiempo.

2. Resolución paso a paso
**Paso A:** Calcular el total de cabeceras
Si tenemos 7 capas y cada una añade 64 Bytes, el "peso" extra total es la multiplicación de ambos:

$$\text{Total Cabeceras} = n \times h = 7 \times 64 \text{ Bytes} = 448 \text{ Bytes}$$

**Paso B:** Calcular el tamaño total del paquete (L)El paquete que realmente se envía por la red es la suma del mensaje original más todas las cabeceras acumuladas:

$$L = \text{Mensaje} (M) + \text{Total Cabeceras} = 1000 \text{ Bytes} + 448 \text{ Bytes} = 1448 \text{ Bytes}$$

**Paso C:** Calcular la fracción del ancho de banda (Eficiencia)La pregunta nos pide qué parte del ancho de banda se llena con "información de la capa de aplicación" (datos útiles).
Esto es una división:
$$\text{Fracción} = \frac{\text{Datos Útiles}}{\text{Tamaño Total}} = \frac{1000}{1448}$$
Resultado:
$$\text{Fracción} \approx 0,6906$$

3. Explicación para entender el resultado
Si multiplicas el resultado por 100, obtienes un 69,06%.

¿Qué significa esto? Significa que de cada 100 bits que pasan por el cable a 400 Kbps, solo unos 69 son tu mensaje real. Los otros 31 bits son "burocracia" de la red (direcciones IP, puertos, códigos de error, etc.) necesarios para que el mensaje llegue a su destino.

## Ejercicio transmision 

**Queremos enviar un archivo de 2000 bytes usando paquetes de 1000 bytes por un enlace de 120 Mbps entre dos torres situadas a 15 Km de distancia. Teniendo en cuenta que las cabeceras ocupan 50 bytes también por tanto los paquetes de confirmación, ¿Cuánto tiempo tardaremos en enviar el primer paquete? ¿Cúanto tiempo tardaremos (desde que comienza el primer envío, si no hay errores) en recibir la confirmación del correcto envío de todos los paquetes?**

1. Datos y conceptos previos: Extraemos la información "limpia" del enunciado:

Archivo total ($A$): 2000 Bytes.

Tamaño del paquete ($P$): 1000 Bytes.

Cabecera ($H$): 50 Bytes por paquete.

Velocidad de transmisión ($R$): 120 Mbps ($120 \cdot 10^6$ bits/s).

Distancia ($d$): 15 Km ($15.000$ m).

Velocidad de propagación ($v$): $2 \cdot 10^8$ m/s (Dato estándar para cables/aire).

Confirmación (ACK): Ocupa 50 Bytes.

**Lo que debes saber de antemano:**

Segmentación: Si el archivo es de 2000 Bytes y los paquetes de 1000, enviaremos 2 paquetes.

Tamaño real en el cable ($L$): El paquete no viaja solo con datos; se le suma la cabecera. 

$L = P + H = 1000 + 50 = 1050 \text{ Bytes}$.

2. Fórmulas a usar

Tiempo de Transmisión ($T_t$):
 $\frac{L \text{ (bits)}}{R \text{ (bps)}}$. (Tiempo para "escupir" el paquete al cable).
 
 Tiempo de Propagación ($T_p$): $\frac{d \text{ (metros)}}{v \text{ (m/s)}}$.  (Tiempo que tarda la señal en viajar los 15km).

 1. Resolución paso a paso

¿Cuánto tardaremos en enviar el primer paquete?
El "tiempo de envío" se completa cuando el último bit del primer paquete llega al destino.

Calculamos $T_t$:

Pasamos 1050 Bytes a bits: 

$1050 \times 8 = 8400 \text{ bits}$. 

$T_t = \frac{8400 \text{ bits}}{120.000.000 \text{ bits/s}} = 0,00007 \text{ s} = \mathbf{70 \mu s}$.

Calculamos $T_p$:

$T_p = \frac{15.000 \text{ m}}{200.000.000 \text{ m/s}} = 0,000075 \text{ s} = \mathbf{75 \mu s}$.

Resultado:

$$\text{Tiempo envío 1er paquete} = T_t + T_p = 70 \mu s + 75 \mu s = \mathbf{145 \mu s}$$

¿Cuánto tardaremos en recibir la confirmación de TODOS los paquetes?

"Como no nos dicen que se puedan enviar varios a la vez, usamos el protocolo Parada y Espera (envío uno, espero confirmación, envío el siguiente)."

Tiempo de un ciclo completo (Envío + ACK):

Ya tenemos el envío del paquete ($145 \mu s$).

Ahora falta que llegue el ACK de vuelta.

$T_t(\text{ACK}) = \frac{50 \text{ Bytes} \times 8}{120 \cdot 10^6 \text{ bps}} = \frac{400}{120 \cdot 10^6} \approx \mathbf{3,33 \mu s}$.

$T_p(\text{vuelta}) = \mathbf{75 \mu s}$ (la distancia es la misma).Total Ciclo 1: $145 \mu s (\text{ida}) + 3,33 \mu s (\text{trans. ACK}) + 75 \mu s (\text{prop. ACK}) = \mathbf{223,33 \mu s}$.

Total para los 2 paquetes:

Como el segundo paquete se envía justo después de recibir el primer ACK:

$$\text{Tiempo Total} = \text{Ciclo 1} + \text{Ciclo 2} = 223,33 \mu s \times 2 = \mathbf{446,66 \mu s}$$

Resumen para entenderlo

El primer paquete tarda $145 \mu s$ en llegar al destino. Pero el emisor no puede enviar el segundo hasta que no recibe el "OK" (ACK), lo cual ocurre a los $223,33 \mu s$.
Como son dos paquetes idénticos, simplemente duplicamos ese tiempo de ciclo.

**(Variante): Transmisión Continua.**

Datos y fórmulas (Los mismos que antes):

$T_t$ (paquete): $70 \mu s$

$T_p$ (viaje): $75 \mu s$

$T_t$ (ACK): $3,33 \mu s$

Número de paquetes: 2

Cálculo del tiempo total:

La fórmula para enviar $N$ paquetes seguidos y recibir la confirmación al final es:

$\text{Tiempo Total} = (N \times T_t) + T_p + T_t(\text{ACK}) + T_p$

1. Enviar los dos paquetes al cable:

$$2 \times 70 \mu s = 140 \mu s$$

2. Llegada del último bit al destino:

Sumamos el tiempo de propagación: $140 \mu s + 75 \mu s = 215 \mu s$.

(En este momento, el receptor ya tiene los 2000 bytes + cabeceras en su poder).

3. Regreso de la confirmación (ACK):
   
El receptor envía el OK, que tarda su propia transmisión y el viaje de vuelta:
$$\text{Tiempo final} = 215 \mu s + 3,33 \mu s (\text{Transmisión ACK}) + 75 \mu s (\text{Propagación ACK})$$

$$\text{Resultado} = \mathbf{293,33 \mu s}$$

## Ejercicio 3 Transmision foto 

**Queremos enviar una foto de resolucion HD (1920X1080) con una profundidad de color de 32 bits. El protocolo nos permite hacer paquetes de hasta 4MB. La cabecera ocupa 3KB.
La velocidad de transferencia es de 1Gbps y la distancia entre torres es de 80 Km.
Dime el tiempo que transcurre desde que comenzamos a emitir hasta que llega la ultima confirmación.
¿Qué tiempo mínimo de confirmación antes de reenviar establecerías para cada paquete?**

1. Datos y conceptos previos

Aquí los números son más grandes, así que hay que ser cuidadosos con las unidades:

Resolución: $1920 \times 1080$ píxeles.

Profundidad de color: 32 bits por píxel.

Capacidad máxima del paquete ($M_p$): 4 MB.

Cabecera ($H$): 3 KB.

Velocidad de transmisión ($R$): 1 Gbps ($10^9$ bps).

Distancia ($d$): 80 Km ($80.000$ m).

Velocidad de propagación ($v$): $2 \cdot 10^8$ m/s.

Lo que debes saber de antemano:

$1 \text{ MB} = 1024 \text{ KB} = 1024 \times 1024 \text{ Bytes}$.

$1 \text{ Gbps} = 1.000.000.000$ bits por segundo.

Timeout: Es el tiempo que el emisor espera antes de "rendirse". Debe ser mayor que el tiempo de ida y vuelta (RTT).

2. Resolución paso a paso

**Paso A:** ¿Cuánto pesa la foto? Primero calculamos el tamaño total en bits y luego lo pasamos a MB para ver cuántos paquetes necesitamos.
   
   Bits totales: $1920 \times 1080 \times 32 = 66.355.200 \text{ bits}$.
   
   Pasar a Bytes: $66.355.200 / 8 = 8.294.400 \text{ Bytes}$.
   
   Pasar a MB: $8.294.400 / (1024 \times 1024) \approx \mathbf{7,91 \text{ MB}}$.

**Paso B:** ¿Cuántos paquetes necesitamos? Si cada paquete puede llevar máximo 4 MB (incluyendo cabecera):

    Paquete 1: 4 MB (3 KB de cabecera + el resto de datos).

    Paquete 2: 4 MB (3 KB de cabecera + el resto de datos).

    Paquete 3: El resto de la foto (unos $0,1 \text{ MB}$) + 3 KB de cabecera.

**Paso C:** Cálculo de tiempos ($T_t$ y $T_p$)

$T_t$ (de un paquete de 4 MB):

$4 \text{ MB} = 4 \times 1024 \times 1024 \times 8 = 33.554.432 \text{ bits}$

$$T_t = \frac{33.554.432 \text{ bits}}{10^9 \text{ bps}} = 0,03355 \text{ s} = \mathbf{33,55 \text{ ms}}$$

$T_p$ (80 Km):

$$T_p = \frac{80.000 \text{ m}}{2 \cdot 10^8 \text{ m/s}} = 0,0004 \text{ s} = \mathbf{0,4 \text{ ms}}$$

**Paso D:** Tiempo hasta la última confirmación. Asumiendo que enviamos los paquetes uno tras otro sin esperar (transmisión continua) y recibimos el ACK al final:

Transmitir los 3 paquetes: $3 \times 33,55 \text{ ms} = 100,65 \text{ ms}$.

Llegada al destino: $+ 0,4 \text{ ms}$ ($T_p$).

Vuelta del ACK: $+ 0,4 \text{ ms}$ ($T_p$ de vuelta).

Despreciamos el tiempo de transmisión del ACK porque no nos dan su tamaño, pero suele ser casi 0.

Total: $100,65 + 0,4 + 0,4 = \mathbf{101,45 \text{ ms}}$.

## TRUCOS Y EXTRAS

1. El cambio de unidades (El error más común):
   
    Tienes que ser un radar detectando esto:

    Velocidad de red: Siempre en potencias de 10 ($1\text{ Mbps} = 10^6\text{ bps}$).
    
    Tamaño de archivo: Suele ser en potencias de 2 ($1\text{ KB} = 1024\text{ Bytes}$).
    
    La gran trampa: Mezclar bits y Bytes. 
    
    Recuerda: Fórmulas de tiempo siempre en bits. Si te dan Bytes, multiplica por 8 antes de empezar.
    
2. El tipo de "Protocolo" (Cómo se envían los paquetes)
   
   Fíjate bien si el enunciado dice cómo se envían:
   
   Parada y Espera (Stop & Wait): Envías un paquete y te detienes hasta recibir el ACK. 
   
   El tiempo total es $(T_t + 2 \cdot T_p) \times \text{número de paquetes}$.
   
   Transmisión Continua / Ventana: Envías todos los paquetes seguidos sin esperar. 
   
   El tiempo es $(N \times T_t) + 2 \cdot T_p$.
   
   Diferencia: El primero es mucho más lento porque hay "tiempos muertos".
   
3. El número de saltos (Routers intermedios)
   
   En tus ejercicios solo hay un emisor y un receptor (las dos torres). Pero, ¿y si hay un Router en medio? Si hay un Router, el paquete tiene que: transmitirse del Emisor al Router, almacenarse entero, y luego re-transmitirse del Router al Receptor.
   
   Regla de oro: Cada Router añade un retardo de transmisión extra ($T_t$) y un retardo de propagación extra ($T_p$).
   
4. ¿El ACK tiene tamaño?
   
   A veces te dicen que el ACK mide 64 Bytes. Entonces tienes que calcular su propio $T_{t,ack} = \frac{64 \cdot 8}{R}$.
   
   Si te dicen que es "despreciable", solo cuentas su $T_p$ (el tiempo que tarda la señal en volver).

5. El Semáforo de Unidades:
   
   Antes de meter números en la calculadora, revisa esto:
   
   De Bytes a bits: Multiplica siempre por 8. ($1 \text{ Byte} = 8 \text{ bits}$).
   
   Distancia: Siempre en metros ($1 \text{ Km} = 1000 \text{ m}$).
   
   Velocidad de Red ($R$):
   
    $1 \text{ Kbps} = 10^3 \text{ bps}$
    
    $1 \text{ Mbps} = 10^6 \text{ bps}$
    
    $1 \text{ Gbps} = 10^9 \text{ bps}$Tamaño de Archivo:$1 \text{ KB} = 1024 \text{ Bytes}$
    
    $1 \text{ MB} = 1024^2 \text{ Bytes}$
