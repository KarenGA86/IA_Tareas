from pyswip import Prolog
 
prolog = Prolog()
prolog.consult("seguridad.pl")
 
# 
# Consulta 1: ¿Qué empleados tienen acceso alto?
print("Consulta 1: Empleados con acceso alto (nivel >= 3)")
for resultado in prolog.query("acceso_alto(Nombre)"):
    print(f"- {resultado['Nombre']} tiene acceso alto")
 
# 
# Consulta 2: ¿Qué empleados son críticos (por su departamento)?
print("\nConsulta 2: Empleados en departamentos críticos")
for resultado in prolog.query("empleado_critico(Nombre)"):
    print(f"- {resultado['Nombre']} es un empleado crítico")
 
# Consulta 3: ¿Luis y Ana pertenecen al mismo departamento?
print("\nConsulta 3: ¿Luis y Ana son del mismo departamento?")
resultado = list(prolog.query("mismo_departamento(luis, ana)"))
respuesta = "Sí" if resultado else "No"
print(f"Respuesta: {respuesta}")
 
