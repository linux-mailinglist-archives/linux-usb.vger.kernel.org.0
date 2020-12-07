Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8282D1C27
	for <lists+linux-usb@lfdr.de>; Mon,  7 Dec 2020 22:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgLGVaH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Dec 2020 16:30:07 -0500
Received: from mga09.intel.com ([134.134.136.24]:5288 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgLGVaH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Dec 2020 16:30:07 -0500
IronPort-SDR: FdDiC4nunRDalGwtnXYSp+orJyba5RXVVwQVn9G+k1G8fV0kzIvQR2wh1nPk4+N3BSlfEqieg+
 Eqr/5l+EqAyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173928585"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="173928585"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 13:29:25 -0800
IronPort-SDR: k8TaBZEpSdGCN6XfU9lla+HiWRs9+O++dsbTEPWzzHGP1cVhHLvZwsRLXU/Koo/NsrmzDKnHMq
 sfuCmt4Inkdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="367431696"
Received: from lkp-server01.sh.intel.com (HELO f1d34cfde454) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2020 13:29:23 -0800
Received: from kbuild by f1d34cfde454 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmO4R-0000AN-8f; Mon, 07 Dec 2020 21:29:23 +0000
Date:   Tue, 08 Dec 2020 05:28:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 93837812a5dcde17224ad20cf2ad7be1e94482bb
Message-ID: <5fce9e99.nFHCq875NOniNnxD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-next
branch HEAD: 93837812a5dcde17224ad20cf2ad7be1e94482bb  Merge 5.10-rc7 into usb-next

i386-tinyconfig vmlinux size:

+-------+------------------------------+-------------------------------------------+
| DELTA |            SYMBOL            |                  COMMIT                   |
+-------+------------------------------+-------------------------------------------+
| +1821 | TOTAL                        | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +105 | TOTAL                        | 93837812a5dc Merge 5.10-rc7 into usb-next |
| +1751 | TEXT                         | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +104 | TEXT                         | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | BSS                          | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +774 | seq_read_iter()              | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  +250 | __invalidate_mapping_pages() | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +225 | intel_pmu_drain_pebs_icl()   | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +224 | intel_pmu_drain_pebs_nhm()   | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +201 | intel_pmu_drain_pebs_core()  | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +117 | init.text                    | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  +103 | collect_syscall()            | 93837812a5dc Merge 5.10-rc7 into usb-next |
|   +68 | dummy_iregs                  | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|   +66 | perf_event_aux_event()       | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|   +66 | perf_log_throttle()          | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|   -69 | __sb_start_write()           | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|   -78 | __ptrace_may_access()        | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  -250 | __invalidate_mapping_pages() | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  -255 | __add_to_page_cache_locked() | 93837812a5dc Merge 5.10-rc7 into usb-next |
|  -356 | __intel_pmu_pebs_event()     | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
|  -470 | seq_read()                   | 3650b228f83a..93837812a5dc (ALL COMMITS)  |
+-------+------------------------------+-------------------------------------------+

elapsed time: 724m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v6_v7_defconfig
arm                          tango4_defconfig
microblaze                      mmu_defconfig
arm                        trizeps4_defconfig
mips                      fuloong2e_defconfig
m68k                       m5208evb_defconfig
mips                           mtx1_defconfig
powerpc                 mpc832x_mds_defconfig
mips                         cobalt_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
m68k                          amiga_defconfig
mips                     loongson1b_defconfig
arc                            hsdk_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
arm                  colibri_pxa270_defconfig
c6x                              alldefconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                            alldefconfig
arm                      footbridge_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
sh                          rsk7203_defconfig
powerpc                     pseries_defconfig
mips                  decstation_64_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
powerpc                     powernv_defconfig
sh                          r7780mp_defconfig
powerpc                      ppc64e_defconfig
arm                          iop32x_defconfig
mips                         tb0226_defconfig
powerpc                     stx_gp3_defconfig
powerpc                    sam440ep_defconfig
powerpc                    klondike_defconfig
m68k                          atari_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                      pistachio_defconfig
c6x                        evmc6472_defconfig
sh                  sh7785lcr_32bit_defconfig
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
i386                 randconfig-a015-20201207
i386                 randconfig-a016-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a012-20201207
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
