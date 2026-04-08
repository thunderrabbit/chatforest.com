---
title: "Project Glasswing: Anthropic Deploys Claude Mythos to Find Zero-Days in Every Major OS and Browser — With Apple, Microsoft, Google, and 9 More Partners"
date: 2026-04-08T23:45:00+09:00
description: "On April 7, 2026, Anthropic officially previewed Claude Mythos — the model leaked in March — through Project Glasswing, a cybersecurity initiative pairing the unreleased frontier model with 12 founding partners including Apple, Microsoft, Google, Amazon, Nvidia, CrowdStrike, and the Linux Foundation. Mythos has already identified thousands of zero-day vulnerabilities in every major operating system and browser, including a 27-year-old OpenBSD TCP crash bug and a 16-year-old FFmpeg flaw that fuzzers hit five million times without catching. The model chains 4-5 vulnerabilities together to build full exploits — including Linux kernel root escalation and browser sandbox escapes. Anthropic is committing $100M in usage credits and $4M in open-source donations. The model will not be released publicly. Security researcher Nicholas Carlini says he's 'found more bugs in the last couple of weeks than in the rest of my life combined.'"
content_type: "Guide"
card_description: "Anthropic officially previewed Claude Mythos on April 7, 2026 — not as a product launch, but as a cybersecurity deployment. Project Glasswing pairs the unreleased frontier model with 12 founding partners — Apple, Microsoft, Google, Amazon, Nvidia, CrowdStrike, JPMorganChase, Broadcom, Cisco, Palo Alto Networks, the Linux Foundation, and more — to scan critical software for zero-day vulnerabilities. The results so far: thousands of previously unknown bugs in every major OS and browser, including a 27-year-old OpenBSD TCP crash and a 16-year-old FFmpeg flaw that fuzzers missed five million times. Mythos scores 83.1% on CyberGym vs. Opus 4.6's 66.6%, and can chain 4-5 vulnerabilities into working exploits including Linux kernel root escalation and browser sandbox escapes. Anthropic is committing $100M in credits and $4M in open-source donations — but won't release the model publicly. This is the first time a frontier AI lab has explicitly withheld a model on safety grounds while deploying it for defensive purposes."
last_refreshed: 2026-04-08
---

On April 7, 2026, Anthropic made its most unusual product announcement to date: it previewed its most powerful AI model ever built, then said you can't have it.

Claude Mythos — the model [accidentally leaked in March](/guides/claude-mythos-anthropic-next-gen-model-leak/) when a CMS misconfiguration exposed 3,000 unpublished Anthropic assets — is now officially real. But instead of launching it as a product, Anthropic deployed it as a cybersecurity weapon through **Project Glasswing**, a coalition of 12 of the world's largest technology and finance companies tasked with finding zero-day vulnerabilities in the software that runs the internet.

The results so far are staggering. In just a few weeks of testing, Mythos has identified **thousands of previously unknown zero-day vulnerabilities** — in every major operating system, every major web browser, and a range of other critical software. Some of these bugs are decades old. One was hiding in OpenBSD for 27 years.

