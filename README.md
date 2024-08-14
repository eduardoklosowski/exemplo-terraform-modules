# Exemplo de Uso de Módulos do Terraform

Projeto de exemplo de uso de módulos em [Terraform](https://www.terraform.io/).

Esse projeto utiliza o [Moto](https://docs.getmoto.org/en/latest/) para simular a AWS, e um módulo para criar uma fila SQS e sua DLQ. Os recursos criados pelo Terraform também podem ser visualizado na [interface web do Moto](http://localhost:4566/moto-api/).

## Guia

O arquivo `exemplo.tf` demonstra alguns usos do módulo que está no diretório `queue-with-dlq`, esse módulo cria uma fila e uma DLQ para ela automaticamente.

Para executar um teste, basta iniciar os módulos do Terraform com o comando `make init`. Após isso é possível criar um plano de migração do Terraform com `make plan`, a informação sobre as alterações apareceram na tela. O comando `make apply` aplicará as mudanças.

Após ter executado o Terraform, as filas podem ser visualizadas com o comando:

```sh
awslocal sqs list-queues
```

Uma mensagem pode ser enviada para as filas com o comando:

```sh
awslocal sqs send-message --queue-url 'http://localhost:4566/123456789012/minha-fila' --message-body '123'
```

Para consumir mensagens das filas, os comandos a baixo podem ser utilizados:

```sh
awslocal sqs receive-message --queue-url 'http://localhost:4566/123456789012/minha-fila' --max-number-of-messages 1 --wait-time-seconds 10 --visibility-timeout 5
awslocal sqs receive-message --queue-url 'http://localhost:4566/123456789012/minha-fila-dlq' --max-number-of-messages 1 --wait-time-seconds 10
```

Para excluir uma mensagem, após consumi-la, execute o comando a baixo informando o `ReceiptHandle`:

```sh
awslocal sqs delete-message --queue-url 'http://localhost:4566/123456789012/minha-fila' --receipt-handle ''
```
