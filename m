Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF232C63E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355204AbhCDA2F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:28:05 -0500
Received: from mga01.intel.com ([192.55.52.88]:40620 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242176AbhCCWzn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 17:55:43 -0500
IronPort-SDR: 08a/WyVsrLjqmhB8IiKLFpV/Ku0YLnVy+x2V7kswZzSg99lVQXbrIgGTiPkKh+/QjDZGhEH26k
 m5S7kc78ByNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="206991410"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="206991410"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 14:52:30 -0800
IronPort-SDR: xWoO0PD2HvhtNrxaNv65KfJrkXeBb3CD/ZX4z/hFMirCQkSbtyH8FXGSp1HsIEeloP/iDEF7w5
 61MWCE+ip27g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="374262864"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2021 14:52:28 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHaM0-0001pL-C3; Wed, 03 Mar 2021 22:52:28 +0000
Date:   Thu, 04 Mar 2021 06:52:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 5e17812c22bcd65fa9202595eef4bbf8fa814144
Message-ID: <6040131f.auMvgehIX2dTeFpe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 5e17812c22bcd65fa9202595eef4bbf8fa814144  usb: dwc3: document usb_psy in struct dwc3

Error/Warning reports:

https://lore.kernel.org/linux-usb/202103040522.zSmSOlyU-lkp@intel.com

Error/Warning in current branch:

core.c:(.text+0x20f8): undefined reference to `power_supply_put'
core.c:(.text+0x560): undefined reference to `power_supply_get_by_name'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- mips-cavium_octeon_defconfig
    |-- core.c:(.text):undefined-reference-to-power_supply_get_by_name
    `-- core.c:(.text):undefined-reference-to-power_supply_put

elapsed time: 723m

configs tested: 143
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     pseries_defconfig
powerpc                     sbc8548_defconfig
arm                          iop32x_defconfig
sh                           se7721_defconfig
powerpc                  mpc885_ads_defconfig
i386                             alldefconfig
powerpc                    klondike_defconfig
sparc                       sparc64_defconfig
powerpc                       eiger_defconfig
powerpc                       maple_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
csky                             alldefconfig
powerpc                  iss476-smp_defconfig
m68k                             alldefconfig
mips                       capcella_defconfig
powerpc                         wii_defconfig
powerpc                      pmac32_defconfig
m68k                          multi_defconfig
powerpc                     mpc5200_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7751_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                      cm5200_defconfig
powerpc                     tqm8555_defconfig
sh                           se7722_defconfig
xtensa                generic_kc705_defconfig
arm                        mini2440_defconfig
mips                   sb1250_swarm_defconfig
mips                     loongson1b_defconfig
arm                             mxs_defconfig
sh                        sh7763rdp_defconfig
riscv                            allmodconfig
sh                           se7705_defconfig
h8300                     edosk2674_defconfig
arm                          pxa910_defconfig
mips                        nlm_xlp_defconfig
mips                      malta_kvm_defconfig
h8300                    h8300h-sim_defconfig
sh                          lboxre2_defconfig
arm                        shmobile_defconfig
nds32                             allnoconfig
arm                          exynos_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
mips                malta_kvm_guest_defconfig
arm                      footbridge_defconfig
alpha                            allyesconfig
powerpc                        cell_defconfig
arm                         orion5x_defconfig
arm                         bcm2835_defconfig
parisc                           alldefconfig
arm                            lart_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          lpd270_defconfig
powerpc                   motionpro_defconfig
mips                             allyesconfig
arc                        nsim_700_defconfig
sh                           sh2007_defconfig
m68k                           sun3_defconfig
powerpc                           allnoconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
arm                       netwinder_defconfig
arc                     nsimosci_hs_defconfig
xtensa                           allyesconfig
sh                         ap325rxa_defconfig
powerpc                     ep8248e_defconfig
arm                        multi_v5_defconfig
arm                        trizeps4_defconfig
alpha                            alldefconfig
powerpc                  storcenter_defconfig
arm                          collie_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a005-20210303
i386                 randconfig-a003-20210303
i386                 randconfig-a002-20210303
i386                 randconfig-a004-20210303
i386                 randconfig-a006-20210303
i386                 randconfig-a001-20210303
x86_64               randconfig-a013-20210303
x86_64               randconfig-a016-20210303
x86_64               randconfig-a015-20210303
x86_64               randconfig-a014-20210303
x86_64               randconfig-a012-20210303
x86_64               randconfig-a011-20210303
i386                 randconfig-a016-20210303
i386                 randconfig-a012-20210303
i386                 randconfig-a014-20210303
i386                 randconfig-a013-20210303
i386                 randconfig-a011-20210303
i386                 randconfig-a015-20210303
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210303
x86_64               randconfig-a001-20210303
x86_64               randconfig-a004-20210303
x86_64               randconfig-a002-20210303
x86_64               randconfig-a005-20210303
x86_64               randconfig-a003-20210303

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
