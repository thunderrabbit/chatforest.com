# ChatForest Traffic & Promotion Plan

*Drafted: 2026-03-14, Run 29*

## The Problem

We have 24 pieces of quality content live at chatforest.com, but no traffic strategy beyond SEO. SEO alone takes 4-6 months to show results for a new domain. We need active promotion to bootstrap traffic while organic search catches up.

## Strategy: Three Channels

### Channel 1: Community Posting (Immediate, Free)

Post our content where developers already discuss MCP servers. The key is to **contribute genuinely** — share insights, not just links.

#### Reddit (Primary)

Target subreddits, ordered by relevance:

| Subreddit | Subscribers | Content fit | Self-promo rules |
|-----------|-------------|-------------|------------------|
| r/mcp | Growing | Direct match — MCP reviews, comparisons | Follow 1:10 rule (1 promo per 10 genuine comments) |
| r/ClaudeAI | Large | MCP content, AI tools | Must be genuinely helpful, not just links |
| r/LocalLLaMA | 500K+ | MCP tutorials, tool comparisons | 10% self-promo limit, tech-first insights |
| r/ChatGPT | Huge | MCP explainers, tool reviews | Very strict on promo — lead with value |
| r/artificial | Large | AI tools ecosystem content | Community-focused, link in comments not title |
| r/coding / r/programming | Huge | Tutorials, technical deep-dives | Technical quality must be high |

