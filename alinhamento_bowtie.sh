# Construção do índice de alinhamento com Bowtie
# Comando para gerar um índice de alinhamento a partir das referências .fasta de Wolbachia. Este índice permite um processo
#     mais rápido e eficiente. O nome dado para o índice é "reference_index" e o nome do arquivo de input é "reference_fasta"
bowtie-build reference.fasta reference_index

# Alinhamento das sequências contra a referência de Wolbachia
# Comando para alinhamento dos dados. O arquivo de input é no formato fasta, o arquivo de output é no formato SAM,
#    todo o alinahmentos que satisfazem os critérios serão reportados, nenhum mismatch será permitido, 3 threads serão utilizados
#    para procesamento paralelo, será printado o tempo gasto em cada fase
bowtie -f -S -a -v 0 -p 3 -t reference_index sample.fasta > sample.sam 2> sample_bowtie.log
