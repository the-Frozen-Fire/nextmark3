from datetime import datetime, timedelta, timezone
from jose import JWTError, jwt

SECRET_KEY = "change-me"  # TODO: load from environment variable
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30


def create_access_token(data: dict, expires_delta: timedelta | None = None) -> str:
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + (expires_delta or timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    to_encode["exp"] = expire
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)


def verify_access_token(token: str) -> dict:
    """Decode and verify a JWT. Raises JWTError on invalid or expired tokens."""
    return jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
