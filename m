Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B75D386B0E
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 22:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhEQUOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 16:14:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:20198 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhEQUOn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 16:14:43 -0400
IronPort-SDR: H+F3fetR2l++HND7RH8QYNs7CG68QUUW7Y48Uo6pGdllrp1vA7W4axw3gXipP727T4U4zEMU55
 kBDds7dNzC5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180158105"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180158105"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 13:13:13 -0700
IronPort-SDR: i7tCvSBISYmHGuxjz0IkW+ETD8ZxMcdhnoaIqNEVtqSPSs9mU83zpO4JJUM/D2VulejI1SvtDQ
 yfT/bp4z9Yig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="438289865"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2021 13:13:11 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lijby-0001sh-BA; Mon, 17 May 2021 20:13:10 +0000
Date:   Tue, 18 May 2021 04:12:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 9fbf82c7641408386ddad162fd70234a574fcd3e
Message-ID: <60a2ce4a.4vJSmIffKWEQBxgg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9fbf82c7641408386ddad162fd70234a574fcd3e  Merge 5.13-rc2 into usb-next

elapsed time: 723m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           stm32_defconfig
mips                        nlm_xlr_defconfig
mips                      loongson3_defconfig
sh                        edosk7705_defconfig
m68k                                defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
x86_64                           alldefconfig
powerpc                    ge_imp3a_defconfig
mips                     cu1000-neo_defconfig
mips                           ip22_defconfig
sh                          rsk7201_defconfig
arm                       aspeed_g5_defconfig
mips                           rs90_defconfig
mips                          rb532_defconfig
s390                             alldefconfig
nds32                             allnoconfig
arm                       cns3420vb_defconfig
powerpc                        warp_defconfig
arm                          badge4_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                         amcore_defconfig
arm                        keystone_defconfig
um                                  defconfig
openrisc                  or1klitex_defconfig
um                               allyesconfig
h8300                    h8300h-sim_defconfig
powerpc                        cell_defconfig
ia64                      gensparse_defconfig
xtensa                  cadence_csp_defconfig
sh                      rts7751r2d1_defconfig
powerpc                      pasemi_defconfig
nios2                         10m50_defconfig
arm                      pxa255-idp_defconfig
sh                           se7619_defconfig
arm                         cm_x300_defconfig
sh                           se7750_defconfig
sh                                  defconfig
sh                           se7712_defconfig
mips                           ip32_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
powerpc                 mpc85xx_cds_defconfig
nios2                         3c120_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8560_ads_defconfig
ia64                        generic_defconfig
xtensa                              defconfig
mips                         rt305x_defconfig
arc                          axs101_defconfig
arm                         lpc18xx_defconfig
sh                         apsh4a3a_defconfig
sh                           sh2007_defconfig
i386                             allyesconfig
m68k                       bvme6000_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
powerpc                    amigaone_defconfig
arc                      axs103_smp_defconfig
riscv                            alldefconfig
mips                     decstation_defconfig
mips                       lemote2f_defconfig
s390                       zfcpdump_defconfig
arm                            zeus_defconfig
ia64                          tiger_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
arc                         haps_hs_defconfig
alpha                               defconfig
openrisc                    or1ksim_defconfig
arc                                 defconfig
arm                            qcom_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
m68k                          amiga_defconfig
sh                            titan_defconfig
m68k                            mac_defconfig
arm                            mps2_defconfig
mips                         cobalt_defconfig
arm                            lart_defconfig
mips                          malta_defconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8548_defconfig
sh                          lboxre2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a002-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
