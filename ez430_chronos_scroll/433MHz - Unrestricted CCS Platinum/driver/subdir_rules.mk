################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
driver/adc12.obj: ../driver/adc12.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/adc12.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/as.obj: ../driver/as.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/as.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/bmp_as.obj: ../driver/bmp_as.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/bmp_as.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/buzzer.obj: ../driver/buzzer.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/buzzer.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/display.obj: ../driver/display.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/display.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/pmm.obj: ../driver/pmm.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/pmm.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/ports.obj: ../driver/ports.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/ports.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/radio.obj: ../driver/radio.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/radio.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/rf1a.obj: ../driver/rf1a.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/rf1a.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

driver/timer.obj: ../driver/timer.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/bin/cl430" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\smpl_nwk_config.dat" --cmd_file="C:\Users\darkdanito\Documents\GitHub\Land-of-Hope\ez430_chronos_scroll\simpliciti\Applications\configuration\End Device\smpl_config.dat"  -vmspx --abi=coffabi -O4 --opt_for_speed=0 --include_path="E:/ti/ccsv6/ccs_base/msp430/include" --include_path="E:/ti/ccsv6/tools/compiler/ti-cgt-msp430_4.4.2/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/include" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/logic" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/driver" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/bluerobin" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Applications/application/End Device" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/boards/CC430EM/bsp_external" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/drivers/code" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/bsp/mcus" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/radios/family5" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/mrfi/smartrf" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk" --include_path="C:/Users/darkdanito/Documents/GitHub/Land-of-Hope/ez430_chronos_scroll/simpliciti/Components/nwk_applications" -g --define=__CC430F6137__ --define=__CCE__ --define=ISM_LF --define=MRFI_CC430 --diag_warning=225 --display_error_number --diag_wrap=off --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --call_assumptions=0 --gen_opt_info=2 --printf_support=minimal --preproc_with_compile --preproc_dependency="driver/timer.pp" --obj_directory="driver" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


