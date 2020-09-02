/*
  Fun��o 
	validarConteudo

  Par�metros
  	evento: Obrigat�rio, do tipo event. Recebe o valor de uma vari�vel do navegador que guarda o evento do teclado.
	tipo: Obrigat�rio, do tipo String. Recebe o nome do tipo de valida��o que deve ser feita. Valores poss�veis: numero, texto ou textoNumerico.

  Funcionalidade
	N�o permite a entrada de caracteres inv�lidos.

  Exemplo de utiliza��o
 	<input type="text" name="tfValor" size="11" maxlength="11" onKeyPress="return(validarConteudo(event, 'numero'))">

  Observa��o
	O retorno false n�o permite a entrada do caractere no respectivo textField.	
*/
function validarConteudo(evento, tipo, campo)
{
	var entrada;
	var navegador = navigator.appName;

	if (navegador.indexOf("Netscape") != -1)
	{
		entrada = String.fromCharCode(evento.which);
	}
	else
	{
		entrada = String.fromCharCode(evento.keyCode);
	}
	
	if (navegador.indexOf("Netscape") && evento.which == 8)
		return true;


	if(tipo == "numero")
	{
		return (validarNumero(entrada));
	}
	else
	{
		if( tipo == "float" ) 
		{
			if( entrada == "," && campo != null )
			{
				var indexVirgula =  campo.value.indexOf(",");
				if( indexVirgula != -1 ) {
					return false;
				}
			}	
			else {
				return (validarFloat(entrada));
			}
		}
		
		if (tipo == "texto")
		{
			return (validarTexto(entrada));
		}
		else 
		{			
			if (tipo == "textoNumerico")
			{
				return (validarTextoNumerico(entrada));
			}
		}
	}
}

/*
  Fun��o 
	validarNumero

  Par�metros
  	conteudo: Obrigat�rio, do tipo String. Recebe o caracter correspondente ao evento do teclado.

  Funcionalidade
	N�o permite a entrada de caracteres que n�o sejam num�ricos.

  Exemplo de utiliza��o
	validarNumero(entrada)
*/
function validarNumero(conteudo)
{
	var validos = "0123456789";
	var valor = new String(conteudo);

	for (var i = 0; i < valor.length; i++)
	{
		if (validos.indexOf(valor.charAt(i)) == -1)
			return false;
	}

	return true;
}

/*
  Fun��o 
	validarTexto

  Par�metros
  	conteudo: Obrigat�rio, do tipo String. Recebe o caracter correspondente ao evento do teclado.

  Funcionalidade
	N�o permite a entrada de caracteres que n�o sejam alfab�ticos.

  Exemplo de utiliza��o
	validarTexto(entrada)

  Observacao
	Exceto os caracteres (),./ os demais como ! @ # $ s�o tratados como caracteres especiais.
*/
function validarTexto(conteudo)
{
	return validarTextoNumero(conteudo, false);
}

/*
  Fun��o 
	validarTextoNumerico

  Par�metros
  	conteudo: Obrigat�rio, do tipo String. Recebe o caracter correspondente ao evento do teclado.

  Funcionalidade
	N�o permite a entrada de caracteres que n�o sejam alfab�ticos ou num�ricos.

  Exemplo de utiliza��o
	validarTexto(entrada)

  Observacao
	Exceto os caracteres (),./ os demais como ! @ # $ s�o tratados como caracteres especiais.
*/
function validarTextoNumerico(conteudo)
{
	return validarTextoNumero(conteudo, true);
}

