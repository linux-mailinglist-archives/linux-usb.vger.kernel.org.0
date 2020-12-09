Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CC52D3E45
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 10:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgLIJLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 04:11:55 -0500
Received: from mga04.intel.com ([192.55.52.120]:17379 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728457AbgLIJLz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 04:11:55 -0500
IronPort-SDR: hlz47SQC2UAROH+eSgIxkQpQX9xrDsefFHCRPnAfJKvTdauKiBYmXeyG5f+3hnS2t23056i2rQ
 H1gfu3qV4FEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="171473172"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="171473172"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 01:11:05 -0800
IronPort-SDR: Xf2yjU4ybEnfhfJKFPd81gQAoQI4DQhINVFkjqOjvwdRRTJXlqwqirpRTFnHS58d0eUw4kvJv0
 y++x8KNo9QAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="348252443"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Dec 2020 01:11:04 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmvV1-0000BW-Iw; Wed, 09 Dec 2020 09:11:03 +0000
Date:   Wed, 09 Dec 2020 17:10:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b175d273d4e4100b66e68f0675fef7a3c07a7957
Message-ID: <5fd09490.oh1QAjBpOQiZ5qWT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: b175d273d4e4100b66e68f0675fef7a3c07a7957  USB: legotower: fix logical error in recent commit

i386-tinyconfig vmlinux size:

+-------+------------------------------+-------------------------------------------+
| DELTA |            SYMBOL            |                  COMMIT                   |
+-------+------------------------------+-------------------------------------------+
| +1821 | TOTAL                        | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +105 | TOTAL                        | 93837812a5dc Merge 5.10-rc7 into usb-next |
| +1751 | TEXT                         | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +104 | TEXT                         | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | BSS                          | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +774 | seq_read_iter()              | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  +250 | __invalidate_mapping_pages() | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +225 | intel_pmu_drain_pebs_icl()   | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +224 | intel_pmu_drain_pebs_nhm()   | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +201 | intel_pmu_drain_pebs_core()  | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +117 | init.text                    | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  +103 | collect_syscall()            | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | dummy_iregs                  | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|   +66 | perf_event_aux_event()       | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|   +66 | perf_log_throttle()          | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|   -69 | __sb_start_write()           | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|   -78 | __ptrace_may_access()        | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  -250 | __invalidate_mapping_pages() | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  -255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  -356 | __intel_pmu_pebs_event()     | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
|  -470 | seq_read()                   | 3650b228f83a..b175d273d4e4 (ALL COMMITS)  |
+-------+------------------------------+-------------------------------------------+

elapsed time: 724m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       maple_defconfig
arm                             rpc_defconfig
parisc                generic-32bit_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                        warp_defconfig
sh                          lboxre2_defconfig
powerpc64                           defconfig
powerpc                     pseries_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                         ps3_defconfig
arm                            qcom_defconfig
sh                             espt_defconfig
sh                            shmin_defconfig
arm                         orion5x_defconfig
sh                         apsh4a3a_defconfig
x86_64                           alldefconfig
powerpc                         wii_defconfig
powerpc                     mpc83xx_defconfig
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7724_defconfig
powerpc                     ep8248e_defconfig
arm                         assabet_defconfig
mips                     cu1830-neo_defconfig
sh                           se7751_defconfig
arm                            lart_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7721_defconfig
mips                      bmips_stb_defconfig
arm                          ep93xx_defconfig
riscv                               defconfig
mips                  decstation_64_defconfig
m68k                        mvme16x_defconfig
arc                         haps_hs_defconfig
c6x                         dsk6455_defconfig
c6x                        evmc6472_defconfig
mips                       lemote2f_defconfig
ia64                             allmodconfig
arm                       omap2plus_defconfig
m68k                       m5475evb_defconfig
arm                             mxs_defconfig
powerpc                   currituck_defconfig
powerpc                      mgcoge_defconfig
arc                            hsdk_defconfig
xtensa                              defconfig
powerpc                      pmac32_defconfig
arm                            mmp2_defconfig
powerpc                       holly_defconfig
arm                           h5000_defconfig
sh                            migor_defconfig
mips                        bcm63xx_defconfig
mips                         rt305x_defconfig
powerpc                     tqm8541_defconfig
c6x                        evmc6678_defconfig
powerpc                     tqm5200_defconfig
powerpc                      acadia_defconfig
arc                        nsimosci_defconfig
arm                           omap1_defconfig
h8300                               defconfig
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
i386                 randconfig-a004-20201208
i386                 randconfig-a005-20201208
i386                 randconfig-a001-20201208
i386                 randconfig-a002-20201208
i386                 randconfig-a006-20201208
i386                 randconfig-a003-20201208
x86_64               randconfig-a004-20201208
x86_64               randconfig-a006-20201208
x86_64               randconfig-a005-20201208
x86_64               randconfig-a001-20201208
x86_64               randconfig-a002-20201208
x86_64               randconfig-a003-20201208
i386                 randconfig-a013-20201208
i386                 randconfig-a014-20201208
i386                 randconfig-a011-20201208
i386                 randconfig-a015-20201208
i386                 randconfig-a012-20201208
i386                 randconfig-a016-20201208
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201208
x86_64               randconfig-a012-20201208
x86_64               randconfig-a013-20201208
x86_64               randconfig-a014-20201208
x86_64               randconfig-a015-20201208
x86_64               randconfig-a011-20201208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
