	# Nginx Monitoring

	Projeto de monitoramento do servidor Nginx
	desenvolvido em bash no Ubuntu Server.


	## Objetivo

	Monitorar o Funcionamento do Nginx
	coletar metricas e identificar trafego elevado.


	## Tecnologias ultilizadas

	- Linux Ubuntu Server
	- Bash
	- Nginx
	- AWK
	- Curl
	- Cron
	- Git

	## Funcionalidades

	- Monitoramento de conexoes ativas
	- Contagem total de requisicoes
	- Calculo de requisicoes por segundo (RPS)
	- Alerta de trafego acima de 10 RPS
	- Execucao automatica a cada minuto
	- Registro das metricas em arquivo de log

	## Como Executar

	Configure o nginx_status no Nginx

	Execute o script:


	```bash
	bash monitoramento.sh
	```

	## Agendamento automatico

	O monitoramento utiliza o cron para
	executar o script a cada minuto

	## Sobre o projeto

	Projeto desenvolvido para praticar
	administracao Linux, automacao e 
	monitoramento de infraestrutura, com foco em Devops.
