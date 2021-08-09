Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B883E4C02
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 20:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhHISUk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 14:20:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:33919 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233828AbhHISUk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 14:20:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="236749549"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; 
   d="scan'208";a="236749549"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 11:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; 
   d="scan'208";a="671006884"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2021 11:20:16 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mD9sm-000JnT-4y; Mon, 09 Aug 2021 18:20:16 +0000
Date:   Tue, 10 Aug 2021 02:19:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 73e19de7b79a2f26f0b370cc071728cede1ab3a0
Message-ID: <611171b2.YlBADbT83qHFq3w0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 73e19de7b79a2f26f0b370cc071728cede1ab3a0  Merge 5.14-rc5 into usb-next

elapsed time: 724m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      obs600_defconfig
arm                       aspeed_g5_defconfig
m68k                         amcore_defconfig
powerpc                      ppc64e_defconfig
powerpc                   microwatt_defconfig
xtensa                           allyesconfig
h8300                     edosk2674_defconfig
sh                          r7785rp_defconfig
powerpc                     ksi8560_defconfig
sh                        edosk7705_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                            q40_defconfig
sh                          sdk7786_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                          atari_defconfig
sh                           se7343_defconfig
riscv                             allnoconfig
powerpc                     tqm8541_defconfig
sh                         apsh4a3a_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
sh                          rsk7201_defconfig
xtensa                         virt_defconfig
arm                         bcm2835_defconfig
sparc64                             defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlp_defconfig
mips                         tb0287_defconfig
powerpc                      ep88xc_defconfig
powerpc64                           defconfig
m68k                        stmark2_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          urquell_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
powerpc                       holly_defconfig
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
i386                 randconfig-a004-20210809
i386                 randconfig-a005-20210809
i386                 randconfig-a006-20210809
i386                 randconfig-a002-20210809
i386                 randconfig-a001-20210809
i386                 randconfig-a003-20210809
i386                 randconfig-a004-20210808
i386                 randconfig-a005-20210808
i386                 randconfig-a006-20210808
i386                 randconfig-a002-20210808
i386                 randconfig-a001-20210808
i386                 randconfig-a003-20210808
x86_64               randconfig-a016-20210808
x86_64               randconfig-a012-20210808
x86_64               randconfig-a013-20210808
x86_64               randconfig-a011-20210808
x86_64               randconfig-a014-20210808
x86_64               randconfig-a015-20210808
i386                 randconfig-a012-20210808
i386                 randconfig-a015-20210808
i386                 randconfig-a011-20210808
i386                 randconfig-a013-20210808
i386                 randconfig-a014-20210808
i386                 randconfig-a016-20210808
i386                 randconfig-a012-20210809
i386                 randconfig-a015-20210809
i386                 randconfig-a011-20210809
i386                 randconfig-a013-20210809
i386                 randconfig-a014-20210809
i386                 randconfig-a016-20210809
x86_64               randconfig-a002-20210809
x86_64               randconfig-a004-20210809
x86_64               randconfig-a006-20210809
x86_64               randconfig-a003-20210809
x86_64               randconfig-a001-20210809
x86_64               randconfig-a005-20210809
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210809
x86_64               randconfig-a002-20210808
x86_64               randconfig-a004-20210808
x86_64               randconfig-a006-20210808
x86_64               randconfig-a003-20210808
x86_64               randconfig-a001-20210808
x86_64               randconfig-a005-20210808
x86_64               randconfig-a016-20210809
x86_64               randconfig-a012-20210809
x86_64               randconfig-a013-20210809
x86_64               randconfig-a011-20210809
x86_64               randconfig-a014-20210809
x86_64               randconfig-a015-20210809

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
