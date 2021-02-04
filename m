Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AE830E879
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 01:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhBDA2k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 19:28:40 -0500
Received: from mga04.intel.com ([192.55.52.120]:44145 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233392AbhBDA2h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 19:28:37 -0500
IronPort-SDR: FE92R87RK84JEHDeffhMnIQ3x0d/nnZWaTws6AvQ1r746f/0SJtrK8O1xo2EvHJycxTgMw3jwZ
 hWGT1tlSYGHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="178582056"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="178582056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 16:27:45 -0800
IronPort-SDR: POigOynnKPlW2+2erf3/CnjfYL0ccVuxC86nq0GDk9lAf3I3xeAtyX/9NaO5YKnJ8RofL+Uk6+
 /JQg/8u418dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="583002873"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2021 16:27:44 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l7SUq-0000ZG-8l; Thu, 04 Feb 2021 00:27:44 +0000
Date:   Thu, 04 Feb 2021 08:27:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d4a610635400ccc382792f6be69427078541c678
Message-ID: <601b3f78.YOUhNkYt2nz5wNVt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: d4a610635400ccc382792f6be69427078541c678  xhci: fix bounce buffer usage for non-sg list case

elapsed time: 725m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
powerpc                      mgcoge_defconfig
mips                        qi_lb60_defconfig
mips                        nlm_xlr_defconfig
powerpc                     kilauea_defconfig
sh                          rsk7203_defconfig
powerpc                    socrates_defconfig
arm                         mv78xx0_defconfig
powerpc                     stx_gp3_defconfig
powerpc                        icon_defconfig
sh                          polaris_defconfig
mips                           ip27_defconfig
ia64                          tiger_defconfig
mips                       lemote2f_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
openrisc                            defconfig
mips                      bmips_stb_defconfig
arc                           tb10x_defconfig
sh                          landisk_defconfig
m68k                            q40_defconfig
arc                    vdk_hs38_smp_defconfig
c6x                        evmc6474_defconfig
openrisc                  or1klitex_defconfig
powerpc                    klondike_defconfig
arm                          pcm027_defconfig
powerpc64                        alldefconfig
powerpc                    adder875_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           mtx1_defconfig
riscv                            allyesconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5208evb_defconfig
powerpc                        warp_defconfig
xtensa                  audio_kc705_defconfig
sh                     magicpanelr2_defconfig
arm                       omap2plus_defconfig
powerpc                       holly_defconfig
mips                       rbtx49xx_defconfig
mips                           ip32_defconfig
mips                      maltasmvp_defconfig
nds32                             allnoconfig
sh                          sdk7780_defconfig
sh                         microdev_defconfig
arm                          pxa168_defconfig
arc                          axs103_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
c6x                              alldefconfig
microblaze                      mmu_defconfig
mips                           ip28_defconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
ia64                            zx1_defconfig
mips                            e55_defconfig
arm                       netwinder_defconfig
xtensa                          iss_defconfig
arm                         orion5x_defconfig
arm                          collie_defconfig
arm                         axm55xx_defconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
arm                             mxs_defconfig
arm                      footbridge_defconfig
powerpc                          allyesconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                        fsp2_defconfig
arm                        keystone_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
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
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a001-20210203
i386                 randconfig-a005-20210203
i386                 randconfig-a003-20210203
i386                 randconfig-a006-20210203
i386                 randconfig-a002-20210203
i386                 randconfig-a004-20210203
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
i386                 randconfig-a013-20210203
i386                 randconfig-a016-20210203
i386                 randconfig-a014-20210203
i386                 randconfig-a012-20210203
i386                 randconfig-a015-20210203
i386                 randconfig-a011-20210203
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
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202
x86_64               randconfig-a013-20210203
x86_64               randconfig-a014-20210203
x86_64               randconfig-a015-20210203
x86_64               randconfig-a016-20210203
x86_64               randconfig-a011-20210203
x86_64               randconfig-a012-20210203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
