@echo off
rem Set paths
set "VRC_PROFILE_CACHE=%userprofile%\AppData\LocalLow\VRChat\VRChat"
set "VRC_ECACHE=E:\Games\VRCCache"
set "JSON_NAME=config.json"

rem Delete and recreate the cache folder (safely)
echo deleting appdata cache
cd "%temp%"
rmdir /s /q "%VRC_PROFILE_CACHE%"
timeout /t 1 /nobreak >nul
mkdir "%VRC_PROFILE_CACHE%"

rem Delete E Drive cache
rmdir /s /q "%VRC_ECACHE%"
timeout /t 1 /nobreak >nul
mkdir "%VRC_ECACHE%"

rem Recreate the config.json with exact formatting
> "%VRC_PROFILE_CACHE%\%JSON_NAME%" (
echo {
echo     "betas": [
echo         "particle_system_limiter"
echo     ],
echo     "ps_max_particles": 50,
echo     "ps_max_systems": 2,
echo     "ps_max_emission": 5,
echo     "ps_max_total_emission": 40,
echo     "ps_mesh_particle_divider": 6,
echo     "ps_mesh_particle_poly_limit": 50,
echo     "ps_collision_penalty_high": 5,
echo     "ps_collision_penalty_med": 3,
echo     "ps_collision_penalty_low": 1,
echo     "ps_trails_penalty": 1,
echo     "dynamic_bone_max_affected_transform_count": 4,
echo     "dynamic_bone_max_collider_check_count": 2,
echo     "cache_directory" : "E:/Games/VRCCache/"
echo }
)

echo VRChat cache has been wiped and config.json restored.
timeout /t 2 /nobreak >nul