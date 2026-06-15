# Security Policy

AMARATWIN is a **concept prototype**, but it is built to a production DevSecOps
standard so it can graduate cleanly if ever sanctioned.

## Supported versions

| Version | Supported |
|---------|-----------|
| 1.x     | ✅        |

## Reporting a vulnerability

Please open a [private security advisory](../../security/advisories/new) rather
than a public issue. We aim to acknowledge within 72 hours.

## Security controls in this repository

- **SAST** — CodeQL on every push/PR (`.github/workflows/security.yml`).
- **Secret scanning** — Gitleaks blocks committed credentials.
- **Vulnerability & IaC scanning** — Trivy (filesystem + misconfiguration), results to GitHub Security.
- **Dependency review** — PRs fail on newly introduced high-severity advisories.
- **Dependabot** — weekly automated dependency PRs.
- **SBOM** — CycloneDX software bill of materials generated each run.
- **Hardened HTTP headers** — CSP, HSTS, X-Content-Type-Options, COOP/CORP, Permissions-Policy (`vercel.json`).
- **Branch protection** — production deploys are gated behind passing CI + security checks.

## Secrets required (set in GitHub repo → Settings → Secrets → Actions)

| Secret | Purpose |
|--------|---------|
| `VERCEL_TOKEN` | Authenticates the Vercel CLI for automated deploys |
| `VERCEL_ORG_ID` | Vercel organisation/team id |
| `VERCEL_PROJECT_ID` | Vercel project id |

No application secrets are stored in code. The site is fully static.
