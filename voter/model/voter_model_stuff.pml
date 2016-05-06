#define MAJORITY_SENSITIVITY 1
#define N_WEBSERVERS 3
#define DOMINIO 5 

int res_possiveis[N_WEBSERVERS];

typedef two_dim_int_mat{
	int a[2]
}

proctype webServer(int wsinstance){

	int wsresult = -1;
    atomic {
	if
	::true -> 
		select(wsresult : 0 .. DOMINIO); 
		res_possiveis[wsinstance] = wsresult
	::true -> 
		res_possiveis[wsinstance] = -1//erro ou eventualmente timeout
	fi;
	}
}

active proctype Voter (){
	int ret = -1; //valor de retorno para o cliente
	short ret_occur = 0;//numero de ocorrencias do valor de retorno para o cliente
	bool valid = 0;//variavel que diz se o valor de retorno obteve maioria ou se empatou com alguem

	int best_value = -1;//melhor valor actual
	short best_occur = 0;//numero de ocorrencias do melhor valor actual
	
	short nresults = 0;//numero de resultados retornados pelos webservices que nao foram erro ou timeout
	two_dim_int_mat real_results[N_WEBSERVERS];/*no voter devera ser uma lista ligada ou algo do genero - 
													[0] e o valor retornado, 
													[1] e o numero de vezes que foi retornado*/
	bool exists = 0;//variavel de controlo para saber se determinado valor ja foi adicionado ou nao a lista

	byte i;
	byte j;
	

	//inicializar array de possiveis resultados
	i=0;
	do
	::i<N_WEBSERVERS->
		res_possiveis[i] = -1;
		//iniciar tambem os real_results
		real_results[i].a[0] = -1;
		real_results[i].a[1] = 0;
		i++
	::i>=N_WEBSERVERS->break
	od;

	//pedir os resultados aos web services
	i=0;
	do
	::i<N_WEBSERVERS->
		run webServer(i);
		i++
	::i>=N_WEBSERVERS->break
	od;

	//esperar tempo do timeout pelas respostas
	(timeout);

	//calcular maioria
	i=0;
	do
	::i<N_WEBSERVERS->
		printf("%d\n",res_possiveis[i]);
		i++
	::else->break
	od;
}