Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E3F3E2DCA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 17:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244675AbhHFPai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 11:30:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:57041 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242735AbhHFPai (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 11:30:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="299977364"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="299977364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 08:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="669516431"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Aug 2021 08:30:21 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mC1ng-000Gzt-FA; Fri, 06 Aug 2021 15:30:20 +0000
Date:   Fri, 06 Aug 2021 23:29:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 43ad944cd73f2360ec8ff31d29ea44830b3119af
Message-ID: <610d5558.PBGrUFVmxhAkcISD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 43ad944cd73f2360ec8ff31d29ea44830b3119af  usb: typec: tcpm: Keep other events when receiving FRS and Sourcing_vbus events

elapsed time: 1696m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210804
i386                 randconfig-c001-20210805
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
nios2                            alldefconfig
powerpc                    mvme5100_defconfig
arm                       netwinder_defconfig
mips                         tb0226_defconfig
ia64                      gensparse_defconfig
powerpc                       ppc64_defconfig
arm                        magician_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                              defconfig
mips                   sb1250_swarm_defconfig
m68k                          hp300_defconfig
xtensa                         virt_defconfig
sh                          polaris_defconfig
arm                       spear13xx_defconfig
mips                       lemote2f_defconfig
openrisc                  or1klitex_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                     taishan_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7203_defconfig
mips                  maltasmvp_eva_defconfig
s390                                defconfig
mips                        nlm_xlp_defconfig
powerpc                     mpc5200_defconfig
sh                          sdk7786_defconfig
sh                            hp6xx_defconfig
arm                            zeus_defconfig
arm                         cm_x300_defconfig
sh                           se7722_defconfig
arm                         socfpga_defconfig
mips                  decstation_64_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210805
x86_64               randconfig-a006-20210805
x86_64               randconfig-a004-20210805
x86_64               randconfig-a003-20210805
x86_64               randconfig-a001-20210805
x86_64               randconfig-a005-20210805
i386                 randconfig-a005-20210805
i386                 randconfig-a004-20210805
i386                 randconfig-a002-20210805
i386                 randconfig-a006-20210805
i386                 randconfig-a003-20210805
i386                 randconfig-a001-20210805
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
x86_64               randconfig-a012-20210804
x86_64               randconfig-a016-20210804
x86_64               randconfig-a011-20210804
x86_64               randconfig-a013-20210804
x86_64               randconfig-a014-20210804
x86_64               randconfig-a015-20210804
i386                 randconfig-a012-20210806
i386                 randconfig-a011-20210806
i386                 randconfig-a015-20210806
i386                 randconfig-a013-20210806
i386                 randconfig-a014-20210806
i386                 randconfig-a016-20210806
i386                 randconfig-a012-20210805
i386                 randconfig-a011-20210805
i386                 randconfig-a015-20210805
i386                 randconfig-a013-20210805
i386                 randconfig-a014-20210805
i386                 randconfig-a016-20210805
i386                 randconfig-a012-20210804
i386                 randconfig-a011-20210804
i386                 randconfig-a015-20210804
i386                 randconfig-a013-20210804
i386                 randconfig-a014-20210804
i386                 randconfig-a016-20210804
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210804
x86_64               randconfig-c001-20210805
x86_64               randconfig-a012-20210805
x86_64               randconfig-a016-20210805
x86_64               randconfig-a011-20210805
x86_64               randconfig-a013-20210805
x86_64               randconfig-a014-20210805
x86_64               randconfig-a015-20210805
x86_64               randconfig-a002-20210804
x86_64               randconfig-a006-20210804
x86_64               randconfig-a004-20210804
x86_64               randconfig-a003-20210804
x86_64               randconfig-a001-20210804
x86_64               randconfig-a005-20210804

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
