Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E998E338237
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 01:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhCLAXw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 19:23:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:20898 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229743AbhCLAXi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 19:23:38 -0500
IronPort-SDR: PrJiP4JGkWNJrKoUyFl4loZWnAzQTLI1aw7V091Uc30o/YXvU/+Bt4jAUFjbegM6FA0cXB/5Cr
 OZXU93oW74ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="188125405"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="188125405"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 16:23:36 -0800
IronPort-SDR: qr54awSYvCg6YuQYNjkPz9tHNLF9sLiWoSFDOmNKS9EDWgPvRooUuf6ASPGI4Jkfal38wdWdtr
 I5syGCWYWO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="409674807"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Mar 2021 16:23:35 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKVaY-000136-Qw; Fri, 12 Mar 2021 00:23:34 +0000
Date:   Fri, 12 Mar 2021 08:23:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d26c00e7276fc92b18c253d69e872f6b03832bad
Message-ID: <604ab478.sqS3otzbVL3qGU+P%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: d26c00e7276fc92b18c253d69e872f6b03832bad  xhci: Fix repeated xhci wake after suspend due to uncleared internal wake state

elapsed time: 720m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v4_v5_defconfig
arm                        shmobile_defconfig
mips                     loongson1b_defconfig
mips                          rm200_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8555_defconfig
openrisc                 simple_smp_defconfig
powerpc64                           defconfig
arc                            hsdk_defconfig
arm                            dove_defconfig
sh                          rsk7203_defconfig
openrisc                         alldefconfig
powerpc                      obs600_defconfig
sparc                               defconfig
ia64                         bigsur_defconfig
arc                          axs101_defconfig
sh                   sh7724_generic_defconfig
m68k                         apollo_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                    adder875_defconfig
powerpc                      mgcoge_defconfig
arm                      tct_hammer_defconfig
s390                             allmodconfig
mips                            e55_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7750_defconfig
powerpc                     tqm5200_defconfig
powerpc                     tqm8548_defconfig
mips                         cobalt_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                         virt_defconfig
sh                           se7712_defconfig
powerpc                      bamboo_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                       lemote2f_defconfig
arm                          imote2_defconfig
openrisc                  or1klitex_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
powerpc                          g5_defconfig
powerpc                     mpc83xx_defconfig
mips                           ip32_defconfig
arm                             pxa_defconfig
sh                          rsk7269_defconfig
sh                        edosk7760_defconfig
sh                            hp6xx_defconfig
xtensa                  nommu_kc705_defconfig
arm                         hackkit_defconfig
m68k                       m5249evb_defconfig
arm                          badge4_defconfig
ia64                             alldefconfig
powerpc                 mpc834x_mds_defconfig
nios2                            alldefconfig
powerpc                     sequoia_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210311
x86_64               randconfig-a001-20210311
x86_64               randconfig-a005-20210311
x86_64               randconfig-a002-20210311
x86_64               randconfig-a003-20210311
x86_64               randconfig-a004-20210311
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
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
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
