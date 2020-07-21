if {[catch {read_lef $::env(MERGED_LEF_UNPADDED)} errmsg]} {
    puts stderr $errmsg
    exit 1
} 

read_liberty $::env(LIB_SYNTH)

if {[catch {read_def $::env(CURRENT_DEF)} errmsg]} {
    puts stderr $errmsg
    exit 1
}  

set glb_cfg_file [open $::env(TMP_DIR)/glb.cfg w]
    puts $glb_cfg_file \
"set ::HALO_WIDTH_V 100
set ::HALO_WIDTH_H 100
set ::CHANNEL_WIDTH_V 100
set ::CHANNEL_WIDTH_H 100"
close $glb_cfg_file

macro_placement -global_config $::env(TMP_DIR)/glb.cfg

write_def $::env(SAVE_DEF)
