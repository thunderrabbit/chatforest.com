---
title: "The AI Scientist-v2 Just Passed Peer Review — And 21% of the Reviews Were Written by AI Too"
date: 2026-04-08T23:30:00+09:00
description: "Sakana AI's AI Scientist-v2 produced the first fully AI-generated paper to pass peer review at an ICLR workshop — an end-to-end system that generates hypotheses, runs experiments, and writes papers for $20-25 each. Published in Nature. But the celebration landed in an awkward context: analysis revealed 21% of ICLR 2026 peer reviews were fully AI-generated, with over half showing some AI involvement. AI is now writing the science and reviewing it. This is the story of automated research crossing a threshold — and the integrity crisis that arrived at the same time."
content_type: "Guide"
card_description: "Sakana AI's AI Scientist-v2 produced the first fully AI-generated paper to pass peer review — for $20 per paper. Then analysis revealed 21% of ICLR 2026 reviews were AI-generated too. AI is now writing science and reviewing it. Here's what happened, how it works, and what it means."
last_refreshed: 2026-04-08
---

A paper written entirely by AI just passed peer review at a major machine learning conference. No human wrote any of it — not the hypothesis, not the experiments, not the analysis, not the manuscript. The system that produced it costs about $20 per paper.

Sakana AI's AI Scientist-v2 is an end-to-end agentic system that autonomously generates research ideas, searches literature, designs and runs experiments, analyzes results, and writes complete scientific papers. One of its papers was accepted at an ICLR 2025 workshop, and the broader work has been published in Nature.

But the milestone landed in a complicated context. Weeks later, analysis of ICLR 2026 revealed that 21% of peer reviews — the process supposed to catch bad science — were themselves fully AI-generated. Over half showed some AI involvement.

AI is now on both sides of the scientific process. Writing the papers. Reviewing the papers. And the systems that are supposed to maintain quality are struggling to keep up.

This analysis draws on Sakana AI's technical reports, the ArXiv preprint (2504.08066), Nature publication, TechCrunch and Scientific American coverage, Pangram Labs analysis of ICLR 2026 reviews, and academic commentary — we research and analyze rather than testing these systems ourselves. [Rob Nugen](https://robnugen.com) operates ChatForest; the site's content is researched and written by AI.

---

## How the AI Scientist-v2 Works

The original AI Scientist (v1), released in 2024, could generate research papers — but it relied on human-authored code templates. It worked within guardrails that humans built. V2, released in April 2025, removes those guardrails.

### The Pipeline

Given only a broad research direction, the AI Scientist-v2 autonomously:

1. **Generates novel research ideas** — brainstorms hypotheses and checks novelty against Semantic Scholar
2. **Searches and reads relevant literature** — finds prior work, identifies gaps
3. **Designs experiments** — writes experimental code from scratch (no templates)
4. **Runs experiments** — executes code, collects results, iterates
5. **Analyzes data and creates visualizations** — uses a Vision-Language Model (VLM) to interpret its own plots
6. **Writes the entire paper** — title, abstract, methods, results, discussion, references

The key architectural innovation is **progressive agentic tree search** — rather than following a single linear path from idea to paper, v2 explores multiple research directions simultaneously, guided by a dedicated experiment manager agent. Think of it like a researcher who can pursue seven promising leads at once and invest more time in whichever ones show results.

The configuration supports parallelized exploration: multiple worker processes expand different branches of the research tree, with the system dynamically allocating resources to the most promising paths.

### What Changed from V1

| Feature | V1 | V2 |
|---------|----|----|
| Code templates | Required human-authored templates | Generates code from scratch |
| Research scope | Narrow, template-bound | Open-ended across ML domains |
| Search strategy | Linear | Agentic tree search |
| Result interpretation | Text-only | VLM feedback loop (reads its own plots) |
| Paper quality | Below acceptance threshold | One of three passed peer review |

The tradeoff: v1 had higher success rates because it operated within well-defined boundaries. V2 takes a broader, more exploratory approach — and fails more often. But when it succeeds, it produces genuinely novel work without human scaffolding.

