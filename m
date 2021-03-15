Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD0333C7BF
	for <lists+linux-usb@lfdr.de>; Mon, 15 Mar 2021 21:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhCOUb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 16:31:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:18591 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229928AbhCOUbu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 16:31:50 -0400
IronPort-SDR: TxBFIOyuAtqUgWYwI//2iNsP6D0JnXCkK6VbXbehBUdI8wfGSYQSLZFM7pQ9GqAZ64Q0ipe/iz
 upB1YynWLsLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="189242441"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="189242441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 13:31:49 -0700
IronPort-SDR: RK0ahcX4DU7U3kWqT3qaCclHDpUhD7E3aMK+5Dqkjgamtow7lCueL1SE3mvNb97R6uPxe9Vh54
 e+TdkJ/+/nwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="411968483"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Mar 2021 13:31:48 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lLtsR-0000dp-Q6; Mon, 15 Mar 2021 20:31:47 +0000
Date:   Tue, 16 Mar 2021 04:31:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 aa403f257e992eac33cd9afd1d87ce9299f6db7a
Message-ID: <604fc40b.ng2TsVBvbX2qktXC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: aa403f257e992eac33cd9afd1d87ce9299f6db7a  Merge 5.12-rc3 into usb-next

elapsed time: 722m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
mips                      malta_kvm_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
sh                                  defconfig
sh                               alldefconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      loongson3_defconfig
nds32                            alldefconfig
arc                      axs103_smp_defconfig
arm                           u8500_defconfig
powerpc                      ppc6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
mips                        jmr3927_defconfig
arm                           h5000_defconfig
m68k                       m5208evb_defconfig
arm                           h3600_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc                       sparc32_defconfig
mips                   sb1250_swarm_defconfig
arm                       mainstone_defconfig
nios2                            allyesconfig
arm                           omap1_defconfig
arm                           spitz_defconfig
mips                         rt305x_defconfig
mips                           xway_defconfig
powerpc                     tqm8555_defconfig
arm                       omap2plus_defconfig
powerpc                    socrates_defconfig
powerpc                       ebony_defconfig
sparc                       sparc64_defconfig
arm                         vf610m4_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7269_defconfig
powerpc                      walnut_defconfig
sh                             espt_defconfig
powerpc                      cm5200_defconfig
m68k                            mac_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                          alldefconfig
alpha                               defconfig
sh                           se7780_defconfig
sh                          urquell_defconfig
xtensa                           alldefconfig
sh                        sh7757lcr_defconfig
s390                                defconfig
sh                           se7206_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
mips                            ar7_defconfig
arc                        nsim_700_defconfig
sh                             shx3_defconfig
powerpc                     kmeter1_defconfig
mips                        nlm_xlp_defconfig
arm                         nhk8815_defconfig
xtensa                generic_kc705_defconfig
parisc                           alldefconfig
sh                            titan_defconfig
arm                         assabet_defconfig
mips                           ip32_defconfig
arm                        multi_v7_defconfig
h8300                       h8s-sim_defconfig
sh                          r7785rp_defconfig
mips                        maltaup_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7721_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                        edosk7760_defconfig
arm                         s3c2410_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
powerpc                      ppc40x_defconfig
sh                          lboxre2_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
arm                         orion5x_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
