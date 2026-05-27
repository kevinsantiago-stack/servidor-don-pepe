cat << 'EOF' > app.py
from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)
SERVER_NAME = "Servidor-Cuadros-Backend"

inventario_motos = [
    {"placa": "XYZ-123", "marca": "Yamaha", "modelo": "FZ25", "estado": "En revisión"},
    {"placa": "ABC-987", "marca": "Suzuki", "modelo": "Gixxer 250", "estado": "Espera de repuestos"}
]

@app.route('/api/registros', methods=['GET'])
def get_registros():
    return jsonify({
        "servidor": SERVER_NAME,
        "hora_servidor": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "inventario": inventario_motos
    }), 200

@app.route('/api/peritajes', methods=['GET', 'POST'])
def handle_peritajes():
    if request.method == 'POST':
        data = request.get_json()
        if not data or 'placa' not in data:
            return jsonify({"error": "Falta el campo 'placa'"}), 400
        nuevo_peritaje = {
            "placa": data['placa'],
            "marca": data.get('marca', 'Genérica'),
            "modelo": data.get('modelo', '2026'),
            "estado": "Registrado para peritaje",
            "fecha_ingreso": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }
        inventario_motos.append(nuevo_peritaje)
        return jsonify({"mensaje": "Moto registrada con éxito para peritaje", "moto": nuevo_peritaje}), 201
    return jsonify({
        "total_peritajes": len(inventario_motos),
        "peritajes": inventario_motos
    }), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
EOF

nano app.py
pip isntall gunicon 
pip isntall gunicorn
pip install python3
python3-pip
sudo pip python3
sudo pip install python3
install -y 
install -y python3
clear
pip install -y 
sudo apt install python3-pip
pip install gunicorn
python3 -m venv
python3 -m venv venv
sudo python3 -m venv venv
sudo apt install python3-venv
sudo python3 -m venv venv
source venv/bin/activate
pip install flask
pip install gunicorn
sudo nano /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reload
sudo systemctl restart gunicorn
sudo systemctl enable gunicorn
curl http://localhost:5000/api/registros
sed -i '/EOF/d' app.py
gunicorn --workers 3 --bind 0.0.0.0:5000 app:app
ls
ls
cd api_flask
./deploy.sh
sudo systemctl status flaskapi.service
python3 app.py
clear
python3 app.py
clear
python3 app.py
git checkout feature-inventario
git add app.py
git commit -m "Fix: corregido bloque __main__ y ajustes en app.py"
git push origin feature-inventario
python3 app.py
python3 app.py
cd servidor
sudo systemctl restart flaskapi.service
sudo systemctl status flaskapi.service
sudo systemctl status flaskapi.service
clear
sudo systemctl status flaskapi.service
/home/larrota/venv/bin/python /home/larrota/app.py
/home/larrota/venv/bin/pip list
/home/larrota/venv/bin/python /home/larrota/app.py
cat /home/larrota/app.py
nano deploynano /home/larrota/app.py
/home/larrota/venv/bin/python /home/larrota/app.py
clear
/home/larrota/venv/bin/python /home/larrota/app.py
nano /home/larrota/app.py
/home/larrota/venv/bin/python /home/larrota/app.py
sudo systemctl daemon-reload
sudo systemctl restart flaskapi.service
sudo systemctl status flaskapi.service
/home/larrota/venv/bin/gunicorn --version
sudo nano /etc/systemd/system/flaskapi.service
sudo systemctl daemon-reload
sudo systemctl restart flaskapi.service
sudo systemctl status flaskapi.service
sudo systemctl status flaskapi.service
clear
sudo systemctl status flaskapi.service
don pepe
don-pepe
clear
cd servidor-don-pepe
cd don-pepe
cd servidor-don-pepe
ls
nano deploy,sh
sudo systemctl status flaskapi.service
clear
push origin inventario
push origin fearure-inventario
git push origin inventario
clear
git push origin seature-inventario
clear
git push origin feature-inventario
log --oneline --graph --all
git log --oneline --graph --all
git log --oneline --graph --all
./deploy.sh
clear
git log --oneline --graph --all
git checkout feature-inventario
git add .
git commit -m "Cambios en feature inventario"
git checkout master
echo "prueba master" >> prueba.txt
git add .
git commit -m "Cambio en master"
git merge feature-inventario
git merge feature-inventario
git log --oneline --graph --all
clear
/.deploy.sh
./deploy.sh
sudo systemctl status flaskapi.service
./deploy.sh
nano deploy.sh
clear
git push origin feature-inventario
git rm --cached .git-credentials
echo ".git-credentials" >> .gitignore
git add .
git commit -m "Removido archivo sensible"
git push origin feature-inventario
clear
git push origin feature-inventario
git reset HEAD~1
git rm --cached .git-credentials
echo ".git-credentials" >> .gitignore
git add .
git commit -m "Merge limpio sin credenciales"
git commit -m "Merge limpio sin credenciales"
clear
git commit -m "Merge limpio sin credenciales"
git push origin feature-inventario
rm .git-credentials
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch .git-credentials" --prune-empty --tag-name-filter cat -- --all
rm -rf .git/refs/original/
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now --aggressive
echo ".git-credentials" >> .gitignore
git add .
git commit -m "Removidas credenciales"
git push origin feature-inventario --force
git push origin feature-inventario --force
git log --oneline --graph --all
git push origin feature-inventario
clear
git push origin feature-inventario
git log --oneline --graph --all
clear
cd don-pepe
cd servidor-don.pepe
cd servidor-don-pepe
clear
nano deploy.sh
cleat
clear
./deploy.sh
git config --global pull.rebase false
clear
./deploy.sh
sudo systemctl status flaskapi.service
pwd
ls
nano deploy.sh
./deploy.sh
git status
clear
git status
nano .gitignore
git add .gitignore
git commit -m "Conflicto resuelto"
./deploy.sh
clear
./deploy.sh
nano requeriments.txt
nano deploy.sh
./deploy.sh
nano requeriments.txt
clear
nano requeriments.txt
clear
./deploy.sh
nano requeriments.txt
./deploy.sh
clear
./deploy.sh
sudo systemctl status flaskapi.service
cd home/larrota
cd ~
clear
git push origin feature-inventario
clear
git add .
git commit -m "Actualizado mensaje de confirmacion"
git push origin feature-inventario
clear
git push origin feature-inventario
git log --oneline --graph --all
