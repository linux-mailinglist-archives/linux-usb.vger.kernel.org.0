Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772C53EC3AB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 17:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhHNPvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 11:51:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:42457 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238181AbhHNPvo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Aug 2021 11:51:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10076"; a="213840018"
X-IronPort-AV: E=Sophos;i="5.84,321,1620716400"; 
   d="scan'208";a="213840018"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2021 08:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,321,1620716400"; 
   d="scan'208";a="508708375"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2021 08:51:14 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEvwH-000Ow5-Pv; Sat, 14 Aug 2021 15:51:13 +0000
Date:   Sat, 14 Aug 2021 23:50:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 cea45a3bd2dd4d9c35581328f571afd32b3c9f48
Message-ID: <6117e634.hZxthuhjeY4rnN2/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: cea45a3bd2dd4d9c35581328f571afd32b3c9f48  usb: gadget: udc: renesas_usb3: Fix soc_device_match() abuse

elapsed time: 1723m

configs tested: 183
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210812
i386                 randconfig-c001-20210814
i386                 randconfig-c001-20210813
powerpc                 mpc8540_ads_defconfig
ia64                                defconfig
arm                       imx_v6_v7_defconfig
mips                           rs90_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
mips                        workpad_defconfig
openrisc                  or1klitex_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
mips                     loongson1c_defconfig
arm                          ep93xx_defconfig
arm                          iop32x_defconfig
arm                            zeus_defconfig
arm                        clps711x_defconfig
nios2                            alldefconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc837x_mds_defconfig
arm                     davinci_all_defconfig
arm                       omap2plus_defconfig
powerpc                     pq2fads_defconfig
mips                  maltasmvp_eva_defconfig
h8300                            alldefconfig
xtensa                           allyesconfig
arm                       imx_v4_v5_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
h8300                               defconfig
sh                          rsk7269_defconfig
ia64                          tiger_defconfig
arm                             rpc_defconfig
powerpc                      ppc40x_defconfig
arm                          simpad_defconfig
sh                           se7750_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
powerpc                     ksi8560_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                       maple_defconfig
powerpc                         wii_defconfig
h8300                            allyesconfig
sh                           se7206_defconfig
sh                                  defconfig
arm                           corgi_defconfig
xtensa                  audio_kc705_defconfig
h8300                       h8s-sim_defconfig
arm                       aspeed_g4_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                       lemote2f_defconfig
arc                              alldefconfig
mips                           ip22_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          urquell_defconfig
mips                     decstation_defconfig
arm                          exynos_defconfig
sh                 kfr2r09-romimage_defconfig
sh                        edosk7760_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
arm                           h5000_defconfig
powerpc                     mpc512x_defconfig
arm                         axm55xx_defconfig
powerpc                    amigaone_defconfig
mips                  decstation_64_defconfig
arm                          pxa3xx_defconfig
mips                         cobalt_defconfig
openrisc                    or1ksim_defconfig
mips                        nlm_xlp_defconfig
arm                         bcm2835_defconfig
arm                            pleb_defconfig
arc                        nsim_700_defconfig
mips                 decstation_r4k_defconfig
arm                            lart_defconfig
mips                          rm200_defconfig
mips                        nlm_xlr_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
x86_64               randconfig-a004-20210814
x86_64               randconfig-a006-20210814
x86_64               randconfig-a003-20210814
x86_64               randconfig-a001-20210814
x86_64               randconfig-a005-20210814
x86_64               randconfig-a002-20210814
i386                 randconfig-a004-20210814
i386                 randconfig-a002-20210814
i386                 randconfig-a001-20210814
i386                 randconfig-a003-20210814
i386                 randconfig-a006-20210814
i386                 randconfig-a005-20210814
i386                 randconfig-a004-20210813
i386                 randconfig-a003-20210813
i386                 randconfig-a001-20210813
i386                 randconfig-a002-20210813
i386                 randconfig-a006-20210813
i386                 randconfig-a005-20210813
x86_64               randconfig-a011-20210813
x86_64               randconfig-a013-20210813
x86_64               randconfig-a012-20210813
x86_64               randconfig-a016-20210813
x86_64               randconfig-a015-20210813
x86_64               randconfig-a014-20210813
i386                 randconfig-a011-20210814
i386                 randconfig-a015-20210814
i386                 randconfig-a013-20210814
i386                 randconfig-a014-20210814
i386                 randconfig-a016-20210814
i386                 randconfig-a012-20210814
i386                 randconfig-a011-20210813
i386                 randconfig-a015-20210813
i386                 randconfig-a014-20210813
i386                 randconfig-a013-20210813
i386                 randconfig-a016-20210813
i386                 randconfig-a012-20210813
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210814
x86_64               randconfig-c001-20210813
x86_64               randconfig-a006-20210813
x86_64               randconfig-a004-20210813
x86_64               randconfig-a003-20210813
x86_64               randconfig-a002-20210813
x86_64               randconfig-a005-20210813
x86_64               randconfig-a001-20210813
x86_64               randconfig-a013-20210814
x86_64               randconfig-a011-20210814
x86_64               randconfig-a016-20210814
x86_64               randconfig-a012-20210814
x86_64               randconfig-a014-20210814
x86_64               randconfig-a015-20210814
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
