# Import Other Bash Files
echo "#!/bin/bash" >> exec;
for i in $(ls imports/endpoints);do
[[ ! -d imports/endpoints/$i ]] && echo "$(cat ./imports/endpoints/$i)" >> exec
done
for i in $(ls imports);do
[[ ! -d imports/$i ]] && echo "$(cat ./imports/$i)" >> exec
done
shc -f exec -r -o server;
rm exec* && ./server;
