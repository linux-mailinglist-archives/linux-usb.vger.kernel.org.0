Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FF5289D85
	for <lists+linux-usb@lfdr.de>; Sat, 10 Oct 2020 04:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgJJBkg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 21:40:36 -0400
Received: from mga01.intel.com ([192.55.52.88]:28677 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729286AbgJJBWx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Oct 2020 21:22:53 -0400
IronPort-SDR: zpCJEbBguZqg/aUlMebdphzDmSP9P9+MDf+Qd6bwcdVuNGh2UmGDDoPBqdflTUSVJOI1sFIBPm
 9Fm96E1eRpLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="183003309"
X-IronPort-AV: E=Sophos;i="5.77,357,1596524400"; 
   d="scan'208";a="183003309"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 18:22:41 -0700
IronPort-SDR: LJmXXeBBXzmB7Es3nL2XqXgQxdwt5GASNb4e2zCHXMdc3ebbMD3yK26Hn+sut81dfhO++zCHMC
 2YG377g9LynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,357,1596524400"; 
   d="scan'208";a="298609588"
Received: from lkp-server02.sh.intel.com (HELO 80eb06af76cf) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2020 18:22:40 -0700
Received: from kbuild by 80eb06af76cf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kR3aq-0000oj-4k; Sat, 10 Oct 2020 01:22:40 +0000
Date:   Sat, 10 Oct 2020 09:22:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 6c8cf369517640edcb4305b38a27f592a54b7bbe
Message-ID: <5f810cba.c5KlDgTnMDV/Ylkt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 6c8cf369517640edcb4305b38a27f592a54b7bbe  usb: typec: Add QCOM PMIC typec detection driver

elapsed time: 725m

configs tested: 152
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
sh                          kfr2r09_defconfig
mips                  maltasmvp_eva_defconfig
mips                             allmodconfig
c6x                                 defconfig
sparc64                          alldefconfig
arm                          iop32x_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
powerpc                     tqm8548_defconfig
arm                          imote2_defconfig
nios2                         3c120_defconfig
powerpc                      walnut_defconfig
powerpc                       ppc64_defconfig
xtensa                          iss_defconfig
sh                             shx3_defconfig
arm                            lart_defconfig
m68k                          atari_defconfig
powerpc                     pseries_defconfig
mips                       rbtx49xx_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7757lcr_defconfig
arc                      axs103_smp_defconfig
arm                           sama5_defconfig
ia64                        generic_defconfig
sparc                       sparc64_defconfig
arm                          pxa910_defconfig
sh                           se7721_defconfig
arm                          gemini_defconfig
powerpc                        warp_defconfig
mips                       lemote2f_defconfig
powerpc                     ppa8548_defconfig
arm                           corgi_defconfig
arm                         s3c6400_defconfig
powerpc                   motionpro_defconfig
sparc64                             defconfig
arc                        nsim_700_defconfig
arm                        multi_v7_defconfig
mips                          rm200_defconfig
sh                               j2_defconfig
arm                           spitz_defconfig
h8300                    h8300h-sim_defconfig
mips                      maltasmvp_defconfig
openrisc                    or1ksim_defconfig
sh                          sdk7780_defconfig
arm                          prima2_defconfig
powerpc                    gamecube_defconfig
c6x                        evmc6472_defconfig
mips                      loongson3_defconfig
arm                         cm_x300_defconfig
mips                     loongson1b_defconfig
arc                             nps_defconfig
mips                           gcw0_defconfig
sh                          rsk7203_defconfig
powerpc                 mpc832x_mds_defconfig
sh                        dreamcast_defconfig
xtensa                              defconfig
arm                       mainstone_defconfig
powerpc                     tqm5200_defconfig
um                             i386_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
sh                         microdev_defconfig
arm                        mvebu_v5_defconfig
arm                            xcep_defconfig
parisc                generic-32bit_defconfig
microblaze                    nommu_defconfig
xtensa                  audio_kc705_defconfig
microblaze                      mmu_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7264_defconfig
m68k                             allmodconfig
powerpc                     tqm8540_defconfig
microblaze                          defconfig
sh                           se7705_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_k210_defconfig
powerpc                      bamboo_defconfig
m68k                         amcore_defconfig
arm                             ezx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201009
i386                 randconfig-a005-20201009
i386                 randconfig-a001-20201009
i386                 randconfig-a004-20201009
i386                 randconfig-a002-20201009
i386                 randconfig-a003-20201009
x86_64               randconfig-a012-20201009
x86_64               randconfig-a015-20201009
x86_64               randconfig-a013-20201009
x86_64               randconfig-a014-20201009
x86_64               randconfig-a011-20201009
x86_64               randconfig-a016-20201009
i386                 randconfig-a015-20201009
i386                 randconfig-a013-20201009
i386                 randconfig-a014-20201009
i386                 randconfig-a016-20201009
i386                 randconfig-a011-20201009
i386                 randconfig-a012-20201009
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
x86_64               randconfig-a006-20201009
x86_64               randconfig-a004-20201009
x86_64               randconfig-a003-20201009
x86_64               randconfig-a005-20201009
x86_64               randconfig-a001-20201009
x86_64               randconfig-a002-20201009

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
