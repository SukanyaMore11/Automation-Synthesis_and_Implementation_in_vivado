open_project [pwd]/Automation/Automation.xpr
set_property source_mgmt_mode None [current_project]
update_compile_order -fileset sources_1	

foreach module_name $argv {
    set_property top [string trimright [lindex $module_name 0] ""] [current_fileset]
    set_property source_mgmt_mode None [current_project]
    update_compile_order -fileset sources_1

#for synthesis
    reset_run synth_1
    launch_runs synth_1 -jobs 12
    wait_on_run synth_1
    
    set file_handler [open "[pwd]/Automation/Automation.runs/synth_1/runme.log" "r"]
    set file_contents [read $file_handler]
    close $file_handler
    
    
# for implementation 
    reset_run impl_1
    launch_runs impl_1 -jobs 12
    wait_on_run impl_1

    set file_handler [open "[pwd]/Automation/Automation.runs/impl_1/runme.log" "r"]
    set file_contents [read $file_handler]
    close $file_handler
    
#creating test files in impl folder

    open_run impl_1
    report_power > Impl/[string trimright [lindex $module_name 0] ""]/power.txt
    report_timing > Impl/[string trimright [lindex $module_name 0] ""]/timing.txt
    report_utilization > Impl/[string trimright [lindex $module_name 0] ""]/utilization.txt
    set a $module_name
    set file_handler [open "Running_Status.txt" "a"]
    puts $file_handler "Implementation of $a has finished."
    close $file_handler
}
close_project
