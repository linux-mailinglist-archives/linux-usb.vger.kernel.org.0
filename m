Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29D22FCB6D
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 08:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbhATHXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 02:23:47 -0500
Received: from mga14.intel.com ([192.55.52.115]:27763 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbhATHXh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Jan 2021 02:23:37 -0500
IronPort-SDR: sLce7sBP0sJtvYFGOOczBcoa9QQKx5DRPECceqZKjKyT786hPs2Cu0dYmadAIHU5LEYnGnaXuy
 fb0dmYcM9Qfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="178280411"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="178280411"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:22:56 -0800
IronPort-SDR: oyWXY/Ptnj9gJqBviMBPrUshTgKvQaTFc23TlnHi/25eOWUtaYuiuUecCX5Fotb52hm12CpXoO
 GAPnubkLZkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="573801267"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2021 23:22:54 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l27pO-0005fF-33; Wed, 20 Jan 2021 07:22:54 +0000
Date:   Wed, 20 Jan 2021 15:22:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 7a79f1f7f7e75e532c5a803ab3ebf42a3e79497c
Message-ID: <6007da35.k/KFWgT8ACgwkx7C%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 7a79f1f7f7e75e532c5a803ab3ebf42a3e79497c  dt-bindings: usb: qcom,dwc3: Add bindings for SM8150, SM8250, SM8350

elapsed time: 727m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           gcw0_defconfig
openrisc                            defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
sh                           sh2007_defconfig
sh                          polaris_defconfig
powerpc                      pasemi_defconfig
sparc64                             defconfig
arc                           tb10x_defconfig
m68k                        m5272c3_defconfig
c6x                        evmc6474_defconfig
powerpc                      mgcoge_defconfig
powerpc                 mpc8313_rdb_defconfig
riscv                            alldefconfig
powerpc                      pmac32_defconfig
mips                           ci20_defconfig
arm                           sunxi_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
powerpc                    adder875_defconfig
arm                            hisi_defconfig
arm                         palmz72_defconfig
mips                malta_kvm_guest_defconfig
m68k                         amcore_defconfig
mips                  decstation_64_defconfig
ia64                            zx1_defconfig
sh                              ul2_defconfig
sh                           se7721_defconfig
arm                           corgi_defconfig
m68k                        m5407c3_defconfig
m68k                          amiga_defconfig
powerpc                      cm5200_defconfig
mips                     loongson1b_defconfig
mips                           jazz_defconfig
mips                        omega2p_defconfig
powerpc                 canyonlands_defconfig
parisc                generic-32bit_defconfig
arm                             ezx_defconfig
arm                          pxa168_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                            allyesconfig
arm                        spear6xx_defconfig
ia64                        generic_defconfig
powerpc                     mpc83xx_defconfig
arm                           stm32_defconfig
sh                           se7780_defconfig
powerpc                     skiroot_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
i386                 randconfig-a001-20210120
i386                 randconfig-a002-20210120
i386                 randconfig-a004-20210120
i386                 randconfig-a006-20210120
i386                 randconfig-a005-20210120
i386                 randconfig-a003-20210120
x86_64               randconfig-a012-20210120
x86_64               randconfig-a015-20210120
x86_64               randconfig-a016-20210120
x86_64               randconfig-a011-20210120
x86_64               randconfig-a013-20210120
x86_64               randconfig-a014-20210120
i386                 randconfig-a013-20210120
i386                 randconfig-a011-20210120
i386                 randconfig-a012-20210120
i386                 randconfig-a014-20210120
i386                 randconfig-a015-20210120
i386                 randconfig-a016-20210120
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
x86_64               randconfig-a002-20210120
x86_64               randconfig-a003-20210120
x86_64               randconfig-a001-20210120
x86_64               randconfig-a005-20210120
x86_64               randconfig-a006-20210120
x86_64               randconfig-a004-20210120

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
