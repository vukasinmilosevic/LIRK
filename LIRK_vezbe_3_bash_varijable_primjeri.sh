#!/bin/bash

# 1. Osnovna varijabla
greeting="Zdravo, čestice!"
echo "$greeting"

# 2. Korišćenje varijable u petlji
file="particle_events_dataset.csv"
for p in proton neutron muon; do
  echo "$p: $(grep -c $p "$file")"
done

# 3. Numerička varijabla i aritmetika
a=10
b=5
sum=$((a + b))
echo "Zbir je: $sum"

# 4. Varijabla sa izlazom komande
line_count=$(wc -l < particle_events_dataset.csv)
echo "Broj redova u fajlu je: $line_count"

# 5. Kombinovanje stringova
prefix="analiza_"
datum=$(date +%Y%m%d)
ime_fajla="${prefix}${datum}.txt"
echo "Ime izlaznog fajla: $ime_fajla"

# 6. Varijabla kao obrazac u grep
particle="tau"
grep "$particle" particle_events_dataset.csv > "${particle}_events.csv"

# 7. Podstringovi iz varijabli
tekst="LHC_Detector_2025"
echo "Tip detektora: ${tekst:0:3}"
echo "Godina: ${tekst:13:4}"

# 8. Brojanje događaja po tipu
protons=$(grep -c 'proton' particle_events_dataset.csv)
muons=$(grep -c 'muon' particle_events_dataset.csv)
echo "Protoni: $protons, Muoni: $muons"

# 9. Uslovno korišćenje varijabli
count=$(grep -c 'neutron' particle_events_dataset.csv)
if [ "$count" -gt 10 ]; then
  echo "Više od 10 neutron događaja: $count"
fi

# 10. Interaktivni unos
read -p "Unesi tip čestice (proton/neutron/muon): " tip
grep "$tip" particle_events_dataset.csv | head -n 5
