# Ava Advisor MCP server

**Your AI watches the markets so you can live your life.**

[Ava Advisor](https://ava.fund) is a personal investment advisor for everybody. This MCP server connects your AI assistant
(Claude, Cursor, or any client that supports remote MCP servers) to the same financial intelligence, so you can ask
in plain words and get answers grounded in structured market data.

- **Screen stocks in plain words.** "Biotech stocks with debt-to-equity below 3 that are turning profitable this year,
  showing a bullish divergence." Your AI turns that into one combined screen across fundamentals, technicals and options,
  and refines it as you talk.
- **Know why markets move.** News is mapped to the stocks, themes and assets it actually affects, with the direction,
  the reason and the ripple to connected companies.
- **See the whole picture.** A financial knowledge graph links themes, GICS sectors, peers, competitors and positioning.
- **Make it yours.** Your AI can read your Ava Advisor portfolios, playlists and notes. Personalised alerts on what
  matters to you live in the Ava Advisor app at [ava.fund](https://ava.fund).

| | |
|---|---|
| Endpoint | `https://mcp.ava.fund/mcp` |
| Transport | Streamable HTTP |
| Auth | OAuth (sign in with your Ava Advisor account), or an API key as a Bearer token |
| Registry | [`fund.ava/ava-advisor`](https://registry.modelcontextprotocol.io/v0.1/servers?search=fund.ava) in the official MCP Registry |

> Ava Advisor provides AI analysis of available data. It is not investment advice.

## Connect

### Claude (claude.ai and Claude Desktop)
1. Open **Settings → Connectors → Add custom connector**.
2. Name it `Ava Advisor` and set the URL to `https://mcp.ava.fund/mcp`.
3. Click **Connect** and sign in with your Ava Advisor account.

### Claude Code
```bash
claude mcp add --transport http ava-advisor https://mcp.ava.fund/mcp
```
Then run `/mcp` inside Claude Code to sign in. To use an API key instead, see [`configs/claude-code.sh`](configs/claude-code.sh).

### Cursor
Add the server to `~/.cursor/mcp.json` (or `.cursor/mcp.json` in a project). See [`configs/cursor.json`](configs/cursor.json),
which reads your key from the `AVA_ADVISOR_API_KEY` environment variable.

### Other MCP clients
Add a remote MCP server with the URL `https://mcp.ava.fund/mcp` (streamable HTTP). Clients that support MCP OAuth find
the sign-in automatically from `https://mcp.ava.fund/.well-known/oauth-protected-resource`. Otherwise, send
`Authorization: Bearer <your API key>`.

## API keys
Sign up at [ava.fund/console/auth/signup](https://ava.fund/console/auth/signup), then create a key at
[ava.fund/console/api-keys](https://ava.fund/console/api-keys).
Keep your key in an environment variable or your client's secret store. **Never commit it to a repository.**

## Example prompts
- "Find biotech stocks with debt-to-equity below 3 that are turning profitable this year."
- "Which semiconductor stocks moved most on news this week, and why?"
- "What's the ripple effect of the latest copper news on miners and EV makers?"
- "How is my portfolio exposed to this week's news?"

## Tools
35 tools, grouped by what they help you do.

**Screening & fundamentals**
| Tool | What it does |
|---|---|
| `screen_unified` | Combined universe, fundamental, technical and options screen |
| `edit_screen` | Change a screener formula by adding, removing or replacing conditions |
| `screen_stocks` | Cohort screener: winners, losers, most-talked-about |
| `screen_dividends` | Income screener |
| `financials` | Income statement, balance sheet and cash flow, with abnormality signals |

**News & impact**
| Tool | What it does |
|---|---|
| `pulse` | One market-pulse read for an asset, theme, sector or market |
| `brief` | A composed analyst brief: "how is <scope> doing right now?" |
| `search_news` | Semantic news search across stocks, FX, crypto, commodities, bond yields and rates |
| `news_feed` | Filtered impact feed by theme, country, aspect, direction or news type |
| `stock_impact` | How news moved one company, per article, with the reason why |
| `relationships` | Competitors and peers from the news-derived relationship graph |
| `private_movers` | Private and off-coverage companies the news moved within a theme |

**Themes**
| Tool | What it does |
|---|---|
| `list_themes` | Browse the megatrend taxonomy |
| `theme_summary` | Pre-composed brief for one megatrend theme |
| `theme_players` | Investable member companies of a theme |

**Prices & markets**
| Tool | What it does |
|---|---|
| `stock_prices` | Price context for a stock, ETF, forex pair, crypto or commodity (split-adjusted) |
| `stock_prices_batch` | The same for up to 50 tickers |
| `price_series` | Small bounded price series for charts, plus headline numbers |
| `options_sentiment` | What the US options market is saying about a name |
| `options_scan` | Find stocks by an options-behaviour pattern |
| `positioning` | Futures positioning (CFTC COT) |
| `cot_extremes` | Positioning extremes across commodities, FX, rates and indices |

**Macro**
| Tool | What it does |
|---|---|
| `fred_series` | One FRED macro series, feature-extracted |
| `wb_series` | World Bank annual indicators by country |
| `trade` | Trade flows, partners and balances (UN Comtrade) |

**Your account** (only your own data; ✎ = changes data)
| Tool | What it does |
|---|---|
| `list_portfolios` | List your portfolios |
| `portfolio_context` | AI-ready snapshot of one of your portfolios |
| `list_playlists` | List your playlists |
| `create_playlist` ✎ | Create a playlist |
| `add_to_playlist` ✎ | Add items to a playlist |
| `remove_from_playlist` ✎ | Remove items from a playlist |
| `write_note` ✎ | Save a note |
| `query_notes` | Search your notes |
| `get_note` | Read one note |

**Assist**
| Tool | What it does |
|---|---|
| `suggest_cta` | One or two data-backed "explore further" follow-ups |

## Security
See [SECURITY.md](SECURITY.md). Report issues privately to contact@ava.fund.

---
Ava Advisor is built by Market Anyware Co., Ltd. · [ava.fund](https://ava.fund)
