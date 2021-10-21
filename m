Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1551436D19
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 23:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhJUVzM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 17:55:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:38123 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231446AbhJUVzK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 17:55:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="289994048"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="289994048"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 14:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="445004835"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2021 14:52:43 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mdfzO-000Epz-Ek; Thu, 21 Oct 2021 21:52:42 +0000
Date:   Fri, 22 Oct 2021 05:51:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 b851f7c7b8fd5365e447bb60e1e18eb6de628507
Message-ID: <6171e0f5.l4nfINt5C762Gmiq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: b851f7c7b8fd5365e447bb60e1e18eb6de628507  usb: dwc3: gadget: Change to dev_dbg() when queuing to inactive gadget/ep

elapsed time: 1599m

configs tested: 209
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211021
sh                         microdev_defconfig
arm                        mvebu_v5_defconfig
powerpc                       eiger_defconfig
ia64                      gensparse_defconfig
arm                         shannon_defconfig
arm                             pxa_defconfig
m68k                        mvme16x_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     asp8347_defconfig
m68k                         apollo_defconfig
arm                            mmp2_defconfig
arm                         vf610m4_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
powerpc                    amigaone_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                            hisi_defconfig
s390                             alldefconfig
sh                           se7780_defconfig
x86_64                           allyesconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
sh                            hp6xx_defconfig
powerpc                      ppc44x_defconfig
arm                  colibri_pxa300_defconfig
powerpc                   bluestone_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     sequoia_defconfig
arm                        magician_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          rm200_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
sh                 kfr2r09-romimage_defconfig
csky                             alldefconfig
powerpc                      ppc40x_defconfig
sh                             shx3_defconfig
parisc                           alldefconfig
powerpc                    klondike_defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    adder875_defconfig
mips                malta_qemu_32r6_defconfig
arc                            hsdk_defconfig
xtensa                       common_defconfig
powerpc                     tqm8548_defconfig
openrisc                 simple_smp_defconfig
mips                        omega2p_defconfig
mips                         mpc30x_defconfig
um                                  defconfig
arm                         orion5x_defconfig
sh                   sh7724_generic_defconfig
arm                           sama5_defconfig
powerpc                       ppc64_defconfig
arm                          gemini_defconfig
arm                        spear6xx_defconfig
powerpc                      ppc6xx_defconfig
arm                        trizeps4_defconfig
parisc                              defconfig
m68k                          atari_defconfig
mips                        qi_lb60_defconfig
m68k                                defconfig
powerpc                      obs600_defconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
arm                       aspeed_g4_defconfig
sh                             espt_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8540_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                            lart_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                         wii_defconfig
powerpc                          allmodconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
nios2                               defconfig
mips                       capcella_defconfig
arm                         s5pv210_defconfig
sh                          rsk7201_defconfig
sh                        edosk7760_defconfig
m68k                       bvme6000_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                          g5_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
mips                           gcw0_defconfig
mips                       rbtx49xx_defconfig
mips                          ath25_defconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20211019
i386                 randconfig-c001-20211019
x86_64               randconfig-c001-20211019
arm                  randconfig-c002-20211021
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20211020
i386                 randconfig-a003-20211020
i386                 randconfig-a002-20211020
i386                 randconfig-a005-20211020
i386                 randconfig-a006-20211020
i386                 randconfig-a001-20211020
x86_64               randconfig-a013-20211021
x86_64               randconfig-a015-20211021
x86_64               randconfig-a011-20211021
x86_64               randconfig-a014-20211021
x86_64               randconfig-a016-20211021
x86_64               randconfig-a012-20211021
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a012-20211021
i386                 randconfig-a013-20211021
i386                 randconfig-a011-20211021
i386                 randconfig-a016-20211021
i386                 randconfig-a015-20211021
i386                 randconfig-a014-20211021
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211020
arc                  randconfig-r043-20211021
riscv                randconfig-r042-20211021
s390                 randconfig-r044-20211021
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20211021
riscv                randconfig-c006-20211021
arm                  randconfig-c002-20211021
x86_64               randconfig-c007-20211021
mips                 randconfig-c004-20211021
s390                 randconfig-c005-20211021
i386                 randconfig-c001-20211021
x86_64               randconfig-a002-20211021
x86_64               randconfig-a004-20211021
x86_64               randconfig-a005-20211021
x86_64               randconfig-a001-20211021
x86_64               randconfig-a006-20211021
x86_64               randconfig-a003-20211021
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a004-20211021
i386                 randconfig-a003-20211021
i386                 randconfig-a002-20211021
i386                 randconfig-a005-20211021
i386                 randconfig-a001-20211021
i386                 randconfig-a006-20211021
hexagon              randconfig-r045-20211021
hexagon              randconfig-r041-20211021
riscv                randconfig-r042-20211020
s390                 randconfig-r044-20211020
hexagon              randconfig-r045-20211020
hexagon              randconfig-r041-20211020

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
