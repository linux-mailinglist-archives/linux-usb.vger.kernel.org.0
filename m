Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6FE4A518D
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 22:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358028AbiAaVhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 16:37:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:61228 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358076AbiAaVhv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Jan 2022 16:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643665071; x=1675201071;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=soxKhWAWSZcnLnluHvwKTzwegcLbojstOS+Qr8cnjX8=;
  b=a9d2fboF49kErvzj1R4BgiP712CM7UblFemD/AQgYMNIGj6DV0mDqW7Q
   TiTKvp1odxPutNvFcfYEiw+awlDHX5wqW/VNqdk64rSSm3KX68dPOoo0Z
   GsUnQPO9UeUmTlzFb8YrDYXTFRvIkz0sB1pW0Xb9b9FC1d8IwcLFTYyya
   +2ldBf7yrvmk6IIFEZVdURDGFRE1niOyXbhPvzlue9Mg/rYDUk1zqIDmH
   Wq4MQUZJnXrCd841RTc1VaHZ9eiRtY41kEE04Q3Y5VTCag0vKhjmSpVfp
   QAW412nE2d/UKLQZ6kH7F9YtfpbTtmHNMnN5jmK1XomCDa/vd1Gc7jw3R
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="234948015"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="234948015"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 13:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="479362250"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2022 13:37:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEeMu-000SLg-Qx; Mon, 31 Jan 2022 21:37:48 +0000
Date:   Tue, 01 Feb 2022 05:37:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 60c250a98d4ca12a34a89a498cb05d4d221f2f19
Message-ID: <61f85696.wk8Ct+kVWIiWyRZN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 60c250a98d4ca12a34a89a498cb05d4d221f2f19  Merge tag 'v5.17-rc2' into usb-next

elapsed time: 729m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
i386                          randconfig-c001
arc                                 defconfig
arm                           u8500_defconfig
ia64                         bigsur_defconfig
arm                          simpad_defconfig
sh                          rsk7203_defconfig
mips                           xway_defconfig
um                               alldefconfig
powerpc                 mpc834x_mds_defconfig
sh                          urquell_defconfig
arm                       imx_v6_v7_defconfig
arc                            hsdk_defconfig
powerpc                     taishan_defconfig
mips                             allmodconfig
arm                           stm32_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
sh                        edosk7705_defconfig
sh                 kfr2r09-romimage_defconfig
arm                        spear6xx_defconfig
mips                       capcella_defconfig
sh                          polaris_defconfig
arm                     eseries_pxa_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
powerpc                  storcenter_defconfig
powerpc                       ppc64_defconfig
parisc                           allyesconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
mips                 decstation_r4k_defconfig
arm                          pxa3xx_defconfig
nds32                               defconfig
powerpc                      mgcoge_defconfig
m68k                        m5272c3_defconfig
powerpc64                        alldefconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                         virt_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         cobalt_defconfig
m68k                       m5475evb_defconfig
parisc                           alldefconfig
sh                      rts7751r2d1_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           tegra_defconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
h8300                     edosk2674_defconfig
sh                           se7206_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
mips                            gpr_defconfig
mips                        vocore2_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
powerpc                     redwood_defconfig
sh                            hp6xx_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
sh                             shx3_defconfig
powerpc                        warp_defconfig
sh                          lboxre2_defconfig
sh                            migor_defconfig
sh                        sh7757lcr_defconfig
sh                        edosk7760_defconfig
x86_64                           alldefconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
powerpc                     pq2fads_defconfig
powerpc                      bamboo_defconfig
arm                       omap2plus_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
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
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
mips                     loongson2k_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                             allnoconfig
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
x86_64                           allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   bluestone_defconfig
powerpc                      ppc44x_defconfig
powerpc                    ge_imp3a_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
