from fastapi import FastAPI

app = FastAPI(title="Northbridge Referral API")


@app.get("/healthz")
def healthz() -> dict[str, str]:
    return {"status": "healthy"}


@app.get("/readyz")
def readyz() -> dict[str, str]:
    return {"status": "ready"}


@app.post("/referrals")
def create_referral(referral: dict) -> dict:
    return {"status": "accepted", "referral": referral}
