# Security Policy

Abstract Altitudes is a personal photography portfolio maintained by one
person. This policy exists so that a genuine security finding reaches me
privately instead of arriving as a public issue.

## Reporting a vulnerability

**Please do not open a public issue for security problems.**

Use GitHub's private vulnerability reporting, which is enabled on this
repository:

**[Report a vulnerability](https://github.com/wrangel/abstractaltitudes/security/advisories/new)**

That opens a private advisory visible only to me, so the problem can be fixed
before it is described anywhere public.

If you would rather not use GitHub, email
`contact@abstractaltitudes.anonaddy.com` with "security" in the subject.

## What helps

- The URL or file and line, and what an attacker could actually achieve
- Steps to reproduce, ideally the smallest case that shows it

## What to expect

This is a side project, not a staffed product. I will acknowledge reports as
soon as I reasonably can and fix what is genuinely exploitable, but I am not
promising a response deadline I cannot keep. There is no bug bounty.

Reports that are clearly automated scanner output with no demonstrated impact
will usually be closed without a detailed reply.

## Scope

In scope: this repository's source, and the deployed site at
<https://abstractaltitudes.com>.

Out of scope: third-party services the site depends on — MongoDB Atlas,
BunnyCDN, Docker Hub, Google Maps — which should be reported to those vendors
directly.

Please do not run automated scanners, load tests, or anything that degrades
the site for other visitors. It runs on a small home server; a scan is
indistinguishable from an outage.

## Versions

There are no released versions to support. The site runs whatever is currently
on `main`, deployed as Docker images, so fixes apply to the live site rather
than to a version range.
