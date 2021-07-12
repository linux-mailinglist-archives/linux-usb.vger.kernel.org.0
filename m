Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA13E3C6469
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 22:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbhGLUCx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 16:02:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:60116 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233862AbhGLUCw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 16:02:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="271158571"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="271158571"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 13:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="451515264"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jul 2021 13:00:00 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m325v-000HE4-Ma; Mon, 12 Jul 2021 19:59:59 +0000
Date:   Tue, 13 Jul 2021 03:59:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 97db1b081e1286bdd9dcd4d25b88d6770ff4a65b
Message-ID: <60ec9f21.fc0BSu7SitC0fvYC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 97db1b081e1286bdd9dcd4d25b88d6770ff4a65b  dt-bindings: usb: dwc3: Update dwc3 TX fifo properties

elapsed time: 724m

configs tested: 184
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                          iss_defconfig
sh                           se7343_defconfig
sparc                               defconfig
powerpc                        fsp2_defconfig
arm                            hisi_defconfig
mips                       rbtx49xx_defconfig
mips                        nlm_xlr_defconfig
sh                     sh7710voipgw_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                    smp_lx200_defconfig
mips                        jmr3927_defconfig
mips                      maltasmvp_defconfig
mips                     cu1830-neo_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc40x_defconfig
ia64                             alldefconfig
s390                                defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     akebono_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    adder875_defconfig
arm                        vexpress_defconfig
arm                        magician_defconfig
arm                        spear3xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    ge_imp3a_defconfig
sh                          polaris_defconfig
sparc                            alldefconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
nios2                         3c120_defconfig
powerpc                 mpc8540_ads_defconfig
arm64                            alldefconfig
mips                            gpr_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7201_defconfig
sh                   sh7724_generic_defconfig
nios2                         10m50_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme147_defconfig
powerpc                      pmac32_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
arm                           stm32_defconfig
xtensa                              defconfig
mips                        bcm63xx_defconfig
arm                        clps711x_defconfig
powerpc                    klondike_defconfig
arm                           omap1_defconfig
arm                           spitz_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     powernv_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
powerpc                      cm5200_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      tqm8xx_defconfig
sh                         apsh4a3a_defconfig
arc                        nsim_700_defconfig
alpha                            allyesconfig
powerpc                     ppa8548_defconfig
m68k                       m5208evb_defconfig
powerpc                      walnut_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
arm                           viper_defconfig
sh                     magicpanelr2_defconfig
powerpc                   motionpro_defconfig
powerpc                     pq2fads_defconfig
parisc                           alldefconfig
powerpc                   lite5200b_defconfig
mips                          rb532_defconfig
m68k                            q40_defconfig
sh                               j2_defconfig
arm                        realview_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
powerpc                     rainier_defconfig
powerpc                     asp8347_defconfig
arm                         lubbock_defconfig
powerpc                     kilauea_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
i386                             alldefconfig
m68k                         apollo_defconfig
arm                          pcm027_defconfig
openrisc                  or1klitex_defconfig
s390                             allmodconfig
arm                         vf610m4_defconfig
arm                         s3c2410_defconfig
arm                       mainstone_defconfig
sh                           se7751_defconfig
mips                           mtx1_defconfig
sh                        sh7763rdp_defconfig
arc                    vdk_hs38_smp_defconfig
arm                             rpc_defconfig
mips                           ip32_defconfig
m68k                          multi_defconfig
s390                             alldefconfig
ia64                            zx1_defconfig
arm                        multi_v7_defconfig
nds32                             allnoconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                  iss476-smp_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210712
x86_64               randconfig-a004-20210712
x86_64               randconfig-a003-20210712
x86_64               randconfig-a002-20210712
x86_64               randconfig-a006-20210712
x86_64               randconfig-a001-20210712
i386                 randconfig-a005-20210712
i386                 randconfig-a004-20210712
i386                 randconfig-a006-20210712
i386                 randconfig-a001-20210712
i386                 randconfig-a002-20210712
i386                 randconfig-a003-20210712
i386                 randconfig-a015-20210712
i386                 randconfig-a014-20210712
i386                 randconfig-a011-20210712
i386                 randconfig-a013-20210712
i386                 randconfig-a012-20210712
i386                 randconfig-a016-20210712
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210712
x86_64               randconfig-b001-20210711
x86_64               randconfig-a005-20210711
x86_64               randconfig-a004-20210711
x86_64               randconfig-a002-20210711
x86_64               randconfig-a003-20210711
x86_64               randconfig-a006-20210711
x86_64               randconfig-a001-20210711
x86_64               randconfig-a016-20210712
x86_64               randconfig-a013-20210712
x86_64               randconfig-a014-20210712
x86_64               randconfig-a015-20210712
x86_64               randconfig-a012-20210712
x86_64               randconfig-a011-20210712

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
