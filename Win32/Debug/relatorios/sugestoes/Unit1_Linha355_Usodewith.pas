// Sugest�o de corre��o para o smell: Uso de with
// Arquivo original: c:\fontes\carregar vumeter em panel\Unit1.pas
// Linha: 355

// Trecho original:
// ------------------
with ListView1.Columns.Add do

// Sugest�o:
// Evite "with". Refatore para acessar membros diretamente.
// Exemplo:
// MinhaClasse.Campo := 10;
