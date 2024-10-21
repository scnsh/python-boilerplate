import requests

URL = "https://soccer.yahoo.co.jp/wcup/"

def main():
    r = requests.get(URL)
    print(f"get text from {URL}: {r.text}")


if __name__ == "__main__":
    main()
