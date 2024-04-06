Return-Path: <linux-usb+bounces-8990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6089A8BF
	for <lists+linux-usb@lfdr.de>; Sat,  6 Apr 2024 05:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE47E283352
	for <lists+linux-usb@lfdr.de>; Sat,  6 Apr 2024 03:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC1118029;
	Sat,  6 Apr 2024 03:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0PDzLQO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEA3208B0
	for <linux-usb@vger.kernel.org>; Sat,  6 Apr 2024 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712375721; cv=none; b=MrqmqQhSmL2q91mcCkOM2kZd+NSH2D0nfJlK+qD4f55/QgMU5eLV1G6QtWX74jy9IVynD/KwvAocYLW2sEyh7RaRTJgMHYrzn93rK8fC/AbUNS/UXhmu5dicGEBShFaLbytTByFuAMnjOIy5dNMdGaYYqU/37t5lxfTsdP7wa1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712375721; c=relaxed/simple;
	bh=bq/IEl0lTbYXvy1kiSVHQUUdGjKB8GXvCLKp5fu58YM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihnfcvf4fQSdS1gjz0JLKLk2yzSpGfs2G1TVqPdio21ZEHZstYLkygZa6V6z4qoCrGJIrCyA+ibyRUdYnmsb6QXyMfpQpIHz1PE6qglKe2XV0lOs98QdzRrmpqgLSCAmb7/ZPLuiYCVNzQIFixbOMS+xNjZD+eis87v36r7fdmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0PDzLQO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712375719; x=1743911719;
  h=date:from:to:cc:subject:message-id;
  bh=bq/IEl0lTbYXvy1kiSVHQUUdGjKB8GXvCLKp5fu58YM=;
  b=e0PDzLQOzV/9r9HduFsq+W6OSCrcjGf39ffEVc7YPnIJJ9HOt2J3DPTC
   IELefH+d5jC4vBcMz6bgud0MKOmbV4vrMKYAgNA2R3ymGeAdoKiFH65FB
   1avJcSsYon+twBE8o16xzbNACm/LLcnFCjyDye6LZlQKb1wUc8HjtU2cR
   4VkpgxjdfM+bDZKoCnc/WmMYd7BqpeN+RfWkqixjEL43fZ1ZWLy6v+KOe
   vZnKOSJ9S8ivbGWIG+34PQgE4xyTDgrI8tOJ3yPWLWnFyhzfuZrK96hHB
   JCQC9js8n4/44Q1bDIIni5RW4KQr8AymSD34eB/JdThArPNnDTqCS8bQh
   A==;
X-CSE-ConnectionGUID: B0eGcXrqTtOkLDEJwd8kYg==
X-CSE-MsgGUID: UGP6aYZdRMa+iYUANGJgQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19153438"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19153438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 20:55:18 -0700
X-CSE-ConnectionGUID: HK8aOmGsRqm+M5FtWCFv9w==
X-CSE-MsgGUID: ikiokSalSBaN5nr2gFw4Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19382547"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2024 20:55:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsx98-00034W-2q;
	Sat, 06 Apr 2024 03:55:14 +0000
Date: Sat, 06 Apr 2024 11:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d464dac47260a33add5a206fd3289ec1216e8435
Message-ID: <202404061113.pJESLqLD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: d464dac47260a33add5a206fd3289ec1216e8435  usb: gadget: fsl: Initialize udc before using it

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
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
|-- i386-buildonly-randconfig-002-20240405
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
|-- openrisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allyesconfig
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
|-- hexagon-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- hexagon-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-003-20240405
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-004-20240405
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- s390-allmodconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1

elapsed time: 1286m

