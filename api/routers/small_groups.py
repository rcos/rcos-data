from typing import Optional
from fastapi import APIRouter
from fastapi.param_functions import Query
from starlette.exceptions import HTTPException

router = APIRouter(
    prefix="/small_groups",
    tags=["small_groups"],
)


@router.get("/")
async def list_small_groups(semester_id: str):
    raise HTTPException(status_code=501)


@router.get("/{small_group_id}")
async def get_small_group(small_group_id: str):
    raise HTTPException(status_code=501)


@router.get("/{small_group_id}/projects")
async def get_small_group_projects(small_group_id: str):
    raise HTTPException(status_code=501)


@router.get("/{small_group_id}/mentors")
async def get_small_group_mentors(small_group_id: str):
    raise HTTPException(status_code=501)