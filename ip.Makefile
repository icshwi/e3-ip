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
include $(where_am_I)/../configure/DECOUPLE_FLAGS

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif




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
