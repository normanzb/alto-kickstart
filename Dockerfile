FROM node:20-bullseye AS builder

RUN apt-get update && \
    apt-get install -y git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN corepack enable

WORKDIR /usr/src/app

# Clone the upstream bundler with submodules
RUN git clone https://github.com/pimlicolabs/alto.git
WORKDIR /usr/src/app/alto

# Install dependencies and build
RUN pnpm setup
RUN pnpm install -g @ecp.eth/rivet
RUN touch .foundry-version
RUN echo "v1.2.3" > .foundry-version
RUN rivet

RUN pnpm install --frozen-lockfile=false
RUN git submodule update --init --recursive
RUN pnpm build:all

FROM node:20-bullseye AS runtime

RUN apt-get update && \
    apt-get install -y git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN corepack enable

WORKDIR /usr/src/app/alto
COPY --from=builder /usr/src/app/alto .
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    chmod +x ./alto

ENTRYPOINT ["docker-entrypoint.sh"]
