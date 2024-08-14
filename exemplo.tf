// Exemplo de uso de módulos

module "minha_fila" {
  source = "./queue-with-dlq"

  name = "minha-fila"
}


// Mostra informações na tela

output "fila" {
  value = module.minha_fila.queue_url
}

output "dlq" {
  value = module.minha_fila.queue_dlq_url
}


// Outro exemplo de uso

module "outro_modulo" {
  source = "./queue-with-dlq"

  name        = "outro-nome"
  max_receive = 2
}
