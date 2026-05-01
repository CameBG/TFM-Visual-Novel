VAR amistad_jefa = 1
VAR amistad_torrado = 1
VAR nota = 0
 
-> Morning

=== Morning ===
# img Torrado: detective_happy.png 80 100 0
Narrador: Un día cualquiera en la ciudad... # img bg: street-3.png
# img Torrado: detective_happy.png 80 100 30
Desconocido: Eh... Hola... 
Desconocido: Soy un inspector, me llamo Torrado... # img Torrado: detective_std_talk.png 80 100 30

Torrado: Me han mandado a una dirección, pero no encuentro la oficina. # img Torrado: detective_std_think.png 80 100 30
Torrado: ¿Sabes dónde puedo encontrar la oficina llamada "Rastreator"? 
Torrado: Tienen una mascota de un perro o algo así... # img Torrado: detective_std_think2.png 80 100 30

+ [Emh, sí... yo trabajo allí, voy a decirle que me siga...]
    ~ amistad_torrado += 1
    Yo: Voy en esa dirección, sígueme y te acerco.
    Torrado: Con que me digas cómo llegar me sobra, ya que ahora mismo no voy a ir. # img Torrado: detective_std_talk.png 80 100 30
    Torrado: Iré en un rato, primero quiero comerme un pincho de tortilla de patata con jamón serrano. # img Torrado: detective_happy.png 80 100 30
    Yo: Vale, pues ¿ves esa calle a la derecha? Si sigues recto podrás encontrarla muy fácilmente.
    Torrado: Menos mal que lo sabes, ya pensaba que me iban a volver a bajar el sueldo. # img Torrado: detective_sad.png 80 100 30
    # img Torrado: detective_sad.png 80 100 0
    Narrador: Ves cómo se aleja y tú sigues tu camino hacia el trabajo.
    -> Oficina_Tutorial
+ [Uff... voy a pasar de decirle nada, no quiero más trabajo]
    ~ amistad_torrado -= 1
    Yo: I don spik espanish.
    Torrado: ¡Pero si te he escuchado mandar un audio hace unos minutos! # img Torrado: detective_sad_talk.png 80 100 30
    Torrado: Y tu inglés es aún peor que el mío. # img Torrado: detective_sad_talk2.png 80 100 30
    Yo: Perdón... Mira, ¿ves esa calle a la derecha? Si sigues recto llegarás.
    Torrado: Vale, muchas gracias, aunque podrías haberlo dicho antes... # img Torrado: detective_sad.png 80 100 30
    # img Torrado: detective_sad.png 80 100 0
    Narrador: Ves cómo se va en dirección contraria y sigues tu camino.
    -> Oficina_Tutorial
   
=== Oficina_Tutorial ===
# img bg: facility-11.png
Narrador: El aire acondicionado zumba suavemente en la sala de servidores.
# img jefa: jefa_molesta.png 10 100 0
Narrador: Es temprano, pero tu jefa Caye ya está esperándote con los brazos cruzados.

Jefa: ¡Ah, ya estás aquí! Escucha, hoy es un día movido. # img jefa: jefa_molesta.png 10 100 30
Jefa: El Departamento de Policía ha solicitado acceso al Censo. # img jefa: jefa_molesta2.png 10 100 30
Jefa: Van a enviar a un inspector para una investigación oficial. # img jefa: jefa_pointup_1.png 10 100 30
Jefa: Necesito que refresques el acceso al servidor. ¿Recuerdas cómo entrar? # img jefa: jefa_pointup_talk.png 10 100 30
+ [Claro que me acuerdo...]
    ~ amistad_jefa += 1
    Yo: Es con el comando `sqlcmd -S .\SQLEXPRESS -E`, ¿verdad?
    Jefa: Exacto. Me gusta que estés atento a los protocolos. # img jefa: jefa_pointup.png 10 100 30
    Jefa: No podemos permitirnos fallos delante de la policía. # img jefa: jefa_pointup_2.png 10 100 30
    Jefa: Es una oportunidad perfecta para nosotros. 
    -> Tutorial_Server
