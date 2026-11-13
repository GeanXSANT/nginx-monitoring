
#!/bin/bash


	URL="http://localhost/nginx_status"

	status=$(curl -fsS "$URL") || {
		echo "Erro ao consultar o Nginx"
		exit 1
	}



	conexoes=$(printf '%s\n' "$status" | awk 'NR==1 {print $3}')
	requisicoes=$(printf '%s/n' "$status"  | awk 'NR==3 {print $3}')
	# Calculo de requisicoes por segundo
	ARQUIVO="/home/gean/nginx_anterio.txt"
	agora=$(date +%s)
	rps=0

	if [ -f "$ARQUIVO" ]; then
		read -r anterior tempo < "$ARQUIVO"
		diferenca=$((requisicoes - anterior))
		intervalo=$((agora - tempo))
	if [ "$intervalo" -gt 0 ] && [ "$diferenca" -ge 0 ]; then
		rps=$(awk "BEGIN {printf \"%.2f\", $diferenca / $intervalo}")
	fi
fi
	echo "$requisicoes $agora" >  "$ARQUIVO"

	# Exibir resultados
	echo "Data: $(date)"
	echo "Conexoes ativa: $conexoes"
	echo "Total de requisicoes: $requisicoes"
	echo "Requisicoes por segundo: $rps"


	if awk  "BEGIN {exit !($rps > 10)}"; then
	echo "Alerta: Trafego elevado no Nginx~"
	else
	echo "Status: Trafego Normal"
	fi


	echo "-------------------------"
