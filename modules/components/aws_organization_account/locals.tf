locals {
  tags = merge(var.tags, {
    OU   = var.ou_name,
    Name = "${var.ou_name}-${var.account_name}"
  })
}