// Sugestão de correção para o smell: Uso de with
// Arquivo original: c:\fontes\Projeto Rodas\WheelPro\Gerar Contra Senha\UnitGerarContrasenha.pas
// Linha: 159

// Trecho original:
// ------------------
with FDQuery1 do;

// Sugestão:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
