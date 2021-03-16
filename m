Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8283533CAEB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 02:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhCPBa4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 21:30:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:2286 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233375AbhCPBay (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 21:30:54 -0400
IronPort-SDR: V/IEqXjAaXNQ2g+AJHNTdhrAVgxiOBgQXpalAofwcaeGN3LXbeR2oyOAOI+ClgnI2RvgzTq5Hj
 l01jT5hXJMPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="185821890"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="185821890"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 18:30:54 -0700
IronPort-SDR: iift8LYSm4KTvUvBbkeSjK5Jf24bztYYRmx9DnoLna/R2ns00mgoP+qVLQ9GyyMDUbMkV3nloQ
 noDxJWYRD99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="410862227"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2021 18:30:53 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lLyXs-0000iw-E9; Tue, 16 Mar 2021 01:30:52 +0000
Date:   Tue, 16 Mar 2021 09:30:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 132da018fa3290addede3b269100efb1b7d74c92
Message-ID: <60500a21.UvJwHMaOqOfs8e1C%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 132da018fa3290addede3b269100efb1b7d74c92  Merge tag 'thunderbolt-for-v5.12-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 728m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
h8300                     edosk2674_defconfig
powerpc                    amigaone_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
openrisc                 simple_smp_defconfig
arm                         bcm2835_defconfig
nios2                            allyesconfig
mips                       capcella_defconfig
sh                            migor_defconfig
powerpc                 mpc836x_mds_defconfig
mips                      malta_kvm_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
i386                             allyesconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7203_defconfig
mips                           ip27_defconfig
sh                        edosk7760_defconfig
openrisc                         alldefconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                         orion5x_defconfig
mips                        bcm63xx_defconfig
mips                         rt305x_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
nds32                             allnoconfig
sh                   secureedge5410_defconfig
powerpc                      pcm030_defconfig
arm                      pxa255-idp_defconfig
arm                           spitz_defconfig
arm                          iop32x_defconfig
ia64                            zx1_defconfig
mips                      loongson3_defconfig
mips                           ip28_defconfig
arm                       mainstone_defconfig
arm64                            alldefconfig
mips                           ip32_defconfig
mips                           xway_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8555_defconfig
powerpc                 mpc8540_ads_defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
um                             i386_defconfig
sh                         ap325rxa_defconfig
mips                     cu1000-neo_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        shmobile_defconfig
m68k                       m5208evb_defconfig
arc                            hsdk_defconfig
arm                        cerfcube_defconfig
mips                        vocore2_defconfig
m68k                        m5307c3_defconfig
ia64                        generic_defconfig
mips                           rs90_defconfig
arm                        magician_defconfig
arm                           h5000_defconfig
sh                             shx3_defconfig
powerpc                      tqm8xx_defconfig
xtensa                         virt_defconfig
sh                           se7722_defconfig
arm                     eseries_pxa_defconfig
m68k                       bvme6000_defconfig
arm                       versatile_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5475evb_defconfig
ia64                             allyesconfig
arm                          pxa910_defconfig
powerpc                     mpc5200_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
arm                            hisi_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                     mpc512x_defconfig
ia64                             alldefconfig
powerpc                     tqm5200_defconfig
powerpc                    klondike_defconfig
m68k                       m5249evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         s3c2410_defconfig
arm                  colibri_pxa300_defconfig
sh                           se7751_defconfig
arm                       aspeed_g5_defconfig
arm                       netwinder_defconfig
parisc                           allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
