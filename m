Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852E84E195F
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 02:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244620AbiCTBvS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Mar 2022 21:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiCTBvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Mar 2022 21:51:17 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A64E1FDFF2
        for <linux-usb@vger.kernel.org>; Sat, 19 Mar 2022 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647740994; x=1679276994;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+t2ViF9xfmSW0cdV8fBXNJa+GdjEDlXACg6QMmllRRc=;
  b=nft0/pf3mpBPsnjaoNFJj8rNr6fdXuH0+xc8igENMwzrtVBdggW3le9b
   jTtceowSuOg9dxRa7oUblDxjpZTL1OqY6hMV2+OYQ3YNL5WBj0n00xncy
   tf1fajQ4yT0tlYmHLVO43N1oRk4rbmKKPmq6bLYijw0VpO5z6yDJ+qXVQ
   kpcNq0DV+q0Z3ByvHcU9+diVN8T9sHwU+X686Ccyg8XqVJDY76TSf7Vei
   6vq4w0/DOG6hH9NelU6sVWFUiWom1/3WJCkQ93jY9dGT2EatFtPSCrm7S
   XkeeNFP5k8osGncpdQI+XZPV5tnkMyxlf4lyMuZzVBUX4tb4p5wxjyt8W
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="343775570"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="343775570"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 18:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="559335859"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Mar 2022 18:49:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nVkhc-000GSc-0d; Sun, 20 Mar 2022 01:49:52 +0000
Date:   Sun, 20 Mar 2022 09:48:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 46d2c20b0b10cf07a2a24b047a09195ba96c84f7
Message-ID: <62368804.a3Ng6lw+wwIk4N0n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 46d2c20b0b10cf07a2a24b047a09195ba96c84f7  usb: gadget: fsl_qe_udc: Add missing semicolon in qe_ep_dequeue()

elapsed time: 722m

configs tested: 159
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
mips                 randconfig-c004-20220320
mips                      maltasmvp_defconfig
arm                        trizeps4_defconfig
nios2                         3c120_defconfig
arm                           tegra_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
powerpc                     redwood_defconfig
arm                            pleb_defconfig
sparc                       sparc32_defconfig
m68k                       m5275evb_defconfig
sh                            hp6xx_defconfig
mips                         db1xxx_defconfig
arm                           stm32_defconfig
sh                        apsh4ad0a_defconfig
xtensa                           alldefconfig
arm                         s3c6400_defconfig
parisc                generic-64bit_defconfig
powerpc                      ppc6xx_defconfig
arm                        mvebu_v7_defconfig
um                               alldefconfig
arc                          axs103_defconfig
powerpc                    sam440ep_defconfig
nios2                               defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
mips                         bigsur_defconfig
sh                          lboxre2_defconfig
parisc                           allyesconfig
arc                     nsimosci_hs_defconfig
sh                           se7750_defconfig
arm                        clps711x_defconfig
powerpc                        cell_defconfig
sh                         ecovec24_defconfig
mips                 decstation_r4k_defconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8555_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
csky                                defconfig
sh                     sh7710voipgw_defconfig
arc                          axs101_defconfig
sh                           se7724_defconfig
sh                           se7712_defconfig
m68k                       bvme6000_defconfig
m68k                          multi_defconfig
arm                        mini2440_defconfig
powerpc                     tqm8541_defconfig
parisc                              defconfig
arm                      footbridge_defconfig
arm                         nhk8815_defconfig
mips                      fuloong2e_defconfig
sh                            shmin_defconfig
arm                          badge4_defconfig
mips                      loongson3_defconfig
powerpc                       maple_defconfig
mips                        vocore2_defconfig
powerpc                   motionpro_defconfig
arm                        spear6xx_defconfig
sh                         microdev_defconfig
sh                        edosk7760_defconfig
openrisc                            defconfig
sparc64                             defconfig
mips                  decstation_64_defconfig
arm                           h5000_defconfig
powerpc64                        alldefconfig
arm                  randconfig-c002-20220319
arm                  randconfig-c002-20220320
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20220319
s390                 randconfig-r044-20220319
riscv                randconfig-r042-20220319
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220319
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220319
riscv                randconfig-c006-20220319
mips                 randconfig-c004-20220319
i386                          randconfig-c001
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
arm                       imx_v4_v5_defconfig
powerpc                      ppc44x_defconfig
powerpc                        icon_defconfig
powerpc                 mpc8560_ads_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
powerpc                     pseries_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8560_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220319
hexagon              randconfig-r041-20220319
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
