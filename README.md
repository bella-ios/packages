<h1 align="left">
  Bella iOS: Your AI Personal Assistant
</h1>

## Motivation
It is either you are super busy with many tasks to do in your job or your daily life, or you need help to organize your thoughts and task organization application are not helping. Not all of us have the luxury to afford having a real personal assistant.

Based on market research study, we found the AI personal assistants technology is increasing and will be the future of assistants and planning based on AI.

We share the vision and passion to leverage the AI application to help us in our daily life to do tasks and also can support in organizing our meetings and notes in work.

Most of AI Personal Assistants available today soud like robotic, or just do not understand a pointless conversation just for chatting, without an instruction to execute.

AI personal assistants shall have the capacity to hold natural, humanized conversations based on daily life dialogs. AI personal assistants shall be able to execute an instruction or follow a command to do a task. And in general, AI personal assistants shall be helpful in different aspects of my daily life.

Based on the criteria above, we had the inspiration to create Bella, a Personal Assistant based on cutting-edge AI technology. We will create structured architecture, large coding capabilities, powerful capacity to develop and integrate new skills.

## Roadmap

Planning to support more architecture (i.e. Raspberry Pi, Android Store and Apple Stor). We will share more about our Roadmap and Timeline soon.

### Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) >= 18
- [npm](https://npmjs.com/) >= 9
- Supported OSes: Linux, macOS and Windows

### Installation

```sh
# Install Bella
npm install

# Build Bella
npm run build
```

### Usage

```sh
# Check the setup went well
npm run check

# Run
npm start

# Go to http://localhost:1337
# Hooray! Bella is running
```

### Docker Installation

```sh
# Install Bella
DOCKER_BUILDKIT=1 docker build . -t bella-ios:v0.1.0

# Run
docker run --rm --name bella-ios --privileged -tidp 1337:1337 --expose=1337 bella-ios:v0.1.0

# Go to http://localhost:1337
# Hooray! Leon is running
```

## Author

**Hesham Yasein** <heshamgyassin@gmail.com>

## License

[Bella iOS License](https://github.com/bella-ios/bella/blob/main/LICENSE.md)

Copyright (c) 2023-present, Bella iOS <bellaiospa@gmail.com>