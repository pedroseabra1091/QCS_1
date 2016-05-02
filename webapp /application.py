from flask import Flask
from routes.routes import app_pages

app = Flask(__name__,template_folder='template')

app.register_blueprint(app_pages)

app.run(debug = True)

