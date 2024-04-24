Return-Path: <linux-usb+bounces-9731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2E8B1399
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 21:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271FA283DC5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 19:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6050762D0;
	Wed, 24 Apr 2024 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPC/1J8M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EE1BF37
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713987273; cv=none; b=SrC5+VCroc4tyhyM9V5h83lHDDH1Go5+Kl2/XhJ3xNRLOX929gNweL+q4fn4XKCKgBNZ0jp00IdCjnsfp+6XNslfr4IhJ7Z64T5VwBJREHUOhlpSDj9NWriySzPuOik6Bmy7RmSczabMQnUAxnRaWrP3HLQ7eL4j1pQuc579OVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713987273; c=relaxed/simple;
	bh=uuUnBzPvGn20wxoZzlC10pCp+tsunBMvT87z+lgVPw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Og8LYGjOAzgNLqdTKhe9r0BkOQtn5zn8AY82sKjqbAk6g86TSSd5Ib9P89DSPq4QFsN+feIAubc1wOuv/gg6MbOfVB1rvOAebmv7G8k/goVdyfp6gSBOJu3+HA/ISGcnLNp4Qop1sCL3xNY0kaeMkI6KaxPIjexUQnyJN8b/2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPC/1J8M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713987270; x=1745523270;
  h=date:from:to:cc:subject:message-id;
  bh=uuUnBzPvGn20wxoZzlC10pCp+tsunBMvT87z+lgVPw8=;
  b=WPC/1J8M62HaDy/dUPFc2zQLPJddgeZ55jrSO0oRN0VrDRJg/0j1Bim7
   sI0gEg4LJKmXR4rP/EDMbaZXPrlMsAH6kSPon2768WvJCqAj9wxuE6aHm
   xxUjHbrTEh0naf6gLMXWSkmVV2s0GXzybEwlFDYMCHOXwNMbRPCEE7AV5
   2Kd31gfglsM1UZv1zI7Y3d9+N8LGmQr6pc7SC1Kf01MhSNhbqJGLAuSoO
   L//jc0HCJQQrLxfFfc2StVCHJ+dCot6a5tde8C9JUwAY8CwWiMv2u5FN6
   kUe+nXM8RyrqWOWCLCkwb3u+B6u0+6f/pqVVmHEFCJEgpmJLjkbGih+nJ
   g==;
X-CSE-ConnectionGUID: K/YRFIadRyyRrCB4sSiqTQ==
X-CSE-MsgGUID: aI8PnkZHRS6ldn4wsHXYlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="27100042"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="27100042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 12:34:30 -0700
X-CSE-ConnectionGUID: U1WviZKvRjCIhgtpSBXNXw==
X-CSE-MsgGUID: 3QdbD1nJQV62KeqgEb7cVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="62282565"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Apr 2024 12:34:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rziNu-0001bG-1Z;
	Wed, 24 Apr 2024 19:34:26 +0000
Date: Thu, 25 Apr 2024 03:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f2004e82abb679735e1dff99f9c94eb4bfe735b4
Message-ID: <202404250336.Ya1sBzOX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f2004e82abb679735e1dff99f9c94eb4bfe735b4  usb: typec: qcom-pmic: fix pdphy start() error handling

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-002-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-003-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-004-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-005-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-001-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- mips-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- um-allyesconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-015-20240424
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- x86_64-allyesconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1

elapsed time: 1176m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240424   gcc  
arc                   randconfig-002-20240424   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240424   gcc  
arm                   randconfig-002-20240424   gcc  
arm                   randconfig-003-20240424   gcc  
arm                         socfpga_defconfig   gcc  
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240424   gcc  
arm64                 randconfig-003-20240424   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240424   gcc  
csky                  randconfig-002-20240424   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240424   gcc  
i386         buildonly-randconfig-002-20240424   gcc  
i386         buildonly-randconfig-003-20240424   gcc  
i386         buildonly-randconfig-004-20240424   gcc  
i386         buildonly-randconfig-005-20240424   gcc  
i386         buildonly-randconfig-006-20240424   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240424   gcc  
i386                  randconfig-002-20240424   gcc  
i386                  randconfig-003-20240424   gcc  
i386                  randconfig-004-20240424   clang
i386                  randconfig-005-20240424   gcc  
i386                  randconfig-006-20240424   gcc  
i386                  randconfig-011-20240424   clang
i386                  randconfig-012-20240424   gcc  
i386                  randconfig-013-20240424   clang
i386                  randconfig-014-20240424   clang
i386                  randconfig-015-20240424   clang
i386                  randconfig-016-20240424   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240424   gcc  
loongarch             randconfig-002-20240424   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240424   gcc  
nios2                 randconfig-002-20240424   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240424   gcc  
parisc                randconfig-002-20240424   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-002-20240424   gcc  
powerpc               randconfig-003-20240424   gcc  
powerpc64             randconfig-001-20240424   gcc  
powerpc64             randconfig-002-20240424   gcc  
powerpc64             randconfig-003-20240424   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240424   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240424   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240424   gcc  
sh                    randconfig-002-20240424   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240424   gcc  
sparc64               randconfig-002-20240424   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240424   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240424   gcc  
xtensa                randconfig-002-20240424   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

