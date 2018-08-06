import hashlib
from flask import Flask, Response, request
import requests

app = Flask(__name__)
SALT = "salt"


@app.route("/", methods=["GET", "POST"])
def main_page():
    name = "Joe Bloggs"
    if request.method == "POST":
        name = request.form["name"]

    hashed_name = hashlib.sha256((SALT + name).encode()).hexdigest()

    header = '<html><head><title>Identidock</title></head><body>'
    body = '''
      <form method="POST">
      Hello <input type="text" name="name" value="{}">
      <input type="submit" value="submit">
      </form>
      <p>You look like a:
      <img src="/monster/{}"/>
      '''.format(name, hashed_name)
    footer = '</body></html>'
    return header + body + footer


@app.route("/monster/<name>")
def get_identicon(name):
    r = requests.get('http://dnmonster:8080/monster/' + name + '?size=80')
    return Response(r.content, mimetype="image/png")


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
