# ============================================
# VPC FLOW LOGS - SECURITY CAMERA FOR NETWORK TRAFFIC
# ============================================

resource "aws_flow_log" "vpc_flow_log" {
  vpc_id               = aws_vpc.lab_vpc.id
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.flow_log_group.arn
  iam_role_arn         = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/vpc-flow-logs-role"
  traffic_type         = "ALL"

  tags = {
    Name         = "day2-vpc-flow-log"
    Purpose      = "Detective control - record all network activity"
    Risk_Control = "Provides audit trail for all network traffic in VPC"
  }
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  name              = "/vpc-flow-logs/day2-lab"
  retention_in_days = 7

  tags = {
    Name    = "day2-flow-log-group"
    Purpose = "Store VPC Flow Logs for security analysis"
  }
}

data "aws_caller_identity" "current" {}
