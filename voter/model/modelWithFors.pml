#define MAJORITY_SENSITIVITY 1
#define N_WEBSERVERS 3
#define DOMINIO 5 

int res_possiveis[N_WEBSERVERS];

typedef two_dim_int_mat{
	int a[2]
}



proctype webServer(int wsinstance){

	int wsresult = -1;

	if
	::true -> 
		select(wsresult : 0 .. DOMINIO); 
		res_possiveis[wsinstance] = wsresult
	::true -> 
		res_possiveis[wsinstance] = -1//erro ou eventualmente timeout
	fi
}

active proctype Voter (){
	int ret = -1; //valor de retorno para o cliente
	int ret_occur = 0;//numero de ocorrencias do valor de retorno para o cliente
	bool valid = 0;//variavel que diz se o valor de retorno obteve maioria ou se empatou com alguem

	int best_value = -1;//melhor valor actual
	int best_occur = 0;//numero de ocorrencias do melhor valor actual
	
	int nresults = 0;//numero de resultados retornados pelos webservices que nao foram erro ou timeout
	two_dim_int_mat real_results[N_WEBSERVERS];/*no voter devera ser uma lista ligada ou algo do genero - 
													[0] e o valor retornado, 
													[1] e o numero de vezes que foi retornado*/
	bool exists = 0;//variavel de controlo para saber se determinado valor ja foi adicionado ou nao a lista

	byte i;
	byte j;
	


	//inicializar array de possiveis resultados
	for(i : 0 .. N_WEBSERVERS){
		res_possiveis[i] = -1;
		//iniciar tambem os real_results
		real_results[i].a[0] = -1;
		real_results[i].a[1] = 0
	}



	//pedir os resultados aos web services
	for(i: 0 .. N_WEBSERVERS){
		run webServer(i)
	}


	//esperar tempo do timeout pelas respostas
	do
	::timeout -> break
	od;


	//calcular maioria
	for(i : 0 .. N_WEBSERVERS){
		//descobrir quantos resultados temos efectivamente
		if
		::res_possiveis[i]>=0 -> 
			/*Adiciona uma ocorrencia a todos os valores ja adicionados tais que 
				res_possiveis[i]-MAJORITY_SENSITIVITY <= val <= res_possiveis[i]+MAJORITY_SENSITIVITY
			  Se o valor ainda nao existir, adiciona-o a lista
			*/
			exists = 0;

			j=0;
			do
			::j<nresults ->
				if
				::(res_possiveis[i] - MAJORITY_SENSITIVITY <= real_results[j].a[0] && res_possiveis[i] + MAJORITY_SENSITIVITY >= real_results[j].a[0]) -> 
					real_results[j].a[1]++
				fi;
				if
				::res_possiveis[i] == real_results[j].a[0] -> exists = 1
				fi;
				j++
			::j>=nresults -> break
			od;
			j=0;

			printf("problema antes do for 1");

			/*
			for(j : 0 .. nresults){
				if
				::((res_possiveis[i]-MAJORITY_SENSITIVITY <= real_results[j].a[0]) && (res_possiveis[i]+MAJORITY_SENSITIVITY >= real_results[j].a[0])) -> 
					real_results[j][1]++
				fi;
				if
				::res_possiveis[i] == real_results[j].a[0] -> exists = 1
				fi
			}*/

			printf("problema depois do for 1");

			if
			::exists==0 -> 
				real_results[nresults].a[0] = res_possiveis[i];
				real_results[nresults].a[1] = 1;
				nresults++
			fi
		fi
	}

	//descobrir qual o resultado com maior votacao(se existir)
	/*for(i : 0 .. nresults){
		if
		::real_results[i].a[1] > best_occur ->
			best_occur = real_results[i].a[1];
			best_value = real_results[i].a[0];
			valid = 1
		::real_results[i].a[1] == best_occur ->
			valid = 0
		fi
	}*/


	i=0;
	do
	::i<nresults->
		if
		::real_results[i].a[1] > best_occur ->
			best_occur = real_results[i].a[1];
			best_value = real_results[i].a[0];
			valid = 1
		::real_results[i].a[1] == best_occur ->
			valid = 0
		fi;
		i++
	::i>=nresults -> break
	od;

	//deve ou nao enviar o resultado
	if
	::valid==1 -> printf("O resultado e %d e obteve &d votos", best_value, best_occur)
	::else -> printf("Nao foi possivel obter um resultado por maioria")
	fi

}