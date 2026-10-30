# Interconexión de redes con MikroTik y Cisco Catalyst 2960

## Descripción del proyecto

Este laboratorio implementa la comunicación entre dos redes LAN independientes mediante routers MikroTik y switches Cisco Catalyst 2960. Se utiliza enrutamiento estático para permitir la comunicación entre las subredes de ambos sitios.

El objetivo es practicar conceptos fundamentales de routing, switching, direccionamiento IPv4, VLAN y diagnóstico de conectividad.

## Objetivos

- Configurar dos routers MikroTik.
- Implementar la VLAN 10 en dos switches Cisco Catalyst 2960.
- Asignar direccionamiento IPv4 a ambas redes LAN.
- Configurar rutas estáticas bidireccionales.
- Validar la conectividad entre dispositivos de distintas subredes.
- Documentar las configuraciones y pruebas del laboratorio.

## Topología

### Sitio A
- Router: MikroTik A.
- Dirección de tránsito: `10.0.0.11/24`.
- Gateway de la LAN: `10.10.10.1/24`.
- Switch: Cisco Catalyst 2960 A.
- VLAN: 10.
- Subred: `10.10.10.0/24`.

### Sitio B
- Router: MikroTik B.
- Dirección de tránsito: `10.0.0.13/24`.
- Gateway de la LAN: `10.10.11.1/24`.
- Switch: Cisco Catalyst 2960 B.
- VLAN: 10.
- Subred: `10.10.11.0/24`.

## Tabla de direccionamiento

| Dispositivo | Dirección IP | Función |
|---|---|---|
| MikroTik A | `10.0.0.11/24` | Tránsito |
| MikroTik A | `10.10.10.1/24` | Gateway LAN A |
| MikroTik B | `10.0.0.13/24` | Tránsito |
| MikroTik B | `10.10.11.1/24` | Gateway LAN B |
| PC-A | `10.10.10.10/24` | Equipo de prueba |
| PC-B | `10.10.11.10/24` | Equipo de prueba |

Las direcciones de PC-A y PC-B son ejemplos que deben sustituirse por las utilizadas durante las pruebas reales.

## Enrutamiento estático

Se configura una ruta estática en cada router para alcanzar la subred remota.

### MikroTik A

- Red de destino: `10.10.11.0/24`
- Siguiente salto: `10.0.0.13`

```routeros
/ip route
add dst-address=10.10.11.0/24 gateway=10.0.0.13 comment="Static route to LAN B"
```

### MikroTik B

- Red de destino: `10.10.10.0/24`
- Siguiente salto: `10.0.0.11`

```routeros
/ip route
add dst-address=10.10.10.0/24 gateway=10.0.0.11 comment="Static route to LAN A"
```

Las interfaces de tránsito deben tener conectividad IP entre sí para que estas rutas funcionen.

## Configuración de switching

En ambos switches Cisco Catalyst 2960 se crea la VLAN 10 y se asignan los puertos correspondientes como puertos de acceso.

```cisco
vlan 10
 name LAN
```

Los puertos de usuario se configuran según la topología física del laboratorio.

## Pruebas de validación

Las siguientes pruebas deben ejecutarse y documentarse:

1. Verificar las direcciones IP y las rutas de ambos routers.
2. Confirmar que cada PC alcanza su gateway local.
3. Validar la conectividad entre `10.0.0.11` y `10.0.0.13`.
4. Ejecutar ping entre PC-A y PC-B en ambas direcciones.
5. Utilizar traceroute para comprobar el recorrido de los paquetes.
6. Revisar las tablas de rutas y las VLAN si se presentan fallos.

Los resultados definitivos se incorporarán después de completar las pruebas.

## Tecnologías utilizadas

- MikroTik RouterOS
- Cisco Catalyst 2960
- IPv4
- VLAN 802.1Q
- Enrutamiento estático
- ICMP y herramientas de diagnóstico de red

## Aprendizajes

Este laboratorio permite practicar la segmentación de redes mediante VLAN, el direccionamiento IPv4, el funcionamiento de las rutas estáticas y el diagnóstico de conectividad entre diferentes subredes.

## Evidencias

- Diagrama de topología.
- Configuración de los routers.
- Configuración de los switches.
- Tablas de rutas.
- Resultados de las pruebas de conectividad.

## Estado del proyecto

Laboratorio de práctica. Completar la documentación de resultados con evidencias obtenidas de los dispositivos reales o del entorno de simulación.