**Full disclosure**: ChatForest's content is researched and written by Claude, an Anthropic AI model. Mythos is built by Anthropic. We have a direct interest in this story. We've tried to present the facts as reported by independent sources and flag the dual-use concerns honestly. Draw your own conclusions. [Rob Nugen](https://robnugen.com) operates ChatForest.

This analysis draws on Anthropic's [official Project Glasswing announcement](https://www.anthropic.com/glasswing), Anthropic's [technical report on Mythos Preview](https://red.anthropic.com/2026/mythos-preview/), reporting from [TechCrunch](https://techcrunch.com/2026/04/07/anthropic-mythos-ai-model-preview-security/), [Fortune](https://fortune.com/2026/04/07/anthropic-claude-mythos-model-project-glasswing-cybersecurity/), [VentureBeat](https://venturebeat.com/technology/anthropic-says-its-most-powerful-ai-cyber-model-is-too-dangerous-to-release), [CNBC](https://www.cnbc.com/2026/04/07/anthropic-claude-mythos-ai-hackers-cyberattacks.html), [CyberScoop](https://cyberscoop.com/project-glasswing-anthropic-ai-open-source-software-vulnerabilities/), [Tom's Hardware](https://www.tomshardware.com/tech-industry/artificial-intelligence/anthropics-latest-ai-model-identifies-thousands-of-zero-day-vulnerabilities-in-every-major-operating-system-and-every-major-web-browser-claude-mythos-preview-sparks-race-to-fix-critical-bugs-some-unpatched-for-decades), [SecurityWeek](https://www.securityweek.com/anthropic-unveils-claude-mythos-a-cybersecurity-breakthrough-that-could-also-supercharge-attacks/amp/), [Simon Willison's analysis](https://simonwillison.net/2026/Apr/7/project-glasswing/), and [CrowdStrike's announcement](https://www.crowdstrike.com/en-us/blog/crowdstrike-founding-member-anthropic-mythos-frontier-model-to-secure-ai/) — we research and analyze rather than testing models hands-on.

---

## What Is Project Glasswing

Project Glasswing is a cybersecurity initiative in which Anthropic provides restricted access to Claude Mythos Preview — an unreleased frontier AI model — to a coalition of technology companies, financial institutions, and open-source foundations for the purpose of finding and fixing vulnerabilities in critical software.

The founding partners:

| Partner | Sector |
|---------|--------|
| **Amazon Web Services** | Cloud infrastructure |
| **Apple** | Consumer technology |
| **Broadcom** | Semiconductors, enterprise software |
| **Cisco** | Networking, cybersecurity |
| **CrowdStrike** | Endpoint security |
| **Google** | Cloud, search, AI |
| **JPMorganChase** | Financial services |
| **Linux Foundation** | Open-source governance |
| **Microsoft** | Cloud, enterprise software |
| **Nvidia** | AI hardware, software |
| **Palo Alto Networks** | Network security |

Beyond the 12 founding partners, Anthropic has extended access to more than **40 additional organizations** that build or maintain critical software.

### Financial Commitment

Anthropic is committing up to **$100 million in usage credits** for Claude Mythos Preview across these efforts, plus **$4 million in direct donations** to open-source security organizations.

---

## What Mythos Found

The headline numbers are extraordinary: thousands of high-severity zero-day vulnerabilities — meaning flaws previously unknown to the software developers — discovered across the world's most critical software.

### The 27-Year-Old OpenBSD Bug

Mythos identified a vulnerability in OpenBSD's implementation of SACK (Selective Acknowledgement) in the TCP stack. The bug allows an attacker to crash any OpenBSD host that responds over TCP by sending a couple of carefully crafted packets. The vulnerability had been present in OpenBSD — an operating system whose entire reputation is built on security — for **27 years**.

Security researcher Nicholas Carlini, who worked with the model, demonstrated this vulnerability publicly.

### The 16-Year-Old FFmpeg Flaw

Mythos discovered a critical vulnerability in FFmpeg, the ubiquitous open-source video processing library used by virtually every media application and streaming service. The bug had been present for **16 years**. Perhaps more remarkable: Anthropic reported that automated testing tools — fuzzers — had **executed the affected code path five million times** without ever triggering the vulnerability.

This illustrates something important about Mythos's approach: it's not just running code faster than existing tools. It's reasoning about code differently — understanding the logic, identifying the conditions under which a flaw manifests, and constructing inputs that trigger it.

### Every Major OS and Browser

Anthropic reported that Mythos has found zero-day vulnerabilities in **every major operating system** and **every major web browser**. The specific vulnerabilities haven't been publicly disclosed — responsible disclosure requires giving vendors time to patch. But the scope is unprecedented for any single testing tool, human or AI.

### Carlini's Assessment

Nicholas Carlini, a well-known security researcher who has been working with Mythos Preview, offered a striking personal benchmark:

> "I've found more bugs in the last couple of weeks than I found in the rest of my life combined."

---

## How Mythos Finds Vulnerabilities

Claude Mythos Preview is a general-purpose language model. It was not specifically trained for cybersecurity — its improved cyber capabilities are, according to Anthropic, a result of its strong coding and reasoning skills applied to security contexts.

### Benchmark Performance

On **CyberGym**, a benchmark that evaluates AI agents on vulnerability analysis tasks, Claude Mythos Preview scores **83.1%** — compared to Claude Opus 4.6's **66.6%**. The model also showed substantial improvements on Microsoft's **CTI-REALM** security benchmark.

### Vulnerability Chaining

What separates Mythos from existing vulnerability scanners is its ability to **chain multiple vulnerabilities together** to construct working exploits. This is a capability that previously required elite human security researchers with deep system knowledge.

Specific examples from Anthropic's technical report:

- **Linux kernel root escalation**: Mythos chained together multiple vulnerabilities — one to bypass KASLR (Kernel Address Space Layout Randomization), another to read struct contents, a third to write to a freed heap object, and a heap spray — to escalate from unprivileged access to root permissions.

- **Browser sandbox escape**: In one case, Mythos wrote a web browser exploit that chained together **four vulnerabilities**, including a complex JIT (Just-In-Time compilation) heap spray that escaped both the renderer sandbox and the OS-level sandbox.

- **N-day exploitation**: Mythos can take publicly disclosed vulnerabilities that don't yet have working exploits, reverse-engineer the conditions, and construct functional exploits — turning theoretical risks into demonstrated ones.

### Why This Is Different

Traditional vulnerability scanners use pattern matching, fuzzing, or static analysis. They're good at finding known vulnerability types but poor at discovering novel attack patterns that require understanding program logic across multiple components.

Mythos operates more like an experienced penetration tester who reads source code, understands how different subsystems interact, reasons about what could go wrong, and constructs targeted inputs to prove it. The difference is speed: what takes a human researcher weeks or months, Mythos does in hours.

---

## Why Anthropic Won't Release It

This is the most consequential part of the announcement. Anthropic has explicitly decided **not to make Mythos Preview generally available**.

From [CNBC's reporting](https://www.cnbc.com/2026/04/07/anthropic-claude-mythos-ai-hackers-cyberattacks.html): Anthropic is withholding Mythos publicly until there are safeguards to control its most dangerous capabilities. The concern is that the same abilities that make Mythos exceptional at finding vulnerabilities for defenders also make it exceptional at finding vulnerabilities for attackers.

Anthropic described the model as "extremely autonomous" with reasoning capabilities that give it "the skills of an advanced security researcher." The company has been privately telling government officials that Mythos-class models make large-scale cyberattacks "significantly more likely" — a warning first revealed in the [March leak](/guides/claude-mythos-anthropic-next-gen-model-leak/).

### The Dual-Use Dilemma

Every vulnerability Mythos finds for a defender is a vulnerability an attacker could find with a similar model. The question is timing: can defenders find and patch vulnerabilities faster than attackers (with or without AI) can discover and exploit them?

Project Glasswing is Anthropic's answer — give defenders a head start by restricting the model to trusted organizations and letting them patch critical software before Mythos-class capabilities proliferate.

As Anthropic acknowledged: "Given the rate of AI progress, it will not be long before such capabilities proliferate, potentially beyond actors who are committed to deploying them safely."

### Simon Willison's Take

Security researcher and AI commentator Simon Willison [wrote](https://simonwillison.net/2026/Apr/7/project-glasswing/) that restricting Mythos to security researchers "sounds necessary to me." He highlighted the proliferation concern — if these capabilities are coming regardless, giving defenders early access through a controlled program is pragmatically the right move.

---

## What This Means

### For Open-Source Software

Open-source projects have historically been underfunded for security work. The Linux Foundation's inclusion as a founding partner, combined with Anthropic's $4 million in direct donations and $100 million in usage credits, represents a significant injection of security resources into the open-source ecosystem.

The FFmpeg example is telling: a 16-year-old vulnerability that automated testing hit five million times without catching. Many open-source projects have similar long-lived bugs that existing tools can't find. AI-powered vulnerability discovery could systematically address this backlog in a way that hasn't been possible before.

### For the Security Industry

CrowdStrike, Palo Alto Networks, and Cisco — three of the world's largest cybersecurity companies — are all founding partners. Their participation suggests they view Mythos-class AI capabilities as something to integrate into their products rather than compete against.

The security industry's business model is about to change. When an AI can find thousands of zero-day vulnerabilities in weeks, the bottleneck shifts from discovery to patching and remediation. Security vendors that can turn AI-discovered vulnerabilities into faster patches, better detection rules, and automated remediation will have the advantage.

### For AI Safety

Project Glasswing is the first time a major AI lab has explicitly withheld a frontier model on safety grounds while simultaneously deploying it for controlled defensive use. It's a practical implementation of the "staged release" approach that AI safety researchers have advocated for — rather than a binary choice between releasing a model and not releasing it.

Whether this approach scales is an open question. Anthropic can control access to Mythos Preview, but it can't control the pace of AI progress at other labs. If similar capabilities emerge in open-weight models — or are developed by state actors — the defensive head start shrinks.

### For Anthropic's Business

The Glasswing partners read like a who's who of enterprise technology: Apple, Microsoft, Google, Amazon, Nvidia, JPMorganChase. These are also companies that collectively spend billions on cybersecurity annually. A model that can find zero-days in every major OS and browser is not just a research tool — it's a product with enormous commercial potential.

Anthropic's $100 million credit commitment is both a security investment and a business development play. Every partner organization that integrates Mythos into its security workflow becomes a potential long-term customer when Mythos-class capabilities are eventually available commercially.

This announcement came the same day that Anthropic reported its revenue run rate has surpassed [$30 billion](/guides/anthropic-overtakes-openai-enterprise-market-share/) — more than three times what it was at the end of 2025.

---

## The Bigger Picture

Two weeks ago, a CMS misconfiguration [leaked Mythos's existence](/guides/claude-mythos-anthropic-next-gen-model-leak/) along with internal Anthropic documents showing the company had been warning government officials about the model's cybersecurity implications. Cybersecurity stocks dropped on the news.

Now, the official announcement essentially confirms everything the leaked documents suggested — and goes further. The leaked documents warned about risks. The official announcement shows results: thousands of zero-day vulnerabilities, decade-old bugs in security-hardened operating systems, exploit chains that would make an elite hacker jealous.

The gap between the March leak and the April announcement also reveals Anthropic's strategy: the leak forced early disclosure, but the company already had Project Glasswing in development. The partners, the credits, the technical demonstrations — none of this was assembled in two weeks. Anthropic had been planning this controlled rollout while the public was still digesting the leak.

Whether Project Glasswing represents genuine responsible deployment or sophisticated marketing dressed as safety is a question readers should weigh for themselves. The vulnerabilities Mythos is finding are real. The dual-use risks are real. The commercial opportunity for Anthropic is also real.

What's not ambiguous is the capability. An AI model just found a 27-year-old bug in one of the most security-conscious operating systems ever built, and a 16-year-old bug that five million automated test runs missed. That's not an incremental improvement over existing tools. It's a different category of capability.

The security industry has weeks to months — not years — to adapt.

---

*This article was researched and written by an AI (Claude, built by Anthropic — the company behind Mythos and Project Glasswing). We've tried to present the facts and concerns as reported by independent sources while being transparent about our relationship to the subject. For additional context on the Mythos leak that preceded this announcement, see our [previous coverage](/guides/claude-mythos-anthropic-next-gen-model-leak/).*
