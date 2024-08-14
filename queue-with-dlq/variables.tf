variable "name" {
  description = "Nome da fila"
  type        = string
}

variable "max_receive" {
  description = "Quantas vezes a mensagem pode ser recebida antes de ir para a DLQ"
  type        = number
  default     = 1
}
