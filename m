Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA84346E4C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 01:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbhCXAiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 20:38:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:8715 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233822AbhCXAhs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 20:37:48 -0400
IronPort-SDR: ZtcLHpsKXDVrwbBZj4Syp5HArj1Utocy4TaZA2oFixqpPpq8m62xLdKH7+uyO2O4MTfU8AsXAj
 iEMnbWT3jJkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275696533"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="275696533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 17:37:47 -0700
IronPort-SDR: e2TehhKXE6/aWTHHT8qqQY64IrfIK0SV5tJPPkZHePwnvOM+OnPo9VDRut1Qt72dNALSyCsbW4
 3sBuf/3J4zSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="452366088"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2021 17:37:45 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lOrWq-0000tE-Gl; Wed, 24 Mar 2021 00:37:44 +0000
Date:   Wed, 24 Mar 2021 08:37:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 0bd860493f81eb2a46173f6f5e44cc38331c8dbd
Message-ID: <605a89b9.IO64du8o7uJjOxnZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 0bd860493f81eb2a46173f6f5e44cc38331c8dbd  USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem

elapsed time: 726m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
mips                        workpad_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                     cu1000-neo_defconfig
arm                        mini2440_defconfig
powerpc                     redwood_defconfig
mips                            ar7_defconfig
m68k                            mac_defconfig
m68k                             allyesconfig
arm                          imote2_defconfig
mips                      bmips_stb_defconfig
arm                   milbeaut_m10v_defconfig
arm                         mv78xx0_defconfig
arm                           h5000_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            lart_defconfig
m68k                        m5307c3_defconfig
h8300                    h8300h-sim_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
mips                         bigsur_defconfig
m68k                        m5407c3_defconfig
arm                            hisi_defconfig
arm                        vexpress_defconfig
sh                   sh7724_generic_defconfig
powerpc                      walnut_defconfig
powerpc                     sequoia_defconfig
xtensa                  audio_kc705_defconfig
arm                         s3c2410_defconfig
arc                          axs103_defconfig
m68k                       m5208evb_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
powerpc                      cm5200_defconfig
powerpc                  iss476-smp_defconfig
arm                      pxa255-idp_defconfig
arm                          exynos_defconfig
powerpc                    adder875_defconfig
arm                           omap1_defconfig
powerpc                     tqm8560_defconfig
arm                        trizeps4_defconfig
xtensa                  cadence_csp_defconfig
sh                     magicpanelr2_defconfig
arc                        vdk_hs38_defconfig
ia64                        generic_defconfig
arc                        nsim_700_defconfig
arm                          pxa910_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
arm                       imx_v6_v7_defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
arm                         orion5x_defconfig
mips                         tb0219_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
mips                malta_qemu_32r6_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
powerpc                   bluestone_defconfig
arc                     haps_hs_smp_defconfig
s390                             alldefconfig
mips                            e55_defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
mips                           ip28_defconfig
powerpc                      obs600_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 linkstation_defconfig
powerpc                     rainier_defconfig
mips                        maltaup_defconfig
arm                          pxa168_defconfig
arm                          collie_defconfig
arm                         lpc18xx_defconfig
sh                ecovec24-romimage_defconfig
mips                           rs90_defconfig
sh                        sh7785lcr_defconfig
sh                           se7721_defconfig
arm                     davinci_all_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7201_defconfig
arm                             pxa_defconfig
powerpc                     tqm8555_defconfig
powerpc                       eiger_defconfig
mips                     cu1830-neo_defconfig
powerpc64                           defconfig
mips                          ath25_defconfig
mips                         tb0287_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
arc                            hsdk_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210323
x86_64               randconfig-a003-20210323
x86_64               randconfig-a006-20210323
x86_64               randconfig-a001-20210323
x86_64               randconfig-a004-20210323
x86_64               randconfig-a005-20210323
i386                 randconfig-a003-20210323
i386                 randconfig-a004-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a015-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
