Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636C62D215F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 04:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgLHDSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Dec 2020 22:18:00 -0500
Received: from mga14.intel.com ([192.55.52.115]:29032 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgLHDR7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Dec 2020 22:17:59 -0500
IronPort-SDR: i4S+mrHEnjYlfS+m3rhOXIY6k217VpuDsw0LPKHOhNcZB1WgtshuTCzPaqzSkahofrchlQk9y7
 i6j2rsHiXPbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173056603"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="173056603"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 19:17:18 -0800
IronPort-SDR: cqCaJLlmbiC5TixUkJ/kwJ2YcbFQik7IZlFpg+Mth8L8n44Wsr9MfKorWQu0E+23f1BfZGe3jP
 tB0/jtLqBMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="318260510"
Received: from lkp-server01.sh.intel.com (HELO 6c6df46aa5de) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2020 19:17:17 -0800
Received: from kbuild by 6c6df46aa5de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmTV6-00003w-EU; Tue, 08 Dec 2020 03:17:16 +0000
Date:   Tue, 08 Dec 2020 11:17:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 08a02f954b0def3ada8ed6d4b2c7bcb67e885e9c
Message-ID: <5fcef035.M/NJSq02/SqadfJ2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 08a02f954b0def3ada8ed6d4b2c7bcb67e885e9c  USB: add RESET_RESUME quirk for Snapscan 1212

i386-tinyconfig vmlinux size:

+-------+------------------------------+-------------------------------------------+
| DELTA |            SYMBOL            |                  COMMIT                   |
+-------+------------------------------+-------------------------------------------+
| +1820 | TOTAL                        | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +105 | TOTAL                        | 93837812a5dc Merge 5.10-rc7 into usb-next |
| +1751 | TEXT                         | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +104 | TEXT                         | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | BSS                          | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +774 | seq_read_iter()              | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  +250 | __invalidate_mapping_pages() | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +225 | intel_pmu_drain_pebs_icl()   | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +224 | intel_pmu_drain_pebs_nhm()   | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +201 | intel_pmu_drain_pebs_core()  | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +117 | init.text                    | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  +103 | collect_syscall()            | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | dummy_iregs                  | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|   +66 | perf_event_aux_event()       | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|   +66 | perf_log_throttle()          | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|   -69 | __sb_start_write()           | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|   -78 | __ptrace_may_access()        | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  -250 | __invalidate_mapping_pages() | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  -255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  -356 | __intel_pmu_pebs_event()     | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
|  -470 | seq_read()                   | 3650b228f83a..08a02f954b0d (ALL COMMITS)  |
+-------+------------------------------+-------------------------------------------+

elapsed time: 724m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
powerpc                      walnut_defconfig
arm                         palmz72_defconfig
arm                          simpad_defconfig
m68k                             alldefconfig
m68k                       m5249evb_defconfig
sh                             shx3_defconfig
powerpc                     tqm8560_defconfig
mips                        bcm63xx_defconfig
arc                          axs103_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      arches_defconfig
um                             i386_defconfig
arm                   milbeaut_m10v_defconfig
m68k                       bvme6000_defconfig
nios2                               defconfig
nds32                               defconfig
powerpc                     tqm8555_defconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc832x_rdb_defconfig
c6x                         dsk6455_defconfig
m68k                        m5272c3_defconfig
arm                     eseries_pxa_defconfig
arm                          pcm027_defconfig
powerpc                      makalu_defconfig
sh                          rsk7201_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     powernv_defconfig
m68k                        mvme16x_defconfig
arm                           tegra_defconfig
powerpc                     tqm8540_defconfig
sh                                  defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
arm                        multi_v5_defconfig
mips                           ci20_defconfig
arm                       omap2plus_defconfig
arm                         lpc18xx_defconfig
sh                          sdk7780_defconfig
m68k                       m5275evb_defconfig
mips                         tb0287_defconfig
arm                           omap1_defconfig
um                            kunit_defconfig
h8300                       h8s-sim_defconfig
mips                      bmips_stb_defconfig
powerpc                        icon_defconfig
mips                   sb1250_swarm_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
sh                               allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
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
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64               randconfig-a004-20201207
x86_64               randconfig-a006-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a003-20201207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