+ [La verdad es que no me acuerdo...]
    ~ amistad_jefa -= 1
    Yo: La verdad es que no me acuerdo... ¿Me lo puedes recordar, Caye?
    Jefa: (Suspira profundamente) Increíble. # img jefa: jefa_molesta_habla.png 10 100 30
    Jefa: Espero que el café te haga efecto pronto. Es `sqlcmd -S .\SQLEXPRESS -E`. # img jefa: jefa_molesta.png 10 100 30
    Jefa: Memorízalo de una vez, es la base de nuestro trabajo.
    Yo: Gracias, jefa. No volverá a pasar. 
    -> Tutorial_Server
=== Tutorial_Server ===
Jefa: Bien. Echa un vistazo a la estructura. # img jefa: jefa_pointup_talk.png 10 100 30
Jefa: Te he dejado disponibles tres tablas, ya que el resto por lo que tengo entendido no te van a ser necesarias.
Jefa: Si consideras que necesitas más información dímelo.
Jefa: Ahora, la tabla <b>Viviendas</b> tiene cientos de filas. # img jefa: jefa_pointup_1.png 10 100 30
Jefa: No olvides filtrar siempre por <b>Distrito</b> o nos volveremos locos. # img jefa: jefa_pointup_2.png 10 100 30
Jefa: Bueno, yo me voy a marchar, que tengo a otros clientes esperando. 

# img jefa: jefa_pointup_talk.png 10 100 0
Narrador: Caye se aleja con paso firme. Te quedas solo frente a la terminal.

Yo: <i>Entendido. Antes de que llegue el inspector, verificaré las tablas...</i>

~ temp fallos = 0
- (loop_tablas)
+ [SHOW TABLES;]
    ~ fallos = 1
    Yo: (No... eso es de MySQL. Aquí usamos <b>SQL Server Express</b>).
    -> loop_tablas

+ [SELECT name FROM sys.tables;]
    { 
    - fallos == 0: 
        ~ nota += 5
        Yo: (¡A la primera! Se nota que domino el sistema).
    - else:
        ~ nota += 2
        Yo: (Al final la he sacado, menos mal).
    }
    Narrador: La pantalla muestra: <b>Habitantes</b>, <b>Viviendas</b> y <b>Registros_Actividad</b>.
    -> Oficina_Mediodia
=== Oficina_Mediodia ===
# img bg: empty
Narrador: Pasan las horas y escuchas cómo alguien entra en la oficina. 
# img bg: facility-11.png 
Narrador: Reconoces la voz de inmediato. ¿Será aquel inspector de esta mañana?

+ [Ir a la entrada a ver quién es]
    -> Encuentro_Proactivo
+ [Quedarse en el sitio trabajando]
    -> Llamada_Jefa
=== Encuentro_Proactivo ===
Yo: Voy a acercarme a la sala de ordenadores a ver si es él...
# img bg: facility-5.png
Narrador: Allí está Torrado, mirando los ordenadores como si de una escena de crimen se tratase.
# img Torrado: detective_std.png 80 100 30
-> Dialogo_Torrado
=== Llamada_Jefa ===
Narrador: Decides ignorar las voces, pero unos pasos rápidos se acercan.
# img jefa: jefa_molesta2.png 10 100 30
Jefa: ¿Se puede saber qué haces todavía sentado? # img jefa: jefa_molesta_habla.png 10 100 30
Jefa: Ha llegado el inspector y está perdido. Muévete. # img jefa: jefa_molesta2.png 10 100 30
~ amistad_jefa -= 1
Yo: ¡Perdona, Caye! Voy volando.
# img jefa: jefa_molesta2.png 10 100 0
# img bg: facility-5.png
Narrador: Te encuentras con el inspector cerca de la entrada.
-> Dialogo_Torrado
=== Dialogo_Torrado ===
{ 
- amistad_torrado > 1:
    # img Torrado: detective_happier.png 80 100 30
    Torrado: ¡Ahí estás! Mi guía de esta mañana. ¡Este sitio es un laberinto! 
- else:
    # img Torrado: detective_sad_talk.png 80 100 30
    Torrado: Vaya... pero si es el que "no hablaba español". 
}

Torrado: No sabía que trabajabas aquí. Necesito tu ayuda. # img Torrado: detective_std_talk.png 80 100 30
Torrado: El departamento no me deja tocar un ordenador ni para jugar al buscaminas... # img Torrado: detective_std_2.png 80 100 30
Torrado: El caso es que me falta información. # img Torrado: detective_std_3.png 80 100 30
Torrado: ¿Me puedes ayudar a continuar con este caso?

