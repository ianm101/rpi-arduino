from flask import Flask, request
import subprocess

app = Flask(__name__)

script_fp = 'hook_script.sh'

@app.route('/payload', methods=['POST'])
def payload():
    data = request.get_json()
    if data['ref'] == 'refs/heads/main':
        subprocess.run([script_fp])  # Add your script here
    return '', 204

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

