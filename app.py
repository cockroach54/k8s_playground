from flask import Flask
from uuid import getnode as get_mac
app = Flask(__name__)

@app.route('/')
def hello_world():
    mac = get_mac()
    return 'Hello, flask: %s'%mac

@app.route('/hash')
def hash():
    return 'hash'

@app.route('/good')
def good():
    return 'good'

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=9999)