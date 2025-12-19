# scripts/create_sample_excel.py

import pandas as pd

# 샘플 데이터
data = {
    "컬럼명": ["NOTICE_ID", "TITLE", "CONTENT", "USE_YN", "SECRET_YN"],
    "데이터타입": ["NUMBER", "VARCHAR2", "CLOB", "CHAR", "CHAR"],
    "길이": [10, 200, None, 1, 1],
    "NULL": ["N", "N", "Y", "N", "N"],
    "기본값": [None, None, None, "Y", "N"],
    "설명": ["공지사항ID", "제목", "내용", "사용여부", "비밀글여부"]
}

df = pd.DataFrame(data)

# Excel 저장
df.to_excel("examples/test_simple.xlsx", sheet_name="TB_NOTICE", index=False)

print("✅ examples/test_simple.xlsx 생성 완료!")