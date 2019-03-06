## Pasos a seguir para subir nueva funcionalidad:

  1. Desde la rama master creamos una nueva rama: 
  
                      git checkout -b nombre-descriptivo-de-lo-que-voy-a-hacer
                      
  2. Vamos añadiendo los cambios con:
                                             `git add .`
                      `git commit -m "mensaje descriptivo del cambio que hago"`
                      
  3. Cuando hayamos acabado lo que queremos meter en master o simplemente queramos guardar en la nube nuestro trabajo: 
  
                                git push origin nombre-de-la-rama
                                
  4. Para mergear con la rama master en github creamos una pull request de nuestra rama contra master
  
  5. Cuando uno de los otros miembros nos acepte los cambios se podrá mergear.
