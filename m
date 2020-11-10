Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5732AE09C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 21:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJUY2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 15:24:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:50520 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgKJUY2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 15:24:28 -0500
IronPort-SDR: bfmuRCc92mX8hQHshFKgd+BNAUt3yZlcNywJajoWV988/gaagtcyofEddzaT8cnxBLgLa1u5Yb
 RuYGg+dQogdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157053483"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="157053483"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 12:24:27 -0800
IronPort-SDR: 6kO7RakEVYz3AjoFcmyURs+8FUcz3hWhIp5KAe4o32Fq1RQt1gAlOOyMBrn7MriCz44vUf+RuL
 S+bR11FlHVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="473563544"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Nov 2020 12:24:26 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcaBl-0000RP-GV; Tue, 10 Nov 2020 20:24:25 +0000
Date:   Wed, 11 Nov 2020 04:24:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 368183029cc4055c571ed19ceaa49c35de996611
Message-ID: <5faaf6e1.3wgTnLqzsZbVpVSU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-linus
branch HEAD: 368183029cc4055c571ed19ceaa49c35de996611  Merge tag 'thunderbolt-for-v5.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 723m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
m68k                       m5208evb_defconfig
arm                           sama5_defconfig
arm                            lart_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
mips                       rbtx49xx_defconfig
arm                         cm_x300_defconfig
powerpc                        fsp2_defconfig
arm                         lpc32xx_defconfig
arm                            mps2_defconfig
sh                        sh7757lcr_defconfig
c6x                        evmc6474_defconfig
arm                         shannon_defconfig
powerpc                  mpc866_ads_defconfig
mips                         bigsur_defconfig
arm                    vt8500_v6_v7_defconfig
s390                             alldefconfig
mips                       bmips_be_defconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
arm                       cns3420vb_defconfig
sh                   sh7770_generic_defconfig
powerpc                   currituck_defconfig
sh                           se7619_defconfig
powerpc                     kmeter1_defconfig
arm                        oxnas_v6_defconfig
powerpc                      mgcoge_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                           alldefconfig
mips                        qi_lb60_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                            zeus_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arm                             ezx_defconfig
mips                         tb0226_defconfig
h8300                    h8300h-sim_defconfig
arm                        neponset_defconfig
powerpc                     mpc512x_defconfig
arm                       omap2plus_defconfig
mips                  maltasmvp_eva_defconfig
arm                        vexpress_defconfig
m68k                                defconfig
mips                         tb0287_defconfig
arc                          axs101_defconfig
arm                         at91_dt_defconfig
arm                           u8500_defconfig
mips                        bcm47xx_defconfig
c6x                              alldefconfig
xtensa                              defconfig
mips                           ip28_defconfig
powerpc                   bluestone_defconfig
powerpc64                           defconfig
arm                          simpad_defconfig
mips                        bcm63xx_defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip32_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
powerpc                     asp8347_defconfig
mips                        nlm_xlr_defconfig
arm                        multi_v5_defconfig
powerpc                     stx_gp3_defconfig
powerpc                    amigaone_defconfig
powerpc                    klondike_defconfig
mips                            ar7_defconfig
mips                   sb1250_swarm_defconfig
m68k                       bvme6000_defconfig
arm                       spear13xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
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
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
