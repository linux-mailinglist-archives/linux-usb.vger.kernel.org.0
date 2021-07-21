Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943CE3D1974
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 23:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhGUVPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 17:15:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:4791 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhGUVPR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 17:15:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198726723"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; 
   d="scan'208";a="198726723"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2021 14:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; 
   d="scan'208";a="511946150"
Received: from lkp-server01.sh.intel.com (HELO b8b92b2878b0) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2021 14:55:38 -0700
Received: from kbuild by b8b92b2878b0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m6KBm-0000dh-2K; Wed, 21 Jul 2021 21:55:38 +0000
Date:   Thu, 22 Jul 2021 05:55:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f3a1a937f7b240be623d989c8553a6d01465d04f
Message-ID: <60f897b7.oBo6evDZ1nWGyIdv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f3a1a937f7b240be623d989c8553a6d01465d04f  Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"

elapsed time: 720m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
um                           x86_64_defconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
openrisc                            defconfig
powerpc                     taishan_defconfig
mips                           ip32_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                  mpc885_ads_defconfig
h8300                       h8s-sim_defconfig
sh                ecovec24-romimage_defconfig
parisc                generic-64bit_defconfig
arm                          exynos_defconfig
powerpc                      pasemi_defconfig
m68k                        mvme16x_defconfig
sh                          r7785rp_defconfig
sparc64                             defconfig
arc                     nsimosci_hs_defconfig
m68k                             allyesconfig
m68k                       m5208evb_defconfig
arm                           sama5_defconfig
mips                       rbtx49xx_defconfig
mips                          ath25_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
arm                           h3600_defconfig
xtensa                    smp_lx200_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
ia64                                defconfig
riscv                            alldefconfig
microblaze                          defconfig
mips                           ip28_defconfig
arm64                            alldefconfig
mips                     cu1000-neo_defconfig
riscv                    nommu_virt_defconfig
mips                 decstation_r4k_defconfig
xtensa                  nommu_kc705_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
arm                         socfpga_defconfig
powerpc64                           defconfig
powerpc                      cm5200_defconfig
arm                         palmz72_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
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
x86_64               randconfig-a003-20210720
x86_64               randconfig-a006-20210720
x86_64               randconfig-a001-20210720
x86_64               randconfig-a005-20210720
x86_64               randconfig-a004-20210720
x86_64               randconfig-a002-20210720
i386                 randconfig-a005-20210720
i386                 randconfig-a003-20210720
i386                 randconfig-a004-20210720
i386                 randconfig-a002-20210720
i386                 randconfig-a001-20210720
i386                 randconfig-a006-20210720
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
x86_64               randconfig-a011-20210721
x86_64               randconfig-a016-20210721
x86_64               randconfig-a013-20210721
x86_64               randconfig-a014-20210721
x86_64               randconfig-a012-20210721
x86_64               randconfig-a015-20210721
i386                 randconfig-a016-20210720
i386                 randconfig-a013-20210720
i386                 randconfig-a012-20210720
i386                 randconfig-a014-20210720
i386                 randconfig-a011-20210720
i386                 randconfig-a015-20210720
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210721
x86_64               randconfig-b001-20210720
x86_64               randconfig-a011-20210720
x86_64               randconfig-a016-20210720
x86_64               randconfig-a013-20210720
x86_64               randconfig-a014-20210720
x86_64               randconfig-a012-20210720
x86_64               randconfig-a015-20210720

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
