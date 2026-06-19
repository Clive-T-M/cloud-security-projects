# Day 2 Reflection

## What I Built Today
- VPC Flow Logs: Records metadata of ALL network traffic in my VPC (ACCEPTED and REJECTED)
- AWS Config: Automatic compliance checking with the restricted-ssh rule
- Tested detection by creating a deliberately vulnerable security group and watching Config flag it as Non-compliant

## One Thing I Learned
Preventative controls stop attacks. Detective controls PROVE the attacks were stopped.
Without logs and compliance checks, security is just a hope. With them, it's auditable and verifiable.

## One Concept I Want Deeper Understanding Of
How to automatically fix what Config detects — auto-remediation with Lambda functions.

## Getting Ready for 3rd lab?
I will learn auto-remediation so violations fix themselves without human intervention.
