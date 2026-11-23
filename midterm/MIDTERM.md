
# IA 462 Midterm — Security Analysis and Threat Model

## 1. Repository Overview

A Flask application is a web application or backend service built using Flask, a lightweight web framework written in Python.
The three operating environments examined throughout this midterm were Linux (Ubuntu/WSL), Microsoft Windows 11, and Docker. 
The Docker security controls examined included non-root container execution, minimal base images, dependency pinning, and image digest pinning to reduce privileges, minimize the attack surface, and maintain software integrity.
The main GitHub security workflows focused on securing application code, software dependencies, and Docker images through automated CI/CD pipelines.

 
## 2. Cross-Platform Hardening Comparison

| Security Area | Linux                                               | Windows                                                | Docker |
------------------------------------------------------------------------------------------------------------------------------------------
| Kernel model:  |Linux kernal; separates user space from kernel space |Windows NT kernel; separates user mode from kernel mode |Linux containers share the host's Linux kernel |
| Access control: |Users, groups, chmod, sudo, PAM                      |NTFS permissions, ACLs, UAC, security policies          |Non-root execution, Linux capabilities, seccomp |
| Auditing: |Lynis, auditd, system logs                                |Windows Event Viewer, Sysmon, audit policies            |Docker logs, Docker Bench, host-level auditing |
| Hardening standard: |CIS Linux Benchmark, SSH/PAM hardening          |CIS Windows Benchmark, Microsoft security baselines     |CIS Docker Benchmark, least privilege |
| Common attack surface: |SSH, exposed services, privileged accounts   |PowerShell, Windows services, credentials               |Vulnerable images, container permissions, Docker daemon |

Linux and Windows operate with their own kernels and native security mechanisms, whereas Linux-based Docker containers share the underlying Linux kernel.
Linux emphasizes granular permissions and system-level configurations, Windows emphasizes centralized security policies and identity management, and Docker emphasizes isolated application execution and securing software throughout the build and deployment process. 
Despite their differences, all three environments emphasize least privilege, vulnerability management, security auditing, and attack surface reduction.


## 3. Supply-Chain Threat Model

| Potential Attack                           | Affected Component     | Security Control                             | Supporting Evidence |
--------------------------------------------------------------------------------------------------------------------------------------------
|Exploitation of a vulnerable Python package |Flask Dependencies      |Dependency Review & pip-audit                 |Section 6 — failed checks on vulnerable PR #2 |

|Exploitation of outdated system packages    |Docker Image            |Trivy & Grype scanning                        |Section 4 — scan reports                      |

|Abuse of excessive container privileges     |Docker Runtime          |Non-root user, dropped capabilities, seccomp  |Section 3 — hardened container configuration |

|Unauthorized changes to dependency versions |Python dependency files |Exact version pins and SHA-256 package hashes |Section 6 — requirements.lock |

|Malicious or suspicious account creation    |Windows user accounts   |Windows security auditing and Sigma rule      |Sections 2 and 5 — Event ID 4720|


### Course Slide References

Week 5, Slide 4 — Docker: Core Threat Landscape

Week 5, Slide 5 — Docker: Threat Intelligence Techniques

Week 5, Slide 6 — Docker: Hardening & CI/CD Integration

Week 5, Slide 8 — Windows: Core Threat Landscape

Week 5, Slide 9 — Windows: Event Log Analysis

Week 7, Slide 5 — Docker: Understanding the Attack Surface

Week 7, Slide 6 — Docker: Key Policy Enforcement Tools

Week 7, Slide 8 — Docker: Policy in the CI/CD Pipeline


## 4. Learning Objectives Crosswalk

- Section 1 — Linux Host Hardening: This section aligns with the syllabus objective, “Implement Windows and Linux best practices to protect against Supply Chain Attacks.” 
Relevant supporting evidence includes PAM authentication, SSH hardening, restrictive permissions, and Lynis security auditing.

- Section 2 — Windows Baseline & Event Log Analysis: This section aligns with the syllabus objective, “Implement Windows and Linux best practices to protect against Supply Chain Attacks.” 
Relevant supporting evidence includes Windows Defender, Windows Firewall, Sysmon, and Windows Security Event Log analysis.


- Section 3 — Docker Hardened Build & Runtime Controls: This section aligns with the syllabus objective, “Apply enterprise patch and policy management for Docker Containers, including container hardening.” 
Relevant supporting evidence includes non-root container execution, a hardened Dockerfile, seccomp profiles, and runtime security restrictions.

- Section 4 — Trivy, Syft & Grype: This section aligns with the syllabus objective, “Understand and integrate Software Bill of Materials (SBOM) into Docker Container workflows.” 
Relevant supporting evidence includes SBOM generation, vulnerability scanning using Trivy and Grype, and CVE analysis.

- Section 5 — Policy Enforcement: This section aligns with the syllabus objective, “Utilize Supply Chain Security Techniques across Windows, Linux, and Docker container environments.” 
Relevant supporting evidence includes the Docker Bench security assessment and the Sigma detection rule.

- Section 6 — Dependency Management & GitHub: This section aligns with the following syllabus objectives: “Apply Dependency Pinning, Version Control, and Hashing to reduce surprise supply chain attacks,” “Perform Vulnerability Management: scan, patch, and retest continuously using CI/CD techniques in GitHub,” and “Configure and manage third-party security scanners within a GitHub CI/CD pipeline.” 
Relevant supporting evidence includes dependency pinning, hashing, Dependabot, GitHub Actions, and dependency review.