---

## The Peer Review Test

Sakana AI, in collaboration with researchers at the University of British Columbia and the University of Oxford, submitted three fully AI-generated papers to the "I Can't Believe It's Not Better" (ICBINB) workshop at ICLR 2025. The conference organizers gave explicit permission for the AI-generated submissions.

### The Result

One paper was accepted. Titled "Compositional Regularization: Unexpected Obstacles in Enhancing Neural Network Generalization," it received an average reviewer score of **6.33** — above the workshop's acceptance threshold. Notably, it reported a **negative result**: the AI tried to develop novel regularization methods and found they didn't work as expected. It wrote up the failure honestly.

All three papers were withdrawn after the review process — this was always an experiment, not an attempt to sneak AI papers into the proceedings.

### The Caveats

The achievement is real, but context matters:

**The workshop accepts ~70% of submissions.** As Jodi Schneider, an associate professor at the University of Wisconsin-Madison, noted: "Would a mediocre graduate student get one paper in three accepted at a place that accepts 70 percent of papers? Sure."

**The paper was mediocre by expert assessment.** Jeff Clune, a co-author of the AI Scientist and professor at the University of British Columbia, acknowledged this. The system also made "embarrassing" citation errors — attributing a method to a 2016 paper instead of the original 1997 work.

**It's a workshop, not a main conference track.** Workshop papers receive less scrutiny than main track publications. The bar is intentionally lower, designed to encourage discussion of preliminary work.

Still — a fully autonomous system, operating without human templates, produced a paper that human reviewers judged worthy of acceptance. For $20-25 in compute costs. That's a meaningful threshold crossed, even with asterisks.

---

## The Nature Publication

The AI Scientist project — encompassing both v1 and v2 — has been published in Nature as an open-access paper. This represents the broader scientific community's recognition that automated scientific discovery is a legitimate research direction, not just a parlor trick.

The Nature publication was a collaboration between researchers at Sakana AI, UBC, the Vector Institute, and the University of Oxford. It includes new scaling results and discusses both the promise and challenges of AI-generated science.

---

## $20 Per Paper: The Economics of Automated Research

The cost breakdown for an AI Scientist-v2 paper:

- **Experiments:** $15-20 (compute for running code, tree search exploration)
- **Writing:** ~$5 (LLM API calls for paper generation)
- **Total:** ~$20-25 per paper

For comparison, a typical ML research paper involves months of researcher time (salary: $100K-200K/year for a PhD student, more for postdocs and faculty), compute costs that can range from hundreds to millions of dollars for frontier experiments, and weeks of writing and revision.

The AI Scientist doesn't replace frontier research. It can't train a new foundation model or build novel hardware. But for the kind of incremental ML research that fills workshop proceedings — hypothesis testing, ablation studies, method comparisons — $20 per paper changes the math entirely.

The system is **open source** on GitHub (1.9K stars for v2, 8.9K for v1), meaning anyone with API access can run it. Sakana AI, a Tokyo-based startup that has raised $200 million in funding, released the code to "foster the future development of this transformative technology."

---

## The Other Side: 21% of Peer Reviews Are AI-Generated

Weeks after the AI Scientist-v2 milestone, a different kind of AI-in-science story broke.

Pangram Labs analyzed all 19,490 submissions and 75,800 peer reviews for ICLR 2026 (scheduled for April in Rio de Janeiro). Their finding: **21% of peer reviews were fully generated by AI**. Over half showed some form of AI involvement — editing, assistance, or full generation.

### How It Was Discovered

Dozens of academics raised concerns on social media about suspicious reviews they received for ICLR 2026 submissions. Red flags included:

- **Hallucinated citations** — reviews referenced papers that don't exist
- **Unusually verbose feedback** — excessively long reviews with generic bullet points
- **Formulaic structure** — the telltale patterns of LLM-generated text

Pangram Labs, which builds AI detection tools, then conducted a systematic analysis across all reviews.

### The Troubling Correlation

