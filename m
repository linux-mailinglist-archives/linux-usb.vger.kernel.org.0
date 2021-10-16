Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21524300DD
	for <lists+linux-usb@lfdr.de>; Sat, 16 Oct 2021 09:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243744AbhJPHj5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Oct 2021 03:39:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:19029 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234547AbhJPHj4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Oct 2021 03:39:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="288894876"
X-IronPort-AV: E=Sophos;i="5.85,377,1624345200"; 
   d="scan'208";a="288894876"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2021 00:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,377,1624345200"; 
   d="scan'208";a="442776661"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2021 00:37:47 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mbeGI-0008rH-VV; Sat, 16 Oct 2021 07:37:46 +0000
Date:   Sat, 16 Oct 2021 15:37:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 cd932c2a1ecc8f261ecb8d140fa431c16379931f
Message-ID: <616a8138.0iww6ONhZJtxQ+2n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: cd932c2a1ecc8f261ecb8d140fa431c16379931f  Merge tag 'usb-serial-5.15-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1065m

configs tested: 202
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211016
i386                 randconfig-c001-20211015
sparc                            allyesconfig
mips                           ip28_defconfig
sh                        sh7763rdp_defconfig
mips                      bmips_stb_defconfig
powerpc                      acadia_defconfig
mips                        nlm_xlr_defconfig
xtensa                           alldefconfig
arm                          moxart_defconfig
sh                          rsk7264_defconfig
arm                           spitz_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc834x_mds_defconfig
nios2                            alldefconfig
arm                           omap1_defconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
powerpc                     tqm8560_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                    socrates_defconfig
arm                      tct_hammer_defconfig
mips                      maltasmvp_defconfig
arm                        trizeps4_defconfig
arm                          gemini_defconfig
openrisc                            defconfig
powerpc                          g5_defconfig
sparc                               defconfig
arm                           sama7_defconfig
powerpc                     kmeter1_defconfig
ia64                             alldefconfig
powerpc                  iss476-smp_defconfig
powerpc                      chrp32_defconfig
m68k                       m5249evb_defconfig
sparc64                             defconfig
arm                          iop32x_defconfig
h8300                       h8s-sim_defconfig
sh                        sh7785lcr_defconfig
mips                      maltaaprp_defconfig
sh                     magicpanelr2_defconfig
nds32                            alldefconfig
arm                       mainstone_defconfig
um                             i386_defconfig
mips                        nlm_xlp_defconfig
arm                  colibri_pxa300_defconfig
sh                   sh7724_generic_defconfig
s390                       zfcpdump_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
powerpc                    ge_imp3a_defconfig
arm                         bcm2835_defconfig
arc                              alldefconfig
arm                       imx_v4_v5_defconfig
arm                         lpc18xx_defconfig
powerpc                    amigaone_defconfig
m68k                        m5407c3_defconfig
powerpc                       holly_defconfig
ia64                            zx1_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
mips                          malta_defconfig
microblaze                      mmu_defconfig
mips                        vocore2_defconfig
arc                     haps_hs_smp_defconfig
sh                         microdev_defconfig
sh                          kfr2r09_defconfig
sh                         apsh4a3a_defconfig
arm                       versatile_defconfig
arm                         socfpga_defconfig
arm                           h3600_defconfig
m68k                           sun3_defconfig
h8300                            alldefconfig
powerpc                   motionpro_defconfig
m68k                          atari_defconfig
arm64                            alldefconfig
arm                          ixp4xx_defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
powerpc                      obs600_defconfig
arm                      integrator_defconfig
powerpc                      tqm8xx_defconfig
mips                     loongson1b_defconfig
sh                          sdk7786_defconfig
powerpc                      bamboo_defconfig
arm                          badge4_defconfig
arm                             rpc_defconfig
arm                           u8500_defconfig
arm                            hisi_defconfig
arm                  randconfig-c002-20211015
x86_64               randconfig-c001-20211015
arm                  randconfig-c002-20211016
x86_64               randconfig-c001-20211016
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
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211016
x86_64               randconfig-a004-20211016
x86_64               randconfig-a001-20211016
x86_64               randconfig-a005-20211016
x86_64               randconfig-a002-20211016
x86_64               randconfig-a003-20211016
i386                 randconfig-a003-20211016
i386                 randconfig-a001-20211016
i386                 randconfig-a005-20211016
i386                 randconfig-a004-20211016
i386                 randconfig-a002-20211016
i386                 randconfig-a006-20211016
x86_64               randconfig-a012-20211015
x86_64               randconfig-a015-20211015
x86_64               randconfig-a016-20211015
x86_64               randconfig-a014-20211015
x86_64               randconfig-a011-20211015
x86_64               randconfig-a013-20211015
i386                 randconfig-a016-20211015
i386                 randconfig-a014-20211015
i386                 randconfig-a011-20211015
i386                 randconfig-a015-20211015
i386                 randconfig-a012-20211015
i386                 randconfig-a013-20211015
arc                  randconfig-r043-20211015
s390                 randconfig-r044-20211015
riscv                randconfig-r042-20211015
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211015
arm                  randconfig-c002-20211015
i386                 randconfig-c001-20211015
s390                 randconfig-c005-20211015
x86_64               randconfig-c007-20211015
powerpc              randconfig-c003-20211015
riscv                randconfig-c006-20211015
x86_64               randconfig-a006-20211015
x86_64               randconfig-a004-20211015
x86_64               randconfig-a001-20211015
x86_64               randconfig-a005-20211015
x86_64               randconfig-a002-20211015
x86_64               randconfig-a003-20211015
i386                 randconfig-a003-20211015
i386                 randconfig-a001-20211015
i386                 randconfig-a005-20211015
i386                 randconfig-a004-20211015
i386                 randconfig-a002-20211015
i386                 randconfig-a006-20211015
x86_64               randconfig-a012-20211016
x86_64               randconfig-a015-20211016
x86_64               randconfig-a016-20211016
x86_64               randconfig-a014-20211016
x86_64               randconfig-a011-20211016
x86_64               randconfig-a013-20211016
i386                 randconfig-a016-20211016
i386                 randconfig-a014-20211016
i386                 randconfig-a011-20211016
i386                 randconfig-a015-20211016
i386                 randconfig-a012-20211016
i386                 randconfig-a013-20211016
hexagon              randconfig-r041-20211016
s390                 randconfig-r044-20211016
riscv                randconfig-r042-20211016
hexagon              randconfig-r045-20211016
hexagon              randconfig-r041-20211015
hexagon              randconfig-r045-20211015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
