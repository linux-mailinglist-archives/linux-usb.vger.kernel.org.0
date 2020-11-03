Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CAB2A54CA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 22:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388581AbgKCVOa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 16:14:30 -0500
Received: from mga17.intel.com ([192.55.52.151]:8609 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388856AbgKCVOX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 16:14:23 -0500
IronPort-SDR: ZrHNVdR8l7pEH4v90PFAlNJ5ScxhL2WCshcsNBRwKwChSuJ5Ljgw4x0f7tDy8FFtpIHQ/by/Lt
 g8DBvBLN9VAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="148979243"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="148979243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 13:14:22 -0800
IronPort-SDR: 1lJnmcTvUoJayQptWLxIAWkOLQFWgbfuxh6DVkF3o3vvL9EtibOJGlsEH2akICay+5Mgzdoyc8
 ilgiTXoqVtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="363753825"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2020 13:14:19 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ka3dC-0000Vt-Ir; Tue, 03 Nov 2020 21:14:18 +0000
Date:   Wed, 04 Nov 2020 05:13:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 35ad0d901eac56ac6af2e4d726f255486c1ee36c
Message-ID: <5fa1c80f.l69HfciiY85x2PDF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 35ad0d901eac56ac6af2e4d726f255486c1ee36c  usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL check

elapsed time: 723m

configs tested: 195
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                         amcore_defconfig
sh                           sh2007_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
mips                        nlm_xlp_defconfig
mips                  cavium_octeon_defconfig
mips                     loongson1b_defconfig
arm                           h3600_defconfig
powerpc                     sequoia_defconfig
sh                        sh7757lcr_defconfig
arm                        spear3xx_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                       rbtx49xx_defconfig
arm                          exynos_defconfig
arm                        neponset_defconfig
arm                        oxnas_v6_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    sam440ep_defconfig
openrisc                         alldefconfig
sh                             espt_defconfig
arm                            xcep_defconfig
arc                           tb10x_defconfig
sh                          rsk7269_defconfig
powerpc                      obs600_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                             alldefconfig
arm                            zeus_defconfig
powerpc                     tqm5200_defconfig
ia64                          tiger_defconfig
sh                         ecovec24_defconfig
powerpc                   bluestone_defconfig
arc                        vdk_hs38_defconfig
arm                            qcom_defconfig
m68k                          atari_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv                            alldefconfig
powerpc                      arches_defconfig
powerpc                    gamecube_defconfig
arm                          pxa3xx_defconfig
mips                     cu1830-neo_defconfig
mips                      bmips_stb_defconfig
powerpc                      katmai_defconfig
arm                           spitz_defconfig
powerpc                   currituck_defconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
arm                         lubbock_defconfig
arm                        vexpress_defconfig
powerpc                     mpc512x_defconfig
powerpc                    ge_imp3a_defconfig
sh                          rsk7264_defconfig
powerpc                     asp8347_defconfig
powerpc                        fsp2_defconfig
arm                          ep93xx_defconfig
powerpc                  iss476-smp_defconfig
arm                     davinci_all_defconfig
arm                       omap2plus_defconfig
sh                             sh03_defconfig
arm                      pxa255-idp_defconfig
sh                          rsk7203_defconfig
powerpc                    adder875_defconfig
powerpc                      cm5200_defconfig
arm                        mvebu_v5_defconfig
m68k                          sun3x_defconfig
mips                           gcw0_defconfig
xtensa                    smp_lx200_defconfig
sparc64                             defconfig
powerpc                     tqm8555_defconfig
arm                           h5000_defconfig
arm                         orion5x_defconfig
nios2                            alldefconfig
arm                            mmp2_defconfig
arm                        cerfcube_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
arm                          simpad_defconfig
powerpc                      ppc44x_defconfig
mips                      malta_kvm_defconfig
sh                         apsh4a3a_defconfig
powerpc                     ep8248e_defconfig
arm                          pcm027_defconfig
powerpc                     stx_gp3_defconfig
arm                       aspeed_g5_defconfig
powerpc                     pseries_defconfig
arm                           viper_defconfig
powerpc64                           defconfig
arm                       imx_v6_v7_defconfig
um                             i386_defconfig
sh                   sh7770_generic_defconfig
mips                           ip32_defconfig
arm                             mxs_defconfig
openrisc                            defconfig
powerpc                       holly_defconfig
arm                        mvebu_v7_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      ep88xc_defconfig
mips                     cu1000-neo_defconfig
sh                               allmodconfig
powerpc                         ps3_defconfig
powerpc                     rainier_defconfig
mips                       bmips_be_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                       spear13xx_defconfig
arm                          pxa168_defconfig
xtensa                  nommu_kc705_defconfig
mips                        qi_lb60_defconfig
arm                       versatile_defconfig
sh                            shmin_defconfig
powerpc                 canyonlands_defconfig
h8300                     edosk2674_defconfig
arm                       mainstone_defconfig
xtensa                  audio_kc705_defconfig
arm                         lpc18xx_defconfig
nds32                             allnoconfig
ia64                                defconfig
xtensa                           allyesconfig
nios2                         3c120_defconfig
m68k                       m5475evb_defconfig
sh                           se7751_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
x86_64               randconfig-a004-20201103
x86_64               randconfig-a005-20201103
x86_64               randconfig-a003-20201103
x86_64               randconfig-a002-20201103
x86_64               randconfig-a006-20201103
x86_64               randconfig-a001-20201103
i386                 randconfig-a004-20201103
i386                 randconfig-a006-20201103
i386                 randconfig-a005-20201103
i386                 randconfig-a001-20201103
i386                 randconfig-a002-20201103
i386                 randconfig-a003-20201103
i386                 randconfig-a013-20201103
i386                 randconfig-a015-20201103
i386                 randconfig-a014-20201103
i386                 randconfig-a016-20201103
i386                 randconfig-a011-20201103
i386                 randconfig-a012-20201103
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201103
x86_64               randconfig-a015-20201103
x86_64               randconfig-a011-20201103
x86_64               randconfig-a013-20201103
x86_64               randconfig-a014-20201103
x86_64               randconfig-a016-20201103

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
