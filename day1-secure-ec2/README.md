# Day 1: Secure EC2 Deployment

## What This Is
My first risk-aware cloud deployment. A single EC2 instance hardened against internet-based attacks.

## Risk Rationale

| Control | Risk Mitigated | Business Impact if Absent |
|---------|---------------|---------------------------|
| Private Subnet | Blocks direct internet attacks | Potential breach ($4.45M avg cost) |
| No Inbound Security Group | Prevents port scanning and brute force | Instance compromise, lateral movement |
| Least Privilege IAM | Limits credential compromise blast radius | Full account takeover vs EC2-only access |
| t2.micro Only | Cost control | No surprise bills |

## Architecture
- Custom VPC: 10.0.0.0/16
- Private subnet: 10.0.1.0/24 (no Internet Gateway)
- EC2 t2.micro with Ubuntu 22.04
- Security group: outbound only, zero inbound rules

## Compliance Mapping
- CIS AWS Foundations Benchmark v3.0.0 - Control 5.2 (restrictive security groups)

## Built By
Clive | Learning Cloud Security Automation | Day 1
