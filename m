Return-Path: <linux-usb+bounces-2680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E707E52BB
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 10:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EDC41C20D9E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E81F101F6;
	Wed,  8 Nov 2023 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBwbq73c"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0595FC17
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 09:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DC7199
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699436391; x=1730972391;
  h=date:from:to:cc:subject:message-id;
  bh=CMbeCoUBjY79g4vzsB4egY6LCB1Gcivd0T2uoF7ix6A=;
  b=BBwbq73ckILlltVc1wIlvViEOlyswu25gi43DEBzRcKPWq+jC9egeqB2
   O+vg0wYReWcqFaVGNDkDUiulNa/EJQM0usMyWxFgINxdHLFo7X5JLCaqW
   z76dpuM6hkaPFmzrHySFlnIyAf7VBRFKT415xqEke+jt0CNNbrLEFVUgh
   aUjrQ41oHpzT1YPUtfLujOw2yInzYk+7dY5b2gziaSU1+mHspdNyahKCC
   KoelQv7m1UNmrELYQcCmWAR/qe2oD+txQAzENRqsRqLQMaOlkUBy58Poj
   fnwOUBrB6XHR4sOJlieity8rkhwP5zwP79oMiG0upgheY2+oPtUGi6Sjv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456223591"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456223591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="763004529"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="763004529"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Nov 2023 01:39:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0f28-0007rD-34;
	Wed, 08 Nov 2023 09:39:36 +0000
Date: Wed, 08 Nov 2023 17:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1a229d8690a0f8951fc4aa8b76a7efab0d8de342
Message-ID: <202311081728.1wEYuGU6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1a229d8690a0f8951fc4aa8b76a7efab0d8de342  Revert "usb: phy: add usb phy notify port status API"

elapsed time: 1575m

configs tested: 239
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231107   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231107   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231107   gcc  
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-002-20231107   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-003-20231107   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-004-20231107   gcc  
arm                   randconfig-004-20231108   gcc  
arm                           sunxi_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231107   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-002-20231107   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-003-20231107   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-004-20231107   gcc  
arm64                 randconfig-004-20231108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231107   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231107   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231107   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231107   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231107   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231107   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231107   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231107   gcc  
i386                  randconfig-006-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231107   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231107   gcc  
loongarch             randconfig-002-20231108   gcc  
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
mips                 decstation_r4k_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                          rb532_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231107   gcc  
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-002-20231107   gcc  
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231107   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231107   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc               randconfig-001-20231107   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-002-20231107   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-003-20231107   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc64                           defconfig   gcc  
powerpc64             randconfig-001-20231107   gcc  
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-002-20231107   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-003-20231107   gcc  
powerpc64             randconfig-003-20231108   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231107   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231107   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231107   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231107   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231107   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231107   gcc  
sh                    randconfig-002-20231108   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231107   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231107   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231107   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231107   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231107   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231107   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231107   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-002-20231107   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-003-20231107   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-004-20231107   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-005-20231107   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-006-20231107   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-011-20231107   gcc  
x86_64                randconfig-011-20231108   gcc  
x86_64                randconfig-012-20231107   gcc  
x86_64                randconfig-012-20231108   gcc  
x86_64                randconfig-013-20231107   gcc  
x86_64                randconfig-013-20231108   gcc  
x86_64                randconfig-014-20231107   gcc  
x86_64                randconfig-014-20231108   gcc  
x86_64                randconfig-015-20231107   gcc  
x86_64                randconfig-015-20231108   gcc  
x86_64                randconfig-016-20231107   gcc  
x86_64                randconfig-016-20231108   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                randconfig-001-20231107   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231107   gcc  
xtensa                randconfig-002-20231108   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

