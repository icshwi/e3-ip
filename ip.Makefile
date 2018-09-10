#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Monday, September 10 09:56:53 CEST 2018
# version : 0.0.3


where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(E3_REQUIRE_TOOLS)/driver.makefile

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif


# *** ISSUES
# driver.makefile recursively read all include directories which were installed.
# The only way to exclude header files is....



iocStats_VERSION=
autosave_VERSION=
#asyn_VERSION=
busy_VERSION=
modbus_VERSION=
ipmiComm_VERSION=
#sequencer_VERSION=
sscan_VERSION=

std_VERSION=
ip_VERSION=
calc_VERSION=
pcre_VERSION=
stream_VERSION=
s7plc_VERSION=
recsync_VERSION=

devlib2_VERSION=
mrfioc2_VERSION=

exprtk_VERSION=
motor_VERSION=
ecmc_VERSION=
ethercatmc_VERSION=
ecmctraining_VERSION=


keypress_VERSION=
sysfs_VERSION=
symbolname_VERSION=
memDisplay_VERSION=
regdev_VERSION=
i2cDev_VERSION=

tosca_VERSION=
tsclib_VERSION=
ifcdaqdrv2_VERSION=

## The main issue is nds3, it is mandatory to disable it
## 
nds3_VERSION=
nds3epics_VERSION=
ifc14edrv_VERSION=
ifcfastint_VERSION=


nds_VERSION=
loki_VERSION=
nds_VERSION=
sis8300drv_VERSION=
sis8300_VERSION=
sis8300llrfdrv_VERSION=
sis8300llrf_VERSION=


ADSupport_VERSION=
ADCore_VERSION=
ADSimDetector_VERSION=
ADAndor_VERSION=
ADAndor3_VERSION=
ADPointGrey_VERSION=
ADProsilica_VERSION=

amcpico8_VERSION=
adpico8_VERSION=
adsis8300_VERSION=
adsis8300bcm_VERSION=
adsis8300bpm_VERSION=
adsis8300fc_VERSION=




APP:=ipApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

USR_INCLUDES += -I$(where_am_I)$(APPSRC)


USR_CFLAGS   += -Wno-unused-variable
USR_CFLAGS   += -Wno-unused-function
USR_CFLAGS   += -Wno-unused-but-set-variable
USR_CPPFLAGS += -Wno-unused-variable
USR_CPPFLAGS += -Wno-unused-function
USR_CPPFLAGS += -Wno-unused-but-set-variable


SOURCES += $(APPSRC)/devXxStrParm.c
SOURCES += $(APPSRC)/devXxEurotherm.c
SOURCES += $(APPSRC)/devAiHeidND261.c
SOURCES += $(APPSRC)/devAiMKS.c
SOURCES += $(APPSRC)/Keithley2kDMM.st
SOURCES += $(APPSRC)/Keithley65xxEM.st
SOURCES += $(APPSRC)/Keithley2kDMM_mf40.st
SOURCES += $(APPSRC)/Federal.st
SOURCES += $(APPSRC)/devMPC.c
SOURCES += $(APPSRC)/devGP307gpib.c  
SOURCES += $(APPSRC)/devXxHeidenhainGpib.c
SOURCES += $(APPSRC)/devXxAX301.c    
SOURCES += $(APPSRC)/devXxKeithleyDMM199Gpib.c
# SOURCES_vxWorks += $(APPSRC)/tyGSAsynInit.c
SOURCES += $(APPSRC)/devTelevac.c
SOURCES += $(APPSRC)/devTPG261.c

DBDS    += $(APPSRC)/ipSupport.dbd
# libip.so: undefined symbol: tyGSAsynInitBuffsize
# we excluded tyGSAsynInit.c because it will be needed
# for vxWorks, so I also exclude ipVXSupport, because
# driver.makefile combine all dbds to make one ip.dbd

# DBDS    += $(APPSRC)/ipVXSupport.dbd



TEMPLATES += $(wildcard $(APPDB)/*.db)
# ip has *.proto and *.protocol files in $(APPDB)
TEMPLATES += $(wildcard $(APPDB)/*.proto*)



# db rule is the default in RULES_E3, so add the empty one

db:
