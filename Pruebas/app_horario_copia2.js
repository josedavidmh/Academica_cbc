function horario(vficha,vstart,vend){
    cadena="";
    console.log('ficha',vficha)
    console.log('Fecha inicial',vstart)
    console.log('fecha final',vend)
    b=0
    const bloques={
        "bloque":['Bloque A 06:00 - 09:00 am','Bloque B 09:00 - 12:00 am','Bloque C 01:00 - 04:00 pm','Bloque D 04:00 - 07:00 pm']
    }
    for (i=0;i<20;i++){
        cadena+=`<tr>`
        if (i%5==0){
            cadena+=`<td rowspan="5" style="background-color:rgb(188, 245, 102)">${bloques['bloque'][b]}</td>`
            b++;
            for(j=0;j<5;j++){
                cadena+=`<td><select><option value="1">Jose David</option><option value="2">Jesus Ramiro</option><option value="3">Beberly Romero</option><option value="4">Alfredo Garcia</option><option value="5">Adrian Morillo</option></select></td>`
            }
        }
        else{
            for(j=0;j<5;j++){
                cadena+=`<td><select> <option value="1">rap1</option><option value="2">rap2</option><option value="3">rap3</option><option value="4">rap4</option></select></td>`
                }
            }
        
    cadena+=`</tr>`
    }
    document.getElementById('data_horario').innerHTML = cadena;
}