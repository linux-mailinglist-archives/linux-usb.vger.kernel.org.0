Return-Path: <linux-usb+bounces-3453-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4267FC8DC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70041C20E54
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66247481AC;
	Tue, 28 Nov 2023 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz9AH9zh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3391BE
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701208698; x=1732744698;
  h=date:from:to:cc:subject:message-id;
  bh=r0HfzL+p7r/SJUixpvRL4whywb6BCGxlBLpvUQNJwF4=;
  b=cz9AH9zh4fRlQ1M6t0W5eF92nSlQQ3ZlzedmAD/hlfE9DZwWF7pDqQKb
   auS2Z//olrBBXOqxUO8v+Q+1EoxrMA24MKHxdc6n0ytDDBL5u7Ewe/HvF
   u7GDl6MA3OaqpfuPutMVX8kSZzhouwxU0NlxGzqI1jRssoIOQAFx9PLIC
   VYk3pPIfaDkAsV0yYq+Xt5xK0yT7m6GRSBdaWpOouqJVc6HtfMqO2bSuJ
   uw1GJrzNauBNDF65ZeOma+PmHV64o7IiZygop+FC0pyfrBj9DaW3kFhJa
   8L987WxvGVK69rJX1wDcQFGk+FeZVx7pzJ6a1jse/c46kHbntuoINKMVz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373220143"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="373220143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 13:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718530205"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="718530205"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Nov 2023 13:58:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r865n-00089w-0C;
	Tue, 28 Nov 2023 21:58:07 +0000
Date: Wed, 29 Nov 2023 05:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 24af68a0ed53629bdde7b53ef8c2be72580d293b
Message-ID: <202311290535.RwOFfMCA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 24af68a0ed53629bdde7b53ef8c2be72580d293b  usb: misc: onboard_usb_hub: Add support for Cypress CY7C6563x

elapsed time: 1577m

configs tested: 233
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231128   gcc  
arc                   randconfig-002-20231128   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                             rpc_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                         socfpga_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231128   gcc  
csky                  randconfig-002-20231128   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231128   gcc  
i386                  randconfig-012-20231128   gcc  
i386                  randconfig-013-20231128   gcc  
i386                  randconfig-014-20231128   gcc  
i386                  randconfig-015-20231128   gcc  
i386                  randconfig-016-20231128   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231128   gcc  
loongarch             randconfig-002-20231128   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231128   gcc  
nios2                 randconfig-002-20231128   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231128   gcc  
parisc                randconfig-002-20231128   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231128   gcc  
s390                  randconfig-002-20231128   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231128   gcc  
sh                    randconfig-002-20231128   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231128   gcc  
sparc64               randconfig-002-20231128   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231128   clang
x86_64       buildonly-randconfig-002-20231128   clang
x86_64       buildonly-randconfig-003-20231128   clang
x86_64       buildonly-randconfig-004-20231128   clang
x86_64       buildonly-randconfig-005-20231128   clang
x86_64       buildonly-randconfig-006-20231128   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231128   clang
x86_64                randconfig-012-20231128   clang
x86_64                randconfig-013-20231128   clang
x86_64                randconfig-014-20231128   clang
x86_64                randconfig-015-20231128   clang
x86_64                randconfig-016-20231128   clang
x86_64                randconfig-071-20231128   clang
x86_64                randconfig-072-20231128   clang
x86_64                randconfig-073-20231128   clang
x86_64                randconfig-074-20231128   clang
x86_64                randconfig-075-20231128   clang
x86_64                randconfig-076-20231128   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231128   gcc  
xtensa                randconfig-002-20231128   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

