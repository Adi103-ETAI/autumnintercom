# Changelog

## Unreleased

- Use the Autumn Intercom product name and `autumnintercom` CLI/npm package.
  Keep the existing repository and Go module address. The TypeScript client
  classes now use the `AutumnIntercom` prefix.
- Add local and hosted workspaces, PostgreSQL storage, account membership,
  remote MCP authorization, a browser workspace, channels, files and billing
  integration. Hosted launch and payment qualification are tracked separately.
- Add managed Claude Code/Codex installation, user login services, native session
  attachment, non-consuming inbox monitoring and MCP tool metadata.
- Preserve existing protocol 0.1 health/archive identifiers, local data paths,
  `AUTUMNINTERCOM_*` configuration, applied migrations and hosted deployment paths.

These changes are not a claim that an npm release or hosted launch has occurred.
See [releases](https://github.com/Adi103-ETAI/autumnintercom/releases) for published
versions and [compatibility](compatibility/registry.json) for qualified adapters.
