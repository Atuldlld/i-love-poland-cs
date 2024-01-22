//Notify client that addon exists serverside - doesn't work for some reason
//SetGlobalBool("DeathSoundsD2KIsInstalled", true)


//Main function
local function DeathSounds_D2K(Victim_d2k)

//Get player model
local ds_model = Victim_d2k:GetModel()
//Msg("" .. tostring(Victim_d2k:GetModel()) .. "\n")

//Get player settings
local ds_setting = Victim_d2k:GetInfoNum("deathsounds", 0)

//Default sound if model is not on the list
local ds_sound = "vo/npc/male01/pain0" .. math.random(1,9) .. ".wav"

//-------------------------------------------------------
//Combine Soldiers
if ds_setting == 1 || ((
ds_model == "models/player/combine_soldier.mdl"
||
ds_model == "models/player/combine_soldier_prisonguard.mdl"
||
ds_model == "models/player/combine_super_soldier.mdl"
) && ds_setting == 0 )

then

ds_sound = "npc/combine_soldier/die" .. math.random(1,3) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Alyx
if ds_setting == 2 || (
ds_model == "models/player/alyx.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,4)
if ds_decider <= 3 then ds_sound = "vo/npc/alyx/hurt0" .. math.random(4,6) .. ".wav" end
if ds_decider == 4 then ds_sound = "vo/npc/alyx/hurt08.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Barney
if ds_setting == 3 || (
ds_model == "models/player/barney.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,12)
if ds_decider <=9 then ds_sound = "vo/npc/barney/ba_pain0" .. math.random(1,9) .. ".wav" end
if ds_decider == 10 then ds_sound = "vo/npc/barney/ba_pain10.wav" end
if ds_decider == 11 then ds_sound = "vo/k_lab/ba_geethanks.wav" end
if ds_decider == 12 then ds_sound = "vo/npc/barney/ba_ohshit03.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Breen
if ds_setting == 4 || (
ds_model == "models/player/breen.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,4)
if ds_decider == 1 then ds_sound = "vo/citadel/br_gravgun.wav" end
if ds_decider == 2 then ds_sound = "vo/citadel/br_no.wav" end
if ds_decider == 3 then ds_sound = "vo/citadel/br_mock04.wav" end
if ds_decider == 4 then ds_sound = "vo/citadel/br_ohshit.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Dead Stuff & Headcrabs
if ds_setting == 5 || ((
ds_model == "models/player/charple.mdl"
||
ds_model == "models/player/corpse1.mdl"
||
ds_model == "models/player/soldier_stripped.mdl"
) && ds_setting == 0 )

then

ds_sound = "npc/headcrab/die" .. math.random(1,2) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Zombie
if ds_setting == 6 || (
ds_model == "models/player/zombie_classic.mdl"
&& ds_setting == 0 )

then

ds_sound = "npc/zombie/zombie_die" .. math.random(1,3) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Fast zombie
if ds_setting == 7 || (
ds_model == "models/player/zombie_fast.mdl"
&& ds_setting == 0 )

then

ds_sound = "npc/fast_zombie/wake1.wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Zombine
if ds_setting == 8 || (
ds_model == "models/player/zombie_soldier.mdl"
&& ds_setting == 0 )

then

ds_sound = "npc/zombine/zombine_die" .. math.random(1,2) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Female Rebel, Refugee, Medic
if ds_setting == 9 || ((
ds_model == "models/player/group01/female_01.mdl"
||
ds_model == "models/player/group01/female_02.mdl"
||
ds_model == "models/player/group01/female_03.mdl"
||
ds_model == "models/player/group01/female_04.mdl"
||
ds_model == "models/player/group01/female_06.mdl"
||
ds_model == "models/player/group01/female_05.mdl"
||
ds_model == "models/player/group01/female_07.mdl"
||
ds_model == "models/player/group03/female_01.mdl"
||
ds_model == "models/player/group03/female_02.mdl"
||
ds_model == "models/player/group03/female_03.mdl"
||
ds_model == "models/player/group03/female_04.mdl"
||
ds_model == "models/player/group03/female_05.mdl"
||
ds_model == "models/player/group03/female_06.mdl"
||
ds_model == "models/player/group03/female_07.mdl"
||
ds_model == "models/player/group03m/female_01.mdl"
||
ds_model == "models/player/group03m/female_02.mdl"
||
ds_model == "models/player/group03m/female_03.mdl"
||
ds_model == "models/player/group03m/female_04.mdl"
||
ds_model == "models/player/group03m/female_05.mdl"
||
ds_model == "models/player/group03m/female_06.mdl"
) && ds_setting == 0 )

then

ds_sound = "vo/npc/female01/pain0" .. math.random(1,9) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Male Rebel, Refugee, Medic
if ds_setting == 10 || ((
ds_model == "models/player/group01/male_01.mdl"
||
ds_model == "models/player/group01/male_02.mdl"
||
ds_model == "models/player/group01/male_03.mdl"
||
ds_model == "models/player/group01/male_04.mdl"
||
ds_model == "models/player/group01/male_05.mdl"
||
ds_model == "models/player/group01/male_06.mdl"
||
ds_model == "models/player/group01/male_07.mdl"
||
ds_model == "models/player/group01/male_08.mdl"
||
ds_model == "models/player/group01/male_09.mdl"
||
ds_model == "models/player/group03/male_01.mdl"
||
ds_model == "models/player/group03/male_02.mdl"
||
ds_model == "models/player/group03/male_03.mdl"
||
ds_model == "models/player/group03/male_04.mdl"
||
ds_model == "models/player/group03/male_05.mdl"
||
ds_model == "models/player/group03/male_06.mdl"
||
ds_model == "models/player/group03/male_07.mdl"
||
ds_model == "models/player/group03/male_08.mdl"
||
ds_model == "models/player/group03/male_09.mdl"
||
ds_model == "models/player/group02/male_02.mdl"
||
ds_model == "models/player/group02/male_04.mdl"
||
ds_model == "models/player/group02/male_06.mdl"
||
ds_model == "models/player/group02/male_08.mdl"
||
ds_model == "models/player/group03m/male_01.mdl"
||
ds_model == "models/player/group03m/male_02.mdl"
||
ds_model == "models/player/group03m/male_03.mdl"
||
ds_model == "models/player/group03m/male_04.mdl"
||
ds_model == "models/player/group03m/male_05.mdl"
||
ds_model == "models/player/group03m/male_06.mdl"
||
ds_model == "models/player/group03m/male_07.mdl"
||
ds_model == "models/player/group03m/male_08.mdl"
||
ds_model == "models/player/group03m/male_09.mdl"
) && ds_setting == 0 )

then

ds_sound = "vo/npc/male01/pain0" .. math.random(1,9) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Kleiner
if ds_setting == 11 || (
ds_model == "models/player/kleiner.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,4)
if ds_decider == 1 then ds_sound = "vo/k_lab/kl_hedyno03.wav" end
if ds_decider == 2 then ds_sound = "vo/k_lab/kl_ahhhh.wav" end
if ds_decider == 3 then ds_sound = "vo/k_lab/kl_fiddlesticks.wav" end
if ds_decider == 4 then ds_sound = "vo/k_lab/kl_ohdear.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Father Grigori
if ds_setting == 12 || (
ds_model == "models/player/monk.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,22)
if ds_decider <=9 then ds_sound = "vo/ravenholm/monk_rant0" .. math.random(1,9) .. ".wav" end
if ds_decider > 9 && ds_decider < 19 then ds_sound = "vo/ravenholm/monk_rant1" .. math.random(0,9) .. ".wav" end
if ds_decider <=20 then ds_sound = "vo/ravenholm/monk_rant2" .. math.random(0,2) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Mossman
if ds_setting == 13 || ((
ds_model == "models/player/mossman.mdl"
||
ds_model == "models/player/mossman_arctic.mdl"
) && ds_setting == 0 )

then

local ds_decider = math.random(1,2)
if ds_decider == 1 then ds_sound = "vo/eli_lab/mo_airlock0" .. math.random(1,2) .. ".wav" end
if ds_decider == 2 then ds_sound = "vo/eli_lab/mo_airlock0" .. math.random(3,4) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Odessa
if ds_setting == 14 || (
ds_model == "models/player/odessa.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,3)
if ds_decider == 1 then ds_sound = "vo/coast/odessa/nlo_cub_thatsthat.wav" end
if ds_decider == 2 then ds_sound = "vo/coast/odessa/nlo_cub_service.wav" end
if ds_decider == 3 then ds_sound = "vo/coast/odessa/nlo_cub_wherewasi.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Eli Vance
if ds_setting == 15 || (
ds_model == "models/player/eli.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,3)
if ds_decider == 1 then ds_sound = "vo/eli_lab/eli_wantyou.wav" end
if ds_decider == 2 then ds_sound = "vo/eli_lab/eli_goodvort.wav" end
if ds_decider == 3 then ds_sound = "vo/eli_lab/eli_lookaround.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Metrocop
if ds_setting == 16 || ((
ds_model == "models/player/police.mdl"
||
ds_model == "models/player/police_fem.mdl"
) && ds_setting == 0 )

then

ds_sound = "npc/metropolice/die" .. math.random(1,4) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Magnusson
if ds_setting == 17 || (
ds_model == "models/player/magnusson.mdl"
&& ds_setting == 0 )

then

local ds_decider = math.random(1,9)
if ds_decider == 1 then ds_sound = "vo/outland_12a/launch/mag_launch_check01.wav" end
if ds_decider == 2 then ds_sound = "vo/outland_12a/launch/mag_launch_check04.wav" end
if ds_decider == 3 then ds_sound = "vo/outland_12a/launch/mag_launch_check06.wav" end
if ds_decider == 4 then ds_sound = "vo/outland_12a/launch/mag_launch_check07.wav" end
if ds_decider == 5 then ds_sound = "vo/outland_12a/launch/mag_launch_check08.wav" end
if ds_decider == 6 then ds_sound = "vo/outland_12a/launch/mag_launch_check09.wav" end
if ds_decider == 7 then ds_sound = "vo/outland_12a/launch/mag_launch_check10.wav" end
if ds_decider == 8 then ds_sound = "vo/outland_12a/launch/mag_launch_check12a.wav" end
if ds_decider == 9 then ds_sound = "vo/outland_12a/launch/mag_launch_check12b.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Axis player
if ds_setting == 18 || (
ds_model == "models/player/dod_german.mdl"
&& ds_setting == 0 )

then

ds_sound = "player/damage/male/megapain" .. math.random(1,5) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Allied player
if ds_setting == 19 || (
ds_model == "models/player/dod_american.mdl"
&& ds_setting == 0 )

then

ds_sound = "player/damage/female/megapain" .. math.random(1,5) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Counter-Strike's T's and CT's
if ds_setting == 20 || ((
ds_model == "models/player/guerilla.mdl"
||
ds_model == "models/player/arctic.mdl"
||
ds_model == "models/player/leet.mdl"
||
ds_model == "models/player/phoenix.mdl"
||
ds_model == "models/player/gasmask.mdl"
||
ds_model == "models/player/riot.mdl"
||
ds_model == "models/player/swat.mdl"
||
ds_model == "models/player/urban.mdl"
) && ds_setting == 0 )

then

local ds_decider = math.random(1,9)
if ds_decider <= 6 then ds_sound = "player/death" .. math.random(1,6) .. ".wav" end
if ds_decider == 7 then ds_sound = "player/headshot1.wav" end
if ds_decider == 8 then ds_sound = "player/headshot2.wav" end
if ds_decider == 9 then ds_sound = "player/bhit_helmet-1.wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Hostages
if ds_setting == 21 || ((
ds_model == "models/player/hostage/hostage_01.mdl"
||
ds_model == "models/player/hostage/hostage_02.mdl"
||
ds_model == "models/player/hostage/hostage_03.mdl"
||
ds_model == "models/player/hostage/hostage_04.mdl"
) && ds_setting == 0 )

then

ds_sound = "hostage/hpain/hpain" .. math.random(1,6) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Poison headcrab
if ds_setting == 22

then

ds_sound = "npc/headcrab_poison/ph_pain" .. math.random(1,3) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Robotic
if ds_setting == 23

then

local ds_decider = math.random(1,5)
if ds_decider == 1 then ds_sound = "npc/scanner/scanner_explode_crash2.wav" end
if ds_decider == 2 || ds_decider == 3 then ds_sound = "npc/roller/mine/rmine_shockvehicle" .. math.random(1,2) .. ".wav" end
if ds_decider >= 4 then ds_sound = "npc/scanner/scanner_pain" .. math.random(1,2) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Neck Snap (Chell, Skeleton, G-Man)
if ds_setting == 24 || ((
ds_model == "models/player/p2_chell.mdl"
||
ds_model == "models/player/skeleton.mdl"
||
ds_model == "models/player/gman_high.mdl"
) && ds_setting == 0 )

then

ds_sound = "npc/barnacle/neck_snap" .. math.random(1,2) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Spy
if ds_setting == 25

then

local ds_decider = math.random(1,8)
if ds_decider <= 6 then ds_sound = "vo/spy_painsevere0" .. math.random(1,5) .. ".mp3" end
if ds_decider > 5 then ds_sound = "vo/spy_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Spy (Robot)
if ds_setting == 26

then

local ds_decider = math.random(1,8)
if ds_decider <= 6 then ds_sound = "vo/mvm/norm/spy_mvm_painsevere0" .. math.random(1,5) .. ".mp3" end
if ds_decider > 5 then ds_sound = "vo/mvm/norm/spy_mvm_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Soldier
if ds_setting == 27

then

local ds_decider = math.random(1,10)
if ds_decider <= 6 then ds_sound = "vo/soldier_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/soldier_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Soldier (Robot)
if ds_setting == 28

then

local ds_decider = math.random(1,10)
if ds_decider <= 6 then ds_sound = "vo/mvm/norm/soldier_mvm_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/mvm/norm/soldier_mvm_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Sniper
if ds_setting == 29

then

local ds_decider = math.random(1,8)
if ds_decider <= 4 then ds_sound = "vo/sniper_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/sniper_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Sniper (Robot)
if ds_setting == 30

then

local ds_decider = math.random(1,8)
if ds_decider <= 4 then ds_sound = "vo/mvm/norm/sniper_mvm_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/mvm/norm/sniper_mvm_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Scout
if ds_setting == 31

then

local ds_decider = math.random(1,9)
if ds_decider <= 6 then ds_sound = "vo/scout_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/scout_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Scout (Robot)
if ds_setting == 32

then

local ds_decider = math.random(1,9)
if ds_decider <= 6 then ds_sound = "vo/mvm/norm/scout_mvm_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/mvm/norm/scout_mvm_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Pyro
if ds_setting == 33

then

local ds_decider = math.random(1,9)
if ds_decider <= 6 then ds_sound = "vo/pyro_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/pyro_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Pyro (Robot)
if ds_setting == 34

then

local ds_decider = math.random(1,9)
if ds_decider <= 6 then ds_sound = "vo/mvm/norm/medic_mvm_painsevere0" .. math.random(1,6) .. ".mp3" end
if ds_decider > 6 then ds_sound = "vo/mvm/norm/medic_mvm_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Medic
if ds_setting == 35

then

local ds_decider = math.random(1,8)
if ds_decider <= 4 then ds_sound = "vo/medic_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/medic_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Medic (Robot)
if ds_setting == 36

then

local ds_decider = math.random(1,8)
if ds_decider <= 4 then ds_sound = "vo/mvm/norm/pyro_mvm_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/mvm/norm/pyro_mvm_paincrticialdeath0" .. math.random(1,4) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Heavy
if ds_setting == 37

then

local ds_decider = math.random(1,6)
if ds_decider <= 3 then ds_sound = "vo/heavy_painsevere0" .. math.random(1,3) .. ".mp3" end
if ds_decider > 3 then ds_sound = "vo/heavy_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Heavy (Robot)
if ds_setting == 38

then

local ds_decider = math.random(1,6)
if ds_decider <= 3 then ds_sound = "vo/mvm/norm/heavy_mvm_painsevere0" .. math.random(1,3) .. ".mp3" end
if ds_decider > 3 then ds_sound = "vo/mvm/norm/heavy_mvm_paincrticialdeath0" .. math.random(1,3) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Engineer
if ds_setting == 39

then

local ds_decider = math.random(1,13)
if ds_decider <= 7 then ds_sound = "vo/engineer_painsevere0" .. math.random(1,7) .. ".mp3" end
if ds_decider > 7 then ds_sound = "vo/engineer_paincrticialdeath0" .. math.random(1,6) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Engineer (Robot)
if ds_setting == 40

then

local ds_decider = math.random(1,13)
if ds_decider <= 7 then ds_sound = "vo/mvm/norm/engineer_mvm_painsevere0" .. math.random(1,7) .. ".mp3" end
if ds_decider > 7 then ds_sound = "vo/mvm/norm/engineer_mvm_paincrticialdeath0" .. math.random(1,6) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Demoman
if ds_setting == 41

then

local ds_decider = math.random(1,9)
if ds_decider <= 4 then ds_sound = "vo/demoman_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/demoman_paincrticialdeath0" .. math.random(1,5) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Demoman (Robot)
if ds_setting == 42

then

local ds_decider = math.random(1,9)
if ds_decider <= 4 then ds_sound = "vo/mvm/norm/demoman_mvm_painsevere0" .. math.random(1,4) .. ".mp3" end
if ds_decider > 4 then ds_sound = "vo/mvm/norm/demoman_mvm_paincrticialdeath0" .. math.random(1,5) .. ".mp3" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Sentry
if ds_setting == 43

then

ds_sound = "weapons/sentry_damage" .. math.random(1,4) .. ".wav"

end
//-------------------------------------------------------

//-------------------------------------------------------
//Francis
if ds_setting == 44

then

local ds_decider = math.random(1,22)
if ds_decider <= 22 then ds_sound = "player/survivor/voice/Biker/HurtCritical" .. math.random(10,11) .. ".wav" end
if ds_decider <= 20 then ds_sound = "player/survivor/voice/Biker/HurtCritical0" .. math.random(1,9) .. ".wav" end
if ds_decider <= 11 then ds_sound = "player/survivor/voice/Biker/DeathScream10.wav" end
if ds_decider <= 10 then ds_sound = "player/survivor/voice/Biker/DeathScream0" .. math.random(6,9) .. ".wav" end
if ds_decider <= 6 then ds_sound = "player/survivor/voice/Biker/DeathScream0" .. math.random(1,4) .. ".wav" end
if ds_decider <= 2 then ds_sound = "player/survivor/voice/Biker/IncapacitatedInjury0" .. math.random(1,2) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Louis
if ds_setting == 45

then

local ds_decider = math.random(1,13)
if ds_decider <= 13 then ds_sound = "player/survivor/voice/Manager/HurtCritical0" .. math.random(1,5) .. ".wav" end
if ds_decider <= 8 then ds_sound = "player/survivor/voice/Manager/DeathScream10.wav" end
if ds_decider <= 7 then ds_sound = "player/survivor/voice/Manager/DeathScream0" .. math.random(8,9) .. ".wav" end
if ds_decider <= 5 then ds_sound = "player/survivor/voice/Manager/DeathScream06.wav" end
if ds_decider <= 4 then ds_sound = "player/survivor/voice/Manager/DeathScream01.wav" end
if ds_decider <= 3 then ds_sound = "player/survivor/voice/Manager/IncapacitatedInjury0" .. math.random(1,3) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Bill
if ds_setting == 46

then

local ds_decider = math.random(1,12)
if ds_decider <= 12 then ds_sound = "player/survivor/voice/NamVet/HurtCritical0" .. math.random(7,9) .. ".wav" end
if ds_decider <= 9 then ds_sound = "player/survivor/voice/NamVet/HurtCritical05.wav" end
if ds_decider <= 8 then ds_sound = "player/survivor/voice/NamVet/HurtCritical03.wav" end
if ds_decider <= 7 then ds_sound = "player/survivor/voice/NamVet/HurtCritical01.wav" end
if ds_decider <= 6 then ds_sound = "player/survivor/voice/NamVet/DeathScream0" .. math.random(5,7) .. ".wav" end
if ds_decider <= 3 then ds_sound = "player/survivor/voice/NamVet/DeathScream02.wav" end
if ds_decider <= 2 then ds_sound = "player/survivor/voice/NamVet/IncapacitatedInjury0" .. math.random(1,2) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Zoey
if ds_setting == 47

then

local ds_decider = math.random(1,17)
if ds_decider <= 17 then ds_sound = "player/survivor/voice/TeenGirl/HurtCritical0" .. math.random(1,7) .. ".wav" end
if ds_decider <= 10 then ds_sound = "player/survivor/voice/TeenGirl/DeathScream0" .. math.random(5,8) .. ".wav" end
if ds_decider <= 6 then ds_sound = "player/survivor/voice/TeenGirl/DeathScream0" .. math.random(1,2) .. ".wav" end
if ds_decider <= 4 then ds_sound = "player/survivor/voice/TeenGirl/IncapacitatedInjury0" .. math.random(1,4) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Coach
if ds_setting == 48

then

local ds_decider = math.random(1,25)
if ds_decider <= 25 then ds_sound = "player/survivor/voice/coach/hurtcritical0" .. math.random(1,8) .. ".wav" end
if ds_decider <= 17 then ds_sound = "player/survivor/voice/coach/deathscream0" .. math.random(4,9) .. ".wav" end
if ds_decider <= 11 then ds_sound = "player/survivor/voice/coach/incapacitatedinjury" .. math.random(10,11) .. ".wav" end
if ds_decider <= 9 then ds_sound = "player/survivor/voice/coach/incapacitatedinjury0" .. math.random(1,9) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Nick
if ds_setting == 49

then

local ds_decider = math.random(1,14)
if ds_decider <= 14 then ds_sound = "player/survivor/voice/gambler/hurtcritical0" .. math.random(1,7) .. ".wav" end
if ds_decider <= 7 then ds_sound = "player/survivor/voice/gambler/deathscream0" .. math.random(3,7) .. ".wav" end
if ds_decider <= 2 then ds_sound = "player/survivor/voice/gambler/incapacitatedinjury0" .. math.random(2,3) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Ellis
if ds_setting == 50

then

local ds_decider = math.random(1,14)
if ds_decider <= 14 then ds_sound = "player/survivor/voice/mechanic/hurtcritical0" .. math.random(1,6) .. ".wav" end
if ds_decider <= 8 then ds_sound = "player/survivor/voice/mechanic/deathscream0" .. math.random(4,6) .. ".wav" end
if ds_decider <= 5 then ds_sound = "player/survivor/voice/mechanic/deathscream01.wav" end
if ds_decider <= 4 then ds_sound = "player/survivor/voice/mechanic/incapacitatedinjury05.wav" end
if ds_decider <= 3 then ds_sound = "player/survivor/voice/mechanic/incapacitatedinjury0" .. math.random(1,3) .. ".wav" end

end
//-------------------------------------------------------

//-------------------------------------------------------
//Rochelle
if ds_setting == 51

then

local ds_decider = math.random(1,7)
if ds_decider <= 7 then ds_sound = "player/survivor/voice/producer/hurtcritical0" .. math.random(1,4) .. ".wav" end
if ds_decider <= 3 then ds_sound = "player/survivor/voice/producer/deathscream01.wav" end
if ds_decider <= 2 then ds_sound = "player/survivor/voice/producer/incapacitatedinjury04.wav" end
if ds_decider == 1 then ds_sound = "player/survivor/voice/producer/incapacitatedinjury01.wav" end

end
//-------------------------------------------------------

//Play the actual death sound
Victim_d2k:EmitSound(ds_sound, 72, 100)

end

--------------------------------------------------------------------

//Execute this function on player death
hook.Add( "PlayerDeath", "DeathSoundsHook_D2K", DeathSounds_D2K )

//Remove the annoying flatline
local function RemoveGoddamnFlatline_D2K()
return true
end
hook.Add( "PlayerDeathSound", "RemoveFlatlineSound_D2K", RemoveGoddamnFlatline_D2K )

//Make sure clients download menu script
AddCSLuaFile("autorun/client/deathsounds_menu_d2k.lua")