# ============================================
# VPC FLOW LOGS - NETWORK TRAFFIC MONITORING
# ============================================
# Detective Control: Records metadata about every
# network packet entering or leaving the VPC.

resource "aws_flow_log" "vpc_flow_log" {
  vpc_id = aws_vpc.lab_vpc.id

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.flow_log_group.arn

  iam_role_arn = "arn:aws:iam::600743178672:role/vpc-flow-logs-role"

  traffic_type = "ALL"

  tags = {
    Name         = "day2-doc-flow-log"
    Purpose      = "Detective control - network activity monitoring"
    Risk_Control = "Audit trail for all VPC traffic"
  }
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  name              = "/vpc-flow-logs/day2-documented"
  retention_in_days = 7

  tags = {
    Name    = "day2-doc-log-group"
    Purpose = "Store VPC Flow Logs for security analysis"
  }
}

data "aws_caller_identity" "current" {}
