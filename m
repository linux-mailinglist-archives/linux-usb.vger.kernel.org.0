Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE12D5457
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 08:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgLJHI0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 02:08:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:65019 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbgLJHIS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 02:08:18 -0500
IronPort-SDR: C7klen4JTU9QVpJDnFYRjr0m0qHXRSqEcm13Dz4oXznL7Q2o7FRrQ9AoT39rlp4bBnys+4zdYr
 BHAhgNNwgNDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174355033"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
   d="scan'208";a="174355033"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 23:07:32 -0800
IronPort-SDR: VRHpRvRwehkBsNAGikdAJWCZ1rcsko+81FZa1wvs8rx6pI587MW7+jFb+wQYneFRwDqv0W6dPH
 0AWMuyraJ2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
   d="scan'208";a="542741300"
Received: from lkp-server01.sh.intel.com (HELO ecc0cebe68d1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Dec 2020 23:07:31 -0800
Received: from kbuild by ecc0cebe68d1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1knG30-00007r-RK; Thu, 10 Dec 2020 07:07:30 +0000
Date:   Thu, 10 Dec 2020 15:07:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8010622c86ca5bb44bc98492f5968726fc7c7a21
Message-ID: <5fd1c92c.oRKeSKKitYV9f/2/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 8010622c86ca5bb44bc98492f5968726fc7c7a21  USB: UAS: introduce a quirk to set no_write_same

i386-tinyconfig vmlinux size:

+-------+------------------------------+-------------------------------------------+
| DELTA |            SYMBOL            |                  COMMIT                   |
+-------+------------------------------+-------------------------------------------+
| +1822 | TOTAL                        | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +105 | TOTAL                        | 93837812a5dc Merge 5.10-rc7 into usb-next |
| +1751 | TEXT                         | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +104 | TEXT                         | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | BSS                          | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +774 | seq_read_iter()              | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  +250 | __invalidate_mapping_pages() | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +225 | intel_pmu_drain_pebs_icl()   | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +224 | intel_pmu_drain_pebs_nhm()   | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +201 | intel_pmu_drain_pebs_core()  | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +117 | init.text                    | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  +103 | collect_syscall()            | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | dummy_iregs                  | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|   +66 | perf_event_aux_event()       | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|   +66 | perf_log_throttle()          | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|   -69 | __sb_start_write()           | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|   -78 | __ptrace_may_access()        | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  -250 | __invalidate_mapping_pages() | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  -255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  -356 | __intel_pmu_pebs_event()     | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
|  -470 | seq_read()                   | 3650b228f83a..8010622c86ca (ALL COMMITS)  |
+-------+------------------------------+-------------------------------------------+

elapsed time: 726m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc837x_mds_defconfig
h8300                               defconfig
xtensa                           alldefconfig
mips                      loongson3_defconfig
powerpc                     ppa8548_defconfig
sh                        edosk7705_defconfig
sh                          r7780mp_defconfig
powerpc                   lite5200b_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
arc                        vdk_hs38_defconfig
powerpc                      walnut_defconfig
ia64                         bigsur_defconfig
m68k                         apollo_defconfig
powerpc                     tqm8555_defconfig
riscv                            allmodconfig
mips                           gcw0_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           viper_defconfig
arm                         socfpga_defconfig
alpha                            alldefconfig
arm                        vexpress_defconfig
powerpc                      makalu_defconfig
mips                         tb0219_defconfig
mips                  maltasmvp_eva_defconfig
mips                     cu1000-neo_defconfig
powerpc                     rainier_defconfig
arm                          pcm027_defconfig
mips                          ath25_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        oxnas_v6_defconfig
s390                                defconfig
arm                        spear6xx_defconfig
arm                         s3c6400_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
arm                       versatile_defconfig
powerpc                        icon_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
arm                          ep93xx_defconfig
arm                        cerfcube_defconfig
arm                       multi_v4t_defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           tegra_defconfig
sh                             shx3_defconfig
powerpc                      pmac32_defconfig
mips                          ath79_defconfig
nios2                            alldefconfig
arm                       aspeed_g5_defconfig
powerpc                 canyonlands_defconfig
sh                      rts7751r2d1_defconfig
mips                         bigsur_defconfig
mips                           xway_defconfig
mips                         cobalt_defconfig
mips                        nlm_xlp_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
i386                 randconfig-a001-20201210
i386                 randconfig-a004-20201210
i386                 randconfig-a003-20201210
i386                 randconfig-a002-20201210
i386                 randconfig-a005-20201210
i386                 randconfig-a006-20201210
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209
x86_64               randconfig-a003-20201210
x86_64               randconfig-a006-20201210
x86_64               randconfig-a002-20201210
x86_64               randconfig-a005-20201210
x86_64               randconfig-a004-20201210
x86_64               randconfig-a001-20201210

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
