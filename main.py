import os
from fastapi import FastAPI, Depends
from pydantic import BaseModel
from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy import create_engine

# Fetch DATABASE_URL from the environment variable
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres@localhost/traffic_violations")

# Set up SQLAlchemy engine, session and declarative base
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Create tables if they do not exist
Base.metadata.create_all(bind=engine)

# FastAPI app initialization
app = FastAPI()

# Define models
class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(255), unique=True, index=True)
    email = Column(String(255))
    password_hash = Column(String(255))

class Violation(Base):
    __tablename__ = "violations"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, index=True)
    description = Column(Text)
    location = Column(String)
    media_url = Column(String)
    status = Column(String, default='Pending')
    created_at = Column(DateTime)

# Pydantic model for violation creation
class ViolationCreate(BaseModel):
    user_id: int
    description: str
    location: str
    media_url: str

# Dependency to get the database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# POST endpoint to report a violation
@app.post("/report_violation/", response_model=ViolationCreate)
def report_violation(violation: ViolationCreate, db: Session = Depends(get_db)):
    db_violation = Violation(**violation.dict())
    db.add(db_violation)
    db.commit()
    db.refresh(db_violation)
    return db_violation

# GET endpoint to get all violations
@app.get("/dashboard_summary")
def get_dashboard_summary(db: Session = Depends(get_db)):
    # Query database for the required summary data
    total_reports = db.query(Violation).count()
    resolved_reports = db.query(Violation).filter(Violation.status == "Resolved").count()
    pending_reports = db.query(Violation).filter(Violation.status == "Pending").count()

    # Return the summary as a JSON response
    return {
        "total_reports": total_reports,
        "resolved_reports": resolved_reports,
        "pending_reports": pending_reports
    }
