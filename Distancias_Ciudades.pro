/*
Autor: Alfredo Reyes
Fecha: 04/12/2017
email: benitoalfredoreyes@gmail.com
github: https://github.com/Alfredit0
*/

/*Hechos que establecen la informacion de las carreteras, el hecho recibe: ciudad de origen, ciudad
de destino y la cantidad en kilometros de la distancia de la carretera que las conecta*/
carretera(la_paz,tijuana,1063).
carretera(tijuana,hermosillo,563).
carretera(hermosillo,chihuahua,500).
carretera(hermosillo,culiacan,588).
carretera(chihuahua,culiacan,438).
carretera(chihuahua,saltillo,625).
carretera(chihuahua,durango,533).
carretera(culiacan,durango,288).
carretera(culiacan,tepic,438).
carretera(durango,saltillo,413).
carretera(durango,zacatecas,250).
carretera(durango,tepic,250).
carretera(tepic,aguascalientes,275).
carretera(tepic,guadalajara,188).
carretera(tepic,colima,288).
carretera(zacatecas,saltillo,313).
carretera(aguascalientes,zacatecas,100).
carretera(saltillo,monterrey,75).
carretera(monterrey,ciudad_victoria,250).
carretera(saltillo,san_luis_potosi,375).
carretera(ciudad_victoria,zacatecas,375).
carretera(ciudad_victoria,san_luis_potosi,250).
carretera(zacatecas,san_luis_potosi,188).
carretera(colima,guadalajara,163).
carretera(colima,morelia,275).
carretera(colima,chilpancingo,500).
carretera(ciudad_victoria,pachuca,400).
carretera(ciudad_victoria,xalapa,500).
carretera(guadalajara,morelia,250).
carretera(aguascalientes,guanajuato,150).
carretera(guadalajara,guanajuato,225).
carretera(colima,guanajuato,313).
carretera(san_luis_potosi,queretaro,188).
carretera(guanajuato,queretaro,125).
carretera(guanajuato,morelia,150).
carretera(morelia,queretaro,125).
carretera(queretaro,pachuca,188).
carretera(pachuca,morelia,250).
carretera(xalapa,villahermosa,438).
carretera(xalapa,tuxtla_gutierrez,500).
carretera(xalapa,oaxaca,275).
carretera(xalapa,puebla,150).
carretera(xalapa,tlaxcala,125).
carretera(pachuca,xalapa,188).
carretera(queretaro,estado_de_mexico,150).
carretera(morelia,estado_de_mexico,163).
carretera(estado_de_mexico,chilpancingo,188).
carretera(estado_de_mexico,cdmx,63).
carretera(chilpancingo,villahermosa,688).
carretera(chilpancingo,oaxaca,313).
carretera(cdmx,tlaxcala,100).
carretera(cdmx,puebla,125).
carretera(cuernavaca,cdmx,50).
carretera(cuernavaca,chilpancingo,150).
carretera(cuernavaca,tlaxcala,125).
carretera(cuernavaca,puebla,113).
carretera(oaxaca,tuxtla_gutierrez,400).
carretera(puebla,oaxaca,263).
carretera(tuxtla_gutierrez,campeche,438).
carretera(villahermosa,campeche,325).
carretera(campeche,chetumal,263).
carretera(chetumal,merida,288).
carretera(campeche,merida,300).

/* Regla que se invoca que genera una ruta y su distancia, recibe:
ciudad de origen, destino y una varible plan*/
plan(Origen,Destino,Plan):-planear(Destino,[0,Origen],Ruta),
invertir(Ruta,[],Plan).
/*Regla que encuentra la ruta o plan que hay que seguir de una ciudad Destino a
una ciudad Origen y que guarda la Distancia recorrida*/
planear(Destino,[Distancia,Destino|Ciudades],[Distancia,Destino|Ciudades]):-!.
planear(Destino,[DistanciaAnterior,Actual|Ciudades],Ruta):-
conectados(Actual,Siguiente,DistanciaAux),
\+member(Siguiente,Ciudades),
NuevaDistancia is DistanciaAnterior+DistanciaAux,
planear(Destino,[NuevaDistancia,Siguiente,Actual|Ciudades],Ruta).
/*Regla que determina si dos ciudades estan conectadas por una carretera*/
conectados(Ciudad1,Ciudad2,Distancia):-carretera(Ciudad1,Ciudad2,Distancia).
conectados(Ciudad1,Ciudad2,Distancia):-carretera(Ciudad2,Ciudad1,Distancia).
/*Regla que invierte el contenido de una lista*/
invertir([],Lista,Lista).
invertir([X|Cola],HastaAhora,Lista):-
invertir(Cola,[X|HastaAhora],Lista).
/*Regla que lee la ciudad de Origen*/
pedir_origen(Origen):-write('Dame la ciudad de origen\n'), read(Origen).
/*Regla que lee la ciudad Destino*/
pedir_destino(Destino):-write('Dame la ciudad de destino\n'), read(Destino).
/*Regla que imprime uno a uno los elementos de una lista*/
imprimir([]):-!. 
imprimir([CABEZA|CUERPO]):-write(CABEZA), write('\n'),imprimir(CUERPO). 
/*Regla Princial, inicia la interacion con el usuario para obtener la ruta desde
una ciudad destino a una ciudad de origen*/
iniciar():-pedir_origen(X), pedir_destino(Y), write('Usted va de '), write(X),
write(' a '), write(Y), write(' La ruta y la distancia total que debera recorrer se muestran a continuacion\n\n'),
plan(X, Y, DistanciaRuta), imprimir(DistanciaRuta).