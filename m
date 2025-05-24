Return-Path: <linux-usb+bounces-24275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18470AC2F64
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 13:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDBD04A5432
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 11:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9B21E1E19;
	Sat, 24 May 2025 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HliTy75j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658733E4
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748086853; cv=none; b=Yu+jzh2uenOPuMJ1R2zG4EXpQvA1xXOS0m0DS6cwI2R1k1YUYOjafm2Rd8NSPdY5O8t5JRX+wRq3fImSV5ZAYFu/X0x9rl746kwvcFfs88LDezIiCIYY1v7vpEuYY0iGaBX4IeYFmVTJgZZFuxWhJClljwKwCLb1lrxFe4K07a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748086853; c=relaxed/simple;
	bh=t4inW5MfwCWYgxzaVvn5AFo/CaWu4R5vGgQmhZ1Qmkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CinXMk5yymSxmm7aTorMcTXEedZZdJ1b4HbfoqfUWD89c3KJO+TnbyJQRJ8yqGYaYPvukS/iwDuoB0Viwx7KwhoRnsufWzoMQ1E5o2mTeYSZtwr6VuZUDQRj3dk6ZjC7FkMVw523sD/WHRx0eCet43ti+omEpykDldsI2kzO57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HliTy75j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748086852; x=1779622852;
  h=date:from:to:cc:subject:message-id;
  bh=t4inW5MfwCWYgxzaVvn5AFo/CaWu4R5vGgQmhZ1Qmkw=;
  b=HliTy75jOqIkJj1smZEYuOIX+OJPgb4teIU7I8a3wvns4V0UThthJMPu
   ZnI9jkXwJS7E7+Bnp9UgXNl4l9enemv4QYvpAsVBdt+7bW2EP7mrdFj0r
   vEOReLQhMZsjj3Aa7GaIZu1mrV0pBx0RteI0mjG9qWW1MjD92ysKHK9xl
   yIyiMQ4+Gg1LukA9vqFzDB6yU6iSNU5CizjOyJqXofMeooUKKynZN+MFJ
   SCx3yymklmy5CMTEx599tLI+F8tvTxOHdIQHGufilREfGSqet9xtjCHlE
   0cSmbjI1iIjvkH8f252Kbe+iQ0aFItZD4LTVkodiJP3hUbZepnvoe4Dnl
   g==;
X-CSE-ConnectionGUID: FzQR9k6NQQWCqSt55ND+Jw==
X-CSE-MsgGUID: fUAYzrd0S0yTCTpIY+w3XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49830353"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49830353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 04:40:51 -0700
X-CSE-ConnectionGUID: SEAWaiQ/Sk2ElDA9WObDGQ==
X-CSE-MsgGUID: B5ipWmu7Q9qEADTTYEm9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141396878"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2025 04:40:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uInF9-000RAW-11;
	Sat, 24 May 2025 11:40:47 +0000
Date: Sat, 24 May 2025 19:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS WITH WARNING
 e60acc420368e3fcb8c158207d37a502c4eee9e2
Message-ID: <202505241937.ZkLscr6M-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: e60acc420368e3fcb8c158207d37a502c4eee9e2  usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING macro

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
|-- csky-randconfig-002-20250523
|   |-- drivers-usb-misc-onboard_usb_dev.c:warning:onboard_dev_5744_i2c_read_byte-defined-but-not-used
|   `-- drivers-usb-misc-onboard_usb_dev.c:warning:onboard_dev_5744_i2c_write_byte-defined-but-not-used
|-- hexagon-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- hexagon-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- s390-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- s390-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- um-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
`-- um-allyesconfig
    |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
    `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup

elapsed time: 1450m

configs tested: 128
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250523    gcc-15.1.0
arc                   randconfig-002-20250523    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                      footbridge_defconfig    clang-17
arm                       imx_v4_v5_defconfig    clang-21
arm                        keystone_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250523    clang-16
arm                   randconfig-002-20250523    gcc-8.5.0
arm                   randconfig-003-20250523    gcc-7.5.0
arm                   randconfig-004-20250523    clang-21
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250523    gcc-8.5.0
arm64                 randconfig-002-20250523    clang-16
arm64                 randconfig-003-20250523    clang-21
arm64                 randconfig-004-20250523    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250523    gcc-10.5.0
csky                  randconfig-002-20250523    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250523    clang-21
hexagon               randconfig-002-20250523    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250523    clang-20
i386        buildonly-randconfig-002-20250523    clang-20
i386        buildonly-randconfig-003-20250523    clang-20
i386        buildonly-randconfig-004-20250523    clang-20
i386        buildonly-randconfig-005-20250523    clang-20
i386        buildonly-randconfig-006-20250523    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250523    gcc-15.1.0
loongarch             randconfig-002-20250523    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250523    gcc-10.5.0
nios2                 randconfig-002-20250523    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250523    gcc-9.3.0
parisc                randconfig-002-20250523    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250523    clang-21
powerpc               randconfig-002-20250523    clang-21
powerpc               randconfig-003-20250523    clang-20
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250523    clang-21
powerpc64             randconfig-002-20250523    clang-19
powerpc64             randconfig-003-20250523    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250523    gcc-8.5.0
riscv                 randconfig-002-20250523    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                  randconfig-001-20250523    gcc-6.5.0
s390                  randconfig-002-20250523    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250523    gcc-12.4.0
sh                    randconfig-002-20250523    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250523    gcc-10.3.0
sparc                 randconfig-002-20250523    gcc-10.3.0
sparc64               randconfig-001-20250523    gcc-9.3.0
sparc64               randconfig-002-20250523    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250523    gcc-12
um                    randconfig-002-20250523    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250523    gcc-12
x86_64      buildonly-randconfig-002-20250523    clang-20
x86_64      buildonly-randconfig-003-20250523    clang-20
x86_64      buildonly-randconfig-004-20250523    clang-20
x86_64      buildonly-randconfig-005-20250523    clang-20
x86_64      buildonly-randconfig-006-20250523    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250523    gcc-9.3.0
xtensa                randconfig-002-20250523    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

