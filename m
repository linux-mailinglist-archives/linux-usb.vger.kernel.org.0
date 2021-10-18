Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E954327E6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 21:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhJRTrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 15:47:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:24341 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232835AbhJRTrq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Oct 2021 15:47:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228299756"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="228299756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 12:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="566526657"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2021 12:45:33 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mcYZh-000Bh8-40; Mon, 18 Oct 2021 19:45:33 +0000
Date:   Tue, 19 Oct 2021 03:45:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 c03fb16bafdfc42a158d0f35a0472128a7d2ff57
Message-ID: <616dcec6.Xk0wS3QKimCiJxpY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: c03fb16bafdfc42a158d0f35a0472128a7d2ff57  Merge 5.15-rc6 into usb-next

elapsed time: 720m

configs tested: 197
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211019
mips                         tb0287_defconfig
s390                          debug_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                         orion5x_defconfig
powerpc                  iss476-smp_defconfig
arm                      pxa255-idp_defconfig
powerpc                     stx_gp3_defconfig
mips                         cobalt_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8548_defconfig
xtensa                       common_defconfig
mips                            gpr_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7264_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
xtensa                  nommu_kc705_defconfig
xtensa                         virt_defconfig
powerpc                      obs600_defconfig
mips                        qi_lb60_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
powerpc                     powernv_defconfig
openrisc                            defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm                         palmz72_defconfig
arm                         nhk8815_defconfig
powerpc                    socrates_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                          atari_defconfig
mips                       capcella_defconfig
arm                       imx_v6_v7_defconfig
xtensa                  audio_kc705_defconfig
s390                                defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          imote2_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         hackkit_defconfig
mips                     cu1000-neo_defconfig
m68k                           sun3_defconfig
mips                            e55_defconfig
powerpc                      makalu_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
ia64                             allmodconfig
sh                         apsh4a3a_defconfig
sh                          r7785rp_defconfig
s390                       zfcpdump_defconfig
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
arm                        keystone_defconfig
sh                         ap325rxa_defconfig
sh                          r7780mp_defconfig
m68k                          sun3x_defconfig
arc                        nsim_700_defconfig
m68k                        mvme147_defconfig
mips                           ip28_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
powerpc64                        alldefconfig
mips                     loongson2k_defconfig
mips                      malta_kvm_defconfig
arm                           stm32_defconfig
powerpc                     mpc5200_defconfig
arm                         cm_x300_defconfig
powerpc                   currituck_defconfig
powerpc                        icon_defconfig
powerpc                      ep88xc_defconfig
arm                            hisi_defconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
powerpc                     kmeter1_defconfig
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
arm                  randconfig-c002-20211018
i386                 randconfig-c001-20211018
x86_64               randconfig-c001-20211018
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20211018
x86_64               randconfig-a006-20211018
x86_64               randconfig-a005-20211018
x86_64               randconfig-a001-20211018
x86_64               randconfig-a002-20211018
x86_64               randconfig-a003-20211018
i386                 randconfig-a001-20211018
i386                 randconfig-a003-20211018
i386                 randconfig-a004-20211018
i386                 randconfig-a005-20211018
i386                 randconfig-a002-20211018
i386                 randconfig-a006-20211018
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
i386                 randconfig-a016-20211017
i386                 randconfig-a014-20211017
i386                 randconfig-a011-20211017
i386                 randconfig-a015-20211017
i386                 randconfig-a012-20211017
i386                 randconfig-a013-20211017
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
mips                 randconfig-c004-20211017
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
s390                 randconfig-c005-20211017
x86_64               randconfig-c007-20211017
powerpc              randconfig-c003-20211017
riscv                randconfig-c006-20211017
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
x86_64               randconfig-a015-20211018
x86_64               randconfig-a012-20211018
x86_64               randconfig-a016-20211018
x86_64               randconfig-a014-20211018
x86_64               randconfig-a011-20211018
x86_64               randconfig-a013-20211018
i386                 randconfig-a014-20211018
i386                 randconfig-a016-20211018
i386                 randconfig-a012-20211018
i386                 randconfig-a013-20211018
hexagon              randconfig-r041-20211018
s390                 randconfig-r044-20211018
riscv                randconfig-r042-20211018
hexagon              randconfig-r045-20211018
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
