Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4BA3EDDE5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 21:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhHPTaG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 15:30:06 -0400
Received: from mga18.intel.com ([134.134.136.126]:43625 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229587AbhHPTaG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 15:30:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="203081566"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="203081566"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 12:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="679453742"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2021 12:29:31 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mFiId-000Qsf-6P; Mon, 16 Aug 2021 19:29:31 +0000
Date:   Tue, 17 Aug 2021 03:29:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 2dec48c32a349e51920b6a53b464982db4ed1563
Message-ID: <611abc90.nOfSqPHUYFR17G58%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 2dec48c32a349e51920b6a53b464982db4ed1563  Merge 5.14-rc6 into usb-next

elapsed time: 726m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20210816
arm                            zeus_defconfig
ia64                             allmodconfig
mips                      pic32mzda_defconfig
arm                            mmp2_defconfig
parisc                generic-32bit_defconfig
powerpc                  iss476-smp_defconfig
m68k                          atari_defconfig
powerpc                     taishan_defconfig
arm                       versatile_defconfig
mips                         tb0226_defconfig
sh                          rsk7201_defconfig
sh                           se7712_defconfig
arm                         lubbock_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ep88xc_defconfig
sh                   secureedge5410_defconfig
arm                        vexpress_defconfig
xtensa                          iss_defconfig
powerpc                   motionpro_defconfig
sh                          rsk7203_defconfig
powerpc                         wii_defconfig
powerpc                     skiroot_defconfig
powerpc64                        alldefconfig
mips                           mtx1_defconfig
powerpc                      arches_defconfig
sparc                            alldefconfig
mips                    maltaup_xpa_defconfig
mips                         cobalt_defconfig
powerpc                         ps3_defconfig
powerpc                  mpc866_ads_defconfig
arm                         lpc18xx_defconfig
arm                        shmobile_defconfig
sh                          r7785rp_defconfig
arm                            dove_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc832x_mds_defconfig
arm                     am200epdkit_defconfig
mips                       lemote2f_defconfig
m68k                          hp300_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
arc                            hsdk_defconfig
arm                      footbridge_defconfig
xtensa                         virt_defconfig
ia64                        generic_defconfig
sh                        dreamcast_defconfig
arm                         nhk8815_defconfig
sh                                  defconfig
arm                           corgi_defconfig
arm                           omap1_defconfig
sh                           sh2007_defconfig
powerpc                      ppc44x_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
mips                      loongson3_defconfig
mips                        bcm63xx_defconfig
mips                      fuloong2e_defconfig
ia64                            zx1_defconfig
arc                          axs103_defconfig
arm                     davinci_all_defconfig
mips                         bigsur_defconfig
arm                             rpc_defconfig
riscv                            allmodconfig
m68k                        mvme16x_defconfig
sh                        apsh4ad0a_defconfig
sh                            hp6xx_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
sh                           se7619_defconfig
powerpc                     kilauea_defconfig
arm                        keystone_defconfig
mips                          rb532_defconfig
ia64                      gensparse_defconfig
sh                         ecovec24_defconfig
i386                             alldefconfig
powerpc                      pcm030_defconfig
openrisc                            defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
sh                            shmin_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210816
x86_64               randconfig-a004-20210816
x86_64               randconfig-a003-20210816
x86_64               randconfig-a001-20210816
x86_64               randconfig-a005-20210816
x86_64               randconfig-a002-20210816
i386                 randconfig-a004-20210816
i386                 randconfig-a003-20210816
i386                 randconfig-a002-20210816
i386                 randconfig-a001-20210816
i386                 randconfig-a006-20210816
i386                 randconfig-a005-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210816
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
