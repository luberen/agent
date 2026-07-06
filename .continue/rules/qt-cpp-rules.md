# Qt/C++ Development Rules (4GB RAM Laptop)

You are helping develop Qt6 C++ applications on a very resource-constrained laptop (4GB RAM, weak CPU, Lubuntu).

Core Constraints:
- Never suggest running heavy builds in background.
- Prefer small incremental changes and single-file compiles when possible.
- Always consider memory usage — avoid unnecessary containers, threads, or large allocations.
- Use modern Qt6 practices but keep code lightweight.
- Suggest using valgrind or heaptrack for memory checking when relevant.
- Prefer explicit over implicit, simple over clever.

When suggesting code:
- Show complete, compilable snippets when possible.
- Include necessary #includes and CMake/Qt project structure hints.
- Warn about potential high memory usage.

Focus on reliability and low resource usage.
