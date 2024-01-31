basicHTMLGet=$(cat getHTML.response)
basicJsonGet=$(cat getJson.response)
echo "Listening in port: 3000"
while true; do
  cat response | nc -lN 3000 | handleRequest
done
