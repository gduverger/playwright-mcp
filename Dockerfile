FROM node:20-bookworm

# Install Playwright MCP and Chromium with deps
RUN npm i -g @playwright/mcp@latest \
 && npx playwright install --with-deps chromium

# Default port (Railway will still inject $PORT)
EXPOSE 3000

# Start the HTTP/SSE server
CMD ["mcp-server-playwright","--host","0.0.0.0","--port","3000","--headless","--no-sandbox"]
