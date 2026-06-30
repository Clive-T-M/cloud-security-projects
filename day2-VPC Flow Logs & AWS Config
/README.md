# Day 2: Detective Controls — VPC Flow Logs & AWS Config

## What I Built
Added network monitoring and automatic compliance checking to a secure EC2 deployment.

## Architecture
- Secure EC2 in private subnet (Day 1 foundation)
- VPC Flow Logs → CloudWatch (network traffic audit)
- AWS Config rules (configuration compliance monitoring)

## Controls Implemented

| Control | Type | Status |
|---------|------|--------|
| VPC Flow Logs | Detective | Active |
| AWS Config: restricted-ssh | Detective | Compliant |
| AWS Config: vpc-default-sg-closed | Detective | Compliant |

## Detection Test Performed
1. Created deliberately vulnerable security group (SSH open to 0.0.0.0/0)
2. AWS Config detected as "Non-compliant" within minutes
3. Cleaned up vulnerable resource
4. Config returned to compliant state

## Compliance Mapping

| Framework | Control | Implementation |
|-----------|---------|----------------|
| CIS AWS 3.0.0 | 3.1 - VPC Flow Logs | Enabled on all VPC traffic |
| CIS AWS 3.0.0 | 5.2 - No unrestricted SSH | AWS Config automated verification |
| NIST 800-53 | AU-2 - Audit Events | Flow logs provide audit trail |

## Files
- main.tf - Day 1 foundation (secure EC2)
- flowlogs.tf - VPC Flow Logs configuration
- test-vulnerable.tf - Vulnerable SG for detection testing
- providers.tf - Terraform AWS provider config
