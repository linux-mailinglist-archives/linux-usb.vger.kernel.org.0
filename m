Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0413F1B8D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 16:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238607AbhHSOYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 10:24:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:8489 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238536AbhHSOYX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Aug 2021 10:24:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="203763283"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
   d="scan'208";a="203763283"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 07:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; 
   d="scan'208";a="512029566"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2021 07:23:31 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mGix8-000U17-Tb; Thu, 19 Aug 2021 14:23:30 +0000
Date:   Thu, 19 Aug 2021 22:23:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb
Message-ID: <611e6960./GspunifTGnl6urA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb  USB: EHCI: Add alias for Broadcom INSNREG

Warning reports:

https://lore.kernel.org/linux-usb/202108190619.wLK5u4fO-lkp@intel.com

Warning in current branch:

drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch' is never read [clang-analyzer-deadcode.DeadStores]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- riscv-randconfig-c006-20210818
    `-- drivers-usb-isp1760-isp1760-hcd.c:warning:Value-stored-to-scratch-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 1055m

configs tested: 116
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
powerpc                      pcm030_defconfig
arm                         socfpga_defconfig
m68k                       m5275evb_defconfig
sh                           se7619_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     ep8248e_defconfig
arm                            pleb_defconfig
arm                            xcep_defconfig
powerpc                     skiroot_defconfig
powerpc                        icon_defconfig
powerpc                         ps3_defconfig
arm                         hackkit_defconfig
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
powerpc                      pmac32_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                 mpc834x_mds_defconfig
arm                       aspeed_g4_defconfig
nios2                         10m50_defconfig
m68k                       m5249evb_defconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
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
x86_64               randconfig-a004-20210818
x86_64               randconfig-a006-20210818
x86_64               randconfig-a003-20210818
x86_64               randconfig-a005-20210818
x86_64               randconfig-a002-20210818
x86_64               randconfig-a001-20210818
i386                 randconfig-a004-20210818
i386                 randconfig-a006-20210818
i386                 randconfig-a002-20210818
i386                 randconfig-a001-20210818
i386                 randconfig-a003-20210818
i386                 randconfig-a005-20210818
x86_64               randconfig-a013-20210819
x86_64               randconfig-a011-20210819
x86_64               randconfig-a012-20210819
x86_64               randconfig-a016-20210819
x86_64               randconfig-a014-20210819
x86_64               randconfig-a015-20210819
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
x86_64               randconfig-a004-20210819
x86_64               randconfig-a006-20210819
x86_64               randconfig-a003-20210819
x86_64               randconfig-a002-20210819
x86_64               randconfig-a005-20210819
x86_64               randconfig-a001-20210819
i386                 randconfig-a004-20210819
i386                 randconfig-a006-20210819
i386                 randconfig-a001-20210819
i386                 randconfig-a002-20210819
i386                 randconfig-a003-20210819
i386                 randconfig-a005-20210819
i386                 randconfig-a015-20210818
i386                 randconfig-a011-20210818
i386                 randconfig-a013-20210818
i386                 randconfig-a014-20210818
i386                 randconfig-a016-20210818
i386                 randconfig-a012-20210818

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
