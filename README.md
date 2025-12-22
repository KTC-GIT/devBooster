# DevBooster

> 전자정부프레임워크 CRUD 코드 자동 생성기

[![Python](https://img.shields.io/badge/python-3.10+-blue.svg)](https://python.org)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 특징

- 📊 **Excel 명세서 기반**: 테이블 정의서(Excel)만 있으면 CRUD 코드 자동 생성
- 🔍 **지능형 진단**: PK 검사, Identifier 추천, 테이블 품질 분석
- 🎯 **전정프 표준**: 전자정부프레임워크 4.x 기준 완벽 준수
- 📦 **즉시 사용**: Mapper.xml, VO, Service, Controller 한 번에 생성
- 🔒 **폐쇄망 지원**: 오프라인 설치 가능

## 📦 설치

**개발 버전** -  PyPI 배포는 v1.0 릴리즈 후 진행됩니다.

```bash
git clone https://github.com/your-username/devbooster.git
cd devbooster
pip install -e .
```

**의존성**(자동 설치):
- click>=8.1.0
- pandas>=2.0.0
- openpyxl>=3.1.0
- jinja2>=3.1.0

### 빠른 시작
```bash
# Excel 파일로 CRUD 생성
devbooster generate -i tables.xlsx

# 결과: generated/generated.zip
```
## 📊 입력 형식 (Excel)

### 시트 구조

시트명이 테이블명이 됩니다 (예: `TB_NOTICE`)

| 컬럼명     | 데이터타입 | 길이| PK | NULL | 기본값| 설명      | 
|-----------|----------|-----|----|------|------|----------|
| NOTICE_ID | NUMBER   | 10  | Y  | N    |      | 공지사항ID |  
| TITLE     | VARCHAR2 | 200 | N  | N    |      | 제목      | 
| CONTENT   | CLOB     |     | N  | Y    |      | 내용      | 
| USE_YN    | CHAR     | 1   | N  | N    |      | 사용여부   |  

### 예제 파일
```bash
# 샘플 Excel 생성
python -m devbooster.examples.create_sample
```

## 📦 생성 결과
```
generated/
├─ notice/
│  ├─ NoticeMapper.xml      # MyBatis Mapper
│  ├─ NoticeMapper.java     # Mapper Interface
│  ├─ NoticeVO.java         # Value Object
│  ├─ NoticeService.java    # Service Interface
│  ├─ NoticeServiceImpl.java # Service 구현체
│  └─ EgovNoticeController.java # Controller
└─ generated.zip            # 전체 압축파일
```


## 🎨 주요 기능

### 1. 테이블 진단
```bash
$ devbooster generate -i tables.xlsx

📋 처리 중: TB_NOTICE
  PK: True
  품질: good
  ✅ Identifier: NOTICE_ID
```

### 2. PK 없는 테이블 지원
```bash
📋 처리 중: TB_ATTACH
  ⚠️  PK 없음 - Identifier 지정 필요
  
💡 추천 Identifier:
  1. BOARD_ID + FILE_SEQ (실용적 복합키)
  2. BOARD_ID
  3. FILE_SEQ
```

### 3. 논리삭제 자동 처리

USE_YN 또는 DEL_YN 컬럼이 있으면:
- DELETE 쿼리 → UPDATE로 자동 변경
- 목록 조회 시 자동 필터링


## 🛠️ 고급 사용

### 옵션
```bash
# 프레임워크 선택
devbooster generate -i tables.xlsx -f egov  # 전정프 (기본)
devbooster generate -i tables.xlsx -f boot  # Spring Boot

# 데이터베이스 선택
devbooster generate -i tables.xlsx -d oracle  # Oracle (기본)
devbooster generate -i tables.xlsx -d mysql   # MySQL

# 출력 디렉토리 지정
devbooster generate -i tables.xlsx -o output/
```

### Python API
```python
from devbooster.core.parser import parse_excel
from devbooster.core.analyzer import TableAnalyzer
from devbooster.core.renderer import TemplateRenderer
from devbooster.core.writer import FileWriter

# Excel 파싱
tables = parse_excel("tables.xlsx")

# 분석
analyzer = TableAnalyzer()
diagnosis = analyzer.analyze(tables[0])

# 코드 생성
renderer = TemplateRenderer()
outputs = renderer.render_all(tables[0])

# 파일 저장
writer = FileWriter()
writer.write_files(outputs, tables[0].module)
writer.create_zip()
```

## 📋 지원 환경

- **전자정부프레임워크**: 4.x 이상
- **Spring Framework**: 5.x 이상
- **Java**: 8 이상
- **Python**: 3.10 이상

## 🔒 폐쇄망 설치

### Wheels 방식
```bash
# 외부망에서 
pip download devbooster -d wheels/

# 폐쇄망에서
pip install --no-index --find-links=wheels/ devbooster
```

### 실행파일 방식 (추천, v1.0 릴리즈 후)
```bash
# 1. Releases에서 devbooster.exe 다운로드
# 2. 폐쇄망에 복사
# 3. 즉시 실행
devbooster.exe generate -i tables.xlsx
```

## 🎯 로드맵

- [x] v1.0: 전정프 CRUD 생성 (완료)
- [ ] v1.0: PyPI 배포 (12월 말)
- [ ] v1.1: FastAPI 버전
- [ ] v1.5: AI 코드 생성
- [ ] v2.0: Spring Boot 지원

## 📝 라이선스

MIT License

## 🔗 링크

- GitHub: https://github.com/KTC-GIT/devbooster
- Issues: https://github.com/KTC-GIT/devbooster/issues

## 🤝 기여

이슈와 PR은 언제나 환영합니다!
```