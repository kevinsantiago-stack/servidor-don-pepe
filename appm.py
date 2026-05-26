import os
import json
from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)
SERVER_NAME = "Servidor-kevin-Backend"
JSON_PATH = "/var/www/html/peritajes.json"

os.makedirs(os.path.dirname(JSON_PATH), exist_ok=True)

def cargar_datos():
    if not os.path.exists(JSON_PATH) or os.stat(JSON_PATH).st_size == 0:
        datos_iniciales = [
            {"placa": "XYZ-123", "marca": "Yamaha", "modelo": "FZ25", "estado": "En revisión", "falla": "Frenos"},
            {"placa": "ABC-987", "marca": "Suzuki", "modelo": "Gixxer 250", "estado": "Espera de repuestos", "falla": "Cambio de pastillas"},
            {"placa": "JDC-21H", "marca": "Suzuki", "modelo": "Gixxer 250", "estado": "Listo", "falla": "Cambio de pastillas"}
        ]
        guardar_datos(datos_iniciales)
        return datos_iniciales
    with open(JSON_PATH, 'r') as file:
        return json.load(file)

def guardar_datos(datos):
    with open(JSON_PATH, 'w') as file:
        json.dump(datos, file, indent=4)

@app.route('/api/registros', methods=['GET'])
def get_registros():
    inventario = cargar_datos()
    return jsonify({
        "servidor": SERVER_NAME,
        "hora_servidor": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "inventario": inventario
    }), 200

@app.route('/api/peritajes', methods=['GET', 'POST'])
def handle_peritajes():
    inventario = cargar_datos()
    if request.method == 'POST':
        data = request.get_json() or {}
        if not data or 'placa' not in data:
            return jsonify({"error": "Falta el campo 'placa'"}), 400
        nuevo_peritaje = {
            "placa": data['placa'],
            "marca": data.get('marca', 'Genérica'),
            "modelo": data.get('modelo', '2026'),
            "estado": "Registrado para peritaje",
            "falla": data.get('falla', 'Revisión general')
        }
        inventario.append(nuevo_peritaje)
        guardar_datos(inventario)
        return jsonify({"mensaje": "Moto registrada con éxito", "moto": nuevo_peritaje}), 201
    return jsonify({"total_peritajes": len(inventario), "peritajes": inventario}), 200

@app.route('/api/peritajes/<string:placa>', methods=['DELETE'])
def delete_peritaje(placa):
    inventario = cargar_datos()
    moto_encontrada = None
    
    for moto in inventario:
        if moto['placa'].upper() == placa.upper():
            moto_encontrada = moto
            break
            
    if moto_encontrada:
        inventario.remove(moto_encontrada)
        guardar_datos(inventario)
        return jsonify({
            "message": f"Vehículo {placa} entregado al cliente con éxito",
            "moto_removida": moto_encontrada
        }), 200
        
    return jsonify({"error": f"No se encontró el vehículo con placa {placa}"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
EOF