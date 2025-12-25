# 가벼운 파이썬 베이스 이미지 사용 (용량 절약)
FROM python:3.11-slim

# 작업 폴더 설정
WORKDIR /app

# requirements.txt 파일'만' 먼저 복사
COPY requirements.txt .

# 파일에 적힌 리스트를 한방에 설치 (-r 옵션)
# --no-cache-dir은 설치 파일 찌꺼기를 남기지 않아서 이미지를 가볍게 해줌.
RUN pip install --no-cache-dir -r requirements.txt

# 나머지 소스코드 복사
COPY . .

# 파이썬에게 "내 소스는 src 폴더 안에 있어"라고 알려주기
# 이걸 하지 않는 경우 "ModuleNotFoundError: No module named 'devbooster'" 뜸.
ENV PYTHONPATH=/app/src

# 실행 명령어 (FastAPI 정석)
# 문법: uvicorn <패키지경로>.<파일명>:<FastAPI객체변수명>
# src 폴더가 PYTHONPATH에 있으니, devbooster부터 시작하면 된다.
CMD ["uvicorn","devbooster.api.main:app","--host","0.0.0.0","--port","5000"]