/*
 Fun��o 
	validarTextoNumero

  Par�metros
  	conteudo: Obrigat�rio, do tipo String. Recebe o caracter correspondente ao evento do teclado.
	textoNumerico: Obrigat�rio, do tipo boolean (true ou false). Indica se o tipo de valida��o � s� para texto(false) ou texto num�rico(true).

  Funcionalidade
	Valida caracteres para o tipo de valida��o escolhida: false = Texto ou true = texto num�rico.

  Exemplo de utiliza��o
	validarTextoNumero(conteudo, false)
*/
function validarTextoNumero(conteudo, textoNumerico)
{
	var valor = String(conteudo);
	var acentosMinusculos = new String("������������");
	var acentosMaiusculos = new String("������������");
	var outrosCaracteres = new String("/().,");
	var numerico = new RegExp("[0-9]");
	var texto = new RegExp("[A-Za-z]");

	for (var i = 0; i < valor.length; i++)
	{
		var letra = new String(valor.charAt(i));

		if (letra != " " && !texto.test(letra)) 
		{
			if ((acentosMinusculos.indexOf(letra) == -1) && (acentosMaiusculos.indexOf(letra) == -1) && (outrosCaracteres.indexOf(letra) == -1))
			{
				if (textoNumerico) // Se tipo � texto num�rico, ainda pode ser n�mero.
				{
					if (!numerico.test(letra)) 
						return false;
				}
				else 
					return false;                                
			}
		}
	}

	return true;
}




/*
  Fun��o 
	validarFloat

  Par�metros
  	conteudo: Obrigat�rio, do tipo String. Recebe o caracter correspondente ao evento do teclado.

  Funcionalidade
	N�o permite a entrada de caracteres que n�o sejam num�ricos e permite a digita��o do caracter '.' (ponto)

  Exemplo de utiliza��o
	validarFloat(entrada)
*/
function validarFloat(conteudo)
{
	var validos = "0123456789,";
	var valor = new String(conteudo);

	for (var i = 0; i < valor.length; i++)
	{
		if (validos.indexOf(valor.charAt(i)) == -1)
			return false;
	}

	return true;
}

/*
  Fun��o 
	formatarData

  Par�metros
  	componente: Obrigat�rio, do tipo textField (campo para entrada de caracteres). Recebe o componente textField que deve ter o seu conte�do validado.

  Funcionalidade
	Valida o conte�do do componente conforme formata��o de data adotada.

  Exemplo de utiliza��o
	<input type="text" name="tfDataVencimento" size="10" maxlength="10" onKeyUp=formatarData(this)>

  Observa��o
	Esta fun��o � chamada sempre que o evento keyup � disparado.	
*/
function formatarData(componente)
{
	if (componente.value.length == 2) 
	{
		if (!testarDia(componente.value)) 
		{
			componente.value = "";
			componente.focus();
		} 
		else 
		{
			componente.value += '/';
		}
	}

	if (componente.value.length == 5) 
	{
		if (!testarMes(componente.value.substring(3,5), componente.value.substring(0,2))) 
		{ 
			componente.value = componente.value.substring(0,3);
			componente.focus();
		} 
		else 
		{
			componente.value += '/';
		}
	}

	if (componente.value.length == 10) 
	{
		if (!testarAno(componente.value.substring(6,10), componente.value.substring(3,5), componente.value.substring(0,2))) 
		{
			componente.value = componente.value.substring(0,5);
			componente.focus();
		}
	}
}

/**
 *  Formata mes/ano considerando dia 01
 */
function formatarMesAno(componente)
{
	if (componente.value.length == 2) 
	{
		if (!testarMes(componente.value,"01")) 
		{ 
			componente.value = "";
			componente.focus();
		} 
		else 
		{
			componente.value += '/';
		}
	}

	if (componente.value.length == 7) 
	{
		if ( !testarAno(componente.value.substring(3,7), componente.value.substring(0,2),"01") ) 
		{
			componente.value = componente.value.substring(0,3);
			componente.focus();
		}
	}
}



/**
 *  Formata o horario como hh:mm
 */
function formatarHorario(componente, componenteFoco)
{
	if (componente.value.length == 2) 
	{
		componente.value += ':';
	}
	else if (componente.value.length == 5) {
		if( componenteFoco != null ) {
			componenteFoco.focus();
		}
	}	
}


/*
  Fun��o 
	testarDia

  Par�metros
  	dia: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.

  Funcionalidade
	Verifica se o conte�do passado como par�metro est� no formato dia.

  Exemplo de utiliza��o
	testarDia(componente.value)

  Observa��o
	Um dia tem que estar entre 1 e 31.
*/
function testarDia(dia) 
{
	if (dia <= 0 || dia >= 32) 
	{
		alert("Dia n�o pode ter valor inferior a 01 e superir a 31 !");
		return false;
	}

	return true;
}


