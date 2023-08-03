from flask import Flask, request
import subprocess
import os


def get_current_user():
    return os.geteuid()


app = Flask(__name__)

script_fp = 'hook_script.sh'

@app.route("/", methods=['GET'])
def index():
	return "<h1>Hello world</h1>"

@app.route('/payload', methods=['POST'])
def payload():
    data = request.get_json()
    if data['ref'] == 'refs/heads/main':
        subprocess.run([f'./{script_fp}'])  # Add your script here
    return '', 204

if __name__ == "__main__":
    current_user = get_current_user()
    print(f"Current User ID: {current_user}")
    app.run(host="0.0.0.0", port=5000)