Yo: Claro que sí, sígueme a mi puesto, pero por favor no toque ningún equipo...
# img Torrado: detective_sad.png 80 100 30
-> Sala_Ordenadores
=== Sala_Ordenadores ===
# img bg: facility-11.png
# img Torrado: detective_std_2.png 80 100 30
Narrador: Torrado se sienta a tu lado, fascinado por los monitores.
Yo: ¿Qué es lo que necesita, inspector?
Torrado: Pues mira, cómo te iba diciendo antes... El departamento no confía mucho en mí... 
Torrado: Y nos han puesto en "prueba", a ti para ver si eres útil en casos más confidenciales, y a mí para saber si pueden confiar más. # img Torrado: detective_std_3.png 80 100 30
Torrado: El archivo que me ha dado mi jefe no tiene los datos suficientes para resolver este caso, así que te voy a necesitar para conseguir lo que falta. # img Torrado: detective_std_2.png 80 100 30
Yo: Entendido. 

Torrado: Buscamos a alguien que dejó un paquete en la <b>Avenida Luna</b>. # img Torrado: detective_std.png 80 100 30
Torrado: No aparece en Google Maps. ¿Podemos ubicarla? # img Torrado: detective_std_think.png 80 100 30

Narrador: Te conectas a la base de datos. Debes elegir la tabla correcta.
# img Torrado: detective_std_2.png 80 100 30
Yo: (Tengo que ver qué tabla contiene la información geográfica).

-> Reto_Analisis_Tablas
=== Reto_Analisis_Tablas ===
~ temp fallos_tablas = 0
- (loop)
# img Torrado: detective_std.png 80 100 30
Torrado: {¿Qué tabla miramos?|Piénsalo bien...|¿Seguro que es esa?}

* [Consultar la tabla 'Habitantes']
    # img Torrado: detective_sad_talk.png 80 100 30
    ~ fallos_tablas++
    Yo: (No... esa tabla tiene nombres y profesiones, pero sin saber en qué casa vive el sospechoso, no me sirve de nada ahora mismo).
    -> loop
* [Consultar la tabla 'Registros_Actividad']
    # img Torrado: detective_sad_talk.png 80 100 30
    ~ fallos_tablas++
    Yo: (Ahí veré qué ha pasado en la ciudad, pero "Avenida Luna" es una calle. Necesito primero los datos de la vivienda).
    -> loop
+ [Consultar la tabla 'Viviendas']
    # img Torrado: detective_happy.png 80 100 30
    { 
    - fallos_tablas == 0:
        ~ nota += 5
        Yo: (¡Exacto! Esa es la que relaciona las calles con los distritos y los códigos de cada portal).
    - else:
        ~ nota += 2
        Yo: (Eso es, en 'Viviendas' es donde encontraremos la información geográfica).
    }
    -> Reto_Avenida_Luna
=== Reto_Avenida_Luna ===
Yo: Vale, inspector. Vamos a ver en qué distrito cae la Avenida Luna para empezar a filtrar.
~ temp fallos_distrito = 0
- (Query_Distrito)
{fallos_distrito == 0: Yo: (Tengo que localizar el distrito de esa calle...)|Yo: (A ver, concéntrate...)}

+ [SELECT distrito FROM Viviendas WHERE calle = 'Avenida Luna';]
    { 
    - fallos_distrito == 0: 
        ~ nota += 5
        Yo: (¡Eso es! Directo al grano).
    - else: 
        ~ nota += 2
        Yo: (Vale, esta es la consulta correcta).
    }
    -> Resultado_Distrito
* [SELECT * FROM Viviendas WHERE distrito = 'Avenida Luna';]
    # img Torrado: detective_std_think2.png 80 100 30
    ~ fallos_distrito++
    Torrado: Hum... no sale nada en la pantalla. ¿Seguro que "Avenida Luna" es un distrito? 
    -> Query_Distrito
=== Resultado_Distrito ===
Narrador: La pantalla muestra un único resultado: <b>Distrito 9</b>.
# img Torrado: detective_happy.png 80 100 30
Torrado: ¡El Distrito 9! Una zona industrial perfecta para dejar paquetes sin ser visto.
Torrado: ¿Puedes mostrarme qué portales hay exactamente en esa calle? # img Torrado: detective_std_talk.png 80 100 30

Yo: Claro, vamos a listar las viviendas de la Avenida Luna en ese distrito.

