from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    x = 1 / 0
    return "Flask funcionando correctamente"

@app.route("/api")
def api():
    return {"mensaje": "API activa con Flask y systemd"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
