from sanic import Sanic
from sanic.response import json

def main()->None:
    app = Sanic("My Hello, world app")

    @app.route('/')
    async def test(request):
        return json({'hello': 'world'})

    @app.route('/hello', methods=("GET", "POST"))
    async def hello(request):
        name = request.args.get("name")
        if request.method == "POST":
            name = request.form.get("name")

        return json({'hello': name})

    app.run()

if __name__ == '__main__':
    main()