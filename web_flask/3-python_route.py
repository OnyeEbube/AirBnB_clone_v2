#!/usr/bin/python3
"""
Write a script that starts a Flask web application
"""
from flask import Flask

app = Flask("__name__")


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """
    Displays "Hello HBNB" with root '/'
    """
    return ("Hello HBNB!")


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    """
    Displays "HBNB" with root '/hbnb'
    """
    return ("HBNB")


@app.route("/c/<text>", strict_slashes=False)
def cTxt(text):
    """
    display “C ” followed by the value of the text variable
    (replace underscore _ symbols with a space
    """
    return ("C {}".format(text.replace("_", " ")))


@app.route('/python', strict_slashes=False)
@app.route("/python/<text>", strict_slashes=False)
def pythonTxt(text="is cool"):
    """
    display “Python ”, followed by the value of the
    text variable (replace underscore _ symbols with a space )
    """
    return ("Python {}".format(text.replace("_", " ")))


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=None)
