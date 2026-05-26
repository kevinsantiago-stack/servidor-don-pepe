from flask import Flask, request, jsonify

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
