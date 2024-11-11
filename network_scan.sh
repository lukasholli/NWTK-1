#!/bin/bash

#Ausgabe Datei definieren
output_file="scan_ergebnisse.txt"

#Ausführen des NMAP-Befehls
nmap -sP 192.168.111.10-254 > "$output_file"

#Ausgabe der Bestätigung
echo "Scan abgeschlossen. Die Ergebnisse werden in '$output_file' gespeichert."
