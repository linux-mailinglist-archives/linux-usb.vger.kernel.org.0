Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0CB332FC2
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 21:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhCIUS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 15:18:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:18979 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231138AbhCIUSq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 15:18:46 -0500
IronPort-SDR: VJVABO+m/gr7s27JJaTITag8/l5+zk6XWRu1FiSbsVGBqwEE4NjrEvp8grR8HgrY2Tc+hnEWMq
 tthio6dcjtOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175423169"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="175423169"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 12:18:43 -0800
IronPort-SDR: 8Cv1ST3TiO0MYCagS9fU3LM349eKsaAAkFuZ7fGbU4rcvws9jroIs9j1I1eijxcwKgN2NwGgEk
 R0RJPrKOKyxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="447637602"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2021 12:18:41 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lJioS-0001nz-U2; Tue, 09 Mar 2021 20:18:40 +0000
Date:   Wed, 10 Mar 2021 04:18:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bebccc4bc6585c04be862db92631aab8c161bc8c
Message-ID: <6047d7fb.EeabFiHM9EgwH7Qc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bebccc4bc6585c04be862db92631aab8c161bc8c  Merge v5.12-rc2 into usb-next

elapsed time: 725m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        workpad_defconfig
sh                           se7724_defconfig
mips                         bigsur_defconfig
mips                          ath25_defconfig
m68k                           sun3_defconfig
nds32                               defconfig
powerpc                  mpc866_ads_defconfig
mips                           gcw0_defconfig
arm                            lart_defconfig
sh                        edosk7705_defconfig
arm                          pxa3xx_defconfig
m68k                             alldefconfig
arm                          moxart_defconfig
powerpc                  storcenter_defconfig
arm                             ezx_defconfig
mips                       lemote2f_defconfig
arm                             mxs_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                        mvebu_v7_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    amigaone_defconfig
powerpc                    mvme5100_defconfig
arc                            hsdk_defconfig
arm                        multi_v5_defconfig
sh                              ul2_defconfig
arm                           spitz_defconfig
mips                      maltaaprp_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    ge_imp3a_defconfig
arm                         hackkit_defconfig
mips                     loongson1b_defconfig
h8300                            alldefconfig
arm                        cerfcube_defconfig
sh                           se7343_defconfig
sh                        sh7785lcr_defconfig
mips                     cu1830-neo_defconfig
sh                           se7722_defconfig
nios2                         3c120_defconfig
powerpc                 linkstation_defconfig
m68k                          amiga_defconfig
arc                           tb10x_defconfig
alpha                            allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210309
i386                 randconfig-a003-20210309
i386                 randconfig-a002-20210309
i386                 randconfig-a006-20210309
i386                 randconfig-a004-20210309
i386                 randconfig-a001-20210309
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
x86_64               randconfig-a013-20210309
x86_64               randconfig-a016-20210309
x86_64               randconfig-a015-20210309
x86_64               randconfig-a014-20210309
x86_64               randconfig-a011-20210309
x86_64               randconfig-a012-20210309
i386                 randconfig-a016-20210309
i386                 randconfig-a012-20210309
i386                 randconfig-a014-20210309
i386                 randconfig-a013-20210309
i386                 randconfig-a011-20210309
i386                 randconfig-a015-20210309
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210309
x86_64               randconfig-a001-20210309
x86_64               randconfig-a004-20210309
x86_64               randconfig-a002-20210309
x86_64               randconfig-a005-20210309
x86_64               randconfig-a003-20210309
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
