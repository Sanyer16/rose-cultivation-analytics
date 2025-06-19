# Prueba Técnica – Analista de Datos (SQL Server & Power BI) 🌹 

Este repositorio contiene el desarrollo de una **prueba técnica** para el cargo de **Analista de Datos**, aplicada a una empresa dedicada al cultivo de rosas.\
El ejercicio abarca el modelado de datos, implementación en SQL Server y creación de un reporte en Power BI para responder preguntas clave del negocio.

---

## ✅ Actividades realizadas

1. **Diseño del modelo entidad-relación (ER):**\
   Representación de la estructura operativa de la empresa, registrando:

   - Información de los ciclos de floración.
   - Registro de podas, operarios y ubicación de las camas.
   - Envío de tallos al inventario de poscosecha.
   - Tipos de datos definidos según SQL Server y relaciones con cardinalidad.

2. **Implementación en SQL Server:**

   - Creación de la base de datos `RosaCultivoDB`.
   - Estructura de tablas conforme al modelo ER.
   - Inserción de datos de prueba para simular el proceso productivo.
   - Script principal disponible en: `crear_base_datos_rosas.sql`.
   - Consultas y operaciones DDL adicionales en: `Query_DDL.sql`.

3. **Diseño de reporte en Power BI:**\
   Se diseñó un tablero visual titulado **"Control de Producción de Rosas"**. Este reporte interactivo se conecta a la base de datos y permite responder consultas clave del negocio a través de visualizaciones intuitivas:

   - 🌱 **Total de tallos podados:** resumen numérico de la producción total.
   - 📅 **Tallos podados por mes:** gráfico de barras con evolución mensual.
   - 👷‍♂️ **Tallos podados por operario:** rendimiento individual.
   - 🛏️ **Cantidad de tallos por cama:** análisis por ubicación.
   - 🧱 **Cantidad de tallos por bloque:** desglose por área de cultivo.
   - 📆 Filtros por **fecha de poda**, **bloque** y **operario** para análisis dinámico.

4. **Documentación:**\
   Desarrollo completo de la prueba y evidencia presentada en el archivo PDF: `Analisis del cultivo de rosas_Sanyer_Duque.pdf`.

---

## 🛠️ Herramientas utilizadas

- **SQL Server 2019 Express** – Motor de base de datos relacional.
- **Power BI Desktop** – Visualización y análisis de datos.
- **Lucidchart** – Diseño del modelo entidad-relación.
- **SSMS (SQL Server Management Studio)** – Administración y ejecución de scripts.

---

## 📂 Estructura del repositorio

```
│
├── crear_base_datos_rosas.sql                       # Script SQL para restaurar la base de datos completa
├── Query_DDL.sql                                    # Consultas DDL: creación, inserción y consultas adicionales
├── modelo_entidad_relacion.png                      # Diagrama ER del modelo de datos
├── Cultivo Rosas.pbix                               # Reporte Power BI conectado a la base de datos
├── Analisis del cultivo de rosas_Sanyer_Duque.pdf   # Documento PDF con todo el desarrollo y evidencia
├── README.md                                        # Documentación del proyecto
```

---

## 📝 Consideraciones

Este ejercicio técnico simula un caso real de uso de datos en el sector agrícola, con enfoque en la trazabilidad de procesos, eficiencia operativa y toma de decisiones basada en datos.
