Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA32B3197
	for <lists+linux-usb@lfdr.de>; Sun, 15 Nov 2020 01:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgKOAYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 19:24:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:50997 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgKOAYo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Nov 2020 19:24:44 -0500
IronPort-SDR: L+EA0KVH4vZcMiZMGHN3fcdU+bClhkLlWuysmPiR9J1QlybCSrJnlUpDNFnDNvYXtMvtwAd64F
 4PCuiC+hOVoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9805"; a="169826236"
X-IronPort-AV: E=Sophos;i="5.77,479,1596524400"; 
   d="scan'208";a="169826236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2020 16:24:42 -0800
IronPort-SDR: G+hyxr0ZyYdeHIFL1BrzuzECLQCP8QxKbk8P3I4lXII9d+jCMoZGJekda87Sw99DNA0Cb6yvy6
 DQS2KSRmtPqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,479,1596524400"; 
   d="scan'208";a="355914693"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Nov 2020 16:24:39 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ke5qR-00012O-5U; Sun, 15 Nov 2020 00:24:39 +0000
Date:   Sun, 15 Nov 2020 08:24:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 56c62080d5b57dac2c2cdd4a83571450e38ca763
Message-ID: <5fb0752c.X2LuBQmny6+9Hu+B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  usb-testing
branch HEAD: 56c62080d5b57dac2c2cdd4a83571450e38ca763  usb: hcd.h: Remove RUN_CONTEXT

elapsed time: 722m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        workpad_defconfig
nios2                         10m50_defconfig
arm                          ep93xx_defconfig
arm                         nhk8815_defconfig
nios2                            alldefconfig
sh                          rsk7203_defconfig
m68k                            q40_defconfig
sh                             shx3_defconfig
openrisc                    or1ksim_defconfig
arm                         hackkit_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc32_defconfig
powerpc                     ppa8548_defconfig
mips                         rt305x_defconfig
powerpc                   bluestone_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                                defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8560_defconfig
powerpc                  mpc866_ads_defconfig
sh                ecovec24-romimage_defconfig
arm64                            alldefconfig
arm                           h5000_defconfig
powerpc                      pmac32_defconfig
mips                   sb1250_swarm_defconfig
sh                   sh7724_generic_defconfig
alpha                            alldefconfig
arm                         s3c6400_defconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
sh                         ecovec24_defconfig
arm                            lart_defconfig
mips                       rbtx49xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          imote2_defconfig
xtensa                         virt_defconfig
arm                        shmobile_defconfig
powerpc64                           defconfig
arm                           sama5_defconfig
mips                           ip32_defconfig
riscv                               defconfig
sh                          kfr2r09_defconfig
mips                     loongson1c_defconfig
arm                   milbeaut_m10v_defconfig
arm                           spitz_defconfig
mips                         tb0226_defconfig
m68k                        m5272c3_defconfig
parisc                              defconfig
ia64                          tiger_defconfig
arm                            xcep_defconfig
arm                        neponset_defconfig
mips                 decstation_r4k_defconfig
powerpc                     tqm8541_defconfig
c6x                        evmc6678_defconfig
arm                           tegra_defconfig
arm                              alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
x86_64               randconfig-a003-20201114
x86_64               randconfig-a005-20201114
x86_64               randconfig-a004-20201114
x86_64               randconfig-a002-20201114
x86_64               randconfig-a001-20201114
x86_64               randconfig-a006-20201114
i386                 randconfig-a006-20201114
i386                 randconfig-a005-20201114
i386                 randconfig-a001-20201114
i386                 randconfig-a002-20201114
i386                 randconfig-a004-20201114
i386                 randconfig-a003-20201114
i386                 randconfig-a012-20201114
i386                 randconfig-a014-20201114
i386                 randconfig-a016-20201114
i386                 randconfig-a011-20201114
i386                 randconfig-a015-20201114
i386                 randconfig-a013-20201114
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201114
x86_64               randconfig-a011-20201114
x86_64               randconfig-a014-20201114
x86_64               randconfig-a013-20201114
x86_64               randconfig-a016-20201114
x86_64               randconfig-a012-20201114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
