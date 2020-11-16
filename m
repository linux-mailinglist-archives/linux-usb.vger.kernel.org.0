Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04A72B5374
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 22:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbgKPVKQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 16:10:16 -0500
Received: from mga09.intel.com ([134.134.136.24]:20948 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728877AbgKPVKQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 16:10:16 -0500
IronPort-SDR: WvtuEkOk8yKzQ4WNWee4M38+d4lLIwS5/lnDc8OwmySh3eJ9RTXrLU55OOhsoGVaQL9xgnMGAv
 5+mdffhRpz5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="170987034"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="170987034"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 13:10:08 -0800
IronPort-SDR: 6YW/5alM66zDFAEjCB6i0tciYnSuJEeJljR2Tru+wKRZr3vpyrhsIvNQ7fEPMN6rY0EV0CRoPO
 iiU4axQIpO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; 
   d="scan'208";a="329833102"
Received: from lkp-server01.sh.intel.com (HELO fb398427a497) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Nov 2020 13:10:06 -0800
Received: from kbuild by fb398427a497 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kellG-0000DE-7j; Mon, 16 Nov 2020 21:10:06 +0000
Date:   Tue, 17 Nov 2020 05:09:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 0fb2c41f992cc58aa87fe42b6ee9c6048359670f
Message-ID: <5fb2ea8e.VWgGJqb3Ad3EPpje%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 0fb2c41f992cc58aa87fe42b6ee9c6048359670f  Merge 5.10-rc4 into here.

elapsed time: 725m

configs tested: 182
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                   sh7770_generic_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7757lcr_defconfig
s390                                defconfig
arm                         lpc32xx_defconfig
mips                            e55_defconfig
openrisc                 simple_smp_defconfig
sh                          rsk7203_defconfig
arm                       netwinder_defconfig
arm                     am200epdkit_defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
mips                           ip27_defconfig
sh                          r7780mp_defconfig
s390                             alldefconfig
powerpc                      pmac32_defconfig
arc                        nsimosci_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
um                           x86_64_defconfig
arm                        magician_defconfig
m68k                        m5272c3_defconfig
arm                        spear3xx_defconfig
arm                         shannon_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
sh                      rts7751r2d1_defconfig
riscv                    nommu_k210_defconfig
arm                     eseries_pxa_defconfig
mips                      malta_kvm_defconfig
m68k                         amcore_defconfig
arm                           viper_defconfig
ia64                          tiger_defconfig
mips                       capcella_defconfig
mips                        nlm_xlr_defconfig
sh                        dreamcast_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
arc                          axs101_defconfig
powerpc                     ep8248e_defconfig
m68k                             allmodconfig
powerpc                     sbc8548_defconfig
openrisc                         alldefconfig
powerpc                      cm5200_defconfig
mips                          malta_defconfig
microblaze                          defconfig
nds32                            alldefconfig
powerpc                      ppc40x_defconfig
arm                          badge4_defconfig
um                            kunit_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           xway_defconfig
riscv                             allnoconfig
alpha                               defconfig
powerpc                      walnut_defconfig
alpha                            allyesconfig
h8300                               defconfig
mips                     cu1830-neo_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
sh                           se7721_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
arm                           h3600_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
sh                         ap325rxa_defconfig
arm                        mvebu_v7_defconfig
ia64                            zx1_defconfig
i386                             allyesconfig
powerpc                     pq2fads_defconfig
mips                        jmr3927_defconfig
xtensa                  audio_kc705_defconfig
arm                        vexpress_defconfig
m68k                          hp300_defconfig
sh                          kfr2r09_defconfig
arm                       multi_v4t_defconfig
arm                          ixp4xx_defconfig
powerpc                      chrp32_defconfig
arm                          moxart_defconfig
powerpc                      arches_defconfig
sh                          lboxre2_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm47xx_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                       m5249evb_defconfig
m68k                          sun3x_defconfig
arm                          collie_defconfig
s390                          debug_defconfig
arm                          gemini_defconfig
powerpc                 xes_mpc85xx_defconfig
ia64                         bigsur_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201115
i386                 randconfig-a014-20201115
i386                 randconfig-a016-20201115
i386                 randconfig-a011-20201115
i386                 randconfig-a015-20201115
i386                 randconfig-a013-20201115
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
