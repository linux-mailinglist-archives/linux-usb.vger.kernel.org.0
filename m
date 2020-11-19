Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D91D2B8970
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 02:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgKSBUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Nov 2020 20:20:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:5376 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbgKSBUx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 20:20:53 -0500
IronPort-SDR: VjxCErRVsWWLuDCN1AYAW38b15SrsSULkE6zhkPYU+a5touTzqkCpRK/q5+p0AbH4qE2yPDw/l
 OmJAL9Ko47DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189297110"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="189297110"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 17:20:52 -0800
IronPort-SDR: 5Uk9OzoVPpa/hkdrH98whPoizll9M8raGCYLS6RPwYT1UvSpCidQ29+zOYR9lP83cBqCk7+i7W
 MvLwdyGxLAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="544789823"
Received: from lkp-server01.sh.intel.com (HELO cf7a658f8e69) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Nov 2020 17:20:50 -0800
Received: from kbuild by cf7a658f8e69 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfYd0-000026-8g; Thu, 19 Nov 2020 01:20:50 +0000
Date:   Thu, 19 Nov 2020 09:20:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e1e52361c61afdf81d81cfbbfa3ce08971e60f50
Message-ID: <5fb5c841.YLOSq+JYI4e9uoxC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: e1e52361c61afdf81d81cfbbfa3ce08971e60f50  usb: typec: Add plug num_altmodes sysfs attr

elapsed time: 722m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                      pic32mzda_defconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8560_defconfig
m68k                          sun3x_defconfig
arc                        nsim_700_defconfig
mips                      loongson3_defconfig
arm                           sunxi_defconfig
nios2                            alldefconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
powerpc                     skiroot_defconfig
sh                   sh7724_generic_defconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
mips                        omega2p_defconfig
mips                    maltaup_xpa_defconfig
mips                       bmips_be_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
mips                        nlm_xlr_defconfig
powerpc                     tqm8540_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7722_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      pcm030_defconfig
powerpc                      ppc64e_defconfig
sh                         ecovec24_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
arm                          exynos_defconfig
xtensa                  cadence_csp_defconfig
mips                         rt305x_defconfig
sh                               alldefconfig
arm                      tct_hammer_defconfig
sh                             sh03_defconfig
arm                         shannon_defconfig
arm                         axm55xx_defconfig
powerpc                       ebony_defconfig
arm                           sama5_defconfig
sparc                       sparc32_defconfig
sh                            hp6xx_defconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
arm                       netwinder_defconfig
arm                         s3c2410_defconfig
arc                                 defconfig
riscv                    nommu_virt_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                           ip32_defconfig
arm                       spear13xx_defconfig
sh                           se7705_defconfig
arm                         cm_x300_defconfig
sh                          r7780mp_defconfig
arc                              alldefconfig
powerpc                     mpc83xx_defconfig
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
h8300                            allyesconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
i386                 randconfig-a006-20201119
i386                 randconfig-a005-20201119
i386                 randconfig-a002-20201119
i386                 randconfig-a001-20201119
i386                 randconfig-a003-20201119
i386                 randconfig-a004-20201119
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
i386                 randconfig-a012-20201119
i386                 randconfig-a014-20201119
i386                 randconfig-a016-20201119
i386                 randconfig-a011-20201119
i386                 randconfig-a013-20201119
i386                 randconfig-a015-20201119
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118
x86_64               randconfig-a005-20201119
x86_64               randconfig-a003-20201119
x86_64               randconfig-a004-20201119
x86_64               randconfig-a002-20201119
x86_64               randconfig-a006-20201119
x86_64               randconfig-a001-20201119

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
