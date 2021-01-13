Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1502F40D7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 01:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437827AbhAMAnK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 19:43:10 -0500
Received: from mga02.intel.com ([134.134.136.20]:42628 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392354AbhAMAZS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 19:25:18 -0500
IronPort-SDR: qW++mxGElEWpS8dJLvbRmmpU9wE9lt4iCzT7yiacTVMhAx8D+vwB8qQtn/S82B8S5pTjlGr3zg
 mL9zar+oPbCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165214669"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; 
   d="scan'208";a="165214669"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 16:24:36 -0800
IronPort-SDR: +4OUGYuOePTRsocppVvFMXn19TYH8BKmARx/WdlGqXrQZx9eQb0i70mwb7ovjNL96fKrWhrxhv
 Lydg3auonUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; 
   d="scan'208";a="381636240"
Received: from lkp-server01.sh.intel.com (HELO 974c6bfa98f0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Jan 2021 16:24:35 -0800
Received: from kbuild by 974c6bfa98f0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzTxi-00002g-Hk; Wed, 13 Jan 2021 00:24:34 +0000
Date:   Wed, 13 Jan 2021 08:23:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 89795852c9c46b9b0701f7376d30a1c5ab4d146c
Message-ID: <5ffe3d98.0mhiZ1RZNZRONVey%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 89795852c9c46b9b0701f7376d30a1c5ab4d146c  usb: typec: ucsi: Add support for USB role switch

elapsed time: 725m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
um                            kunit_defconfig
powerpc                     akebono_defconfig
powerpc                  mpc866_ads_defconfig
mips                         db1xxx_defconfig
mips                           rs90_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                  cadence_csp_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
arm                         shannon_defconfig
sparc64                             defconfig
arm                            xcep_defconfig
arm                            hisi_defconfig
powerpc                     tqm8548_defconfig
riscv                            allyesconfig
sh                            titan_defconfig
mips                     loongson1c_defconfig
powerpc                      bamboo_defconfig
powerpc                      katmai_defconfig
sh                           se7343_defconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
ia64                          tiger_defconfig
mips                      loongson3_defconfig
arm                          collie_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
powerpc                       ebony_defconfig
arm                            lart_defconfig
arm                         lubbock_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
arm                           corgi_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
arm                       spear13xx_defconfig
arm                          moxart_defconfig
powerpc                    amigaone_defconfig
sh                          sdk7780_defconfig
arm                        spear3xx_defconfig
sh                                  defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
mips                        maltaup_defconfig
sh                        dreamcast_defconfig
powerpc                    socrates_defconfig
um                           x86_64_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     mpc5200_defconfig
sh                           se7724_defconfig
powerpc                      arches_defconfig
xtensa                       common_defconfig
arm                        oxnas_v6_defconfig
powerpc                  storcenter_defconfig
sparc64                          alldefconfig
powerpc                     kmeter1_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
arm                        magician_defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
mips                  cavium_octeon_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
microblaze                      mmu_defconfig
arm                         hackkit_defconfig
m68k                          atari_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