~ temp fallos_viviendas = 0
- (Query_Viviendas_Calle)
+ [SELECT id_vivienda, numero FROM Viviendas WHERE calle = 'Avenida Luna' AND distrito = 'Distrito 9';]
    { 
    - fallos_viviendas == 0: 
        ~ nota += 5
        Yo: (Filtro correcto. AND aplicado).
    - else: 
        ~ nota += 2
        Yo: (Vale, esta combinación funciona).
    }
    -> Resultado_Viviendas_Calle

* [SELECT id_vivienda, numero FROM Viviendas WHERE calle = 'Avenida Luna' OR distrito = 'Distrito 9';]
    # img Torrado: detective_sad_talk2.png 80 100 30
    ~ fallos_viviendas++
    Torrado: ¡Cáspita! Salen muchísimas viviendas. No puede ser, esa avenida no era tan larga.
    Yo: (El operador 'OR' me está sumando todo el distrito. Debo usar 'AND').
    -> Query_Viviendas_Calle
=== Resultado_Viviendas_Calle ===
Narrador: Resultados: ID 18 (Nº 15), ID 19 (Nº 17), ID 20 (Nº 19).
# img Torrado: detective_happier.png 80 100 30
Torrado: ¡Espera un segundo! (Rebusca entre sus notas)... ¡Aquí está! "Entregar en el <b>número 19</b>".
Torrado: ¡Ese es el sitio! El portal 19 es el <b>ID_Vivienda 20</b>. ¡Sácame a los habitantes! # img Torrado: detective_std.png 80 100 30

Yo: (A ver... portal 19 es ID_Vivienda 20. Usaré ese ID para buscar a las personas).

- (Reto_Final_Habitantes)
+ [SELECT nombre FROM Habitantes WHERE id_vivienda = 20]
    Yo: Consultando nombres para la vivienda con ID 20...
    -> Lista_Sospechosos
+ [SELECT nombre FROM Habitantes WHERE numero = 19]
    # img Torrado: detective_std_think.png 80 100 30
    Yo: (No... la tabla Habitantes no tiene una columna 'numero'. Tengo que usar el ID_Vivienda que acabamos de ver). 
    -> Reto_Final_Habitantes
+ [SELECT * FROM Habitantes WHERE id_vivienda = 19]
    # img Torrado: detective_std_think.png 80 100 30
    Yo: (Cuidado... el ID del portal 19 es el **20**. No debo confundir el número de calle con el ID de la tabla). 
    -> Reto_Final_Habitantes
=== Lista_Sospechosos ===
# img bg: final-evidence.png
Narrador: Aparecen 15 residentes. Torrado se agobia ante la lista.
# img Torrado: detective_sad.png 80 100 30
Torrado: ¡Madre mía! ¡Esto parece la cola del paro! No podemos interrogar a todos.
Yo: Tranquilo. Vamos a ver cuántos registros de actividad tiene este portal para ver la magnitud. # img Torrado: detective_std_2.png 80 100 30
- (Reto_Contar_Avisos)
~ temp fallos_count = 0
* [SELECT MAX(*) FROM Registros_Actividad;]
    # img Torrado: detective_std_think2.png 80 100 30
    ~ fallos_count++
    Yo: (No, MAX se usa para buscar el valor más alto en una columna, no para contar filas). 
    -> Reto_Contar_Avisos
+ [SELECT COUNT(*) FROM Registros_Actividad WHERE id_vivienda = 20;]
    { 
    - fallos_count == 0: 
        ~ nota += 5 
        Yo: (El recuento nos dará una idea del tráfico del edificio).
    - else: 
        ~ nota += 2 
        Yo: (Conseguido, ahí está el total).
    }
    -> Resultado_Conteo
* [SELECT * FROM Registros_Actividad WHERE id_vivienda = 20;]
    # img Torrado: detective_std_think2.png 80 100 30
    ~ fallos_count++
    Yo: (Eso me daría la lista completa, pero yo solo quiero saber el número total ahora mismo). 
    -> Reto_Contar_Avisos
=== Resultado_Conteo ===
Yo: Inspector, el sistema dice que hay un total de 12 registros vinculados a este edificio.
Torrado: ¡Siguen siendo demasiados! ¿Podemos ver el <b>último</b> aviso? El ID más alto será el más reciente. # img Torrado: detective_std_talk.png 80 100 30

