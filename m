Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E620340F8E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 22:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhCRVIc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 17:08:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:50070 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhCRVIP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 17:08:15 -0400
IronPort-SDR: pC4VPeIieLbX7oq8TA0lQhOOO2NW9EBRpWvQbYUHoVc/S8OaJgPSrp38CpPgeEvSo1AKcebp21
 FaxiihtV8Tiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="189145945"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="189145945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 14:07:55 -0700
IronPort-SDR: BRiBvQxx9ubbglvsHi+L9xmUp6HHaJXJGhqiKy4OzznhzwHUowOBW+U0NzDL19g53JnSy6twDH
 +01fEkGvZUDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="379903544"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2021 14:07:54 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMzs1-0001Ph-EO; Thu, 18 Mar 2021 21:07:53 +0000
Date:   Fri, 19 Mar 2021 05:07:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 18106234c0e99f21bd50574d92dbd26d9b97d789
Message-ID: <6053c107.LXgy4u+9GRBiLJs5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 18106234c0e99f21bd50574d92dbd26d9b97d789  usb: mtu3: Fix spelling mistake "disabed" -> "disabled"

elapsed time: 722m

configs tested: 127
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
i386                             allyesconfig
riscv                            allyesconfig
arm                       omap2plus_defconfig
powerpc                 mpc8560_ads_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                        clps711x_defconfig
m68k                       m5475evb_defconfig
sparc                            alldefconfig
powerpc                        icon_defconfig
xtensa                  nommu_kc705_defconfig
mips                        workpad_defconfig
arm                         hackkit_defconfig
arm                         lpc18xx_defconfig
powerpc                      pcm030_defconfig
m68k                             allmodconfig
powerpc                     taishan_defconfig
powerpc                    socrates_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
arm                         nhk8815_defconfig
mips                  maltasmvp_eva_defconfig
mips                     decstation_defconfig
arm                          exynos_defconfig
mips                            gpr_defconfig
arm                       multi_v4t_defconfig
powerpc                      chrp32_defconfig
powerpc                   lite5200b_defconfig
csky                             alldefconfig
powerpc                      acadia_defconfig
sh                          rsk7269_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa910_defconfig
arm                          simpad_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ppc40x_defconfig
powerpc                     stx_gp3_defconfig
arm                        multi_v7_defconfig
sh                             espt_defconfig
powerpc                      ppc44x_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
mips                        vocore2_defconfig
mips                           ci20_defconfig
sh                             sh03_defconfig
sh                               j2_defconfig
mips                        jmr3927_defconfig
powerpc                      makalu_defconfig
powerpc                    amigaone_defconfig
powerpc                 xes_mpc85xx_defconfig
nios2                            allyesconfig
sh                           se7721_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a001-20210318
i386                 randconfig-a005-20210318
i386                 randconfig-a003-20210318
i386                 randconfig-a002-20210318
i386                 randconfig-a006-20210318
i386                 randconfig-a004-20210318
x86_64               randconfig-a011-20210318
x86_64               randconfig-a016-20210318
x86_64               randconfig-a013-20210318
x86_64               randconfig-a015-20210318
x86_64               randconfig-a014-20210318
x86_64               randconfig-a012-20210318
i386                 randconfig-a013-20210318
i386                 randconfig-a016-20210318
i386                 randconfig-a011-20210318
i386                 randconfig-a014-20210318
i386                 randconfig-a015-20210318
i386                 randconfig-a012-20210318
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210318
x86_64               randconfig-a001-20210318
x86_64               randconfig-a005-20210318
x86_64               randconfig-a002-20210318
x86_64               randconfig-a003-20210318
x86_64               randconfig-a004-20210318

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
