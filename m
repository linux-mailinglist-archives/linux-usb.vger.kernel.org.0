Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E5B3AA4D1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 21:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhFPT7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 15:59:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:32237 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230155AbhFPT7L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Jun 2021 15:59:11 -0400
IronPort-SDR: 6daqN2uryK+s7kOGi8mp1iHKJvN5j4Lp3jSy/nmZlFH6EmqUbHbWToa4X2d2y0sQPN8o2gXnHR
 lNAaFaQlJOUg==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="193369689"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="193369689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 12:57:03 -0700
IronPort-SDR: ALzjgRJcgXlLcufnh+3hODq/xc3bSsjCbM9O4UaUsxM/JqcR84dUYa7delRbdXPKvqzbV8TzJ1
 5iaG7P98rtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="554157061"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2021 12:57:02 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ltben-0001UG-NV; Wed, 16 Jun 2021 19:57:01 +0000
Date:   Thu, 17 Jun 2021 03:56:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 60ed39db6e861f4a42dfa75f9b53f10093f6d672
Message-ID: <60ca5767.ofTbljnh531xeIzV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 60ed39db6e861f4a42dfa75f9b53f10093f6d672  Merge tag 'usb-v5.13-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-linus

elapsed time: 733m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1000-neo_defconfig
ia64                        generic_defconfig
arm                       versatile_defconfig
arm                         lpc32xx_defconfig
arm                        clps711x_defconfig
sparc                       sparc64_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
m68k                          multi_defconfig
xtensa                    smp_lx200_defconfig
mips                          ath79_defconfig
powerpc                  iss476-smp_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      ep88xc_defconfig
mips                           rs90_defconfig
powerpc                       ppc64_defconfig
sh                             shx3_defconfig
sh                           se7721_defconfig
xtensa                generic_kc705_defconfig
powerpc                    socrates_defconfig
arc                        nsim_700_defconfig
arm                            hisi_defconfig
sh                            migor_defconfig
sh                            hp6xx_defconfig
m68k                          atari_defconfig
powerpc                        fsp2_defconfig
powerpc                     sbc8548_defconfig
s390                             alldefconfig
riscv             nommu_k210_sdcard_defconfig
arm                            zeus_defconfig
m68k                          sun3x_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
arm                              alldefconfig
s390                          debug_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc85xx_cds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
x86_64               randconfig-a002-20210615
x86_64               randconfig-a003-20210615
x86_64               randconfig-a006-20210615
x86_64               randconfig-a005-20210615
i386                 randconfig-a002-20210615
i386                 randconfig-a006-20210615
i386                 randconfig-a004-20210615
i386                 randconfig-a001-20210615
i386                 randconfig-a005-20210615
i386                 randconfig-a003-20210615
i386                 randconfig-a015-20210615
i386                 randconfig-a013-20210615
i386                 randconfig-a016-20210615
i386                 randconfig-a012-20210615
i386                 randconfig-a014-20210615
i386                 randconfig-a011-20210615
i386                 randconfig-a015-20210616
i386                 randconfig-a013-20210616
i386                 randconfig-a016-20210616
i386                 randconfig-a012-20210616
i386                 randconfig-a014-20210616
i386                 randconfig-a011-20210616
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
x86_64               randconfig-b001-20210615
x86_64               randconfig-a004-20210616
x86_64               randconfig-a001-20210616
x86_64               randconfig-a002-20210616
x86_64               randconfig-a003-20210616
x86_64               randconfig-a006-20210616
x86_64               randconfig-a005-20210616
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
