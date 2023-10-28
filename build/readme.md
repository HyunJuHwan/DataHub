빌드 절차
========

## 빌드 사전 준비
- Docker Engine 설치
- git clone 받은 후
```bash
# city data hub 소스코드 다운로드
git submodule init 실행 
git submodule update --recursive 실행
# city data hub 소스코드에 수정사항 반영
cd build/core/datacore
git apply < ../../diff-core.txt
cd build/secure/security
git apply < ../../diff-security.txt
```

## 빌드 
```bash
cd build
# 소스코드 빌드
./all-build-java.sh
# Docker 이미지 빌드
./all-build-docker.sh
```