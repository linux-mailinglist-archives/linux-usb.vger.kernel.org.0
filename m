Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E472EFBCF
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jan 2021 00:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbhAHXrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 18:47:13 -0500
Received: from mga04.intel.com ([192.55.52.120]:10261 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbhAHXrN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 18:47:13 -0500
IronPort-SDR: q2OHDib1WS15dvExUMM+1Y7mk4T1UGV6Mn3+RrE6Xz0UO0karnALi9CnB8i9CQNJ3HA5NX/na6
 hk97bGKplQDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="175091242"
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; 
   d="scan'208";a="175091242"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 15:46:32 -0800
IronPort-SDR: pJnh+yNohsWNdK8fNf+CW+3QeCpt+EsjdCU0iNXAliG7M5JXvmpEUjIngmzXFoGHCdqoudHLT/
 VUQ2jC6JTlSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,333,1602572400"; 
   d="scan'208";a="351025007"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jan 2021 15:46:31 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ky1Sg-0000l1-Hv; Fri, 08 Jan 2021 23:46:30 +0000
Date:   Sat, 09 Jan 2021 07:46:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 841081d89d5adf96759f2df50185de950f5d8694
Message-ID: <5ff8eec5.j7VgPY7tCdq4uTOm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 841081d89d5adf96759f2df50185de950f5d8694  usb: usbip: Use DEFINE_SPINLOCK() for spinlock

elapsed time: 1324m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       imx_v6_v7_defconfig
x86_64                              defconfig
arm                          iop32x_defconfig
powerpc                         wii_defconfig
mips                      pistachio_defconfig
m68k                           sun3_defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
arc                     haps_hs_smp_defconfig
um                           x86_64_defconfig
sparc64                          alldefconfig
arm                        oxnas_v6_defconfig
sh                           se7721_defconfig
powerpc                      mgcoge_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
riscv                          rv32_defconfig
m68k                             alldefconfig
openrisc                  or1klitex_defconfig
parisc                generic-32bit_defconfig
powerpc                        warp_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
arm                         socfpga_defconfig
powerpc                       ebony_defconfig
mips                         bigsur_defconfig
arm                        realview_defconfig
sh                            migor_defconfig
arm                           h3600_defconfig
m68k                          atari_defconfig
sparc                       sparc64_defconfig
c6x                        evmc6472_defconfig
xtensa                generic_kc705_defconfig
mips                  decstation_64_defconfig
mips                        workpad_defconfig
mips                        omega2p_defconfig
sh                            titan_defconfig
powerpc                      ppc64e_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
arm                        mvebu_v7_defconfig
microblaze                          defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
arm                       cns3420vb_defconfig
m68k                        mvme147_defconfig
sh                            shmin_defconfig
powerpc                  iss476-smp_defconfig
m68k                          hp300_defconfig
sh                          polaris_defconfig
mips                           ip27_defconfig
mips                     loongson1c_defconfig
ia64                        generic_defconfig
sh                      rts7751r2d1_defconfig
arm                       omap2plus_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
mips                           ci20_defconfig
powerpc                  mpc885_ads_defconfig
mips                malta_kvm_guest_defconfig
i386                             allyesconfig
powerpc                       ppc64_defconfig
powerpc                     tqm8560_defconfig
mips                         cobalt_defconfig
nios2                         3c120_defconfig
powerpc                  storcenter_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
powerpc                     pseries_defconfig
arm                         lpc32xx_defconfig
powerpc                     kilauea_defconfig
arc                      axs103_smp_defconfig
openrisc                    or1ksim_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
sh                           se7619_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
powerpc                      acadia_defconfig
sh                           se7722_defconfig
sh                        sh7763rdp_defconfig
parisc                generic-64bit_defconfig
powerpc                       holly_defconfig
powerpc                     mpc83xx_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
mips                      pic32mzda_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      chrp32_defconfig
arm                          lpd270_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210108
x86_64               randconfig-a011-20210108
x86_64               randconfig-a012-20210108
x86_64               randconfig-a016-20210108
x86_64               randconfig-a014-20210108
x86_64               randconfig-a015-20210108

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
