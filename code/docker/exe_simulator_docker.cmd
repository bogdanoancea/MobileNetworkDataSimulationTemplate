cd C:\simulator\simulator-master-docker\docker 
docker load -i simulator.tar 
docker run --rm -v C:\simulator\simulator-master-docker\docker\output:/repo/output -t -i simulator -m output/map.wkt -s output/simulation.xml -p output/persons.xml -a output/antennas.xml -v -o -pb output/probabilities.xml
