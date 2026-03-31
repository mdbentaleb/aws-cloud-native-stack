from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify(status="UP", environment="Production"), 200

@app.route('/')
def index():
    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cloud-Native App</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                background-color: #0d1b2a;
                color: #e0e1dd;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center;
            }
            .card {
                background-color: #1b263b;
                padding: 3rem;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                border: 1px solid #415a77;
                max-width: 500px;
                width: 90%;
            }
            h1 {
                font-size: 2rem;
                margin-bottom: 1rem;
                color: #ffffff;
            }
            p {
                font-size: 1.1rem;
                color: #a3b18a;
                margin-bottom: 2rem;
            }
            .badge {
                display: inline-block;
                background-color: #00b4d8;
                color: #03045e;
                padding: 0.5rem 1rem;
                border-radius: 50px;
                font-weight: bold;
                font-size: 0.9rem;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>🚀 AWS Cloud-Native App</h1>
            <p>✔ Application is running successfully behind Nginx Reverse Proxy.</p>
            <span class="badge">Production Environment</span>
        </div>
    </body>
    </html>
    """
    return html_content

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5004)