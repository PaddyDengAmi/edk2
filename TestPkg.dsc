## @file
# UEFI/PI Emulation Platform with UEFI HII interface supported.
#
# The Emulation Platform can be used to debug individual modules, prior to creating
# a real platform. This also provides an example for how an DSC is created.
#
# Copyright (c) 2006 - 2021, Intel Corporation. All rights reserved.<BR>
# Portions copyright (c) 2010 - 2011, Apple Inc. All rights reserved.<BR>
# Copyright (c) Microsoft Corporation.
#
# SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

[Defines]
  PLATFORM_NAME                  = TestPkg
  PLATFORM_GUID                  = d81b53b0-d946-4024-ac4f-e28334b0fd31
  PLATFORM_VERSION               = 0.3
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/TestPkg$(ARCH)

  SUPPORTED_ARCHITECTURES        = X64|IA32
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER               = DEFAULT


[SkuIds]
  0|DEFAULT

[LibraryClasses]
  StackCheckLib|MdePkg/Library/StackCheckLibNull/StackCheckLibNull.inf

# [PcdsFixedAtBuild]
#   gEfiMdePkgTokenSpaceGuid.PcdIpmiSsifSmbusSlaveAddr|1
[PcdsFixedAtBuild]
  gEfiMdePkgTokenSpaceGuid.PcdIpmiKcsIoBaseAddress|gEfiMdePkgTokenSpaceGuid.PcdIpmiSsifSmbusSlaveAddr

[Components]
  HelloWorld/HelloWorld.inf
  HelloWorld/HelloWorld.inf{
    <Defines>
      FILE_GUID = 1afc7087-645f-4e1a-8a08-2e732836f2d1
    <PcdsFixedAtBuild>
      gEfiMdePkgTokenSpaceGuid.PcdIpmiSsifSmbusSlaveAddr|2
  }

