FROM node:22-slim AS base

# Install Python
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-venv && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Node dependencies
COPY package.json package-lock.json* ./
RUN npm ci || npm install

# Install Python dependencies
COPY requirements.txt ./
RUN python3 -m venv /app/.venv && /app/.venv/bin/pip install --no-cache-dir -r requirements.txt

ENV PATH="/app/.venv/bin:$PATH"

# --- Production build ---
FROM base AS build
COPY theme/ theme/
COPY docs/ docs/
COPY mkdocs.yml ./
RUN npx @tailwindcss/cli -i theme/css/input.css -o docs/css/output.css --minify
RUN mkdocs build

FROM scratch AS output
COPY --from=build /app/site /site

# --- Dev server (hot reload) ---
FROM base AS dev
COPY entrypoint-dev.sh ./
RUN chmod +x entrypoint-dev.sh
EXPOSE 8000
ENTRYPOINT ["./entrypoint-dev.sh"]
