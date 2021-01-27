Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504833053B5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 07:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhA0G52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 01:57:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:17826 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232180AbhA0Gva (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Jan 2021 01:51:30 -0500
IronPort-SDR: CgIEW67ljgWPOblfTToZzifaYTVbp/KPK0SRx88z6WlDpHvK26hlOk4hZsg+vPK8vMzdt9VkxL
 G4iSnDvQFimg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="167123329"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="167123329"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 22:50:39 -0800
IronPort-SDR: fJqXhMDScUpnOwgvE9at368T/0oOABZy4ZJocmJTWwIT9FKPa4k+oFYlOfEyn8FhL03za9zAYf
 q+jBE6VeDm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="504815969"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2021 22:50:38 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4ef0-0001Q3-6G; Wed, 27 Jan 2021 06:50:38 +0000
Date:   Wed, 27 Jan 2021 14:50:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1a9e38cabd80356ffb98c2c88fec528ea9644fd5
Message-ID: <60110d1d.r8+M3lULOGD/zj5U%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1a9e38cabd80356ffb98c2c88fec528ea9644fd5  usb: dwc2: Make "trimming xfer length" a debug message

elapsed time: 725m

configs tested: 164
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
xtensa                generic_kc705_defconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        clps711x_defconfig
mips                     decstation_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                         wii_defconfig
sh                           se7780_defconfig
sh                             sh03_defconfig
arm                      footbridge_defconfig
m68k                        m5272c3_defconfig
sh                        edosk7705_defconfig
mips                         tb0287_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     kilauea_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
openrisc                            defconfig
c6x                         dsk6455_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
mips                           ci20_defconfig
alpha                               defconfig
mips                         rt305x_defconfig
mips                  cavium_octeon_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                           viper_defconfig
arm                        trizeps4_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
um                           x86_64_defconfig
arm                         lubbock_defconfig
powerpc                      acadia_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
arm                       aspeed_g4_defconfig
powerpc                     pq2fads_defconfig
powerpc                     powernv_defconfig
arm                          pcm027_defconfig
mips                       capcella_defconfig
arm                             pxa_defconfig
parisc                           alldefconfig
sh                           se7750_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
mips                           ip28_defconfig
powerpc                   bluestone_defconfig
sh                           se7751_defconfig
mips                        qi_lb60_defconfig
powerpc                     pseries_defconfig
powerpc                        icon_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
x86_64               randconfig-a003-20210127
x86_64               randconfig-a002-20210127
x86_64               randconfig-a001-20210127
x86_64               randconfig-a005-20210127
x86_64               randconfig-a006-20210127
x86_64               randconfig-a004-20210127
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
i386                 randconfig-a013-20210127
i386                 randconfig-a011-20210127
i386                 randconfig-a012-20210127
i386                 randconfig-a015-20210127
i386                 randconfig-a014-20210127
i386                 randconfig-a016-20210127
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
