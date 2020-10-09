Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184242881AD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Oct 2020 07:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbgJIFZg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 01:25:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:37883 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730449AbgJIFZf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Oct 2020 01:25:35 -0400
IronPort-SDR: g8+BQp7iyA7/cgadfktQtkZ9jck62Q8rkVg8gzyeRObMo6EBrmYk3tKskl8Zv8yZOBM356c9VG
 uZkftdPTrhiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="153278796"
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; 
   d="scan'208";a="153278796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 22:25:34 -0700
IronPort-SDR: zZwr45WkjY2Ypap494b66kyJjP4kSFAFK2UCjqS8fTufvWn9POshmTxMmRqntJ+pdJics/1Kq/
 nFYqVWVd2hFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; 
   d="scan'208";a="462065578"
Received: from lkp-server02.sh.intel.com (HELO 80eb06af76cf) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Oct 2020 22:25:33 -0700
Received: from kbuild by 80eb06af76cf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kQkuK-0000E6-At; Fri, 09 Oct 2020 05:25:32 +0000
Date:   Fri, 09 Oct 2020 13:24:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3bfb8239be5753a6d7a77556d09ef99ebed89964
Message-ID: <5f7ff41d.Gm6ecIcr+6RrmEcE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 3bfb8239be5753a6d7a77556d09ef99ebed89964  Merge tag 'usb-serial-5.10-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 725m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
arm                          exynos_defconfig
s390                       zfcpdump_defconfig
m68k                       m5208evb_defconfig
powerpc                    mvme5100_defconfig
mips                        jmr3927_defconfig
mips                       rbtx49xx_defconfig
arm                            u300_defconfig
nios2                               defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        m5307c3_defconfig
arm                             mxs_defconfig
h8300                               defconfig
powerpc                  mpc885_ads_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
powerpc                      ppc64e_defconfig
powerpc                        warp_defconfig
sh                          polaris_defconfig
arm                           sama5_defconfig
sh                   secureedge5410_defconfig
powerpc                      bamboo_defconfig
sh                         ecovec24_defconfig
powerpc                         ps3_defconfig
arm                           h3600_defconfig
powerpc                     mpc512x_defconfig
parisc                           allyesconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                             allmodconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
sh                          landisk_defconfig
mips                     decstation_defconfig
powerpc                     pseries_defconfig
arm                       netwinder_defconfig
arm                          ep93xx_defconfig
mips                         bigsur_defconfig
powerpc                  storcenter_defconfig
sh                        dreamcast_defconfig
m68k                       m5275evb_defconfig
riscv                             allnoconfig
powerpc                     ppa8548_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
mips                      malta_kvm_defconfig
sh                           se7721_defconfig
mips                           rs90_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
sh                        edosk7705_defconfig
arm                         assabet_defconfig
sparc                       sparc32_defconfig
h8300                            alldefconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
powerpc                      chrp32_defconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      pic32mzda_defconfig
arm                         s5pv210_defconfig
x86_64                              defconfig
arm                    vt8500_v6_v7_defconfig
mips                        qi_lb60_defconfig
c6x                        evmc6472_defconfig
sh                     sh7710voipgw_defconfig
m68k                          multi_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
mips                           ip28_defconfig
arm                        shmobile_defconfig
powerpc                      arches_defconfig
powerpc                    gamecube_defconfig
powerpc                     ksi8560_defconfig
h8300                     edosk2674_defconfig
arm                     eseries_pxa_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
sh                              ul2_defconfig
sh                          lboxre2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
x86_64               randconfig-a004-20201008
x86_64               randconfig-a003-20201008
x86_64               randconfig-a005-20201008
x86_64               randconfig-a001-20201008
x86_64               randconfig-a002-20201008
x86_64               randconfig-a006-20201008
i386                 randconfig-a006-20201008
i386                 randconfig-a005-20201008
i386                 randconfig-a001-20201008
i386                 randconfig-a004-20201008
i386                 randconfig-a002-20201008
i386                 randconfig-a003-20201008
i386                 randconfig-a006-20201009
i386                 randconfig-a005-20201009
i386                 randconfig-a001-20201009
i386                 randconfig-a004-20201009
i386                 randconfig-a002-20201009
i386                 randconfig-a003-20201009
x86_64               randconfig-a012-20201009
x86_64               randconfig-a015-20201009
x86_64               randconfig-a013-20201009
x86_64               randconfig-a014-20201009
x86_64               randconfig-a011-20201009
x86_64               randconfig-a016-20201009
i386                 randconfig-a015-20201009
i386                 randconfig-a013-20201009
i386                 randconfig-a014-20201009
i386                 randconfig-a016-20201009
i386                 randconfig-a011-20201009
i386                 randconfig-a012-20201009
i386                 randconfig-a015-20201008
i386                 randconfig-a013-20201008
i386                 randconfig-a014-20201008
i386                 randconfig-a016-20201008
i386                 randconfig-a011-20201008
i386                 randconfig-a012-20201008
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201008
x86_64               randconfig-a015-20201008
x86_64               randconfig-a013-20201008
x86_64               randconfig-a014-20201008
x86_64               randconfig-a011-20201008
x86_64               randconfig-a016-20201008
x86_64               randconfig-a004-20201009
x86_64               randconfig-a003-20201009
x86_64               randconfig-a005-20201009
x86_64               randconfig-a001-20201009
x86_64               randconfig-a002-20201009
x86_64               randconfig-a006-20201009

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