/*
  Fun��o 
	testarMes

  Par�metros
  	mes: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.
	dia: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.

  Funcionalidade
	Verifica se o conte�do passado como par�metro est� no formato m�s e se o dia informado � v�lido para o respectivo m�s.

  Exemplo de utiliza��o
	testarMes(componente.value.substring(3,5), componente.value.substring(0,2)) 

  Observa��o
	Um m�s tem que estar entre 1 e 12.
*/
function testarMes(mes, dia) 
{
	if (mes < 1 || mes > 12) 
	{
		alert("M�s inv�lido.");
		return false;
	}

	if ((mes == 4 || mes == 6 || mes == 9 || mes == 11 ) && dia > 30) 
	{
		alert("Dia inv�lido para este m�s !");
		return false;
	}

	if ((mes == 2) && dia > 29) 
	{
		alert("Dia inv�lido para este m�s !");
		return false;
	}

	return true;
}

/*
  Fun��o 
	testarAno

  Par�metros
	ano: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.
	mes: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.
  	dia: Obrigat�rio, do tipo value (conte�do de um TextField). Recebe o conte�do que deve ser validado.

  Funcionalidade
	Verifica se o conte�do passado como par�metro est� no formato data. Verifica tamb�m se toda a data � v�lida.

  Exemplo de utiliza��o
	testarAno(componente.value.substring(6,10), componente.value.substring(3,5), componente.value.substring(0,2))

  Observa��o
	 O m�s e o dia ('mes' e 'dia') devem estar de acordo com o ano ('ano') passado como par�metro. Este teste � nescess�rio devido aos anos bissextos.
*/
function testarAno(ano, mes, dia) 
{
	if (mes == 2) 
	{
		if (dia ==29) 
		{
			if ((ano % 100) == 0)
			{
				if ((ano % 400) != 0) 
				{ 
					alert("O m�s de fevereiro n�o possui dia 29 para este ano !");
					return false;
				}
			}
			else
			{
				if ((ano % 4) != 0) 
				{ 
					alert("O m�s de fevereiro n�o possui dia 29 para este ano !");
					return false;
				}
			}
		}
	}
	
	return true;
}


/*
* Mascara para o n�mero de  CPF.
*
*/
function mascara_cpf(form,fieldName,evento)
{
	if( evento != null ) 
	{
		var code;
		var navegador = navigator.appName;
	
		if (navegador.indexOf("Netscape") != -1) {
			code = evento.which;
		}
		else {
			code = evento.keyCode;
		}	
		if( code == 8 )//backspace
			return true; 
	}
	
    var mycpf = '';
    mycpf = mycpf + form.value;
	
    if (mycpf.length == 3) {
        mycpf = mycpf + '.';
        fieldName.value = mycpf;
    }
    if (mycpf.length == 7) {
        mycpf = mycpf + '.';
        fieldName.value = mycpf;
    }
    if (mycpf.length == 11) {
        mycpf = mycpf + '-';
        fieldName.value = mycpf;
    }
    //if (mycpf.length == 14) {
    //}
}

/*
* Mascara para o n�mero de  CNPJ.
*
*/
function mascaraCNPJ(Campo, teclapres){

	var tecla = teclapres.keyCode;

	var vr = new String(Campo.value);
	vr = vr.replace(".", "");
	vr = vr.replace(".", "");
	vr = vr.replace("/", "");
	vr = vr.replace("-", "");

	tam = vr.length + 1 ;

	
	if (tecla != 9 && tecla != 8){
		if (tam > 2 && tam < 6)
			Campo.value = vr.substr(0, 2) + '.' + vr.substr(2, tam);
		if (tam >= 6 && tam < 9)
			Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,tam-5);
		if (tam >= 9 && tam < 13)
			Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,3) + '/' + vr.substr(8,tam-8);
		if (tam >= 13 && tam < 15)
			Campo.value = vr.substr(0,2) + '.' + vr.substr(2,3) + '.' + vr.substr(5,3) + '/' + vr.substr(8,4)+ '-' + vr.substr(12,tam-12);
	}
}


