# ============================================
# VPC FLOW LOGS - Network Traffic Monitoring
# ============================================
# Detective control: Records metadata about every
# network packet in the VPC.
# ACCEPT = allowed traffic
# REJECT = blocked traffic (attack attempts!)

resource "aws_flow_log" "vpc_flow_log" {
  vpc_id               = aws_vpc.lab_vpc.id
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.flow_log_group.arn
  iam_role_arn         = "arn:aws:iam::600743178672:role/vpc-flow-logs-role-day2"
  traffic_type         = "ALL"

  tags = {
    Name    = "day2-fresh-flow-log"
    Purpose = "Detective control - network audit trail"
  }
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  name              = "/vpc-flow-logs/day2-fresh"
  retention_in_days = 7

  tags = {
    Name    = "day2-fresh-log-group"
    Purpose = "Store VPC Flow Logs"
  }
}

data "aws_caller_identity" "current" {}