configs tested: 218
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
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240405   gcc  
arc                   randconfig-001-20240406   gcc  
arc                   randconfig-002-20240405   gcc  
arc                   randconfig-002-20240406   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                        multi_v5_defconfig   gcc  
arm                   randconfig-001-20240405   gcc  
arm                   randconfig-003-20240405   gcc  
arm                   randconfig-003-20240406   gcc  
arm                   randconfig-004-20240406   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240405   gcc  
arm64                 randconfig-002-20240405   gcc  
arm64                 randconfig-003-20240405   gcc  
arm64                 randconfig-004-20240405   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240405   gcc  
csky                  randconfig-001-20240406   gcc  
csky                  randconfig-002-20240405   gcc  
csky                  randconfig-002-20240406   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240405   gcc  
i386         buildonly-randconfig-001-20240406   clang
i386         buildonly-randconfig-002-20240405   gcc  
i386         buildonly-randconfig-002-20240406   clang
i386         buildonly-randconfig-003-20240405   clang
i386         buildonly-randconfig-004-20240405   gcc  
i386         buildonly-randconfig-004-20240406   clang
i386         buildonly-randconfig-005-20240405   clang
i386         buildonly-randconfig-006-20240405   clang
i386         buildonly-randconfig-006-20240406   clang
i386                                defconfig   clang
i386                  randconfig-001-20240405   clang
i386                  randconfig-001-20240406   clang
i386                  randconfig-002-20240405   gcc  
i386                  randconfig-003-20240405   clang
i386                  randconfig-003-20240406   clang
i386                  randconfig-004-20240405   clang
i386                  randconfig-004-20240406   clang
i386                  randconfig-005-20240405   clang
i386                  randconfig-005-20240406   clang
i386                  randconfig-006-20240405   gcc  
i386                  randconfig-011-20240405   clang
i386                  randconfig-011-20240406   clang
i386                  randconfig-012-20240405   gcc  
i386                  randconfig-012-20240406   clang
i386                  randconfig-013-20240405   gcc  
i386                  randconfig-013-20240406   clang
i386                  randconfig-014-20240405   gcc  
i386                  randconfig-015-20240405   gcc  
i386                  randconfig-015-20240406   clang
i386                  randconfig-016-20240405   clang
i386                  randconfig-016-20240406   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240405   gcc  
loongarch             randconfig-001-20240406   gcc  
loongarch             randconfig-002-20240405   gcc  
loongarch             randconfig-002-20240406   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240405   gcc  
nios2                 randconfig-001-20240406   gcc  
nios2                 randconfig-002-20240405   gcc  
nios2                 randconfig-002-20240406   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240405   gcc  
parisc                randconfig-001-20240406   gcc  
parisc                randconfig-002-20240405   gcc  
parisc                randconfig-002-20240406   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-003-20240406   gcc  
powerpc64             randconfig-001-20240405   gcc  
powerpc64             randconfig-001-20240406   gcc  
powerpc64             randconfig-002-20240405   gcc  
powerpc64             randconfig-002-20240406   gcc  
powerpc64             randconfig-003-20240406   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240406   gcc  
riscv                 randconfig-002-20240405   gcc  
riscv                 randconfig-002-20240406   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240406   gcc  
s390                  randconfig-002-20240405   gcc  
s390                  randconfig-002-20240406   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240405   gcc  
sh                    randconfig-001-20240406   gcc  
sh                    randconfig-002-20240405   gcc  
sh                    randconfig-002-20240406   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240405   gcc  
sparc64               randconfig-001-20240406   gcc  
sparc64               randconfig-002-20240405   gcc  
sparc64               randconfig-002-20240406   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240405   gcc  
um                    randconfig-002-20240406   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240406   gcc  
x86_64       buildonly-randconfig-003-20240405   gcc  
x86_64       buildonly-randconfig-004-20240405   gcc  
x86_64       buildonly-randconfig-004-20240406   gcc  
x86_64       buildonly-randconfig-005-20240406   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240406   gcc  
x86_64                randconfig-003-20240406   gcc  
x86_64                randconfig-004-20240405   gcc  
x86_64                randconfig-006-20240405   gcc  
x86_64                randconfig-011-20240406   gcc  
x86_64                randconfig-012-20240405   gcc  
x86_64                randconfig-013-20240405   gcc  
x86_64                randconfig-014-20240406   gcc  
x86_64                randconfig-015-20240405   gcc  
x86_64                randconfig-015-20240406   gcc  
x86_64                randconfig-016-20240405   gcc  
x86_64                randconfig-071-20240405   gcc  
x86_64                randconfig-072-20240405   gcc  
x86_64                randconfig-073-20240405   gcc  
x86_64                randconfig-074-20240405   gcc  
x86_64                randconfig-075-20240405   gcc  
x86_64                randconfig-076-20240405   gcc  
x86_64                randconfig-076-20240406   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240405   gcc  
xtensa                randconfig-001-20240406   gcc  
xtensa                randconfig-002-20240405   gcc  
xtensa                randconfig-002-20240406   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

