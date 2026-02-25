# Pokédex App 

## Descripcion 
Cree una aplicacion simple que desplega los pirmeros 151 pokemon usando la pokeapi. 
El usuario puede navegar en toda esta lista y darle click al que le interese para ver sus detalles

## API usada
PokeAPI  

Endpoint para la lista:
https://pokeapi.co/api/v2/pokemon?limit=151

Endpoint para el detalle:
https://pokeapi.co/api/v2/pokemon-species/{id}


## Funcionalidades
- Obtiene datos reales desde la api publica de pokemon
- Muestra los Pokemon en una lista desplazable
- Permite navegar a una vista de detalle
- Muestra imagen y descripcion del Pokemon
- Incluye estado de carga (ProgressView)
- Manejo basico de errores
- Implementa navegación con NavigationStack (Lista -> Detalle)

## Arquitectura
La aplicacion fue desarrollada utilizando SwiftUI.

- Los modelos están separados en su propio archivo
- Las vistas están organizadas en archivos SwiftUI independientes
- Las solicitudes a la API se realizan usando URLSession

## Cómo ejecutar el proyecto
- Xcode 15 o superior
- iOS 17 o superior
- Abrir el proyecto en Xcode
- Seleccionar un simulador
- Presionar Run

## Autor
Carlos Baranda
