var ingreso=0;
var contador_combo_horario=0
var cadenota=""

// const Tablas_select={
//     //[tabla],[Campo a mostrar en el select][2° Campo a mostrar 0 si no aplica][Etiqueta o titulo a mostrar]
//     "vista_instructores":[['profesion','postgrado'],[1,1],[0,2],['Profesion','Postgrado']],
//     "vista_fichas": [['programa'],[2],[0],['Programa']],
//     "vista_rap": [['competencias'],[2],[0],['Competencia']],
//     "vista_planeacion": [['programa','vista_actividad_proyecto','Rap'],[2,1,3],[0,3,4],['Programa','Actividad de proyecto','Resultado de aprendizaje']],
//     "vista_programacion":[['vista_fichas','instructores'],[1,2],[5,5],['Ficha','Instructor']]
//   }

function horario(vficha,vstart,vend){
   
    document.getElementById('data_horario').innerHTML=""
    clase=".js-example-basic-single form-select form-select-md";
    console.log('ficha',vficha)
    console.log('Fecha inicial',vstart)
    console.log('fecha final',vend)
    b=0
    const bloques={
        "bloque":['Bloque A 06:00 - 09:00 am','Bloque B 09:00 - 12:00 am','Bloque C 01:00 - 04:00 pm','Bloque D 04:00 - 07:00 pm']
    }
    for (i=0;i<20;i++){
        document.getElementById('data_horario').innerHTML +=`<tr>`
        if (i%5==0){
            document.getElementById('data_horario').innerHTML +=`<td rowspan="5" style="background-color:rgb(188, 245, 102)">${bloques['bloque'][b]}</td>`
            b++;
            cadenita=""
            for(j=0;j<5;j++){
                contador_combo_horario+=1
                seleccion=1
                tabla_buscada='vista_instructores'
                valor=2
                valor2=4
                elemento="cbi"+contador_combo_horario;
                 cadenita+=`<td> jose </td>`
                //combo_h(tabla_buscada,elemento,clase,valor,valor2,seleccion)
                //document.getElementById('data_horario').innerHTML+=`</td>`
            }
            document.getElementById('data_horario').innerHTML+=cadenita
            console.log("b",contador_combo_horario)
        }
        else{
            cadenota=""
            for(j=0;j<5;j++){
                cadenota+=`<td><select> <option value="1">rap1</option><option value="2">rap2</option><option value="3">rap3</option><option value="4">rap4</option></select></td>`
                }
                document.getElementById('data_horario').innerHTML+=cadenota
            }
            document.getElementById('data_horario').innerHTML+=`</tr>`
    }
}

function combo_h(tabla,elemento,clase,valor,valor2,seleccion){
    /*combo(tabla,id del elemento,clase bootstrap,valor a mostrar,segundo valor a mostrar,valor predeterminado, Titulo*/
    let url = "http://127.0.0.1:5000/consulta_general/"+tabla;
              fetch(url)
                  .then( response => response.json())
                  .then( data => visualizar(data) )
                  .catch( error => console.log(error) )
              const visualizar = (data => {
                  console.log(data.datos)   
                  cadena=""
                  cadena+=`<select id=${elemento} class='${clase}'>`;
                      for (var i = 0; i < data.datos.length; i++) { 
                      s=""       
                        if (seleccion== data.datos[i][0])
                            s="selected"  
                        if (valor2==0)
                           v=data.datos[i][valor]
                        else
                           v=data.datos[i][valor]+" - "+data.datos[i][valor2]
                           
                            cadena+=`<option ${s} value='${data.datos[i][0]}'>${v}</option>`;
                            }
                      cadena+=`</select>`;
                      
                     document.getElementById('data_horario').innerHTML+=cadena;
                    
                     ingreso+=1;
                  
                 // if (ingreso==contador_combo_horario){
                     //$(document).ready(function() {
                     // $('.js-example-basic-single').select2();
                  //});
                }    
                  //} 
                  )   }   