/*
* Fun�a� para testar o n�mero do  CNPJ.
* Utiliza as fun��es CalculaDV e LimpaCampo
*/
function TestaNI(cNI,iTipo){

	var NI 
	NI = LimpaCampo(cNI.value,10);
	switch (iTipo) {
		case 1://testa cnpj
			if (NI == 11111111111111 || NI == 22222222222222 ||
				NI == 33333333333333 || NI == 44444444444444 ||
				NI == 55555555555555 || NI == 66666666666666 ||
				NI == 77777777777777 || NI == 88888888888888 ||
				NI == 99999999999999 || NI == 00000000000000 ){
				alert('O n�mero do CNPJ informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}
		
			if (NI.length != 14){			
				alert('O n�mero do CNPJ informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}

			if (NI.substr(12,2) != CalcularDV(NI.substr(0,12), 9)){
				alert('O n�mero do CNPJ informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}
			break;

		case 2://testa cpf
			if (NI == 11111111111 || NI == 22222222222 ||
				NI == 33333333333 || NI == 44444444444 ||
				NI == 55555555555 || NI == 66666666666 ||
				NI == 77777777777 || NI == 88888888888 ||
				NI == 99999999999 || NI == 00000000000 ){
				alert('O n�mero do CPF informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}

			if (NI.length != 11){
				alert('O n�mero do CPF informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}

			if (NI.substr(9,2) != CalcularDV(NI.substr(0,9), 11)){
				alert('O n�mero do CPF informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}
			break;
	
		case 3://testa ITR
			if (NI.length != 8){
				alert('O n�mero do ITR informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}
			var dv = new String(); 
			dv = CalcularDV(NI.substr(0,7), 9);
			dv = dv.substr(0,1);
			if (NI.substr(7,1) != dv){
				alert('O n�mero do ITR informado est� incorreto');
				cNI.value = "";
				cNI.focus();
				return(false);
				}
			break;

		default:
			return(false);
		}
	return (true);	
}  


function LimpaCampo(sValor,iBase)
{
	var tam = sValor.length
	var saida = new String
	for (i=0;i<tam;i++)
		if (!isNaN(parseInt(sValor.substr(i,1),iBase)))
			saida = saida + String(sValor.substr(i,1));
	return (saida);		
}

/**
 * Esta fun��o utiliza a fun��o Calcular_Peso
 */
function CalcularDV(sCampo, iPeso){
	
	var iTamCampo;
	var iPosicao, iDigito;
	var iSoma1 = 0;
	var iSoma2=0;
	var iDV1, iDV2;
		
	iTamCampo = sCampo.length;

	for (iPosicao=1; iPosicao<=iTamCampo; iPosicao++){
		iDigito = sCampo.substr(iPosicao-1, 1);
		iSoma1 = parseInt(iSoma1,10) + parseInt((iDigito * Calcular_Peso(iTamCampo - iPosicao, iPeso)),10);
		iSoma2 = parseInt(iSoma2,10) + parseInt((iDigito * Calcular_Peso(iTamCampo - iPosicao + 1, iPeso)),10);
		}

	iDV1 = 11 - (iSoma1 % 11);
	if (iDV1 > 9)
		iDV1 = 0;

	iSoma2 = iSoma2 + (iDV1 * 2);
	iDV2 = 11 - (iSoma2 % 11);
	if (iDV2 > 9)
		iDV2 = 0;

	Ret = (parseInt(iDV1 * 10,10) + parseInt(iDV2));

	Ret = "0" + Ret;
	Ret = Ret.substr(Ret.length - 2,Ret.length);
		
	return(Ret);
}

function Calcular_Peso(iPosicao, iPeso){

	//Pesos
	//CPF 11
	//CNPJ 9
	return (iPosicao % (iPeso - 1)) + 2;
}
	
/**
 * Abre uma nova janela.
 * Se os n�o forem passados os par�metros width e height a
 * janela ser� aberta com o tamanho de 780 X 580
 * Se o par�metro resizable n�o for passado, a janela ser� redimension�vel.
 */
function showWindow(url,nameWindow,width,height,resizable,menubar,target)
{
	if(width == null ) {
		width = 780;
	}
	if( height == null ) {
		height = 580;			
	}
	if( resizable == null ) {
		resizable = "yes";
	}	
	if( menubar == null ) {
		menubar = "no";
	}
		
	window.open(url,nameWindow,'width=' +width+ ',height=' +height+ ',top=1,left=1,resizable=' +resizable+ ',menubar=' +menubar+ ',scrollbars=yes ,target=_blank');
}

/**
 * Apresenta uma nova janela e submete o formul�rio
 */
function showWindowSubmit(form,nameWindow,acao,width,height,resizable,menubar)
{
	if(width == null ) {
		width = 780;
	}
	if( height == null ) {
		height = 580;			
	}
	if( resizable == null ) {
		resizable = "yes";
	}	
	if( menubar == null ) {
		menubar = "no";
	}
	
	//chama a funcao para abrir uma nova janela
	showWindow('',nameWindow,width,height,resizable,menubar);
	
	//submete o formulario
	form.target = nameWindow;
	form.action = acao;
	form.submit();	
}


function mascara_cep(field)
{
	if( field.value != '' && field.value.length == 8 )
	{
		var parte1 =  field.value.substring(0,5);
		var parte2 =  field.value.substring(5);
        field.value = parte1 + "-" + parte2;
    }
}

function removeMascaraCep(campo)
{
   var index = campo.value.indexOf("-");
   if( index != -1) 
   {
   	   var parte1 = campo.value.substring(0,index);
   	   var parte2 = campo.value.substring(index+1);
   	   campo.value = parte1 + parte2;
   }
}


function comparaDatas(dtinicio,datafim) 
{

			   return true;

}

function maxLength(campo,tamanho) 
{			
	if(campo.value.length  >=tamanho)
	{
		return true;
	}
	return false;
}


/**
 * Formata um valor float para apresentar um determinado n�mero de casas decimais.
 */	
function formatValueFloat(valor,casas)
{
	if( casas == null ) {
		casas = 2; //default
	}
	
	var valor_str = valor.toString();

	if( valor_str == "" )
		return valor_str;

	//procura o separador decimal -> definido como sendo a v�rgula
	var indexSeparator = valor_str.indexOf(',');
	
	if( indexSeparator != -1)
	{
		var valorp1 = valor_str.substring(0,indexSeparator);
		var valorp2 = valor_str.substring(indexSeparator+1);
		
		var casasZero = "";
		if( valorp2.length < casas ) 
		{
			var numeroCasas = casas;
			while( numeroCasas > valorp2.length ) {
				casasZero += "0";
				numeroCasas--;
			}
			valorp2 = valorp2 + casasZero;		
		}
		else
		{
			valorp2 = valorp2.substring(0,casas);
		}
		//--return valorp1 + "." + valorp2;
		return valorp1 + "," + valorp2;
	}
	else 
	{
		var valorp2 = "00";
		while( valorp2.length < casas )	{
			valorp2 += "0";
		} 

		//--return valor + "." + valorp2;
		return valor + "," + valorp2;
	}
}



/**
 * Preenche o campo com o valor formatado.
 * Utiliza a funcao formatValueFloat
 */
function formatValueFloatField(campo,casas)
{
	if( casas == null ) {
		casas = 2;
	}

	campo.value = formatValueFloat(campo.value,casas);
}	

function enter(evento)
{
	var isNetscape = false;
	
	if ( navigator.appName.indexOf("Netscape") != -1 )
	{
		isNetscape = true;
	}

	var CodigoTecla;

	if( isNetscape )
		codigoTecla = evento.which;
	else
		codigoTecla = evento.keyCode;				
		
	if(codigoTecla == 13)//enter
		return true;
	else
		return false;
}

