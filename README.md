# Docker

1. Docker 다운로드

> https://docs.docker.com/get-docker/
> 프로그램 설치하고 실행해야함.
> vscode 확장프로그램 설치

2. Dockerfile 생성

```dockerfile
# 기본 베이스 이미지(node16버전, alpine: 작은단위의 리눅스 버전 )
FROM node:16-alpine

# 이미지 파일안에서 어떤 디렉토리에 앱을 복사할 것인가?
WORKDIR /app

# WORKDIR 로 복사
# 레이어 시스템으로 구성되어있기 때문에 빈번히 작성되는 건 나중에 작성
# COPY <복사할 파일 경로> <이미지에서 파일이 위치할 경로> 형식
COPY package.json package-lock.json babel.config.json ./

# 리눅스에서 명령어 실행
# npm install 은 최신 버전을 설치한다. package-lock.json 을 참조하는 설치는 npm ci
RUN npm ci

# index 복사
COPY /src ./src

RUN npm run build
```

### docker 명령어

- docker build <-f 도커세팅파일> <-t 도커이미지이름(태그)> <실행하는 현재경로>

```
docker build -f Dockerfile -t fun-docker:v0.1 .
```

- 이미지 리스트보기

```
docker images
```

- docker 실행 (docker run)
- `-d`: 백그라운드에서 실행
- `-p`: 포트지정 8080:8080

```
docker run -d -p 8080:8080 fun-docker:v0.1
```

- 도커 컨테이너 리스트

```
// 전체 리스트
docker ps -a
// 실행중인 리스트
docker ps
```

- 도커 컨테이너 삭제

```
docker rm <컨테이너 아이디>
```

- 컨터이너 로그

```
docker logs <컨테이너 아이디>
```

- 토커 이미지 태그 지정(이름 추가)
- docker tag <기존이미지이름> <추구할이미지이름>

```
docker tag fun-docker:v0.3 mk0131/node:v0.3
```

### docker Hub

- github 과 똑같다고 생각하면 된다.
- 도커허브에 repo 생성

```
// 도커 로그인
docker login

//
```
