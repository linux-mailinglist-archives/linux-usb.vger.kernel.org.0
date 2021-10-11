Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5592442971A
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 20:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJKSup (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 14:50:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:48819 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhJKSun (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 14:50:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="313138237"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="313138237"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 11:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="479994893"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2021 11:48:42 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ma0Lp-0002cN-Fa; Mon, 11 Oct 2021 18:48:41 +0000
Date:   Tue, 12 Oct 2021 02:47:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ea0f69d8211963c4b2cc1998b86779a500adb502
Message-ID: <616486d8.ptNyBJxLUyz2cIFv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ea0f69d8211963c4b2cc1998b86779a500adb502  xhci: Enable trust tx length quirk for Fresco FL11 USB controller

elapsed time: 721m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211011
sparc                            allyesconfig
sh                           se7705_defconfig
arm                      tct_hammer_defconfig
ia64                      gensparse_defconfig
sh                           se7206_defconfig
powerpc                      pcm030_defconfig
sh                        edosk7760_defconfig
m68k                                defconfig
i386                             allyesconfig
mips                       capcella_defconfig
m68k                           sun3_defconfig
sh                     sh7710voipgw_defconfig
s390                                defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
arm                        realview_defconfig
arm                        multi_v5_defconfig
riscv                               defconfig
sh                     magicpanelr2_defconfig
mips                  maltasmvp_eva_defconfig
powerpc64                           defconfig
powerpc                     taishan_defconfig
powerpc                     mpc83xx_defconfig
openrisc                    or1ksim_defconfig
arm                         at91_dt_defconfig
arm                             mxs_defconfig
mips                    maltaup_xpa_defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
mips                           ip22_defconfig
arm                       mainstone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
arm                        cerfcube_defconfig
mips                           ci20_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
arm                         lubbock_defconfig
xtensa                           alldefconfig
powerpc                      ppc44x_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
mips                         tb0287_defconfig
mips                        workpad_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
h8300                            alldefconfig
powerpc                       ebony_defconfig
arm                        keystone_defconfig
arm                          iop32x_defconfig
mips                            e55_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    sam440ep_defconfig
m68k                         apollo_defconfig
mips                           xway_defconfig
openrisc                 simple_smp_defconfig
arm                     davinci_all_defconfig
sh                          sdk7780_defconfig
powerpc                   microwatt_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
nds32                            alldefconfig
sh                      rts7751r2d1_defconfig
ia64                        generic_defconfig
xtensa                    smp_lx200_defconfig
arm                          moxart_defconfig
m68k                        m5307c3_defconfig
mips                            gpr_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
