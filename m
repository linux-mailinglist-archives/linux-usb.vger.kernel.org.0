Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D8E2C5E7C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 01:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392084AbgK0An6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 19:43:58 -0500
Received: from mga04.intel.com ([192.55.52.120]:17387 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392082AbgK0An6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 19:43:58 -0500
IronPort-SDR: AEayIXwq7WaQ2nBoiqzX4dv3qQo7iG3VycgD7kavw5X/c7MQwZ5Jsvk191rAVIxOXdJgXNanlU
 PzyNKtzDiE2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="169776327"
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; 
   d="scan'208";a="169776327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 16:43:56 -0800
IronPort-SDR: XvV3OqdYX0mLorzAh5LKpr4ddOd1VB67Nif+oqvluKo2ziK9xeA+um1oMr1hkK3Fc1PIiDGpCs
 Hs9aCafjZARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; 
   d="scan'208";a="535894086"
Received: from lkp-server02.sh.intel.com (HELO e51121f5de4e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2020 16:43:55 -0800
Received: from kbuild by e51121f5de4e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kiRre-000045-OJ; Fri, 27 Nov 2020 00:43:54 +0000
Date:   Fri, 27 Nov 2020 08:43:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ab37fa851c488be805f6568ecaabb67b13cd937c
Message-ID: <5fc04bb2.RFc2YKjAi0KWkOHS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: ab37fa851c488be805f6568ecaabb67b13cd937c  usb: typec: Add type sysfs attribute file for partners

elapsed time: 722m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                        alldefconfig
mips                     loongson1c_defconfig
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
arm                           viper_defconfig
s390                                defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
csky                             alldefconfig
xtensa                          iss_defconfig
sh                          urquell_defconfig
sh                          sdk7786_defconfig
arm                           stm32_defconfig
arm                     am200epdkit_defconfig
xtensa                  audio_kc705_defconfig
arm                           efm32_defconfig
xtensa                         virt_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                      maltasmvp_defconfig
m68k                          multi_defconfig
arc                    vdk_hs38_smp_defconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
powerpc                     kmeter1_defconfig
mips                           ip22_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
arm                      tct_hammer_defconfig
powerpc                     rainier_defconfig
m68k                        mvme147_defconfig
c6x                                 defconfig
powerpc                      katmai_defconfig
arm                         assabet_defconfig
c6x                        evmc6474_defconfig
mips                        nlm_xlp_defconfig
sh                           se7750_defconfig
mips                        bcm47xx_defconfig
h8300                       h8s-sim_defconfig
arm                         hackkit_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
powerpc                      arches_defconfig
x86_64                           alldefconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                         ebsa110_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc8272_ads_defconfig
xtensa                              defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
arm                       spear13xx_defconfig
um                            kunit_defconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20201126
x86_64               randconfig-a003-20201126
x86_64               randconfig-a004-20201126
x86_64               randconfig-a005-20201126
x86_64               randconfig-a001-20201126
x86_64               randconfig-a002-20201126
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
i386                 randconfig-a004-20201126
i386                 randconfig-a003-20201126
i386                 randconfig-a002-20201126
i386                 randconfig-a005-20201126
i386                 randconfig-a001-20201126
i386                 randconfig-a006-20201126
i386                 randconfig-a012-20201126
i386                 randconfig-a013-20201126
i386                 randconfig-a011-20201126
i386                 randconfig-a016-20201126
i386                 randconfig-a014-20201126
i386                 randconfig-a015-20201126
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201126
x86_64               randconfig-a011-20201126
x86_64               randconfig-a014-20201126
x86_64               randconfig-a016-20201126
x86_64               randconfig-a012-20201126
x86_64               randconfig-a013-20201126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
