// Fila principal

output "queue_id" {
  description = "Id da fila principal"
  value       = aws_sqs_queue.main.id
}

output "queue_name" {
  description = "Nome da fila principal"
  value       = aws_sqs_queue.main.name
}

output "queue_url" {
  description = "URL da fila principal"
  value       = aws_sqs_queue.main.url
}

output "queue_arn" {
  description = "ARN da fila principal"
  value       = aws_sqs_queue.main.arn
}


// Fila de DLQ

output "queue_dlq_id" {
  description = "Id da DLQ"
  value       = aws_sqs_queue.dlq.id
}

output "queue_dlq_name" {
  description = "Nome da DLQ"
  value       = aws_sqs_queue.dlq.name
}

output "queue_dlq_url" {
  description = "URL da DLQ"
  value       = aws_sqs_queue.dlq.url
}

output "queue_dlq_arn" {
  description = "ARN da DLQ"
  value       = aws_sqs_queue.dlq.arn
}
