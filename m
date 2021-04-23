Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BB1369D8A
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 01:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhDWXqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 19:46:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:60730 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231740AbhDWXqg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 19:46:36 -0400
IronPort-SDR: 9S+GtuSqVd7n5bm3Q0/pFXhpZKu2W6IQ907/QI9tG1tHa9Xb51OiQq1MJDFDDDDrywbJTpqUue
 e7Hkh5Ckc0RA==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="260100525"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="260100525"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2021 16:45:58 -0700
IronPort-SDR: 2pn3TNEhrIu4F0XWuIS8Y9dJuiJpGwDisDKbFD/+1BljoqAM2aYaEJEWUryrxZfZAuPzWRBxYM
 SALvXLRA9M6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; 
   d="scan'208";a="603671482"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Apr 2021 16:45:57 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1la5Ui-0004tP-OH; Fri, 23 Apr 2021 23:45:56 +0000
Date:   Sat, 24 Apr 2021 07:45:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ddae7979cdd5ed417f2b3ebdc5742e2a600b5ad5
Message-ID: <60835c13.CyHCJcoxrJ9wwA3G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ddae7979cdd5ed417f2b3ebdc5742e2a600b5ad5  usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS capability

elapsed time: 724m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                    socrates_defconfig
m68k                       m5208evb_defconfig
powerpc                     tqm5200_defconfig
sh                          sdk7780_defconfig
s390                             alldefconfig
sh                   rts7751r2dplus_defconfig
arc                      axs103_smp_defconfig
arm                            pleb_defconfig
um                             i386_defconfig
arm                        vexpress_defconfig
mips                        bcm47xx_defconfig
mips                        nlm_xlp_defconfig
um                                allnoconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
mips                  maltasmvp_eva_defconfig
arm64                            alldefconfig
arm                            zeus_defconfig
sh                      rts7751r2d1_defconfig
xtensa                         virt_defconfig
riscv                            alldefconfig
arm                            dove_defconfig
sh                           sh2007_defconfig
sh                         ecovec24_defconfig
arm                          lpd270_defconfig
arm                         orion5x_defconfig
powerpc                     tqm8541_defconfig
um                               allmodconfig
arc                        vdk_hs38_defconfig
powerpc                    mvme5100_defconfig
ia64                            zx1_defconfig
mips                        maltaup_defconfig
powerpc                         wii_defconfig
mips                      loongson3_defconfig
mips                   sb1250_swarm_defconfig
mips                      fuloong2e_defconfig
mips                      pic32mzda_defconfig
sh                   sh7770_generic_defconfig
arm                         s3c2410_defconfig
sh                        sh7757lcr_defconfig
mips                malta_kvm_guest_defconfig
arm                       imx_v4_v5_defconfig
sh                          r7780mp_defconfig
mips                     decstation_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7203_defconfig
mips                     loongson1b_defconfig
m68k                       bvme6000_defconfig
um                               alldefconfig
sh                        dreamcast_defconfig
powerpc                    ge_imp3a_defconfig
sh                             sh03_defconfig
ia64                          tiger_defconfig
mips                         mpc30x_defconfig
powerpc                     tqm8548_defconfig
arm                         lpc32xx_defconfig
xtensa                          iss_defconfig
arm                       spear13xx_defconfig
powerpc                     ksi8560_defconfig
arm                     eseries_pxa_defconfig
powerpc                     tqm8555_defconfig
sh                           se7619_defconfig
mips                 decstation_r4k_defconfig
h8300                       h8s-sim_defconfig
arm                          moxart_defconfig
arm                          exynos_defconfig
mips                      maltasmvp_defconfig
arm                  colibri_pxa300_defconfig
mips                     cu1000-neo_defconfig
mips                    maltaup_xpa_defconfig
ia64                      gensparse_defconfig
arm                            mps2_defconfig
arm                        trizeps4_defconfig
mips                           gcw0_defconfig
sh                          polaris_defconfig
um                           x86_64_defconfig
ia64                        generic_defconfig
csky                                defconfig
sh                     sh7710voipgw_defconfig
arm                            lart_defconfig
powerpc                      cm5200_defconfig
arm                       cns3420vb_defconfig
arm                            xcep_defconfig
h8300                    h8300h-sim_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
x86_64               randconfig-a002-20210423
x86_64               randconfig-a004-20210423
x86_64               randconfig-a001-20210423
x86_64               randconfig-a005-20210423
x86_64               randconfig-a006-20210423
x86_64               randconfig-a003-20210423
i386                 randconfig-a002-20210423
i386                 randconfig-a001-20210423
i386                 randconfig-a003-20210423
i386                 randconfig-a005-20210423
i386                 randconfig-a006-20210423
i386                 randconfig-a004-20210423
i386                 randconfig-a014-20210423
i386                 randconfig-a012-20210423
i386                 randconfig-a011-20210423
i386                 randconfig-a013-20210423
i386                 randconfig-a015-20210423
i386                 randconfig-a016-20210423
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210423
x86_64               randconfig-a016-20210423
x86_64               randconfig-a011-20210423
x86_64               randconfig-a014-20210423
x86_64               randconfig-a012-20210423
x86_64               randconfig-a013-20210423

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
