from flask import Flask

from routes.routes import app_pages
from api.standardSensitivity import standardSensitivity
from api.backgroundDose import backgroundDose
from api.personalSensitivity import personalSensitivity


app = Flask(__name__,template_folder='template')

app.register_blueprint(app_pages)
app.register_blueprint(standardSensitivity)
app.register_blueprint(backgroundDose)
app.register_blueprint(personalSensitivity)

app.run(debug = True)

