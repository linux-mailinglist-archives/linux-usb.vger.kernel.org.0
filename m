Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19ED03F6ED0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 07:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhHYFaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 01:30:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:30898 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232303AbhHYFaP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 01:30:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="303033542"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="303033542"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 22:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="515986139"
Received: from lkp-server02.sh.intel.com (HELO 181e7be6f509) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2021 22:29:26 -0700
Received: from kbuild by 181e7be6f509 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mIlTZ-0001D4-Cv; Wed, 25 Aug 2021 05:29:25 +0000
Date:   Wed, 25 Aug 2021 13:28:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d7428bc26fc767942c38d74b80299bcd4f01e7cb
Message-ID: <6125d4fe.K6wZNwG3+GUFEU84%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d7428bc26fc767942c38d74b80299bcd4f01e7cb  usb: gadget: f_hid: optional SETUP/SET_REPORT mode

elapsed time: 925m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210824
arm                          pxa3xx_defconfig
powerpc                        fsp2_defconfig
powerpc                      bamboo_defconfig
xtensa                       common_defconfig
mips                        vocore2_defconfig
sh                           se7722_defconfig
powerpc                    mvme5100_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
arm                           viper_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    adder875_defconfig
powerpc                       ebony_defconfig
arm                            xcep_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
riscv                            alldefconfig
sparc64                             defconfig
arc                           tb10x_defconfig
arm                          pxa910_defconfig
ia64                                defconfig
arm                             ezx_defconfig
powerpc                      ppc40x_defconfig
mips                       lemote2f_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     pq2fads_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arm                         cm_x300_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
sh                        sh7763rdp_defconfig
arm                          ixp4xx_defconfig
i386                                defconfig
arc                     haps_hs_smp_defconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
arm                         hackkit_defconfig
sh                           se7206_defconfig
arm                      tct_hammer_defconfig
sh                            titan_defconfig
xtensa                  audio_kc705_defconfig
arc                              allyesconfig
riscv                    nommu_k210_defconfig
m68k                         apollo_defconfig
sh                           se7721_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210824
x86_64               randconfig-a006-20210824
x86_64               randconfig-a001-20210824
x86_64               randconfig-a003-20210824
x86_64               randconfig-a004-20210824
x86_64               randconfig-a002-20210824
i386                 randconfig-a006-20210824
i386                 randconfig-a001-20210824
i386                 randconfig-a002-20210824
i386                 randconfig-a005-20210824
i386                 randconfig-a003-20210824
i386                 randconfig-a004-20210824
x86_64               randconfig-a014-20210825
x86_64               randconfig-a015-20210825
x86_64               randconfig-a016-20210825
x86_64               randconfig-a013-20210825
x86_64               randconfig-a012-20210825
x86_64               randconfig-a011-20210825
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210824
s390                 randconfig-c005-20210824
arm                  randconfig-c002-20210824
riscv                randconfig-c006-20210824
powerpc              randconfig-c003-20210824
x86_64               randconfig-c007-20210824
mips                 randconfig-c004-20210824
x86_64               randconfig-a014-20210824
x86_64               randconfig-a015-20210824
x86_64               randconfig-a016-20210824
x86_64               randconfig-a013-20210824
x86_64               randconfig-a012-20210824
x86_64               randconfig-a011-20210824
i386                 randconfig-a011-20210824
i386                 randconfig-a016-20210824
i386                 randconfig-a012-20210824
i386                 randconfig-a014-20210824
i386                 randconfig-a013-20210824
i386                 randconfig-a015-20210824
hexagon              randconfig-r041-20210824
hexagon              randconfig-r045-20210824
riscv                randconfig-r042-20210824
s390                 randconfig-r044-20210824

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
