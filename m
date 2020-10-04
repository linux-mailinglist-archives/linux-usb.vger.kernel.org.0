Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445E8282918
	for <lists+linux-usb@lfdr.de>; Sun,  4 Oct 2020 07:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDFnP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Oct 2020 01:43:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:38680 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgJDFnP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 4 Oct 2020 01:43:15 -0400
IronPort-SDR: I6+/vl1Tfvjk5uASLDKDib0GTzepgEBqBjXDvTD2W1T6nTfjqBW4yF1KLnvNywMNA0LGjsUN4A
 Rv3Fc4zoyF1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="160653537"
X-IronPort-AV: E=Sophos;i="5.77,334,1596524400"; 
   d="scan'208";a="160653537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2020 22:43:15 -0700
IronPort-SDR: t+NV/tfBQFa12JYyzDKYUniyankhAOeKRQruOdjaEnY1dSKevj7SXc7BKNdQ2HQ9ysqvTKXys6
 Xsgs6GIpdI4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,334,1596524400"; 
   d="scan'208";a="516362128"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2020 22:43:14 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kOwnh-0000M5-Di; Sun, 04 Oct 2020 05:43:13 +0000
Date:   Sun, 04 Oct 2020 13:42:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 21c949b21802341411937291fb04e153b3c8f471
Message-ID: <5f7960e0.siNTRA9zmJJ5uf/p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 21c949b21802341411937291fb04e153b3c8f471  Merge tag 'usb-for-v5.10' of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next

elapsed time: 721m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
nds32                               defconfig
sh                         ap325rxa_defconfig
ia64                                defconfig
powerpc                 mpc832x_mds_defconfig
sh                            shmin_defconfig
nios2                         3c120_defconfig
mips                     loongson1c_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        shmobile_defconfig
m68k                        mvme16x_defconfig
ia64                         bigsur_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
mips                           ip27_defconfig
sh                         apsh4a3a_defconfig
c6x                                 defconfig
powerpc                     ppa8548_defconfig
arc                          axs103_defconfig
powerpc                     akebono_defconfig
powerpc                     sbc8548_defconfig
sparc                       sparc32_defconfig
sh                             shx3_defconfig
sh                   rts7751r2dplus_defconfig
riscv                            allmodconfig
powerpc                 xes_mpc85xx_defconfig
arm                         bcm2835_defconfig
arm                       aspeed_g5_defconfig
m68k                          sun3x_defconfig
microblaze                    nommu_defconfig
nios2                         10m50_defconfig
sh                   secureedge5410_defconfig
arm                           stm32_defconfig
powerpc                       holly_defconfig
mips                          ath25_defconfig
sh                     sh7710voipgw_defconfig
arm                          lpd270_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201004
x86_64               randconfig-a002-20201004
x86_64               randconfig-a001-20201004
x86_64               randconfig-a003-20201004
x86_64               randconfig-a005-20201004
x86_64               randconfig-a006-20201004
i386                 randconfig-a006-20201004
i386                 randconfig-a005-20201004
i386                 randconfig-a001-20201004
i386                 randconfig-a004-20201004
i386                 randconfig-a003-20201004
i386                 randconfig-a002-20201004
i386                 randconfig-a014-20201004
i386                 randconfig-a015-20201004
i386                 randconfig-a013-20201004
i386                 randconfig-a016-20201004
i386                 randconfig-a011-20201004
i386                 randconfig-a012-20201004
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201004
x86_64               randconfig-a015-20201004
x86_64               randconfig-a014-20201004
x86_64               randconfig-a013-20201004
x86_64               randconfig-a011-20201004
x86_64               randconfig-a016-20201004

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
