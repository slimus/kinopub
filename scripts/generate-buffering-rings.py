#!/usr/bin/env python3
"""Regenerate the PNG ring frames used by Roku's SceneGraph Poster node."""

from pathlib import Path
import math
import subprocess


OUTPUT = Path(__file__).resolve().parent.parent / "images" / "buffering"
OUTPUT.mkdir(parents=True, exist_ok=True)
CIRCUMFERENCE = 2 * math.pi * 51


def render(name: str, fraction: float, rotation: int = 0) -> None:
    length = CIRCUMFERENCE * fraction
    arc = "" if length == 0 else f'''
      <circle cx="72" cy="72" r="51" fill="none" stroke="#19B7BD"
        stroke-width="10" stroke-linecap="round"
        stroke-dasharray="{length:.3f} {CIRCUMFERENCE:.3f}"
        transform="rotate({rotation - 90} 72 72)"/>'''
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="144" height="144" viewBox="0 0 144 144">
      <circle cx="72" cy="72" r="70" fill="#07171C" fill-opacity=".86"/>
      <circle cx="72" cy="72" r="51" fill="none" stroke="#315259" stroke-width="10"/>
      {arc}
    </svg>'''
    subprocess.run(
        ["rsvg-convert", "--format=png", f"--output={OUTPUT / name}"],
        input=svg.encode(),
        check=True,
    )


for percent in range(0, 101, 5):
    render(f"progress-{percent:03}.png", percent / 100)

for frame in range(12):
    render(f"spinner-{frame:02}.png", 0.22, frame * 30)
