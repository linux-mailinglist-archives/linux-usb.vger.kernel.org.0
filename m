Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8050468EA3
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 02:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhLFBs1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 20:48:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:30059 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231514AbhLFBs1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Dec 2021 20:48:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="224097099"
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
   d="scan'208";a="224097099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2021 17:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
   d="scan'208";a="599112333"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2021 17:44:49 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mu33g-000Kh8-Oz; Mon, 06 Dec 2021 01:44:48 +0000
Date:   Mon, 06 Dec 2021 09:44:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 9899aa5ba525c293ea14f20891f3d98690661aea
Message-ID: <61ad6afc.nM2dAGD6EHzt0VEm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9899aa5ba525c293ea14f20891f3d98690661aea  usb: core: Fix file path that does not exist

elapsed time: 724m

configs tested: 205
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          pxa3xx_defconfig
sh                          rsk7269_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      ppc64e_defconfig
arm                         lubbock_defconfig
arm                            hisi_defconfig
arm                  colibri_pxa300_defconfig
arm                           spitz_defconfig
x86_64                              defconfig
arc                          axs103_defconfig
sparc                            allyesconfig
powerpc                    klondike_defconfig
arm                             rpc_defconfig
nds32                            alldefconfig
powerpc                     tqm8541_defconfig
arm                        shmobile_defconfig
h8300                    h8300h-sim_defconfig
powerpc                    amigaone_defconfig
arm                           h3600_defconfig
arm                   milbeaut_m10v_defconfig
arm                        mvebu_v7_defconfig
ia64                            zx1_defconfig
powerpc                      tqm8xx_defconfig
m68k                         amcore_defconfig
arm                        cerfcube_defconfig
xtensa                          iss_defconfig
powerpc                     kilauea_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                       m5208evb_defconfig
powerpc                     pseries_defconfig
powerpc                     sequoia_defconfig
powerpc64                           defconfig
arm                           stm32_defconfig
arm                         palmz72_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     akebono_defconfig
arm                            xcep_defconfig
i386                                defconfig
arm                           viper_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7343_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     rainier_defconfig
m68k                             allmodconfig
powerpc                   bluestone_defconfig
powerpc                     asp8347_defconfig
arc                        nsim_700_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                  or1klitex_defconfig
powerpc                 linkstation_defconfig
sparc                            alldefconfig
arm                        oxnas_v6_defconfig
sh                          r7780mp_defconfig
csky                                defconfig
arm                           tegra_defconfig
h8300                            alldefconfig
arm                         shannon_defconfig
nios2                            alldefconfig
arm                           sama5_defconfig
arm                            mmp2_defconfig
arm                          simpad_defconfig
powerpc                      cm5200_defconfig
sparc64                          alldefconfig
powerpc                      ppc40x_defconfig
arm                           corgi_defconfig
mips                      bmips_stb_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
powerpc                      makalu_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
um                           x86_64_defconfig
sh                        sh7757lcr_defconfig
sh                           se7721_defconfig
arm                        multi_v5_defconfig
powerpc                    mvme5100_defconfig
powerpc                        warp_defconfig
arc                         haps_hs_defconfig
powerpc                         wii_defconfig
mips                      loongson3_defconfig
powerpc                     pq2fads_defconfig
nios2                         10m50_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   currituck_defconfig
sh                          rsk7201_defconfig
sh                           se7712_defconfig
arm                          pxa910_defconfig
arm                          gemini_defconfig
m68k                         apollo_defconfig
powerpc                 mpc8313_rdb_defconfig
riscv                          rv32_defconfig
arm                  randconfig-c002-20211205
arm                  randconfig-c002-20211206
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211205
i386                 randconfig-a005-20211205
i386                 randconfig-a003-20211205
i386                 randconfig-a002-20211205
i386                 randconfig-a006-20211205
i386                 randconfig-a004-20211205
x86_64               randconfig-a016-20211206
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
i386                 randconfig-a016-20211206
i386                 randconfig-a013-20211206
i386                 randconfig-a011-20211206
i386                 randconfig-a014-20211206
i386                 randconfig-a012-20211206
i386                 randconfig-a015-20211206
x86_64               randconfig-a006-20211205
x86_64               randconfig-a005-20211205
x86_64               randconfig-a001-20211205
x86_64               randconfig-a002-20211205
x86_64               randconfig-a004-20211205
x86_64               randconfig-a003-20211205
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211205
arm                  randconfig-c002-20211205
riscv                randconfig-c006-20211205
mips                 randconfig-c004-20211205
i386                 randconfig-c001-20211205
powerpc              randconfig-c003-20211205
s390                 randconfig-c005-20211205
x86_64               randconfig-a006-20211206
x86_64               randconfig-a005-20211206
x86_64               randconfig-a001-20211206
x86_64               randconfig-a002-20211206
x86_64               randconfig-a004-20211206
x86_64               randconfig-a003-20211206
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
x86_64               randconfig-a016-20211205
x86_64               randconfig-a011-20211205
x86_64               randconfig-a013-20211205
x86_64               randconfig-a015-20211205
x86_64               randconfig-a012-20211205
x86_64               randconfig-a014-20211205
i386                 randconfig-a013-20211205
i386                 randconfig-a016-20211205
i386                 randconfig-a011-20211205
i386                 randconfig-a014-20211205
i386                 randconfig-a012-20211205
i386                 randconfig-a015-20211205
hexagon              randconfig-r045-20211205
s390                 randconfig-r044-20211205
riscv                randconfig-r042-20211205
hexagon              randconfig-r041-20211205
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
