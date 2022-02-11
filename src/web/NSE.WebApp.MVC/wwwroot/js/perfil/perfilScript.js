
function AtivaEdicaoPerfil() {

    if ($('#butaoEditar').hasClass('active-button')) {
        $('#butaoEditar').removeClass('active-button');
        $("#salvarAlteracaoPerfil").prop('disabled', true);
        $("#Nome").prop('disabled', true);
    }
    else {
        $('#butaoEditar').addClass('active-button');
        $("#salvarAlteracaoPerfil").removeAttr('disabled')
        $("#Nome").removeAttr('disabled')
    }
}

function AtivarNovoEndereco() {
    if ($("#FormNovoEndereco").is(":hidden")) {
        $("#FormNovoEndereco").prop('hidden', false);
    } else {
        $("#FormNovoEndereco").prop('hidden', true);
    }
}


function BuscarCepPerfil() {
    $(document).ready(function () {

        function limpa_formulário_cep() {
            // Limpa valores do formulário de cep.
            $("#Logradouro").val("");
            $("#Bairro").val("");
            $("#Cidade").val("");
            $("#Estado").val("");
            $("#Complemento").val("");
            $("#Numero").val("");
        }


        //Quando o campo cep perde o foco.
        $("#Cep").blur(function () {

            //Nova variável "cep" somente com dígitos.
            var cep = $(this).val().replace(/\D/g, '');

            //Verifica se campo cep possui valor informado.
            if (cep != "") {

                //Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;

                //Valida o formato do CEP.
                if (validacep.test(cep)) {

                    //Preenche os campos com "..." enquanto consulta webservice.
                    $("#Logradouro").val("...");
                    $("#Bairro").val("...");
                    $("#Cidade").val("...");
                    $("#Estado").val("...");

                    //Consulta o webservice viacep.com.br/
                    $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
                        function (dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#Logradouro").val(dados.logradouro);
                                $("#Bairro").val(dados.bairro);
                                $("#Cidade").val(dados.localidade);
                                $("#Estado").val(dados.uf);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                } //end if.
                else {
                    //cep é inválido.
                    limpa_formulário_cep();
                    alert("Formato de CEP inválido.");
                }
            } //end if.
            else {
                //cep sem valor, limpa formulário.
                limpa_formulário_cep();
            }
        });
    });
}