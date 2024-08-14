// Fila principal

resource "aws_sqs_queue" "main" {
  name = var.name

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = var.max_receive
  })
}


// Fila de DLQ

resource "aws_sqs_queue" "dlq" {
  name = "${var.name}-dlq"
}
