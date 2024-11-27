# Avaliação de qualidade das leituras com FastQC
# nesta linha, será gerado um arquivo fastqc (relatório de qualidade) a partir de um arquivo fastq
fastqc SRRXXXXXXX.fastq

# Limpeza e corte de sequências de baixa qualidade com Trim Galore
# nesta linha de comando, foi determinado que será utilizado um corte mínimo de qualidade (Phred 25), os Ns serão removidos da
#   leitura, será utilizado 1 core de processamento para corte, serão descartadas reads menores que 18 e os arquivos 
#   de output não serão compactados
trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip SRRXXXXXXX.fastq
