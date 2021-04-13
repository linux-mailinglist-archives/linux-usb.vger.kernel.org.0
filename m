Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7858F35E961
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 00:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347875AbhDMXAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 19:00:07 -0400
Received: from mga07.intel.com ([134.134.136.100]:7115 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229922AbhDMXAG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Apr 2021 19:00:06 -0400
IronPort-SDR: Rqw7lAdXpJGWlalgfiBMiCYkMPvsBQOs9e1fMHvqBaAi00ET7b7S5tPSRvyWziiPszyBnG5SVv
 wgo39UPskPgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="258487905"
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="258487905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 15:59:43 -0700
IronPort-SDR: XRZxn5oR/UqQKLj9iy0NJac5f/2d7fwQ0kwkcPS77Y5koz/TYpB0IZF+Nu853evLqpsjcKoV2j
 6mUdmJkGUTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="424452491"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 15:59:42 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWS0S-0001LO-BM; Tue, 13 Apr 2021 22:59:40 +0000
Date:   Wed, 14 Apr 2021 06:59:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 401411bbc4e62bcbcc020c2c458ecb90843140a8
Message-ID: <60762249.dgf6DOkgbF2Zp1Bb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 401411bbc4e62bcbcc020c2c458ecb90843140a8  usb: dwc2: Add exit clock gating before removing driver

elapsed time: 725m

configs tested: 149
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
sh                          rsk7203_defconfig
powerpc                  storcenter_defconfig
riscv                             allnoconfig
sh                        sh7785lcr_defconfig
h8300                       h8s-sim_defconfig
arc                      axs103_smp_defconfig
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
mips                         cobalt_defconfig
mips                       bmips_be_defconfig
powerpc                 canyonlands_defconfig
mips                  decstation_64_defconfig
arm                              alldefconfig
arc                         haps_hs_defconfig
powerpc                     taishan_defconfig
powerpc64                        alldefconfig
powerpc                     ksi8560_defconfig
xtensa                  cadence_csp_defconfig
sh                          rsk7269_defconfig
arm                       cns3420vb_defconfig
ia64                          tiger_defconfig
arc                        nsim_700_defconfig
openrisc                 simple_smp_defconfig
powerpc                      bamboo_defconfig
arm                            xcep_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
arm                       netwinder_defconfig
m68k                        mvme147_defconfig
ia64                            zx1_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           ip28_defconfig
powerpc                       ebony_defconfig
arm                          pcm027_defconfig
arm                           tegra_defconfig
powerpc                 mpc836x_mds_defconfig
arm                            zeus_defconfig
openrisc                         alldefconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          atari_defconfig
powerpc                    gamecube_defconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7780_defconfig
arm                         hackkit_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
arm                          pxa3xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
powerpc                 mpc834x_itx_defconfig
sparc64                             defconfig
powerpc                     sequoia_defconfig
powerpc                    amigaone_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
arm                           stm32_defconfig
arc                          axs101_defconfig
powerpc                   motionpro_defconfig
mips                        nlm_xlr_defconfig
mips                            gpr_defconfig
m68k                             allyesconfig
mips                         tb0219_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210413
x86_64               randconfig-a002-20210413
x86_64               randconfig-a001-20210413
x86_64               randconfig-a005-20210413
x86_64               randconfig-a006-20210413
x86_64               randconfig-a004-20210413
i386                 randconfig-a003-20210413
i386                 randconfig-a001-20210413
i386                 randconfig-a006-20210413
i386                 randconfig-a005-20210413
i386                 randconfig-a004-20210413
i386                 randconfig-a002-20210413
i386                 randconfig-a015-20210413
i386                 randconfig-a014-20210413
i386                 randconfig-a013-20210413
i386                 randconfig-a012-20210413
i386                 randconfig-a016-20210413
i386                 randconfig-a011-20210413
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210413
x86_64               randconfig-a015-20210413
x86_64               randconfig-a011-20210413
x86_64               randconfig-a013-20210413
x86_64               randconfig-a012-20210413
x86_64               randconfig-a016-20210413

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
