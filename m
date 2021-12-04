Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D9A4681B1
	for <lists+linux-usb@lfdr.de>; Sat,  4 Dec 2021 02:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhLDBGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 20:06:54 -0500
Received: from mga02.intel.com ([134.134.136.20]:7714 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235129AbhLDBGx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Dec 2021 20:06:53 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="224333019"
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="224333019"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 17:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,286,1631602800"; 
   d="scan'208";a="461101799"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2021 17:03:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtJSY-000IGv-P9; Sat, 04 Dec 2021 01:03:26 +0000
Date:   Sat, 04 Dec 2021 09:03:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 37307f7020ab38dde0892a578249bf63d00bca64
Message-ID: <61aabe48./h+jDCoylniuYi4e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 37307f7020ab38dde0892a578249bf63d00bca64  usb: cdnsp: Fix a NULL pointer dereference in cdnsp_endpoint_init()

elapsed time: 720m

configs tested: 164
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
powerpc                      arches_defconfig
s390                             allyesconfig
arm                         shannon_defconfig
powerpc                 mpc8540_ads_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
powerpc                     tqm8555_defconfig
openrisc                    or1ksim_defconfig
arc                          axs101_defconfig
m68k                        m5407c3_defconfig
mips                        maltaup_defconfig
sparc                       sparc64_defconfig
mips                        vocore2_defconfig
arm                          pxa3xx_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
powerpc                  mpc866_ads_defconfig
sh                          kfr2r09_defconfig
mips                           mtx1_defconfig
nios2                               defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7269_defconfig
mips                        jmr3927_defconfig
arc                        nsim_700_defconfig
arm                         s5pv210_defconfig
um                           x86_64_defconfig
mips                           xway_defconfig
arm                            xcep_defconfig
powerpc                       holly_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
arm                          gemini_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
h8300                            allyesconfig
sh                         microdev_defconfig
powerpc                 canyonlands_defconfig
arm                      jornada720_defconfig
arm                       omap2plus_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8272_ads_defconfig
arc                      axs103_smp_defconfig
arm                         palmz72_defconfig
xtensa                       common_defconfig
sh                         ap325rxa_defconfig
arm                         socfpga_defconfig
mips                          rm200_defconfig
mips                            gpr_defconfig
h8300                               defconfig
mips                         rt305x_defconfig
sh                           se7712_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc32_defconfig
sh                           se7751_defconfig
nios2                            allyesconfig
arm                          ep93xx_defconfig
powerpc                       eiger_defconfig
arm                       aspeed_g4_defconfig
sparc                            alldefconfig
mips                          malta_defconfig
powerpc                        warp_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20211204
arm                  randconfig-c002-20211203
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211203
x86_64               randconfig-a005-20211203
x86_64               randconfig-a001-20211203
x86_64               randconfig-a002-20211203
x86_64               randconfig-a004-20211203
x86_64               randconfig-a003-20211203
i386                 randconfig-a001-20211203
i386                 randconfig-a005-20211203
i386                 randconfig-a002-20211203
i386                 randconfig-a003-20211203
i386                 randconfig-a006-20211203
i386                 randconfig-a004-20211203
i386                 randconfig-a013-20211204
i386                 randconfig-a016-20211204
i386                 randconfig-a011-20211204
i386                 randconfig-a014-20211204
i386                 randconfig-a012-20211204
i386                 randconfig-a015-20211204
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211203
x86_64               randconfig-c007-20211203
riscv                randconfig-c006-20211203
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
powerpc              randconfig-c003-20211203
s390                 randconfig-c005-20211203
x86_64               randconfig-a016-20211203
x86_64               randconfig-a011-20211203
x86_64               randconfig-a013-20211203
x86_64               randconfig-a014-20211203
x86_64               randconfig-a015-20211203
x86_64               randconfig-a012-20211203
i386                 randconfig-a016-20211203
i386                 randconfig-a013-20211203
i386                 randconfig-a011-20211203
i386                 randconfig-a014-20211203
i386                 randconfig-a012-20211203
i386                 randconfig-a015-20211203
hexagon              randconfig-r045-20211203
s390                 randconfig-r044-20211203
hexagon              randconfig-r041-20211203
riscv                randconfig-r042-20211203
hexagon              randconfig-r045-20211204
hexagon              randconfig-r041-20211204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
