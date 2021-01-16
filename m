Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AC92F8B5F
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jan 2021 06:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbhAPFDr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Jan 2021 00:03:47 -0500
Received: from mga17.intel.com ([192.55.52.151]:35610 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbhAPFDr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Jan 2021 00:03:47 -0500
IronPort-SDR: m7OZ1RfDx6hHCS8lOy4dM1Q3UwpBbpjEKxj+rAavs5NPVGpaIedBxCGxi0p+uPI/iwa33b9zeJ
 TTeKVAOOf1RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9865"; a="158416978"
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; 
   d="scan'208";a="158416978"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 21:03:03 -0800
IronPort-SDR: picoG5KKHdvL4GKCEFe2FUpCVt1MuJYWF2SzZ9B4xtRQgi/nhe8bNMDYHQ6zwMwKc4EDiNv/9H
 g1uNb2rxl8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; 
   d="scan'208";a="346375329"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jan 2021 21:03:00 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l0djn-0000il-MI; Sat, 16 Jan 2021 05:02:59 +0000
Date:   Sat, 16 Jan 2021 13:02:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 da7e0c3c2909a3d9bf8acfe1db3cb213bd7febfb
Message-ID: <6002736c.IucQd9melyEyrcP/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: da7e0c3c2909a3d9bf8acfe1db3cb213bd7febfb  xhci: tegra: Delay for disabling LFPS detector

elapsed time: 727m

configs tested: 148
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
sh                          landisk_defconfig
powerpc                   currituck_defconfig
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
mips                  maltasmvp_eva_defconfig
powerpc               mpc834x_itxgp_defconfig
um                             i386_defconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                            pleb_defconfig
m68k                        mvme147_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
arm                         lpc32xx_defconfig
sh                     sh7710voipgw_defconfig
arm                          lpd270_defconfig
powerpc                       maple_defconfig
sh                ecovec24-romimage_defconfig
sparc                       sparc64_defconfig
sh                        dreamcast_defconfig
mips                         db1xxx_defconfig
powerpc                       holly_defconfig
mips                       rbtx49xx_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc834x_itx_defconfig
arc                              allyesconfig
powerpc                      katmai_defconfig
m68k                        m5272c3_defconfig
sh                           se7206_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                             allmodconfig
c6x                         dsk6455_defconfig
arm                      tct_hammer_defconfig
sh                         apsh4a3a_defconfig
arc                        nsim_700_defconfig
arm                        mini2440_defconfig
sh                           se7780_defconfig
arm                         hackkit_defconfig
sh                          urquell_defconfig
powerpc                     redwood_defconfig
mips                      malta_kvm_defconfig
m68k                          atari_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
x86_64               randconfig-a004-20210115
x86_64               randconfig-a006-20210115
x86_64               randconfig-a001-20210115
x86_64               randconfig-a003-20210115
x86_64               randconfig-a005-20210115
x86_64               randconfig-a002-20210115
i386                 randconfig-a002-20210115
i386                 randconfig-a005-20210115
i386                 randconfig-a006-20210115
i386                 randconfig-a001-20210115
i386                 randconfig-a003-20210115
i386                 randconfig-a004-20210115
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
