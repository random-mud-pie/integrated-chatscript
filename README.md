# Integrated ChatScript

[ChatScript](https://github.com/random-mud-pie/ChatScript)  is the next generation chatbot engine that has won the Loebner's 4 times and is the basis for natural language company for a variety of tech startups. It is a rule-based engine, where rules are created by humans writers in program scripts through a process called dialog flow scripting.

This repo contains a proof-of-concept integrated code (single main()) which sets up and executes a bot.

## Dependencies

- [CMake](https://cmake.org/)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [(Optional) rsync](https://rsync.samba.org/)
- [Ninja](https://ninja-build.org/)

# Building

```
make build
cd build
cmake -GNinja ..
cmake --build .
```

## License
All of the code which demonstrates a proof-of-concept of a bot leveraging ChatScript is licensed under the MIT License. Additional libraries may differ.