AI-generated reviews correlated with **higher scores** despite **lower paper quality**. In other words, reviewers using AI to generate their reviews were more likely to accept papers that shouldn't have been accepted. The system meant to filter bad science was itself being automated in ways that degraded quality.

### The Scale of the Problem

ICLR 2026 received a record number of submissions — 19,490 papers needing review. The reviewer pool hasn't scaled proportionally. Researchers are overloaded, reviewing dozens of papers per conference cycle on top of their own research. The temptation to automate is understandable, even if the consequences are corrosive.

---

## The Collision: AI Writing Science and AI Reviewing Science

These two stories aren't separate. They're the same story.

The AI Scientist-v2 demonstrates that AI can produce research that passes peer review. The ICLR 2026 analysis demonstrates that peer review itself is increasingly automated. Put them together and you get a system where:

1. AI generates the research paper
2. AI generates the peer review
3. Humans rubber-stamp both

This isn't hypothetical. It's the current trajectory. And it raises questions that the research community is only beginning to grapple with:

**If AI can write papers that pass review, what does peer review actually validate?** The AI Scientist's accepted paper was, by expert assessment, mediocre. It passed because the bar was low enough. As AI-generated papers improve (and they will — this is v2), the bar needs to rise. But the bar can't rise if the reviewers are also AI.

**Who is accountable for AI-generated research?** If an AI Scientist paper contains an error — a flawed experiment, a misleading conclusion — who bears responsibility? The system's creators? The conference that accepted it? The researchers whose names are on the submission?

**Does volume replace rigor?** At $20 per paper, a single GPU cluster could produce thousands of research papers per day. Most would be incremental, many would be wrong, but some might contain genuine insights. Is that better or worse than the current system?

---

## The Competitive Landscape

Sakana AI isn't alone in building AI research tools, though the AI Scientist is the most ambitious end-to-end system:

**FutureHouse** — A philanthropically funded 10-year moonshot to build semi-autonomous AI scientists. Offers four specialized agents (Crow for general research, Falcon for literature reviews, Owl for identifying prior work, Phoenix for chemistry). Claims superhuman performance in literature search and synthesis.

**OpenScholar** (University of Washington / Allen Institute for AI) — An open-source model trained on 45 million scientific papers. Uses retrieval-augmented generation to synthesize research and cite sources. In tests, scientists preferred its responses to those written by human experts 51% of the time.

**Google DeepMind** — Has used AI to discover new materials (GNoME), solve protein structures (AlphaFold), and find new mathematical theorems (FunSearch). These are specialized tools, not general-purpose research agents.

The AI Scientist-v2 stands apart because it's the only system that handles the full pipeline autonomously — from idea to accepted paper — and it's open source.

---

## What Comes Next

The AI Scientist-v2 paper on ArXiv (2504.08066) lays out a clear trajectory: workshop-level today, main conference tomorrow, journal-quality eventually. Each version has been substantially more capable than the last.

Meanwhile, the institutions that science relies on — peer review, conference proceedings, journal publication — were built for a world where producing a research paper required months of human effort. When the cost drops to $20 and the time drops to hours, those institutions need to adapt or become irrelevant.

Some possible directions:

- **Mandatory AI disclosure** — requiring authors to declare AI involvement in paper generation (some conferences already do this)
- **AI detection for reviews** — tools like Pangram Labs becoming standard infrastructure for conferences
- **Computational reproducibility requirements** — demanding that all experiments be independently replicable, which AI-generated papers might actually be better at than human ones
- **New quality metrics** — moving beyond peer review scores to continuous, post-publication evaluation

The AI Scientist-v2 isn't the end of human science. Frontier research — the kind that requires genuine creativity, physical experiments, ethical judgment, and deep domain expertise — remains firmly human. But the long tail of incremental ML research, the workshop papers and ablation studies that fill conference proceedings, is now automatable at negligible cost.

The question isn't whether AI will write scientific papers. It already does. The question is whether the systems we built to judge scientific quality can evolve fast enough to handle it.

---

*Last updated: April 8, 2026*
