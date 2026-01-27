## Relación ejercicios teóricos Tema 4

**1.** Explique brevemente las funciones de cada una de las capas del modelo de comunicación de datos TCP/IP

```
    1.Capa de Fisica (Acceso a la Red): Interactúa con el hardware de la red (cables, interfaces, switches).
    2.Capa de Internet : Transmisión de paquetes y el enrutamiento a través de múltiples redes.
    3.Capa de Transporte: Asegura la comunicación punto a punto y la transferencia de datos.
    4.Capa de Aplicación: Proporciona servicios de red a las aplicaciones del usuario.
```

**2.** Si la unidad de datos de protocolo en la capa de enlace se llama trama y la unidad de datos de protocolo en la capa de red se llama paquete, ¿son las tramas las que encapsulan los paquetes o son los paquetes los que encapsulan las tramas? Explicar la respuesta.

```
Las tramas encapsulan a los paquetes ya que la capa de red esta por encima, por tanto los paquetes son mas grandes.
```

**5-** ¿Qué diferencia, en el contexto de una red de computadores, existe entre la tecnología de difusión y la tecnología punto a punto? y fuera del contexto de redes de computadores, dime 2 ejemplos de comunicaciones por difusión y otros dos de punto a punto

```
En difusion no va a un receptor concreto, lo lanzas a todos los receptores y que lo coja al que va dirigido. Las conexiones por WiFi o bluthooth por ejemplo.

De punto a punto va a un receptor en concreto.
```

**6-**  Un sistema tiene una jerarquía de protocolos de n capas. Las aplicaciones generan mensajes de M bytes de longitud. En cada capa se añade una cabecera de h bytes. ¿Qué fracción del ancho de banda de la red se llena con cabeceras? Aplique el resultado a una conexión a 512 Kbps con tamaño de datos de 1500 Bytes y 4 capas, cada una de las cuales añade 64 Bytes de cabecera.
La fracción del ancho de banda que se llena con cabeceras es (tomando únicamente dos decimales y redondeando con el tercero):

```

```

**8-** Cuando se intercambia un fichero entre dos hosts se pueden seguir dos estrategias de confirmación. En la primera, el fichero se divide en paquetes que se confirman individualmente por el receptor, pero el fichero en conjunto no se confirma. En la segunda, los paquetes individuales no se confirman individualmente, es el fichero entero el que se confirma cuando llega completo. Discutir las dos opciones

```

```

**9.** Clasifique como difusión o punto a punto cada uno de los siguientes sistemas de transmisión:
a. Radio y TV 
b. Redes inalámbricas (WLAN) 
c. ADSL 
d. Redes de Cable.
e. conexión WIFI

```

```

**10**. Clasifique los siguientes servicios como orientados a conexión / no orientados a conexión y confirmados /sin confirmación. Justifique la respuesta.
a. Correo postal ordinario b. Correo certificado c. Envío y recepción de fax d. Conversación telefónica

```

```

### Ejercicio extra:

**7.** ¿Cuál es el tiempo necesario en enviar un paquete de 1000 Bytes, incluidos 50 Bytes de cabecera, por un enlace de 100 Mbps y 10Km? ¿cuál es el tiempo mínimo desde que se envía hasta que se recibe confirmación? ¿qué relación hay entre este tiempo y los temporizadores en, por ejemplo, las capas de enlace y transporte?

```

```