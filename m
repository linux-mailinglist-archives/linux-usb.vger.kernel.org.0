Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EC22F8B11
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jan 2021 05:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbhAPEBu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 23:01:50 -0500
Received: from mga06.intel.com ([134.134.136.31]:36678 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbhAPEBu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 23:01:50 -0500
IronPort-SDR: ReK8NXIlz4HN+5sI3X8v3C9b07A9BrO3PeugC3fhDaKMx21e6FgeM0jc8k5VYDHFgypqZcXrYz
 xIxAbIbr8ezA==
X-IronPort-AV: E=McAfee;i="6000,8403,9865"; a="240183810"
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; 
   d="scan'208";a="240183810"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 20:00:57 -0800
IronPort-SDR: 1JAi1ArbGRB2PgQBdNHc944943pOdrC3kiFuiuT06dq21sXJGx03ukDOumo1DmUyMXPRN2fLLH
 eT8IJAXWwHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; 
   d="scan'208";a="465792637"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2021 20:00:56 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l0clj-0000hd-K3; Sat, 16 Jan 2021 04:00:55 +0000
Date:   Sat, 16 Jan 2021 12:00:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c25c210f590e7a37eecd865d84f97d1f40e39786
Message-ID: <600264d7.0zoWVteZ9ZdUnaRM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c25c210f590e7a37eecd865d84f97d1f40e39786  usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot

elapsed time: 725m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        edosk7760_defconfig
powerpc                   lite5200b_defconfig
mips                     loongson1c_defconfig
powerpc                     tqm8560_defconfig
arm                           viper_defconfig
xtensa                  cadence_csp_defconfig
mips                  cavium_octeon_defconfig
powerpc                      ppc6xx_defconfig
c6x                              alldefconfig
arc                        nsimosci_defconfig
mips                         rt305x_defconfig
sh                      rts7751r2d1_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           h3600_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       mainstone_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
arm                         assabet_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8548_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
arm                             rpc_defconfig
sparc64                             defconfig
powerpc                      ppc44x_defconfig
sh                          r7785rp_defconfig
arm                          pcm027_defconfig
sparc64                          alldefconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
nios2                            alldefconfig
sh                          rsk7264_defconfig
c6x                                 defconfig
sh                               j2_defconfig
mips                          ath25_defconfig
sh                   rts7751r2dplus_defconfig
mips                     cu1830-neo_defconfig
sh                   sh7724_generic_defconfig
mips                         mpc30x_defconfig
arm                          exynos_defconfig
mips                            gpr_defconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                            pleb_defconfig
m68k                        mvme147_defconfig
arm                         bcm2835_defconfig
sh                             sh03_defconfig
powerpc                     tqm8555_defconfig
mips                           ip32_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      katmai_defconfig
m68k                        m5272c3_defconfig
arc                              allyesconfig
arm                      tct_hammer_defconfig
sh                         apsh4a3a_defconfig
arc                        nsim_700_defconfig
arm                        mini2440_defconfig
sh                           se7780_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
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
i386                 randconfig-a002-20210115
i386                 randconfig-a005-20210115
i386                 randconfig-a006-20210115
i386                 randconfig-a001-20210115
i386                 randconfig-a003-20210115
i386                 randconfig-a004-20210115
x86_64               randconfig-a004-20210115
x86_64               randconfig-a006-20210115
x86_64               randconfig-a001-20210115
x86_64               randconfig-a003-20210115
x86_64               randconfig-a005-20210115
x86_64               randconfig-a002-20210115
x86_64               randconfig-a015-20210116
x86_64               randconfig-a012-20210116
x86_64               randconfig-a013-20210116
x86_64               randconfig-a016-20210116
x86_64               randconfig-a014-20210116
x86_64               randconfig-a011-20210116
i386                 randconfig-a012-20210115
i386                 randconfig-a011-20210115
i386                 randconfig-a016-20210115
i386                 randconfig-a015-20210115
i386                 randconfig-a013-20210115
i386                 randconfig-a014-20210115
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210115
x86_64               randconfig-a012-20210115
x86_64               randconfig-a013-20210115
x86_64               randconfig-a016-20210115
x86_64               randconfig-a014-20210115
x86_64               randconfig-a011-20210115
x86_64               randconfig-a006-20210116
x86_64               randconfig-a004-20210116
x86_64               randconfig-a001-20210116
x86_64               randconfig-a005-20210116
x86_64               randconfig-a003-20210116
x86_64               randconfig-a002-20210116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
