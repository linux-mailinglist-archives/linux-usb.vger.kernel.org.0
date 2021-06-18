Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78493AD2FD
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 21:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhFRTkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 15:40:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:63413 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234216AbhFRTko (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 15:40:44 -0400
IronPort-SDR: zakc8Oe001bdjyVronhPl/Tvb6O7XwcbRMgyvbbT5bdmDXL0/Bn7/tp6QdrPFnV7KPMbj6cGe7
 sSU2blACHKDw==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="193742296"
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="193742296"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 12:38:33 -0700
IronPort-SDR: EKHD1AesB/LQ7SoQ+PZm19ppSKtpx1S17x/CSwu52ZYal8ZkcquuLHZK5zggmh4iwkoF2STnzY
 oBWorS552Egg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="472853158"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2021 12:38:32 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1luKJz-00035Y-9G; Fri, 18 Jun 2021 19:38:31 +0000
Date:   Sat, 19 Jun 2021 03:38:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 04d72afa34edd14d99db7536d22819cdbb2b2e4c
Message-ID: <60ccf61b.H+7AeqlTttg+/EKy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 04d72afa34edd14d99db7536d22819cdbb2b2e4c  Revert "USB: misc: Add onboard_usb_hub driver"

elapsed time: 724m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
mips                        qi_lb60_defconfig
sh                           se7619_defconfig
powerpc                   bluestone_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                      arches_defconfig
powerpc                     tqm8548_defconfig
arm                        multi_v5_defconfig
sh                           sh2007_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
mips                     loongson1c_defconfig
arm                         lpc32xx_defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
x86_64                            allnoconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
mips                        omega2p_defconfig
sh                   secureedge5410_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
mips                  decstation_64_defconfig
m68k                                defconfig
sh                           se7705_defconfig
mips                  cavium_octeon_defconfig
sh                           se7722_defconfig
arc                      axs103_smp_defconfig
arc                              alldefconfig
mips                         db1xxx_defconfig
arm                         axm55xx_defconfig
powerpc                    mvme5100_defconfig
openrisc                            defconfig
arm                            hisi_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                         bigsur_defconfig
um                               alldefconfig
openrisc                    or1ksim_defconfig
sh                          landisk_defconfig
powerpc                      walnut_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        neponset_defconfig
mips                   sb1250_swarm_defconfig
sh                          rsk7203_defconfig
nds32                             allnoconfig
mips                      pistachio_defconfig
arm                  colibri_pxa270_defconfig
sh                        sh7757lcr_defconfig
arm                        spear3xx_defconfig
arc                          axs101_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                      pmac32_defconfig
mips                 decstation_r4k_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          iop32x_defconfig
arm                          collie_defconfig
arm                         s3c6400_defconfig
sparc                            allyesconfig
arm                          pcm027_defconfig
arm                      footbridge_defconfig
sparc                       sparc64_defconfig
arm                             pxa_defconfig
arm                       mainstone_defconfig
alpha                            alldefconfig
powerpc                 linkstation_defconfig
arm                           sama5_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
arm                           spitz_defconfig
mips                            gpr_defconfig
arm                        realview_defconfig
ia64                             alldefconfig
s390                                defconfig
arm                          pxa3xx_defconfig
powerpc                      pasemi_defconfig
arm                        shmobile_defconfig
mips                            e55_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
sh                          r7785rp_defconfig
xtensa                    smp_lx200_defconfig
m68k                          sun3x_defconfig
arm                        cerfcube_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
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
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
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
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210618
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
