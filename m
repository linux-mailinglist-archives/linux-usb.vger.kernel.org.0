Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D5D3D9551
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jul 2021 20:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhG1Scl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jul 2021 14:32:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:63100 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229556AbhG1Sck (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Jul 2021 14:32:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="298311373"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="298311373"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 11:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="663611464"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2021 11:32:36 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m8oM8-0008bs-8r; Wed, 28 Jul 2021 18:32:36 +0000
Date:   Thu, 29 Jul 2021 02:32:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 fa20bada3f934e3b3e4af4c77e5b518cd5a282e5
Message-ID: <6101a2c1.l+SsWUHhndolqt0c%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: fa20bada3f934e3b3e4af4c77e5b518cd5a282e5  usb: gadget: f_hid: idle uses the highest byte for duration

elapsed time: 720m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210728
h8300                       h8s-sim_defconfig
powerpc                   bluestone_defconfig
um                             i386_defconfig
riscv                            allmodconfig
powerpc                     kilauea_defconfig
m68k                          multi_defconfig
mips                         tb0219_defconfig
powerpc                    socrates_defconfig
mips                         db1xxx_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
powerpc                     asp8347_defconfig
xtensa                generic_kc705_defconfig
parisc                           alldefconfig
arm                        neponset_defconfig
mips                         rt305x_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
sh                         ecovec24_defconfig
sh                          r7780mp_defconfig
mips                     cu1000-neo_defconfig
um                                  defconfig
mips                      maltasmvp_defconfig
powerpc                    sam440ep_defconfig
powerpc                  mpc866_ads_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                            e55_defconfig
sh                           se7750_defconfig
powerpc                 mpc8272_ads_defconfig
mips                     loongson1b_defconfig
sh                          sdk7780_defconfig
mips                           xway_defconfig
arm                        multi_v7_defconfig
m68k                          hp300_defconfig
sh                            shmin_defconfig
sh                          polaris_defconfig
mips                      fuloong2e_defconfig
arm                      footbridge_defconfig
powerpc                      pmac32_defconfig
arm                          lpd270_defconfig
arm                            lart_defconfig
arm                            hisi_defconfig
powerpc                       eiger_defconfig
openrisc                    or1ksim_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         lpc18xx_defconfig
powerpc                    mvme5100_defconfig
arm                        mvebu_v7_defconfig
powerpc                      makalu_defconfig
mips                           gcw0_defconfig
powerpc                      mgcoge_defconfig
x86_64                           alldefconfig
arm                         palmz72_defconfig
mips                          rm200_defconfig
powerpc                     sequoia_defconfig
sparc64                          alldefconfig
powerpc                     tqm8548_defconfig
sh                           se7619_defconfig
arm                     am200epdkit_defconfig
ia64                            zx1_defconfig
xtensa                              defconfig
arm                        oxnas_v6_defconfig
xtensa                  cadence_csp_defconfig
x86_64                            allnoconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210728
x86_64               randconfig-a003-20210728
x86_64               randconfig-a001-20210728
x86_64               randconfig-a004-20210728
x86_64               randconfig-a005-20210728
x86_64               randconfig-a002-20210728
i386                 randconfig-a005-20210728
i386                 randconfig-a003-20210728
i386                 randconfig-a004-20210728
i386                 randconfig-a002-20210728
i386                 randconfig-a001-20210728
i386                 randconfig-a006-20210728
i386                 randconfig-a016-20210728
i386                 randconfig-a012-20210728
i386                 randconfig-a013-20210728
i386                 randconfig-a014-20210728
i386                 randconfig-a011-20210728
i386                 randconfig-a015-20210728
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210728
x86_64               randconfig-a016-20210728
x86_64               randconfig-a011-20210728
x86_64               randconfig-a014-20210728
x86_64               randconfig-a013-20210728
x86_64               randconfig-a012-20210728
x86_64               randconfig-a015-20210728

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
