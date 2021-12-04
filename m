Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25114681C4
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 02:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383954AbhLDBUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 20:20:54 -0500
Received: from mga12.intel.com ([192.55.52.136]:37493 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354658AbhLDBUx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Dec 2021 20:20:53 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="217105886"
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="217105886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 17:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="678300644"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Dec 2021 17:17:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtJg6-000IHO-Sy; Sat, 04 Dec 2021 01:17:26 +0000
Date:   Sat, 04 Dec 2021 09:17:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e1c72d907f4c3f4f859f0c5890d5326d804625dc
Message-ID: <61aac1a0.+PGSHjjQNQBdxG42%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e1c72d907f4c3f4f859f0c5890d5326d804625dc  usb: bdc: fix error handling code in bdc_resume

possible Warning in current branch (please contact us if interested):

include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'struct gpio_desc *' [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-buildonly-randconfig-r005-20211203
    `-- include-linux-kern_levels.h:warning:format-d-expects-argument-of-type-int-but-argument-has-type-struct-gpio_desc

elapsed time: 733m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
powerpc                      arches_defconfig
s390                             allyesconfig
arc                          axs101_defconfig
m68k                        m5407c3_defconfig
mips                        maltaup_defconfig
sparc                       sparc64_defconfig
mips                        vocore2_defconfig
powerpc                  mpc866_ads_defconfig
sh                          kfr2r09_defconfig
mips                           mtx1_defconfig
powerpc                     tqm8555_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7269_defconfig
mips                        jmr3927_defconfig
arc                        nsim_700_defconfig
arm                         s5pv210_defconfig
um                           x86_64_defconfig
mips                           xway_defconfig
arm                            xcep_defconfig
powerpc                       holly_defconfig
powerpc                      ppc40x_defconfig
h8300                            allyesconfig
arm                         axm55xx_defconfig
arm                          gemini_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
sh                         microdev_defconfig
powerpc                 canyonlands_defconfig
arm                      jornada720_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8272_ads_defconfig
arc                      axs103_smp_defconfig
arm                         palmz72_defconfig
xtensa                       common_defconfig
sh                         ap325rxa_defconfig
arm                         socfpga_defconfig
mips                          rm200_defconfig
mips                            gpr_defconfig
h8300                               defconfig
mips                         rt305x_defconfig
sh                           se7712_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc32_defconfig
sh                           se7751_defconfig
nios2                            allyesconfig
arm                          ep93xx_defconfig
powerpc                       eiger_defconfig
arm                       aspeed_g4_defconfig
sparc                            alldefconfig
mips                          malta_defconfig
powerpc                        warp_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20211204
arm                  randconfig-c002-20211203
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211203
x86_64               randconfig-a005-20211203
x86_64               randconfig-a001-20211203
x86_64               randconfig-a002-20211203
x86_64               randconfig-a004-20211203
x86_64               randconfig-a003-20211203
i386                 randconfig-a001-20211203
i386                 randconfig-a005-20211203
i386                 randconfig-a002-20211203
i386                 randconfig-a003-20211203
i386                 randconfig-a006-20211203
i386                 randconfig-a004-20211203
i386                 randconfig-a013-20211204
i386                 randconfig-a016-20211204
i386                 randconfig-a011-20211204
i386                 randconfig-a014-20211204
i386                 randconfig-a012-20211204
i386                 randconfig-a015-20211204
arc                  randconfig-r043-20211203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211203
x86_64               randconfig-c007-20211203
riscv                randconfig-c006-20211203
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
powerpc              randconfig-c003-20211203
s390                 randconfig-c005-20211203
x86_64               randconfig-a016-20211203
x86_64               randconfig-a011-20211203
x86_64               randconfig-a013-20211203
x86_64               randconfig-a014-20211203
x86_64               randconfig-a015-20211203
x86_64               randconfig-a012-20211203
i386                 randconfig-a016-20211203
i386                 randconfig-a013-20211203
i386                 randconfig-a011-20211203
i386                 randconfig-a014-20211203
i386                 randconfig-a012-20211203
i386                 randconfig-a015-20211203
hexagon              randconfig-r045-20211203
s390                 randconfig-r044-20211203
hexagon              randconfig-r041-20211203
riscv                randconfig-r042-20211203
hexagon              randconfig-r045-20211204
hexagon              randconfig-r041-20211204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
