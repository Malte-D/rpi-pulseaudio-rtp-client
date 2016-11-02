from flask import Flask
import os
app = Flask(__name__)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=False)

@app.route('/enable/<en>')
def show_post(en):
    if (en=='on'):
        os.system('pactl set-sink-mute 0 false')
    else:
        os.system('pactl set-sink-mute 0 true')
    return 'OK'
