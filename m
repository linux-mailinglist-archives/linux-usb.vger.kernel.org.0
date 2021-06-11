Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4D63A3C9C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFKHKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:10:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:53385 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230484AbhFKHKF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 03:10:05 -0400
IronPort-SDR: maztCeUqLSssqFCR6OP1ew5QbYdsJnoD8SvE1Ti1ZzIhjme0Qwpfxy7Oj5vPGruRt83TyhaE6T
 EzoFbXOHRl5g==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291106457"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="291106457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 00:07:57 -0700
IronPort-SDR: 8sNLJHx2EkUFxl0W9HxuxF12e3hTHY1fQO1/WNXYPiDQ0wvPQzJPuGu9x8VRUVRHZob6duA9s+
 diC2hBswav0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="419991519"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Jun 2021 00:07:55 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrbGl-0000UR-7R; Fri, 11 Jun 2021 07:07:55 +0000
Date:   Fri, 11 Jun 2021 15:07:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD REGRESSION
 142d0b24c1b17139f1aaaacae7542a38aa85640f
Message-ID: <60c30b9a.GY4WXEsFbZ2xvld8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 142d0b24c1b17139f1aaaacae7542a38aa85640f  usb: typec: mux: Fix copy-paste mistake in typec_mux_match

Error/Warning in current branch:

arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x29d4): undefined reference to `fsl_udc_clk_finalize'
arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x2ba8): undefined reference to `fsl_udc_clk_release'
fsl_udc_core.c:(.text+0x2848): undefined reference to `fsl_udc_clk_init'
fsl_udc_core.c:(.text+0xe88): undefined reference to `fsl_udc_clk_release'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-defconfig
    |-- arm-linux-gnueabi-ld:fsl_udc_core.c:(.text):undefined-reference-to-fsl_udc_clk_finalize
    |-- arm-linux-gnueabi-ld:fsl_udc_core.c:(.text):undefined-reference-to-fsl_udc_clk_release
    |-- fsl_udc_core.c:(.text):undefined-reference-to-fsl_udc_clk_init
    `-- fsl_udc_core.c:(.text):undefined-reference-to-fsl_udc_clk_release

elapsed time: 722m

configs tested: 149
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                        mini2440_defconfig
arm                        keystone_defconfig
sh                          sdk7780_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
mips                        nlm_xlp_defconfig
sh                          rsk7264_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       mainstone_defconfig
arm                           sama5_defconfig
powerpc                 mpc832x_mds_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
powerpc                     tqm8560_defconfig
ia64                             allmodconfig
sh                          polaris_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
arm                      footbridge_defconfig
arm                   milbeaut_m10v_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
mips                         mpc30x_defconfig
h8300                            alldefconfig
sh                           se7721_defconfig
powerpc                    ge_imp3a_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
parisc                           alldefconfig
mips                            gpr_defconfig
mips                         db1xxx_defconfig
sh                               j2_defconfig
powerpc                          allmodconfig
powerpc                      pmac32_defconfig
arc                           tb10x_defconfig
arm                          lpd270_defconfig
mips                     loongson2k_defconfig
arm                      tct_hammer_defconfig
powerpc64                           defconfig
m68k                        mvme16x_defconfig
mips                       bmips_be_defconfig
arm                            mps2_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                          r7780mp_defconfig
powerpc                      walnut_defconfig
arc                        nsimosci_defconfig
x86_64                            allnoconfig
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
powerpc                           allnoconfig
i386                 randconfig-a003-20210609
i386                 randconfig-a006-20210609
i386                 randconfig-a004-20210609
i386                 randconfig-a001-20210609
i386                 randconfig-a002-20210609
i386                 randconfig-a005-20210609
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
i386                 randconfig-a015-20210611
i386                 randconfig-a013-20210611
i386                 randconfig-a016-20210611
i386                 randconfig-a014-20210611
i386                 randconfig-a012-20210611
i386                 randconfig-a011-20210611
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
