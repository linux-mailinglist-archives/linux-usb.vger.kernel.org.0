Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1796942E813
	for <lists+linux-usb@lfdr.de>; Fri, 15 Oct 2021 06:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbhJOEwV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Oct 2021 00:52:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:35636 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbhJOEwU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Oct 2021 00:52:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="214785165"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
   d="scan'208";a="214785165"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 21:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; 
   d="scan'208";a="492317775"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2021 21:50:13 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbFAa-0007E5-EP; Fri, 15 Oct 2021 04:50:12 +0000
Date:   Fri, 15 Oct 2021 12:50:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 660a92a59b9e831a0407e41ff62875656d30006e
Message-ID: <6169087c.xdCpyGLs4J+MekpN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 660a92a59b9e831a0407e41ff62875656d30006e  usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform

elapsed time: 945m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211014
mips                     loongson1b_defconfig
arm                            mmp2_defconfig
mips                          rb532_defconfig
arm                          exynos_defconfig
sh                        edosk7705_defconfig
arm                            zeus_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
s390                       zfcpdump_defconfig
mips                        qi_lb60_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     tqm8560_defconfig
arm                            qcom_defconfig
arc                      axs103_smp_defconfig
powerpc                   currituck_defconfig
mips                  decstation_64_defconfig
powerpc                     skiroot_defconfig
xtensa                         virt_defconfig
mips                         bigsur_defconfig
arc                              alldefconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
arc                     haps_hs_smp_defconfig
m68k                          atari_defconfig
um                                  defconfig
powerpc                      tqm8xx_defconfig
powerpc                    adder875_defconfig
arc                        nsim_700_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
powerpc                        warp_defconfig
openrisc                    or1ksim_defconfig
powerpc                   lite5200b_defconfig
arm                          gemini_defconfig
powerpc                      pasemi_defconfig
m68k                         apollo_defconfig
arm                       imx_v6_v7_defconfig
sh                            migor_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        vexpress_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     sequoia_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc                              defconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211014
x86_64               randconfig-a004-20211014
x86_64               randconfig-a001-20211014
x86_64               randconfig-a005-20211014
x86_64               randconfig-a002-20211014
x86_64               randconfig-a003-20211014
i386                 randconfig-a003-20211014
i386                 randconfig-a001-20211014
i386                 randconfig-a005-20211014
i386                 randconfig-a004-20211014
i386                 randconfig-a002-20211014
i386                 randconfig-a006-20211014
arc                  randconfig-r043-20211014
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211014
i386                 randconfig-c001-20211014
s390                 randconfig-c005-20211014
x86_64               randconfig-c007-20211014
powerpc              randconfig-c003-20211014
riscv                randconfig-c006-20211014
x86_64               randconfig-a012-20211014
x86_64               randconfig-a015-20211014
x86_64               randconfig-a016-20211014
x86_64               randconfig-a014-20211014
x86_64               randconfig-a011-20211014
x86_64               randconfig-a013-20211014
i386                 randconfig-a016-20211014
i386                 randconfig-a014-20211014
i386                 randconfig-a011-20211014
i386                 randconfig-a015-20211014
i386                 randconfig-a012-20211014
i386                 randconfig-a013-20211014
hexagon              randconfig-r041-20211014
s390                 randconfig-r044-20211014
riscv                randconfig-r042-20211014
hexagon              randconfig-r045-20211014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
