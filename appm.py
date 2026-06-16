import os
from flask import Flask, request, jsonify
import datetime

app = Flask(__name__)

# Ruta principal
@app.route("/")
def home():
    return "Flask funcionando correctamente"

# Ruta de prueba de la API
@app.route("/api")
def api():
    return jsonify({
        "mensaje": "API activa con Flask y Render"
    })

@app.route("/api/placa", methods=["POST"])
def crear_placa():
    datos = request.get_json()
    placa = datos.get("placa")

    if placa:
        placa = placa.upper()

        return jsonify({
            "mensaje": f"Placa '{placa}' guardada exitosamente"
        }), 201

    return jsonify({
        "error": "No se envió ninguna placa"
    }), 400


@app.route("/api/repuestos")
def get_repuestos():
    return jsonify({
        "status": "online",
        "servidor": "Don Pepe",
        "hora_servidor": str(datetime.datetime.now()),
        "inventario": [
            "filtro de aire",
            "aceite de motor",
            "bujías",
            "pastillas de freno"
        ]
    })


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)