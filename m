Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB61B29DCCC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 01:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgJ2Ac3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 20:32:29 -0400
Received: from mga03.intel.com ([134.134.136.65]:57486 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387544AbgJ2Ac2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 20:32:28 -0400
IronPort-SDR: txkX35lZToHtGTT9c0YDtRMNjBWMR+2liKHjujl6DQAlGZyfk5SBEjdCfjaMCEHpeOHbhtQfbA
 iKPavxbvLKKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168457925"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="168457925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 17:32:27 -0700
IronPort-SDR: UaJ5CMUS9vc6zbFzoIDcGx4hgg1s2o/f0Rc0TnPIePjhdD4bM+xe5WbO4NItLO57T/YSAf8ktA
 ysnceKcUWvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="351219333"
Received: from lkp-server02.sh.intel.com (HELO 0471ce7c9af6) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2020 17:32:26 -0700
Received: from kbuild by 0471ce7c9af6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXvrd-0000Ft-Gb; Thu, 29 Oct 2020 00:32:25 +0000
Date:   Thu, 29 Oct 2020 08:31:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 0cb686692fd200db12dcfb8231e793c1c98aec41
Message-ID: <5f9a0d62.RFB44dFTRMvm3FNf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 0cb686692fd200db12dcfb8231e793c1c98aec41  USB: apple-mfi-fastcharge: don't probe unhandled devices

elapsed time: 726m

configs tested: 202
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                        m5307c3_defconfig
c6x                                 defconfig
s390                             allyesconfig
arm                          prima2_defconfig
ia64                          tiger_defconfig
sh                               alldefconfig
sh                          r7780mp_defconfig
mips                     loongson1b_defconfig
sh                               j2_defconfig
sh                        apsh4ad0a_defconfig
powerpc                    socrates_defconfig
powerpc64                           defconfig
arm                         nhk8815_defconfig
riscv                    nommu_k210_defconfig
nds32                             allnoconfig
powerpc                     tqm8555_defconfig
mips                        bcm47xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                  mpc866_ads_defconfig
arm                         at91_dt_defconfig
powerpc                     pseries_defconfig
arm                        magician_defconfig
arm                          pxa3xx_defconfig
ia64                                defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
sh                          lboxre2_defconfig
arm                       cns3420vb_defconfig
powerpc                     asp8347_defconfig
c6x                        evmc6474_defconfig
arm                        mvebu_v5_defconfig
m68k                         amcore_defconfig
arm                        mvebu_v7_defconfig
mips                       lemote2f_defconfig
arc                     haps_hs_smp_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
alpha                            alldefconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
m68k                        mvme147_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                              zx_defconfig
c6x                         dsk6455_defconfig
parisc                generic-32bit_defconfig
powerpc                    gamecube_defconfig
arm                      integrator_defconfig
sh                               allmodconfig
powerpc                      bamboo_defconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
m68k                       m5249evb_defconfig
arm                           tegra_defconfig
powerpc                 mpc834x_mds_defconfig
arm                     davinci_all_defconfig
mips                             allyesconfig
sh                           se7343_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                           alldefconfig
powerpc                     tqm8560_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
powerpc                     mpc512x_defconfig
mips                       capcella_defconfig
sh                           se7206_defconfig
mips                          rb532_defconfig
powerpc                      walnut_defconfig
mips                     decstation_defconfig
m68k                        m5407c3_defconfig
mips                            gpr_defconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
microblaze                          defconfig
arm                        multi_v7_defconfig
powerpc                     akebono_defconfig
arm                       omap2plus_defconfig
nds32                               defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
mips                            ar7_defconfig
mips                           ip22_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
arm                         s5pv210_defconfig
arm                          tango4_defconfig
arm                          badge4_defconfig
powerpc                     tqm8540_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                malta_qemu_32r6_defconfig
sh                             espt_defconfig
arm                          ixp4xx_defconfig
um                            kunit_defconfig
m68k                          multi_defconfig
nds32                            alldefconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
mips                       bmips_be_defconfig
arm                           viper_defconfig
arm                        realview_defconfig
powerpc                     skiroot_defconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
arm                            zeus_defconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
arm                          pxa168_defconfig
riscv                    nommu_virt_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
i386                 randconfig-a002-20201028
i386                 randconfig-a005-20201028
i386                 randconfig-a003-20201028
i386                 randconfig-a001-20201028
i386                 randconfig-a004-20201028
i386                 randconfig-a006-20201028
x86_64               randconfig-a011-20201028
x86_64               randconfig-a013-20201028
x86_64               randconfig-a016-20201028
x86_64               randconfig-a015-20201028
x86_64               randconfig-a012-20201028
x86_64               randconfig-a014-20201028
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201028
i386                 randconfig-a014-20201028
i386                 randconfig-a015-20201028
i386                 randconfig-a013-20201028
i386                 randconfig-a012-20201028
i386                 randconfig-a011-20201028
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
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026
x86_64               randconfig-a001-20201028
x86_64               randconfig-a002-20201028
x86_64               randconfig-a003-20201028
x86_64               randconfig-a006-20201028
x86_64               randconfig-a005-20201028
x86_64               randconfig-a004-20201028

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
