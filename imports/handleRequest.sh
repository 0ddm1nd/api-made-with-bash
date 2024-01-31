function handleRequest() {
  while read line; do
  	#echo $line
    trline=`echo $line | tr -d '[\r\n]'`

    [ -z "$trline" ] && break
    HEADLINE_REGEX="HTTP?";
    [[ "$trline" =~ $HEADLINE_REGEX ]] && REQUEST=$trline
  done
  case "$REQUEST" in
    "GET /date"*) handleDate GET;echo /date;;
    "GET / HTTP/1.1") handleHome GET; echo \/;;
    *) RESPONSE=$(cat 404.html);echo /404;;
  esac
  echo -e "$RESPONSE" >> response;
}