**Posting approach** (learned from Composio's successful Reddit strategy):
- Write posts as genuine technical reflections, not marketing
- Lead with the insight or finding, link to our review in context
- Example: "I tested 6 database MCP servers and the official Postgres one has a SQL injection bypass — here's what to use instead" with link to our comparison
- Engage in comments, answer questions, be helpful
- Build karma through genuine participation before posting our content

#### Hacker News

- **Show HN** is NOT appropriate — we're a content site, not a tool (Show HN requires something users can try)
- **Regular submissions** work — submit individual articles with factual titles
- Best candidates for HN:
  - "The official Postgres MCP server has a SQL injection vulnerability" (security angle = HN catnip)
  - "We tested every official MCP server — here's which ones are actually good" (mega-comparison)
  - "Playwright vs Puppeteer MCP: accessibility trees changed everything" (technical depth)
- **Timing**: Post between 8-10am ET on weekdays (peak HN traffic)
- **Engage**: Comments are a stronger ranking signal than upvotes — be ready to respond

#### Dev.to + Hashnode (Cross-posting)

- Cross-post our guides and comparison articles to Dev.to and Hashnode
- Set canonical URL back to chatforest.com (preserves SEO juice)
- Dev.to supports RSS import with automatic canonical URLs
- Hashnode offers free custom domain mapping
- Focus on tutorial/guide content (reviews may feel too promotional for these platforms)

**Best candidates for cross-posting:**
- "What Is MCP? A Developer's Guide"
- "How to Build Your First MCP Server"
- "Best MCP Servers for Developers in 2026"

#### Fediverse / Open-Source Reddit Alternatives

- **Lemmy** — federated, open-source Reddit alternative. Key instances:
  - lemmy.ml (general tech)
  - programming.dev (developers)
  - lemmy.world (largest instance)
  - Look for AI/MCP-specific communities
- **Kbin/Mbin** — hybrid Reddit/microblog, part of the Fediverse
  - kbin.social (main instance)
  - fedia.io
- **Tildes** — invite-only, high-quality discussion (like early HN)
  - ~comp and ~tech groups are relevant
  - Very anti-self-promotion — only post if content is genuinely exceptional

**Fediverse approach**: These communities are smaller but highly engaged. Quality over quantity. One well-received post on programming.dev could drive more engaged traffic than a Reddit post.

### Channel 2: SEO (Medium-term, Compounds)

Our content is already well-structured for SEO. Key optimizations:

#### Already done:
- Sitemap.xml ✓
- Robots.txt ✓
- RSS feed ✓
- Open Graph meta tags ✓
- Clean URLs (Hugo) ✓
- Mobile responsive ✓
- Fast load times (no JS, pure HTML/CSS) ✓

#### Should do next:
1. **Submit sitemap to Google Search Console** — requires Rob to verify the domain (Tier 3: account creation on Google)
2. **Add structured data (Schema.org)** — Review schema markup for review pages, Article schema for guides. This helps appear in rich results.
3. **Internal linking audit** — our content pyramid (mega-comparison → category comparisons → individual reviews) is already good, but we should add "Related reviews" sections to each article
4. **Target long-tail keywords** — our content naturally targets queries like "playwright mcp server review", "best database mcp servers 2026", "mcp server sql injection". These are low-competition, high-intent.
5. **Build backlinks** — submit to:
   - awesome-mcp-servers GitHub list (our reviews as resources)
   - PulseMCP / Glama directories (list chatforest.com as a resource)
   - MCP-related Discord servers (share reviews when relevant)

#### SEO timeline expectation:
- Months 1-3 (now): Indexing, foundation. Minimal organic traffic.
- Months 4-6: Early rankings on long-tail MCP keywords.
- Months 7-12: Meaningful organic traffic from search.

### Channel 3: Newsletter / Owned Audience (Long-term)

Email is the only channel we fully own. But this requires:
- An email service (Buttondown is free for <100 subscribers, no account cost)
- A signup form on the site
- Regular content to send

**Recommendation**: Don't start the newsletter yet. Wait until we have:
1. Some traffic (from channels 1 & 2)
2. A few hundred monthly visitors
3. Enough content velocity to send monthly updates

When ready, newsletter format could be: "MCP Ecosystem Monthly" — new reviews, notable MCP server releases, ecosystem news.

## What We Need From Rob

1. **Reddit account access or creation** — Grove needs a Reddit account to post/comment. This is Tier 3 (creating accounts on third-party platforms). Options:
   - Rob creates a "chatforest" or "grove_chatforest" Reddit account and shares credentials
   - Or Rob posts our content himself using his existing account

2. **Google Search Console verification** — Tier 3. Rob needs to add a DNS TXT record or HTML file to verify chatforest.com ownership, then add Grove as a user.

3. **Dev.to account** — Tier 3. Simple signup, free. For cross-posting content.

4. **Hashnode account** — Tier 3. Simple signup, free. For cross-posting content.

5. **Approval for community posting approach** — Is Rob comfortable with us posting on Reddit/HN under a "ChatForest" identity that's transparent about being AI-operated?

## Execution Priority

| Priority | Action | Effort | Impact | Blocker |
|----------|--------|--------|--------|---------|
| 1 | Submit to awesome-mcp-servers GitHub | Low | Medium | None (can PR now) |
| 2 | Cross-post guides to Dev.to | Low | Medium | Needs account (Tier 3) |
| 3 | Post security reviews on HN | Low | High (if it hits) | None (no account needed) |
| 4 | Reddit participation (r/mcp, r/ClaudeAI) | Medium | High | Needs account (Tier 3) |
| 5 | Google Search Console setup | Low | High (long-term) | Needs Rob for DNS verification |
| 6 | Add Schema.org structured data | Medium | Medium | None (developer work) |
| 7 | Cross-post to Lemmy/Fediverse | Low | Low-Medium | Needs account (Tier 3) |
| 8 | Newsletter setup | Medium | High (long-term) | Wait for traffic |

## What Grove Can Do Without Accounts

Even before Rob sets up accounts, there are things we can do:

1. **Add Schema.org structured data** to review and article pages (pure development work)
2. **Submit a PR to awesome-mcp-servers** on GitHub (if we have git push access to fork)
3. **Optimize internal linking** across our 24 content pieces
4. **Write content that's specifically designed to go viral** on HN/Reddit (security findings, contrarian takes, original research)
5. **Prepare cross-posting versions** of our best articles (adapted for Dev.to/Hashnode format)

## Social Media Assessment

| Platform | Worth it? | Why |
|----------|-----------|-----|
| X/Twitter | Maybe later | Good for AI/dev community, but needs consistent posting. Not a priority for launch. |
| LinkedIn | Maybe later | Good for B2B reach, but our audience is developers, not executives. |
| YouTube | No | Video production is outside our capabilities. |
| Discord | Yes (participate) | Many MCP/AI Discord servers where we can share reviews when relevant. |
| Mastodon | Low priority | Small but engaged dev community. Consider after Lemmy. |

## Key Principle

**We are transparent about being AI-operated.** This is not a secret — it's our brand differentiator. When posting on any platform, our bio/profile should say something like: "ChatForest — AI agents reviewing AI tools. Honestly. chatforest.com"

This transparency will attract some people (curious about AI-native content) and repel others (anti-AI sentiment). That's fine — our audience is developers who are already building with AI tools. They're pragmatic about AI authorship.
