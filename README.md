📘 CodeSmellDetector
Ferramenta de análise estática e refatoração assistida para projetos Delphi. Detecta métodos longos, gera sugestões de melhoria com IA local e mantém os arquivos originais seguros.

🚀 Funcionalidades principais
Criação automática de cópia temporária do projeto para análise segura
Conversão de arquivos para UTF-8 sem BOM (sem sujeira antes de unit)
Backup automático dos arquivos antes de qualquer modificação
Detecção de métodos longos e estruturas complexas
Geração de sugestões de refatoração com IA local (via HTTP)
Relatórios em HTML, CSV e JSON
Reversão completa de alterações com um único comando
🧾 Comandos aceitos
Comando	Descrição
CodeSmellDetector <pasta_do_projeto>	Executa a análise completa do projeto informado. Nenhum arquivo original é alterado.
CodeSmellDetector --reverter <pasta_do_projeto>	Restaura os arquivos originais a partir do backup salvo em .backup_CodeSmell.
CodeSmellDetector <pasta> --silencioso	Executa a análise sem exibir logs no console (apenas grava no arquivo de log).
📁 Estrutura de diretórios
C:\Projetos\MeuApp\
├── .backup_CodeSmell\       ← Backup automático dos arquivos originais
├── relatorios\              ← Relatórios e sugestões geradas
│   ├── sugestoes_html\
│   ├── sugestoes_csv\
│   └── sugestoes_json\
└── src\                     ← Código-fonte original (inalterado)
🧠 Detalhes técnicos
Arquivos maiores que 5 MB são ignorados automaticamente
Leitura de arquivos feita linha a linha com TStreamReader para economia de memória
Limite de 4 tarefas paralelas para geração de sugestões
IA local chamada via HTTP em http://localhost:11434/api/generate
Timeout configurado para 5 minutos por requisição
Respostas da IA são cacheadas por hash MD5 do método
Relatórios HTML são salvos como UTF-8 sem BOM para compatibilidade com navegadores
📤 Exemplo de uso
CodeSmellDetector C:\Projetos\MeuApp
🔁 Exemplo de reversão
CodeSmellDetector --reverter C:\Projetos\MeuApp
📌 Requisitos
Delphi XE ou superior
Projeto Delphi com arquivos .pas, .dpr, .dfm, .inc
Servidor de IA local rodando em localhost:11434
