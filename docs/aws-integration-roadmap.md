# AWS Integration Roadmap

## 1) Current AWS usage (audit)
- **In use**
  - **Amazon EC2** via SSH deployment from GitHub Actions: `.github/workflows/deploy-aws.yml`.
- **Not in use (not found in codebase)**
  - AWS SDK dependencies/imports in backend/frontend.
  - IaC definitions for Terraform/CloudFormation/CDK.
  - Managed AWS service configuration for ECR/ECS/RDS/Secrets Manager.

## 2) Recommended services to add next
- **Amazon RDS (MySQL)**
  - Replace containerized DB in production.
  - Add backups, patching, managed failover options.
- **Amazon ECS (Fargate) + Amazon ECR**
  - Replace SSH + compose deploy with managed container deployment.
  - Use private image registry and service-based rollouts.
- **AWS Secrets Manager**
  - Centralize DB/JWT secrets with rotation-ready storage.

## 3) Phased roadmap
- **Phase 0 — Prerequisites**
  - Provision VPC/subnets/security groups and IAM roles.
  - Configure GitHub OIDC role for CI.
- **Phase 1 — Secrets first**
  - Move DB/JWT values to secret-backed runtime env vars.
  - Keep local defaults only for non-production.
- **Phase 2 — Database modernization**
  - Provision RDS MySQL and point backend `DB_URL` to RDS endpoint.
  - Disable init-seed in production (`SQL_INIT_MODE=never`).
- **Phase 3 — Compute modernization**
  - Build/push images to ECR and redeploy ECS services.
  - Add health checks, autoscaling, and rollback policies.

## Implemented in this repository
- Added Terraform scaffold: `/home/runner/work/fullstack_web_ecomerce/fullstack_web_ecomerce/infra/terraform`.
- Added ECS deployment workflow template: `/home/runner/work/fullstack_web_ecomerce/fullstack_web_ecomerce/.github/workflows/deploy-ecs.yml`.
- Refactored runtime config for secret-backed env vars:
  - `/home/runner/work/fullstack_web_ecomerce/fullstack_web_ecomerce/be/src/main/resources/application.properties`
  - `/home/runner/work/fullstack_web_ecomerce/fullstack_web_ecomerce/docker-compose.yml`
  - `/home/runner/work/fullstack_web_ecomerce/fullstack_web_ecomerce/docker-compose.prod.yml`
