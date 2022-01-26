Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7B49C4CD
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 08:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238109AbiAZH5l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 02:57:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:56959 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238096AbiAZH5k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 02:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643183859; x=1674719859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kQivHtTX0FTq8NI+XmF1bXzY7uGGaozpiZyozGTMI1k=;
  b=HZRaer67eQV0IB8nwuXCNptMHfVUhjD9C9AUGtnzouEZ1BwVXEI+VWXp
   2Yf1VSAY9WVJWw2MszX49o8D6mIEMwhQtecC+Jmx1vfQtn3mfxKQ7uv6J
   vAHCuthNyRPW4c0H0RJZpBWrhtAiaQZiV2B0QyrNxDUGetqbzxRFm61vA
   LGA5Ker3zqg+jVSDoiY6bUVfNwX6CvW4yletZSmdCL3V+dTaNnwlN2YmQ
   a7sr7OTd8WukUlWc8EqJf4vwmijgnORjKdoiqJ0RJFU4fyAdKkK6tXid6
   7p0UQeCIXFQbtzoutKPkCgNWU43lKZSL73r4tPgqlVwcEQ912yNfxSqN+
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307216237"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="307216237"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 23:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="628230334"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Jan 2022 23:57:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCdBR-000Kxi-Q9; Wed, 26 Jan 2022 07:57:37 +0000
Date:   Wed, 26 Jan 2022 15:56:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 26fbe9772b8c459687930511444ce443011f86bf
Message-ID: <61f0febc.owb9NV8qZ251eFq8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 26fbe9772b8c459687930511444ce443011f86bf  USB: core: Fix hang in usb_kill_urb by adding memory barriers

elapsed time: 723m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220124
m68k                             allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
powerpc              randconfig-c003-20220124
arm                        spear6xx_defconfig
powerpc64                           defconfig
ia64                          tiger_defconfig
sparc                       sparc64_defconfig
sh                           se7206_defconfig
powerpc                     redwood_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                    nommu_k210_defconfig
m68k                        m5407c3_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     rainier_defconfig
powerpc                    sam440ep_defconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
arm                         vf610m4_defconfig
arm                         nhk8815_defconfig
mips                 decstation_r4k_defconfig
powerpc                         ps3_defconfig
nios2                            alldefconfig
sh                 kfr2r09-romimage_defconfig
sh                          urquell_defconfig
mips                         cobalt_defconfig
openrisc                  or1klitex_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
arm                        trizeps4_defconfig
sh                           se7780_defconfig
mips                            ar7_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
mips                         db1xxx_defconfig
xtensa                  audio_kc705_defconfig
mips                         rt305x_defconfig
arm                        mini2440_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
mips                           xway_defconfig
sh                            hp6xx_defconfig
arm                            zeus_defconfig
nios2                         10m50_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          sdk7780_defconfig
arc                            hsdk_defconfig
mips                  decstation_64_defconfig
xtensa                           alldefconfig
arc                                 defconfig
powerpc                       ppc64_defconfig
mips                            gpr_defconfig
mips                      fuloong2e_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
arm                           stm32_defconfig
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
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
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
powerpc                      katmai_defconfig
arm                       imx_v4_v5_defconfig
arm                        spear3xx_defconfig
mips                      malta_kvm_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
mips                          malta_defconfig
powerpc                     mpc512x_defconfig
powerpc                     kmeter1_defconfig
powerpc                     skiroot_defconfig
powerpc                        icon_defconfig
mips                           ip27_defconfig
powerpc                      ppc64e_defconfig
powerpc                        fsp2_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
