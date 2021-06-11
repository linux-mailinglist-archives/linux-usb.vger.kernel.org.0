Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE253A3C9B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhFKHKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:10:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:17743 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229540AbhFKHJ6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 03:09:58 -0400
IronPort-SDR: l2/uMv2OCRsF/dgOcOg2W32TuL6uSknXgn+Wj8Gr4XK674Lwe+esvP6lVPZZ7uy9A9rQj2OMK6
 k4GuACIlpGQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192789420"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192789420"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 00:07:56 -0700
IronPort-SDR: Yp2l/mkrKCIqUEBWd70tLnSY58J7A21wmTX9GUqJ9YoonSBfkGbWmIzI5pQy0MrkGp7O5B0kSk
 +A86NNY4WFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="483162307"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Jun 2021 00:07:55 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrbGl-0000UP-70; Fri, 11 Jun 2021 07:07:55 +0000
Date:   Fri, 11 Jun 2021 15:07:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 12f739798470288c8c1053484fe0281fe4cc5ea4
Message-ID: <60c30b96.0tzSbFF11r2QclyS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 12f739798470288c8c1053484fe0281fe4cc5ea4  usb: typec: ucsi: Fix a comment in ucsi_init()

elapsed time: 722m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                     pq2fads_defconfig
arc                      axs103_smp_defconfig
arm                         lubbock_defconfig
powerpc                     taishan_defconfig
arm                         axm55xx_defconfig
powerpc                    socrates_defconfig
ia64                         bigsur_defconfig
ia64                                defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        multi_v5_defconfig
powerpc                     kilauea_defconfig
mips                   sb1250_swarm_defconfig
arm                       mainstone_defconfig
arm                           sama5_defconfig
powerpc                 mpc832x_mds_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
arm                         hackkit_defconfig
sh                          kfr2r09_defconfig
mips                        jmr3927_defconfig
arm                     am200epdkit_defconfig
mips                           ip22_defconfig
h8300                     edosk2674_defconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8555_defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7264_defconfig
powerpc                      pasemi_defconfig
powerpc                      makalu_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
powerpc                 mpc8272_ads_defconfig
h8300                               defconfig
sh                           se7619_defconfig
arm                       omap2plus_defconfig
arm                     eseries_pxa_defconfig
arm                      tct_hammer_defconfig
arm                         lpc32xx_defconfig
powerpc                    ge_imp3a_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
parisc                           alldefconfig
mips                            gpr_defconfig
arm                        spear6xx_defconfig
sh                          sdk7780_defconfig
sparc64                             defconfig
sh                            shmin_defconfig
h8300                            alldefconfig
powerpc                         ps3_defconfig
arm                            mmp2_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
alpha                               defconfig
mips                        workpad_defconfig
openrisc                  or1klitex_defconfig
sparc                            alldefconfig
sh                           se7721_defconfig
mips                         rt305x_defconfig
powerpc                      tqm8xx_defconfig
nios2                         3c120_defconfig
arm                        shmobile_defconfig
microblaze                      mmu_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                          r7780mp_defconfig
powerpc                      walnut_defconfig
arc                        nsimosci_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc6xx_defconfig
um                               alldefconfig
powerpc                 mpc836x_mds_defconfig
arc                          axs103_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210611
x86_64               randconfig-a001-20210611
x86_64               randconfig-a004-20210611
x86_64               randconfig-a003-20210611
x86_64               randconfig-a006-20210611
x86_64               randconfig-a005-20210611
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
i386                 randconfig-a015-20210611
i386                 randconfig-a013-20210611
i386                 randconfig-a016-20210611
i386                 randconfig-a014-20210611
i386                 randconfig-a012-20210611
i386                 randconfig-a011-20210611
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
