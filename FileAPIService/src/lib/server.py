
from flask import Flask, render_template, request, flash
from werkzeug import secure_filename
import json
import os
import sqlite3

app = Flask(__name__)

app.config["FILE_UPLOADS"] = "/home/lab/PycharmProjects/PlayGround/uploads/"
sqlite_file = '/home/lab/playground.db'


@app.route('/upload')
def upload():
    return render_template('upload.html')

@app.route('/uploader',methods=['GET','POST'])
def upload_File():
    if request.method == 'POST':
        f = request.files['file']
        #f.save(secure_filename(f.filename))
        f.save(os.path.join(app.config["FILE_UPLOADS"],f.filename))
        return f.filename +' :- file uploaded successfully'
@app.route("/<name>")
def getUser(name):
    return name.upper();

def hello():

    return "Hello World!"

if __name__ == "__main__":

    app.run()