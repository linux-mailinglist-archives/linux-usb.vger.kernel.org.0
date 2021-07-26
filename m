Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AED13D68DA
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jul 2021 23:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhGZVDJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jul 2021 17:03:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:19462 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229489AbhGZVDJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Jul 2021 17:03:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199550376"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="199550376"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 14:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="474138678"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2021 14:43:15 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m88NX-00067t-7g; Mon, 26 Jul 2021 21:43:15 +0000
Date:   Tue, 27 Jul 2021 05:42:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d842bc6c0579ca7643eed029beabab3ac562a335
Message-ID: <60ff2c47.6A0VUU51c6JUHQsD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d842bc6c0579ca7643eed029beabab3ac562a335  Merge v5.14-rc3 into usb-next

elapsed time: 726m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-c001-20210725
i386                 randconfig-c001-20210726
mips                         bigsur_defconfig
mips                malta_qemu_32r6_defconfig
sh                        sh7763rdp_defconfig
powerpc                   currituck_defconfig
i386                             allyesconfig
arm                      tct_hammer_defconfig
arm                       aspeed_g5_defconfig
powerpc                     mpc83xx_defconfig
arm                       multi_v4t_defconfig
mips                     cu1830-neo_defconfig
arm                             mxs_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
sh                            shmin_defconfig
sh                         ap325rxa_defconfig
sh                             sh03_defconfig
h8300                               defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc834x_mds_defconfig
mips                         db1xxx_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        realview_defconfig
mips                 decstation_r4k_defconfig
openrisc                    or1ksim_defconfig
mips                         tb0219_defconfig
powerpc                       ebony_defconfig
mips                           ip32_defconfig
arm                            dove_defconfig
mips                  decstation_64_defconfig
arc                        nsimosci_defconfig
sh                         microdev_defconfig
parisc                generic-64bit_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
riscv                    nommu_virt_defconfig
m68k                        mvme147_defconfig
sh                     magicpanelr2_defconfig
powerpc                 linkstation_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
arm                           spitz_defconfig
ia64                             alldefconfig
sh                          urquell_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
powerpc                      pmac32_defconfig
powerpc                     ppa8548_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                    xip_kc705_defconfig
sh                             espt_defconfig
xtensa                          iss_defconfig
powerpc                      makalu_defconfig
arc                        vdk_hs38_defconfig
m68k                         apollo_defconfig
powerpc                   microwatt_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
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
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210726
x86_64               randconfig-a006-20210726
x86_64               randconfig-a001-20210726
x86_64               randconfig-a005-20210726
x86_64               randconfig-a004-20210726
x86_64               randconfig-a002-20210726
i386                 randconfig-a003-20210726
i386                 randconfig-a002-20210726
i386                 randconfig-a001-20210726
i386                 randconfig-a006-20210726
i386                 randconfig-a005-20210725
i386                 randconfig-a003-20210725
i386                 randconfig-a004-20210725
i386                 randconfig-a002-20210725
i386                 randconfig-a001-20210725
i386                 randconfig-a006-20210725
i386                 randconfig-a005-20210726
i386                 randconfig-a004-20210726
x86_64               randconfig-a011-20210727
x86_64               randconfig-a016-20210727
x86_64               randconfig-a013-20210727
x86_64               randconfig-a014-20210727
x86_64               randconfig-a012-20210727
x86_64               randconfig-a015-20210727
i386                 randconfig-a016-20210726
i386                 randconfig-a013-20210726
i386                 randconfig-a012-20210726
i386                 randconfig-a011-20210726
i386                 randconfig-a014-20210726
i386                 randconfig-a015-20210726
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-c001-20210726
x86_64               randconfig-a003-20210725
x86_64               randconfig-a006-20210725
x86_64               randconfig-a001-20210725
x86_64               randconfig-a005-20210725
x86_64               randconfig-a004-20210725
x86_64               randconfig-a002-20210725
x86_64               randconfig-a011-20210726
x86_64               randconfig-a016-20210726
x86_64               randconfig-a013-20210726
x86_64               randconfig-a014-20210726
x86_64               randconfig-a012-20210726
x86_64               randconfig-a015-20210726

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
