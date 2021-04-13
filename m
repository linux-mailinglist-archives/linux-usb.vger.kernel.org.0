Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A2635D57B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 04:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238531AbhDMCz6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 22:55:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:50815 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237380AbhDMCz5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 22:55:57 -0400
IronPort-SDR: Wm4MaWere70nPqrpE6nI+C5gBMKq7iuUaGoTLWY5XVFkm+AJ2VKu6xWJeJAGu7GsTmWkEkuUlI
 4uaumg0mE1bQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="174423871"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="174423871"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 19:55:38 -0700
IronPort-SDR: VZM3p6jE7IF2l/Ajn578CrYihoajtRWABmXflOdcDE84LRX8zD/7v+XU8r2ouU1QiFeIFhcPfM
 jWstnQ+vIOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="450228249"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2021 19:55:37 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lW9DE-0000m5-Eb; Tue, 13 Apr 2021 02:55:36 +0000
Date:   Tue, 13 Apr 2021 10:55:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 9bc46a12c53d8268392774172742aa9e5dd6953d
Message-ID: <6075080a.e64TjQtvaPuf6mGY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9bc46a12c53d8268392774172742aa9e5dd6953d  Merge tag 'usb-v5.13-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-next

elapsed time: 725m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
riscv                            allyesconfig
i386                             allyesconfig
arm                           sama5_defconfig
sparc                               defconfig
sh                   sh7770_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                         bigsur_defconfig
powerpc                        fsp2_defconfig
i386                                defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                                defconfig
h8300                       h8s-sim_defconfig
arc                      axs103_smp_defconfig
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
riscv                             allnoconfig
mips                         cobalt_defconfig
mips                         tb0219_defconfig
mips                           mtx1_defconfig
m68k                       m5249evb_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
arc                          axs103_defconfig
arc                          axs101_defconfig
arc                         haps_hs_defconfig
arm                           stm32_defconfig
mips                           ci20_defconfig
sh                        sh7757lcr_defconfig
arm                            qcom_defconfig
powerpc                    klondike_defconfig
m68k                          amiga_defconfig
powerpc                       ppc64_defconfig
sh                           se7721_defconfig
powerpc                      pcm030_defconfig
arm                         mv78xx0_defconfig
arm                          exynos_defconfig
arm                       multi_v4t_defconfig
mips                           ip22_defconfig
arm                         s3c6400_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
powerpc                     mpc512x_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
ia64                          tiger_defconfig
powerpc                     tqm8555_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
sh                             espt_defconfig
arm                        trizeps4_defconfig
sh                          urquell_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                             rpc_defconfig
powerpc                      ppc64e_defconfig
arm                        oxnas_v6_defconfig
sh                        edosk7760_defconfig
sparc64                             defconfig
powerpc                     tqm8548_defconfig
powerpc                        cell_defconfig
sh                          rsk7201_defconfig
sh                   sh7724_generic_defconfig
sh                             sh03_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8540_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltaaprp_defconfig
arm                             pxa_defconfig
powerpc                 mpc8560_ads_defconfig
mips                     cu1000-neo_defconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                          ixp4xx_defconfig
sh                          landisk_defconfig
powerpc                      bamboo_defconfig
xtensa                              defconfig
mips                 decstation_r4k_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                       maple_defconfig
um                                allnoconfig
m68k                         apollo_defconfig
arm                        multi_v5_defconfig
powerpc                     pq2fads_defconfig
sh                           se7751_defconfig
arm                         vf610m4_defconfig
arm                         lpc32xx_defconfig
h8300                            alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210412
i386                 randconfig-a001-20210412
i386                 randconfig-a006-20210412
i386                 randconfig-a005-20210412
i386                 randconfig-a004-20210412
i386                 randconfig-a002-20210412
x86_64               randconfig-a014-20210412
x86_64               randconfig-a015-20210412
x86_64               randconfig-a011-20210412
x86_64               randconfig-a013-20210412
x86_64               randconfig-a012-20210412
x86_64               randconfig-a016-20210412
i386                 randconfig-a015-20210412
i386                 randconfig-a014-20210412
i386                 randconfig-a013-20210412
i386                 randconfig-a012-20210412
i386                 randconfig-a016-20210412
i386                 randconfig-a011-20210412
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210412
x86_64               randconfig-a002-20210412
x86_64               randconfig-a001-20210412
x86_64               randconfig-a005-20210412
x86_64               randconfig-a006-20210412
x86_64               randconfig-a004-20210412

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
