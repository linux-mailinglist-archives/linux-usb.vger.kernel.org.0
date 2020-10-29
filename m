Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7689129DBAC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 01:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390704AbgJ2AL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 20:11:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:37313 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388084AbgJ2AL2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 20:11:28 -0400
IronPort-SDR: 7yyhV8nJw/ySiDqjE0zzy5mZ/yxCucQABJdspjlMbzQXOAzfYR423JMcyJAi2Rd31eVXPl8NCn
 GcRz6CNOXQ3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="253057916"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="253057916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 17:11:27 -0700
IronPort-SDR: xK6Lq7gMRNkMUj+eR9RdjpcHMi4UCmbhEydi4id3mLpBG32ZGscRN30WYcUyNGz0dMV11Uwzmb
 hK1jC1/uYqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="318782204"
Received: from lkp-server02.sh.intel.com (HELO 0471ce7c9af6) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2020 17:11:25 -0700
Received: from kbuild by 0471ce7c9af6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXvXJ-0000Fn-4S; Thu, 29 Oct 2020 00:11:25 +0000
Date:   Thu, 29 Oct 2020 08:11:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 aee9ddb1d3718d3ba05b50c51622d7792ae749c9
Message-ID: <5f9a08ac.MLgRHiZDTrXi1Iz8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: aee9ddb1d3718d3ba05b50c51622d7792ae749c9  kcov, usb: only collect coverage from __usb_hcd_giveback_urb in softirq

elapsed time: 720m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
sh                            titan_defconfig
powerpc                     tqm8548_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
sh                               alldefconfig
sh                          r7780mp_defconfig
mips                     loongson1b_defconfig
sh                               j2_defconfig
sh                        apsh4ad0a_defconfig
powerpc                    socrates_defconfig
powerpc64                           defconfig
arm                         nhk8815_defconfig
powerpc                     tqm8541_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
riscv                    nommu_k210_defconfig
nds32                             allnoconfig
powerpc                     tqm8555_defconfig
mips                        bcm47xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                  mpc866_ads_defconfig
arm                         at91_dt_defconfig
powerpc                     pseries_defconfig
arm                        magician_defconfig
arc                     haps_hs_smp_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
alpha                            alldefconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
m68k                        mvme147_defconfig
sh                               allmodconfig
powerpc                      bamboo_defconfig
powerpc                     kmeter1_defconfig
c6x                        evmc6474_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
sh                           se7206_defconfig
arm                          prima2_defconfig
m68k                       m5249evb_defconfig
mips                          rb532_defconfig
sh                           se7343_defconfig
sh                         ap325rxa_defconfig
mips                           jazz_defconfig
arm                            hisi_defconfig
x86_64                              defconfig
mips                          ath25_defconfig
m68k                             allyesconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
microblaze                          defconfig
arm                        multi_v7_defconfig
powerpc                     akebono_defconfig
arm                       omap2plus_defconfig
nds32                               defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
mips                            ar7_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
nds32                            alldefconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
arm                              zx_defconfig
mips                       bmips_be_defconfig
arm                           viper_defconfig
arm                        realview_defconfig
powerpc                     skiroot_defconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
arm                            zeus_defconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
i386                 randconfig-a016-20201028
i386                 randconfig-a014-20201028
i386                 randconfig-a015-20201028
i386                 randconfig-a013-20201028
i386                 randconfig-a012-20201028
i386                 randconfig-a011-20201028
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
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
