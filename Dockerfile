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

# container 가 실행될때 실행하는 명령어
ENTRYPOINT [ "npm", "start" ]

