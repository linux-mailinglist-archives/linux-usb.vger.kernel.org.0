Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656A945B20F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 03:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240747AbhKXCei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 21:34:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:44284 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232450AbhKXCeh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Nov 2021 21:34:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="235421187"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="235421187"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 18:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="457295234"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Nov 2021 18:31:27 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpi4E-0004Bg-B2; Wed, 24 Nov 2021 02:31:26 +0000
Date:   Wed, 24 Nov 2021 10:30:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 113972d2e111304553d4d3226f49d18ea4b7f2f7
Message-ID: <619da3bf.zR/hzFsFDfQgvorz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 113972d2e111304553d4d3226f49d18ea4b7f2f7  usb: typec: tipd: Fix initialization sequence for cd321x

elapsed time: 722m

configs tested: 174
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211123
sh                      rts7751r2d1_defconfig
sh                        apsh4ad0a_defconfig
arm                         vf610m4_defconfig
powerpc                     mpc83xx_defconfig
mips                         rt305x_defconfig
arm                         at91_dt_defconfig
arm                        mvebu_v5_defconfig
riscv                    nommu_virt_defconfig
powerpc                       eiger_defconfig
sh                           se7722_defconfig
mips                      fuloong2e_defconfig
powerpc                      bamboo_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
powerpc                 mpc836x_mds_defconfig
arm                           stm32_defconfig
xtensa                       common_defconfig
sh                         ecovec24_defconfig
m68k                        stmark2_defconfig
mips                           ip27_defconfig
arm                          gemini_defconfig
powerpc64                           defconfig
arm                        magician_defconfig
mips                       rbtx49xx_defconfig
powerpc                     pq2fads_defconfig
powerpc                      pasemi_defconfig
mips                            ar7_defconfig
sh                          lboxre2_defconfig
h8300                     edosk2674_defconfig
arm                         hackkit_defconfig
m68k                            q40_defconfig
arc                            hsdk_defconfig
mips                       capcella_defconfig
mips                     cu1830-neo_defconfig
nios2                         3c120_defconfig
m68k                       m5249evb_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     tqm8555_defconfig
arm                          badge4_defconfig
powerpc                       ebony_defconfig
openrisc                            defconfig
arc                        nsim_700_defconfig
powerpc                      acadia_defconfig
arm                         orion5x_defconfig
sh                          rsk7264_defconfig
mips                          rm200_defconfig
mips                           xway_defconfig
parisc                generic-32bit_defconfig
powerpc                     kmeter1_defconfig
mips                     decstation_defconfig
mips                      pic32mzda_defconfig
powerpc                      arches_defconfig
arm                         s3c2410_defconfig
powerpc                     kilauea_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
powerpc                     tqm8548_defconfig
arm                              alldefconfig
arm                         cm_x300_defconfig
powerpc                    ge_imp3a_defconfig
ia64                          tiger_defconfig
arm                  colibri_pxa270_defconfig
sh                              ul2_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      ppc64e_defconfig
openrisc                 simple_smp_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     pseries_defconfig
arm                        oxnas_v6_defconfig
riscv                            allmodconfig
powerpc                     ppa8548_defconfig
arm                          imote2_defconfig
sh                          r7785rp_defconfig
ia64                        generic_defconfig
powerpc                   currituck_defconfig
riscv                          rv32_defconfig
sh                           se7750_defconfig
arm                        realview_defconfig
powerpc                     stx_gp3_defconfig
um                                  defconfig
sh                   rts7751r2dplus_defconfig
arc                     nsimosci_hs_defconfig
mips                      maltaaprp_defconfig
sh                           se7206_defconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
mips                    maltaup_xpa_defconfig
arm                        mvebu_v7_defconfig
arm                  randconfig-c002-20211123
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211123
x86_64               randconfig-a003-20211123
x86_64               randconfig-a006-20211123
x86_64               randconfig-a004-20211123
x86_64               randconfig-a005-20211123
x86_64               randconfig-a002-20211123
i386                 randconfig-a001-20211123
i386                 randconfig-a002-20211123
i386                 randconfig-a005-20211123
i386                 randconfig-a006-20211123
i386                 randconfig-a004-20211123
i386                 randconfig-a003-20211123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211123
i386                 randconfig-c001-20211123
powerpc              randconfig-c003-20211123
arm                  randconfig-c002-20211123
riscv                randconfig-c006-20211123
x86_64               randconfig-c007-20211123
mips                 randconfig-c004-20211123
x86_64               randconfig-a014-20211123
x86_64               randconfig-a011-20211123
x86_64               randconfig-a012-20211123
x86_64               randconfig-a016-20211123
x86_64               randconfig-a013-20211123
x86_64               randconfig-a015-20211123
i386                 randconfig-a016-20211123
i386                 randconfig-a015-20211123
i386                 randconfig-a012-20211123
i386                 randconfig-a013-20211123
i386                 randconfig-a014-20211123
i386                 randconfig-a011-20211123
hexagon              randconfig-r045-20211123
s390                 randconfig-r044-20211123
hexagon              randconfig-r041-20211123
riscv                randconfig-r042-20211123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