~ temp fallos_max = 0
- (Reto_Maximo_Filtro)
* [SELECT MAX(id_registro) FROM Registros_Actividad WHERE id_vivienda = 19;]
    # img Torrado: detective_std_think2.png 80 100 30
    ~ fallos_max++
    Yo: (No... El 19 es el número de calle, pero el ID que sacamos antes es el 20). 
    -> Reto_Maximo_Filtro
* [SELECT MAX(id_vivienda) FROM Registros_Actividad WHERE id_registro = 20;]
    # img Torrado: detective_std_think2.png 80 100 30
    ~ fallos_max++
    Yo: (Está casi... ¡pero algo falló! Voy a leer bien lo que he hecho).
    -> Reto_Maximo_Filtro
+ [SELECT MAX(id_registro) FROM Registros_Actividad WHERE id_vivienda = 20;]
    { 
    - fallos_max == 0: 
        ~ nota += 5
        Yo: (¡La función MAX me dará el movimiento más reciente!)
    - else: 
        ~ nota += 2
        Yo: (Vale, este es el comando para el valor máximo).
    }
    -> Resultado_Final_Exito
=== Resultado_Final_Exito ===
# img bg: monitor-final.png
Narrador: Registro 45: "Aviso: Vehículo de reparto obstaculizando salida de garaje". # img Torrado: detective_std.png 80 100 30
Yo: El ID_Persona 45 es... <b>Marcos Peña</b>. # img Torrado: detective_happier.png 80 100 30

Torrado: ¡LO TENEMOS! Marcos Peña estaba con el vehículo en la puerta. ¡Eres un genio! 
Torrado: No sabes el peso que me quitas de encima, muchacho. # img Torrado: detective_happier.png 80 100 30

Torrado: Voy a hablar con mi jefe ahora mismo para pasarle toda la información del caso. # img Torrado: detective_std_talk.png 80 100 30
Torrado: ¡Seguro que se queda de piedra con nuestra eficiencia! 
Torrado: Espero que nos veamos pronto, ¡ha sido un placer trabajar contigo! # img Torrado: detective_happy.png 80 100 30

Narrador: Torrado guarda su libreta y archivos y te dedica un último saludo antes de salir.
# img Torrado: detective_happy.png 80 100 0

-> Evening

=== Evening ===
# img bg: street-3.png
~ temp nota_final = (nota * 10) / 30

Narrador: El sol se pone. Torrado se prepara para marchar.

{
    - amistad_torrado > 0:
        # img Torrado: detective_happy.png 80 100 30
        Torrado: ¡Oye, muchacho! Gracias por la ayuda. Da gusto trabajar con gente tan maja.
    - amistad_torrado < 0:
        # img Torrado: detective_sad_talk2.png 80 100 30
        Torrado: Bueno... gracias. Siento que mi español no fuera "lo bastante bueno" para ti, pero eres eficiente.
    - else:
        # img Torrado: detective_std.png 80 100 30
        Torrado: Gracias por los datos, chaval. Buen trabajo.
}

Narrador: La Jefa Caye sale de su despacho. # img jefa: jefa_pointup_1.png 10 100 0

{
    - amistad_jefa > 0:
        # img jefa: jefa_pointup_2.png 10 100 30
        Jefa: Veo que ya habéis terminado. Espero que mi empleado haya estado a la altura.
    - else:
        # img jefa: jefa_molesta.png 10 100 30
        Jefa: Inspector, lamento si ha tenido que esperar porque este chico andaba despistado. Mañana hablaremos.
}

Narrador: --- <b>INFORME FINAL DEL DÍA</b> ---
Narrador: <b>SQL Técnica:</b> {nota_final} / 10
Narrador: <b>Relación Cliente:</b> {amistad_torrado > 0: Excelente|Mejorable}
Narrador: <b>Relación Empresa:</b> {amistad_jefa > 0: Positiva|Tensa}

{ 
    - nota_final >= 9 and amistad_jefa > 0:
        Narrador: ¡Día perfecto! Eres el empleado modelo.
    - nota_final >= 5:
        Narrador: Has cumplido. El caso está cerrado y mantienes el puesto.
    - else:
        Narrador: Un día para olvidar. Necesitas repasar SQL.
}

<b>THE END</b>
+ [¿Jugar de nuevo?]
    -> Restart

=== Restart ===
# RESTART
~ amistad_jefa = 1
~ amistad_torrado = 1
~ nota = 0
-> Morning