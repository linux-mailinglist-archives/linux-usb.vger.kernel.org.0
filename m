Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC46334AF7
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 23:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCJWFx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 17:05:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:59433 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232250AbhCJWFm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 17:05:42 -0500
IronPort-SDR: v6DLYXuRb+zhn3zd9bVA/Hf9ScCRt2xIL61RRyHw5acEmi8CPsVjPqea2pOuoRsHuZJit3ySAN
 2klUNVXSab5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188670651"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="188670651"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 14:05:37 -0800
IronPort-SDR: CF1M1ukyq3+m2AcOsGddnInsyz2ZhezcCMrD/j3edePMx4g3byPQ4s0Pe3WDzWd5wluZXZjZr7
 LHrIx9dpLapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; 
   d="scan'208";a="372107326"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Mar 2021 14:05:36 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lK6xT-0000PC-Hl; Wed, 10 Mar 2021 22:05:35 +0000
Date:   Thu, 11 Mar 2021 06:05:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 60a35ba9141f06b67150ce3544bc595d049b0d83
Message-ID: <604942a5.PwhfZ5pYE4ZwHP80%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 60a35ba9141f06b67150ce3544bc595d049b0d83  usb: usb-mx2: Remove unused file

elapsed time: 728m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc                            allyesconfig
mips                         db1xxx_defconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
mips                         tb0287_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc8540_ads_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
m68k                          hp300_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc40x_defconfig
mips                      pistachio_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          landisk_defconfig
sh                          rsk7264_defconfig
sh                          r7780mp_defconfig
m68k                        mvme16x_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
arm                             ezx_defconfig
powerpc                       eiger_defconfig
ia64                            zx1_defconfig
sh                                  defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       cns3420vb_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
mips                        bcm63xx_defconfig
mips                  maltasmvp_eva_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
powerpc64                        alldefconfig
h8300                       h8s-sim_defconfig
arm                          moxart_defconfig
arm                           tegra_defconfig
sh                              ul2_defconfig
arm                        multi_v7_defconfig
powerpc                     tqm8541_defconfig
sh                          urquell_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       bvme6000_defconfig
x86_64                              defconfig
arm                        spear3xx_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    ge_imp3a_defconfig
arm                         hackkit_defconfig
mips                     loongson1b_defconfig
h8300                            alldefconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
arm                         lubbock_defconfig
arm                            hisi_defconfig
mips                           ip32_defconfig
sh                          lboxre2_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s3c2410_defconfig
mips                          ath79_defconfig
riscv                               defconfig
mips                             allyesconfig
arm                            xcep_defconfig
arc                           tb10x_defconfig
arm                          ep93xx_defconfig
powerpc                     stx_gp3_defconfig
arm                          pxa910_defconfig
powerpc                        icon_defconfig
m68k                        m5307c3_defconfig
powerpc                     tqm5200_defconfig
xtensa                          iss_defconfig
sh                         ap325rxa_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210309
i386                 randconfig-a003-20210309
i386                 randconfig-a002-20210309
i386                 randconfig-a006-20210309
i386                 randconfig-a004-20210309
i386                 randconfig-a001-20210309
x86_64               randconfig-a013-20210309
x86_64               randconfig-a016-20210309
x86_64               randconfig-a015-20210309
x86_64               randconfig-a014-20210309
x86_64               randconfig-a011-20210309
x86_64               randconfig-a012-20210309
x86_64               randconfig-a011-20210310
x86_64               randconfig-a016-20210310
x86_64               randconfig-a013-20210310
x86_64               randconfig-a015-20210310
x86_64               randconfig-a014-20210310
x86_64               randconfig-a012-20210310
i386                 randconfig-a016-20210309
i386                 randconfig-a012-20210309
i386                 randconfig-a014-20210309
i386                 randconfig-a013-20210309
i386                 randconfig-a011-20210309
i386                 randconfig-a015-20210309
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210309
x86_64               randconfig-a001-20210309
x86_64               randconfig-a004-20210309
x86_64               randconfig-a002-20210309
x86_64               randconfig-a005-20210309
x86_64               randconfig-a003-20210309
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
