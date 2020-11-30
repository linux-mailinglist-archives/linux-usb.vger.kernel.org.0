Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99682C902A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 22:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgK3VnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 16:43:18 -0500
Received: from mga12.intel.com ([192.55.52.136]:29212 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgK3VnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 16:43:17 -0500
IronPort-SDR: EnyEhoGdGQPq51Kzf+Br4gdrntAzdUeWiO7DgLG2agxbKJRwgbW3qiSm9VYSRLXFbtPOufuDJD
 tvNfEy0xHmLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="151970534"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="151970534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 13:42:37 -0800
IronPort-SDR: wqRCLamIcZCs88BSWX4PDVDWMzJulVFNJAPNroaIGqJ/w/KpDcWWvTlwOEAm2nYQ8/WrRST+nn
 9WVvZuidsnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="372661467"
Received: from lkp-server01.sh.intel.com (HELO 6b2307aab78b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2020 13:42:36 -0800
Received: from kbuild by 6b2307aab78b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kjqwN-00008l-Mk; Mon, 30 Nov 2020 21:42:35 +0000
Date:   Tue, 01 Dec 2020 05:41:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ebad43260d225bccd57c7144a6eecbef3cd88f7f
Message-ID: <5fc56714.6QStqJRGmukCS8J7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: ebad43260d225bccd57c7144a6eecbef3cd88f7f  Merge 5.10-rc6 into usb-next

elapsed time: 727m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        sh7763rdp_defconfig
sh                          sdk7786_defconfig
mips                           xway_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8555_defconfig
powerpc                     redwood_defconfig
m68k                       m5208evb_defconfig
m68k                        mvme16x_defconfig
powerpc                        warp_defconfig
x86_64                              defconfig
h8300                               defconfig
arc                          axs101_defconfig
mips                           jazz_defconfig
powerpc                     skiroot_defconfig
riscv                            allmodconfig
powerpc                    klondike_defconfig
sh                          landisk_defconfig
powerpc                      walnut_defconfig
mips                      pic32mzda_defconfig
um                             i386_defconfig
arm                      pxa255-idp_defconfig
arm                          ep93xx_defconfig
arc                     haps_hs_smp_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc32_defconfig
powerpc                           allnoconfig
powerpc                      tqm8xx_defconfig
sh                   sh7770_generic_defconfig
ia64                            zx1_defconfig
xtensa                           alldefconfig
c6x                        evmc6474_defconfig
powerpc                      obs600_defconfig
arm                           efm32_defconfig
mips                         tb0219_defconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
mips                           ip32_defconfig
arm                         lpc18xx_defconfig
arm                        shmobile_defconfig
arm                          prima2_defconfig
powerpc                     asp8347_defconfig
c6x                         dsk6455_defconfig
mips                         mpc30x_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
mips                        bcm47xx_defconfig
openrisc                 simple_smp_defconfig
nios2                            allyesconfig
arm                            pleb_defconfig
sh                        sh7757lcr_defconfig
sh                           se7780_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            mmp2_defconfig
arm                        neponset_defconfig
powerpc                  iss476-smp_defconfig
arm                            lart_defconfig
mips                        qi_lb60_defconfig
parisc                generic-32bit_defconfig
powerpc                      ppc6xx_defconfig
h8300                       h8s-sim_defconfig
sh                           se7206_defconfig
mips                           rs90_defconfig
arm                         s5pv210_defconfig
arm                          badge4_defconfig
arc                              allyesconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
m68k                       bvme6000_defconfig
arm64                            alldefconfig
arm                        realview_defconfig
arm                     am200epdkit_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
m68k                         amcore_defconfig
arm                           spitz_defconfig
sh                        edosk7705_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                 randconfig-a004-20201130
i386                 randconfig-a002-20201130
i386                 randconfig-a003-20201130
i386                 randconfig-a005-20201130
i386                 randconfig-a006-20201130
i386                 randconfig-a001-20201130
x86_64               randconfig-a014-20201130
x86_64               randconfig-a015-20201130
x86_64               randconfig-a016-20201130
x86_64               randconfig-a011-20201130
x86_64               randconfig-a012-20201130
x86_64               randconfig-a013-20201130
i386                 randconfig-a013-20201130
i386                 randconfig-a012-20201130
i386                 randconfig-a011-20201130
i386                 randconfig-a016-20201130
i386                 randconfig-a015-20201130
i386                 randconfig-a014-20201130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
