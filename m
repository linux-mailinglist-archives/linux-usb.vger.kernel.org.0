Return-Path: <linux-usb+bounces-24233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59AAC0CB2
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 15:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7800E16A503
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07D128C00A;
	Thu, 22 May 2025 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1xgoPll"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D828BA9A
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920414; cv=none; b=LnRcB/arf/y4ELYXM+AaOIXtn8nuzkrNL8znhIhSuAuSWYq/GYf8jZtgSjqp20WIwtCzd/Ur4qwcR5nFooWMBly6UUJBdeINb0ey/WQmf7/BrozCqemHd3UpdFfBjEYJkF8ugyfrLZpsMVi2Z0xeiQLszEC/GqENtLCDpahKb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920414; c=relaxed/simple;
	bh=vgvRGOerh8wOca3KKMTUP/IEu1nwbYx4UQkZizTknpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MsQCjs4AwJUC4ImtiVQ/6Gqcpzs/vj+OTzLr5D8l8ZnUfwhRMCVGtai/0Jv6R8EFKDylaZmwzpnlojxIrekKNVodOUK8w50jfiG2wfmqqhjNrj053qhzTJ20QsjtTIFCdCVg1/EtDXlogfKptmlPjFFsa+r0dhTZ+qExFlBNlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1xgoPll; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747920413; x=1779456413;
  h=date:from:to:cc:subject:message-id;
  bh=vgvRGOerh8wOca3KKMTUP/IEu1nwbYx4UQkZizTknpk=;
  b=J1xgoPllQZHtGhXMMPAoA+BvBfmKxyL9ZJyT5FQbdpg9X8sjtS3qIZ9i
   zcT/8HGxPM+5gpRLHLZrzMaHHYuqRTU44Fer0G1skTJsLuesmo0srY+Ot
   NjXsTwtAdEp239yiiRZJQ+ggfADkgY1QcgyeHaghgYCLYwEfzpyvLmk/y
   QJFOJikFQVSFHZ7uIIvjWPqZsJbV55CfFHprIRpLNY/Cos4181zoTSOVF
   wQIqxiU1hK0f/nMjVdxvjVwbJ5YYIk6xVaO9KkfFL9McSi4cnC5ZShIOR
   LHM2i5svLwhC+CSAl10tm5lysKzX0iwMifABBiZT0JlcVzMtgpsklqhmb
   w==;
X-CSE-ConnectionGUID: b+eD2COXSpmdoiNuCi/axA==
X-CSE-MsgGUID: /MdSyoQYSz2UCRqGUcd3bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49862347"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49862347"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 06:26:50 -0700
X-CSE-ConnectionGUID: tcGwPiYqS/iuMUl9oLcqug==
X-CSE-MsgGUID: xxkC/SlwRNWhzoB3E8n+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140409090"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2025 06:26:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI5wb-000PNG-3C;
	Thu, 22 May 2025 13:26:45 +0000
Date: Thu, 22 May 2025 21:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 342e4955a1f1ce28c70a589999b76365082dbf10
Message-ID: <202505222104.HuPTgzRt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 342e4955a1f1ce28c70a589999b76365082dbf10  usb: usbtmc: Fix timeout value in get_stb

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505220522.rT5u07uk-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202505220644.tD2JYSkV-lkp@intel.com

    drivers/usb/misc/onboard_usb_dev.c:313:12: warning: 'onboard_dev_5744_i2c_read_byte' defined but not used [-Wunused-function]
    drivers/usb/misc/onboard_usb_dev.c:358:12: warning: 'onboard_dev_5744_i2c_write_byte' defined but not used [-Wunused-function]
    sound/usb/qcom/qc_audio_offload.c:1019: warning: Excess function parameter 'xfer_buf' description in 'uaudio_transfer_buffer_setup'
    sound/usb/qcom/qc_audio_offload.c:1019: warning: Function parameter or struct member 'xfer_buf_cpu' not described in 'uaudio_transfer_buffer_setup'

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arc-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- hexagon-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- hexagon-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- i386-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- loongarch-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- m68k-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- m68k-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- microblaze-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- microblaze-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- sh-randconfig-001-20250522
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- sparc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- um-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- um-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- x86_64-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
`-- xtensa-randconfig-002-20250522
    |-- drivers-usb-misc-onboard_usb_dev.c:warning:onboard_dev_5744_i2c_read_byte-defined-but-not-used
    `-- drivers-usb-misc-onboard_usb_dev.c:warning:onboard_dev_5744_i2c_write_byte-defined-but-not-used

elapsed time: 1456m

configs tested: 106
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    gcc-12.4.0
arm                              alldefconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-004-20250521    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250521    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250521    gcc-12
i386        buildonly-randconfig-006-20250521    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250521    gcc-12
x86_64      buildonly-randconfig-004-20250521    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

