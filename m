Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C246F441035
	for <lists+linux-usb@lfdr.de>; Sun, 31 Oct 2021 19:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhJaSYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Oct 2021 14:24:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:21289 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229993AbhJaSYG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 31 Oct 2021 14:24:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="230855743"
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; 
   d="scan'208";a="230855743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2021 11:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; 
   d="scan'208";a="449024062"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2021 11:21:32 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mhFSV-0002gj-FD; Sun, 31 Oct 2021 18:21:31 +0000
Date:   Mon, 01 Nov 2021 02:20:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a0548b26901f082684ad1fb3ba397d2de3a1406a
Message-ID: <617ede84.IHTnnbQ4x0jL3k3p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a0548b26901f082684ad1fb3ba397d2de3a1406a  usb: gadget: Mark USB_FSL_QE broken on 64-bit

elapsed time: 1973m

configs tested: 225
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211028
powerpc              randconfig-c003-20211028
mips                         tb0287_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5407c3_defconfig
arc                        nsimosci_defconfig
sh                           se7721_defconfig
arm                           corgi_defconfig
arm                     am200epdkit_defconfig
powerpc                     mpc83xx_defconfig
xtensa                  cadence_csp_defconfig
arm                         axm55xx_defconfig
sparc                       sparc64_defconfig
sh                   sh7770_generic_defconfig
xtensa                           alldefconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
arm                         vf610m4_defconfig
h8300                            alldefconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
mips                      maltasmvp_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
powerpc                     mpc512x_defconfig
sh                           se7780_defconfig
i386                                defconfig
riscv                          rv32_defconfig
mips                     loongson1b_defconfig
arc                        nsim_700_defconfig
mips                            e55_defconfig
xtensa                generic_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                        edosk7760_defconfig
powerpc                      pasemi_defconfig
powerpc                      arches_defconfig
arm                           sama7_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7750_defconfig
mips                        workpad_defconfig
powerpc                      ppc64e_defconfig
arm                        keystone_defconfig
mips                        vocore2_defconfig
sh                          rsk7269_defconfig
m68k                       m5208evb_defconfig
s390                             alldefconfig
arm                             pxa_defconfig
powerpc                    klondike_defconfig
arm                       netwinder_defconfig
powerpc                   microwatt_defconfig
powerpc                 canyonlands_defconfig
powerpc                        cell_defconfig
h8300                     edosk2674_defconfig
powerpc                   lite5200b_defconfig
riscv                    nommu_virt_defconfig
xtensa                              defconfig
arm                         hackkit_defconfig
um                             i386_defconfig
arm                           omap1_defconfig
alpha                            allyesconfig
powerpc                       maple_defconfig
m68k                       m5249evb_defconfig
arm                            dove_defconfig
arm                          pxa910_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
mips                       capcella_defconfig
mips                        bcm63xx_defconfig
xtensa                    xip_kc705_defconfig
mips                         bigsur_defconfig
sh                   secureedge5410_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                    socrates_defconfig
powerpc                     rainier_defconfig
sh                           se7619_defconfig
csky                                defconfig
powerpc                 mpc8313_rdb_defconfig
mips                        omega2p_defconfig
arm                          pcm027_defconfig
arm                        realview_defconfig
sh                         ecovec24_defconfig
nds32                             allnoconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
sparc                       sparc32_defconfig
sh                          landisk_defconfig
openrisc                  or1klitex_defconfig
sh                           sh2007_defconfig
arm                          ixp4xx_defconfig
powerpc                  iss476-smp_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
mips                         db1xxx_defconfig
sh                          r7785rp_defconfig
arm                        multi_v5_defconfig
ia64                             alldefconfig
sh                          urquell_defconfig
arm                           h5000_defconfig
mips                            gpr_defconfig
arm                        spear6xx_defconfig
mips                          ath25_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
arm                        magician_defconfig
mips                         tb0219_defconfig
arc                                 defconfig
arm                           sama5_defconfig
sh                        sh7763rdp_defconfig
arm                  randconfig-c002-20211031
arm                  randconfig-c002-20211028
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20211031
x86_64               randconfig-a004-20211031
x86_64               randconfig-a002-20211031
x86_64               randconfig-a003-20211031
x86_64               randconfig-a001-20211031
x86_64               randconfig-a006-20211031
i386                 randconfig-a003-20211031
i386                 randconfig-a006-20211031
i386                 randconfig-a002-20211031
i386                 randconfig-a005-20211031
i386                 randconfig-a001-20211031
i386                 randconfig-a004-20211031
i386                 randconfig-a004-20211028
i386                 randconfig-a003-20211028
i386                 randconfig-a002-20211028
i386                 randconfig-a006-20211028
i386                 randconfig-a001-20211028
i386                 randconfig-a005-20211028
i386                 randconfig-a012-20211029
i386                 randconfig-a013-20211029
i386                 randconfig-a011-20211029
i386                 randconfig-a015-20211029
i386                 randconfig-a016-20211029
i386                 randconfig-a014-20211029
arc                  randconfig-r043-20211031
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
powerpc              randconfig-c003-20211031
riscv                randconfig-c006-20211031
x86_64               randconfig-c007-20211031
mips                 randconfig-c004-20211031
s390                 randconfig-c005-20211031
arm                  randconfig-c002-20211031
i386                 randconfig-c001-20211031
arm                  randconfig-c002-20211028
powerpc              randconfig-c003-20211028
riscv                randconfig-c006-20211028
x86_64               randconfig-c007-20211028
mips                 randconfig-c004-20211028
s390                 randconfig-c005-20211028
i386                 randconfig-c001-20211028
x86_64               randconfig-a002-20211029
x86_64               randconfig-a004-20211029
x86_64               randconfig-a005-20211029
x86_64               randconfig-a001-20211029
x86_64               randconfig-a006-20211029
x86_64               randconfig-a003-20211029
x86_64               randconfig-a013-20211031
x86_64               randconfig-a015-20211031
x86_64               randconfig-a014-20211031
x86_64               randconfig-a011-20211031
x86_64               randconfig-a016-20211031
x86_64               randconfig-a012-20211031
x86_64               randconfig-a015-20211028
x86_64               randconfig-a013-20211028
x86_64               randconfig-a011-20211028
x86_64               randconfig-a014-20211028
x86_64               randconfig-a012-20211028
x86_64               randconfig-a016-20211028
i386                 randconfig-a013-20211031
i386                 randconfig-a012-20211031
i386                 randconfig-a014-20211031
i386                 randconfig-a015-20211031
i386                 randconfig-a011-20211031
i386                 randconfig-a016-20211031
riscv                randconfig-r042-20211031
s390                 randconfig-r044-20211031
hexagon              randconfig-r045-20211031
hexagon              randconfig-r041-20211031
hexagon              randconfig-r045-20211028
riscv                randconfig-r042-20211028
s390                 randconfig-r044-20211028
hexagon              randconfig-r041-20211028

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
