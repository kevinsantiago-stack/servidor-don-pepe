
import os
from flask import Flask, request, jsonify
import datetime


app = Flask(__name__)

# Ruta reparada para guardar placas en MAYÚSCULAS
@app.route("/api/placa", methods=["POST"])
def crear_placa():

    datos = request.get_json()
    placa = datos.get("placa")

    # Se convierte la placa a mayúsculas
    if placa:
        placa = placa.upper()

        return jsonify({
            "mensaje": f"Placa '{placa}' guardada exitosamente"
        }), 201

    return jsonify({
        "error": "No se envió ninguna placa"
    }), 400


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

@app.route('/api/repuestos')
def get_repuestos():
    return jsonify({
        "status": "online",
        "servidor": "Don Pepe",
        "hora_servidor": str(datetime.datetime.now()),
        "inventario": ["filtro de aire", "aceite de motor", "bujías", "pastillas de freno"]
    })
if __name__ == "__main__":
    #lea el puerto de la nube de render o use el puerto 5000 por defecto
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)