# Avaliação de qualidade das leituras com FastQC

echo "**** SCRIPT para LIMPEZA de DADOS ****"
echo "Digite 1 para especificar o arquivo fastq ou 2 para realizar a limpeza de TODOS arquivos fastq no diretório: " 
read option

if [option -eq 1]; then
    echo "Digite o nome do arquivo fastq a ser processado. Coloque a extensão .fastq no nome: "
    fastqc $file_name
    trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip $file_name
elif [option -eq 2]; then
    echo "Todos os arquivos fastq neste diretório serão processados!"
# nesta linha, o script irá gerar um arquivo fastqc (relatório de qualidade) para cada arquivo fastq
    for i in *.fastq
    do
      fastqc *.fastq
# Limpeza e corte de sequências de baixa qualidade com Trim Galore
# nesta linha de comando, foi determinado que será utilizado um corte mínimo de qualidade (Phred 25), os Ns serão removidos da
#   leitura, será utilizado 1 core de processamento para corte, serão descartadas reads menores que 18 e os arquivos 
#   de output não serão compactados. O corte será feito para todos os arquivos fastq presentes no diretório.
      trim_galore --fastqc -q 25 --trim-n --max_n 0 -j 1 --length 18 --dont_gzip "$file".fastq
    done
else
    echo "Opção incorreta!"
    echo "Digite 1 para especificar o arquivo fastq ou 2 para realizar a limpeza de TODOS arquivos fastq no diretório: " 
fi
