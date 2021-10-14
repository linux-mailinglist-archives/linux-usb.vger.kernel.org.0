Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063C242D0D8
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 05:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJNDQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 23:16:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:50635 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230023AbhJNDQ4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 23:16:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214746147"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="214746147"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 20:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="659795844"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2021 20:14:50 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1marCj-0005Tq-U8; Thu, 14 Oct 2021 03:14:49 +0000
Date:   Thu, 14 Oct 2021 11:14:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c2115b2b16421d93d4993f3fe4c520e91d6fe801
Message-ID: <6167a0a1.S6OtonuHG02dfo0Y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c2115b2b16421d93d4993f3fe4c520e91d6fe801  usb: musb: dsps: Fix the probe error path

elapsed time: 898m

configs tested: 145
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211013
sparc                            allyesconfig
arm                  colibri_pxa300_defconfig
powerpc                       maple_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                              ul2_defconfig
arm                            mmp2_defconfig
powerpc                  storcenter_defconfig
arm                         lpc32xx_defconfig
um                               alldefconfig
um                                  defconfig
arm                        multi_v7_defconfig
powerpc                    sam440ep_defconfig
h8300                     edosk2674_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                             ezx_defconfig
arm                       omap2plus_defconfig
mips                        bcm47xx_defconfig
arm                        multi_v5_defconfig
sh                             shx3_defconfig
arm                      jornada720_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      mgcoge_defconfig
sh                           se7724_defconfig
powerpc                 mpc832x_mds_defconfig
mips                  decstation_64_defconfig
arm                     eseries_pxa_defconfig
arc                      axs103_smp_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
m68k                       m5208evb_defconfig
arm                        vexpress_defconfig
xtensa                       common_defconfig
sh                            migor_defconfig
powerpc64                        alldefconfig
mips                           xway_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
powerpc                        icon_defconfig
arm                         s3c6400_defconfig
powerpc                    klondike_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                      tqm8xx_defconfig
mips                     cu1830-neo_defconfig
mips                     loongson1b_defconfig
openrisc                    or1ksim_defconfig
m68k                       m5475evb_defconfig
mips                        omega2p_defconfig
m68k                        mvme147_defconfig
m68k                           sun3_defconfig
nios2                            alldefconfig
riscv                    nommu_virt_defconfig
mips                       bmips_be_defconfig
mips                        bcm63xx_defconfig
arm                  randconfig-c002-20211013
x86_64               randconfig-c001-20211013
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211013
x86_64               randconfig-a012-20211013
x86_64               randconfig-a016-20211013
x86_64               randconfig-a014-20211013
x86_64               randconfig-a013-20211013
x86_64               randconfig-a011-20211013
i386                 randconfig-a016-20211013
i386                 randconfig-a014-20211013
i386                 randconfig-a011-20211013
i386                 randconfig-a015-20211013
i386                 randconfig-a012-20211013
i386                 randconfig-a013-20211013
arc                  randconfig-r043-20211013
s390                 randconfig-r044-20211013
riscv                randconfig-r042-20211013
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211013
mips                 randconfig-c004-20211013
i386                 randconfig-c001-20211013
s390                 randconfig-c005-20211013
x86_64               randconfig-c007-20211013
powerpc              randconfig-c003-20211013
riscv                randconfig-c006-20211013
x86_64               randconfig-a004-20211013
x86_64               randconfig-a006-20211013
x86_64               randconfig-a001-20211013
x86_64               randconfig-a005-20211013
x86_64               randconfig-a002-20211013
x86_64               randconfig-a003-20211013
i386                 randconfig-a001-20211013
i386                 randconfig-a003-20211013
i386                 randconfig-a004-20211013
i386                 randconfig-a005-20211013
i386                 randconfig-a002-20211013
i386                 randconfig-a006-20211013
hexagon              randconfig-r041-20211013
hexagon              randconfig-r045-20211013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
