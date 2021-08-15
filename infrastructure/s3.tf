resource "aws_s3_bucket" "dl" {
  #Parametro de configuração do recurso escolhido
  # Pesquisar terraform "Nome do recurso que queros configurar"
  bucket = "${var.base_bucket_name}-${var.usecase}-${var.numero_conta}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

}