Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DD03AC1BD
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 06:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhFREEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 00:04:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:20145 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhFREEi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 00:04:38 -0400
IronPort-SDR: k1+DRYaQ+HPh1cxg3IiOe6IxtCw3jMUvzCLJAAGuPcyU4/2O+zaJ+HYcrn7qMwX+5oxy9YERym
 NXJBVOdeDbWA==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="193804445"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="193804445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 21:02:29 -0700
IronPort-SDR: LJ7baJW9ZHr7W48nLLp846+2hhRyqNEl7OINKZCau3BK9B4y8BPOqYfRDULG2YuqcNubc36OD8
 rKJqan10tkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="472644574"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2021 21:02:27 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lu5i7-0002YH-58; Fri, 18 Jun 2021 04:02:27 +0000
Date:   Fri, 18 Jun 2021 12:01:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b31d9d6d7abbf6483b871b6370bc31c930d53f54
Message-ID: <60cc1ab3.eihGzWvnIXzdkZeV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: b31d9d6d7abbf6483b871b6370bc31c930d53f54  xhci: solve a double free problem while doing s4

elapsed time: 724m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
arm                         s3c6400_defconfig
powerpc                      arches_defconfig
arm                          ep93xx_defconfig
um                            kunit_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
mips                      bmips_stb_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
arm                          pxa3xx_defconfig
sh                          rsk7203_defconfig
sh                         ap325rxa_defconfig
parisc                           alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc834x_mds_defconfig
arm64                            alldefconfig
arm                        keystone_defconfig
riscv                          rv32_defconfig
arm                        trizeps4_defconfig
m68k                            q40_defconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
riscv                    nommu_virt_defconfig
arm                          lpd270_defconfig
sh                      rts7751r2d1_defconfig
arm                       omap2plus_defconfig
s390                          debug_defconfig
mips                         mpc30x_defconfig
arm                           sama5_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
powerpc                       holly_defconfig
powerpc                      walnut_defconfig
arm                           h3600_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          pxa910_defconfig
mips                      maltasmvp_defconfig
arm                         hackkit_defconfig
sh                           se7206_defconfig
mips                           rs90_defconfig
powerpc                     tqm8555_defconfig
powerpc                     taishan_defconfig
sh                           se7750_defconfig
arc                            hsdk_defconfig
openrisc                 simple_smp_defconfig
arm                          moxart_defconfig
powerpc                     redwood_defconfig
powerpc                       ppc64_defconfig
powerpc                      chrp32_defconfig
mips                           ip28_defconfig
m68k                        mvme147_defconfig
mips                  decstation_64_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
powerpc                     pseries_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
arm                         lubbock_defconfig
arc                              alldefconfig
xtensa                       common_defconfig
arm                         at91_dt_defconfig
arm                      tct_hammer_defconfig
arm                      pxa255-idp_defconfig
arm                        multi_v5_defconfig
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
x86_64               randconfig-a004-20210617
x86_64               randconfig-a001-20210617
x86_64               randconfig-a002-20210617
x86_64               randconfig-a003-20210617
x86_64               randconfig-a006-20210617
x86_64               randconfig-a005-20210617
i386                 randconfig-a002-20210617
i386                 randconfig-a006-20210617
i386                 randconfig-a001-20210617
i386                 randconfig-a004-20210617
i386                 randconfig-a005-20210617
i386                 randconfig-a003-20210617
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210617
i386                 randconfig-a013-20210617
i386                 randconfig-a016-20210617
i386                 randconfig-a012-20210617
i386                 randconfig-a014-20210617
i386                 randconfig-a011-20210617
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210617
x86_64               randconfig-a015-20210617
x86_64               randconfig-a011-20210617
x86_64               randconfig-a014-20210617
x86_64               randconfig-a012-20210617
x86_64               randconfig-a013-20210617
x86_64               randconfig-a016-20210617

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
