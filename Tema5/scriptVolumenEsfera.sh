#!/bin/bash

volumenEsfera() {
    radioAlCubo=$1*$1*$1
    pi=3.1416
    volumen=$(echo "1.33333*$pi*$radioAlCubo" | bc)
    echo $volumen
}

resultado=$(volumenEsfera $1)
echo $resultado