Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499BB39AFAD
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 03:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFDBb2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 21:31:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:38445 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFDBb2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 21:31:28 -0400
IronPort-SDR: kN4JVnM2bc7U0nyUdgK/kdBo7tZtuil7/W8sU5xLLPNs7Pgf8Cfvz7bZvckQAaDxZGFLxbxo+5
 BqJnklpNYkFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191307596"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="191307596"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 18:29:37 -0700
IronPort-SDR: 0H7d2Spkg7qEB4aT8cGG8ALnEIXVn0IDukluQu1oIEoOQvSqQ6prwkb8LqsSX1y5uGa6cMZ5SS
 v0y7XLZl8/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="483707880"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2021 18:29:35 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1loyeU-0006Yc-GF; Fri, 04 Jun 2021 01:29:34 +0000
Date:   Fri, 04 Jun 2021 09:28:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ca5ce82529104e96ccc5e1888979258e233e1644
Message-ID: <60b981c4.tUD630MeokzXcNEB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ca5ce82529104e96ccc5e1888979258e233e1644  usb: typec: intel_pmc_mux: Update IOM port status offset for AlderLake

elapsed time: 750m

configs tested: 188
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
arm                         lpc32xx_defconfig
powerpc                    adder875_defconfig
m68k                         apollo_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      arches_defconfig
h8300                     edosk2674_defconfig
sparc64                          alldefconfig
arm                     am200epdkit_defconfig
arm                        multi_v5_defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                         apsh4a3a_defconfig
arc                         haps_hs_defconfig
arm                         mv78xx0_defconfig
sh                         ecovec24_defconfig
m68k                        m5407c3_defconfig
m68k                        mvme16x_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                             alldefconfig
arm                         lpc18xx_defconfig
arc                      axs103_smp_defconfig
mips                         mpc30x_defconfig
sh                        dreamcast_defconfig
arm                         s3c6400_defconfig
sparc                       sparc32_defconfig
powerpc                     tqm8540_defconfig
mips                           rs90_defconfig
m68k                         amcore_defconfig
arm                        cerfcube_defconfig
powerpc                 canyonlands_defconfig
powerpc64                        alldefconfig
arm                    vt8500_v6_v7_defconfig
arm                            zeus_defconfig
xtensa                generic_kc705_defconfig
m68k                          amiga_defconfig
mips                            gpr_defconfig
nios2                         3c120_defconfig
powerpc                      pcm030_defconfig
nds32                             allnoconfig
powerpc                   lite5200b_defconfig
arm                           u8500_defconfig
um                                  defconfig
powerpc                 mpc8272_ads_defconfig
mips                            ar7_defconfig
powerpc                        cell_defconfig
mips                        bcm63xx_defconfig
powerpc                      walnut_defconfig
mips                      pic32mzda_defconfig
mips                           jazz_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      acadia_defconfig
arm                        neponset_defconfig
powerpc                      tqm8xx_defconfig
sh                          urquell_defconfig
powerpc                      cm5200_defconfig
arm                  colibri_pxa270_defconfig
sh                            hp6xx_defconfig
um                            kunit_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
mips                  decstation_64_defconfig
ia64                      gensparse_defconfig
xtensa                    xip_kc705_defconfig
arm                      tct_hammer_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           sunxi_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           stm32_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                  cavium_octeon_defconfig
powerpc                  storcenter_defconfig
arm                         palmz72_defconfig
mips                          rb532_defconfig
arm                           h5000_defconfig
arm                           tegra_defconfig
sh                              ul2_defconfig
mips                         tb0219_defconfig
mips                     loongson2k_defconfig
arc                              alldefconfig
mips                      pistachio_defconfig
sh                        sh7757lcr_defconfig
mips                           mtx1_defconfig
arm                      pxa255-idp_defconfig
arm                           spitz_defconfig
arm                        vexpress_defconfig
arm                           viper_defconfig
sh                   rts7751r2dplus_defconfig
arm                          simpad_defconfig
riscv                            allyesconfig
arm                          exynos_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      bamboo_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
arm                          moxart_defconfig
sh                        edosk7705_defconfig
xtensa                  nommu_kc705_defconfig
ia64                                defconfig
powerpc                     skiroot_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                         ps3_defconfig
sh                           se7206_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a002-20210603
i386                 randconfig-a005-20210603
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
i386                 randconfig-a015-20210603
i386                 randconfig-a013-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a016-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210603
x86_64               randconfig-a002-20210603
x86_64               randconfig-a004-20210603
x86_64               randconfig-a003-20210603
x86_64               randconfig-a006-20210603
x86_64               randconfig-a005-20210603
x86_64               randconfig-a001-20210603

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
