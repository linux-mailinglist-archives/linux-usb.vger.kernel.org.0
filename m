Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70FF05B2F1B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 08:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbiIIGf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 02:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiIIGf4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 02:35:56 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7895D51EB
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662705355; x=1694241355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eflQTn+cmUwegMHUWTiEsFoY0414RhnagsZtAOw7M4g=;
  b=jcyynuPWThDoEv0CQy2a41xYs1dsHWHYYS77XJP1S46yXk27cMqq8ABX
   9fmOUMS0+LYFmWVxt0WYqjnoV7dfXtMc9A6WB2TzyfFBmQgH3iSuPRH5g
   I+ikNCh+MJJ448SI9kofghYqmoJdvbYhnxrIx3ROHyzYkfZB8ai+byeEU
   i+St7ZXXes3SCSTcGvSSw6yw7DY8PDCo+TiAd93HJOHHhUfXsRO49mDAP
   nM52dFZzIarq9KHENlEk8swgyQnFz3wkGOzDZbRlotXaS9fwROP5oCU53
   gZuGJoNSoAZJuBhEZAdzQXHgbbFgu6rkVUtKirVThGNH90WBiWXoKods9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294990542"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="294990542"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 23:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="943664122"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 23:35:54 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWXcH-0000nK-2Y;
        Fri, 09 Sep 2022 06:35:53 +0000
Date:   Fri, 09 Sep 2022 14:35:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d818320ea200b02f2fea693b2be204f1990bb7e9
Message-ID: <631adea3.vTr4UW1JAWTdhizM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d818320ea200b02f2fea693b2be204f1990bb7e9  usb: chipidea: make configs for glue drivers visible with EXPERT

elapsed time: 1063m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a002
x86_64                        randconfig-a011
i386                                defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                           allyesconfig
x86_64                        randconfig-a006
powerpc                           allnoconfig
i386                          randconfig-a001
i386                          randconfig-a003
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
x86_64                          rhel-8.3-func
sh                               allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
riscv                randconfig-r042-20220908
s390                 randconfig-r044-20220908
i386                             alldefconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
arm                          exynos_defconfig
sparc                             allnoconfig
arm                        cerfcube_defconfig
powerpc                      arches_defconfig
openrisc                 simple_smp_defconfig
powerpc                     asp8347_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                          iop32x_defconfig
parisc64                            defconfig
openrisc                            defconfig
sh                        sh7757lcr_defconfig
sparc                               defconfig
sh                     sh7710voipgw_defconfig
i386                          randconfig-c001
arm                      integrator_defconfig
sparc64                             defconfig
arc                     haps_hs_smp_defconfig
arm                         assabet_defconfig
arm                            zeus_defconfig
mips                            ar7_defconfig
mips                         rt305x_defconfig
arc                      axs103_smp_defconfig
openrisc                    or1ksim_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
sh                             shx3_defconfig
xtensa                              defconfig
mips                    maltaup_xpa_defconfig
mips                  maltasmvp_eva_defconfig
sh                        edosk7705_defconfig
mips                     decstation_defconfig
powerpc                     stx_gp3_defconfig
sh                          sdk7780_defconfig
loongarch                         allnoconfig
arm                        mini2440_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
nios2                               defconfig
mips                 decstation_r4k_defconfig
arm                      footbridge_defconfig
arm                        realview_defconfig
m68k                       m5275evb_defconfig
parisc                           allyesconfig
arm                             pxa_defconfig
arc                              alldefconfig
arm                           u8500_defconfig
m68k                          multi_defconfig
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
powerpc                      mgcoge_defconfig
m68k                                defconfig
arc                  randconfig-r043-20220907
arc                  randconfig-r043-20220908
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                            hisi_defconfig
xtensa                    smp_lx200_defconfig
m68k                          atari_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
parisc                              defconfig
powerpc                      ppc40x_defconfig
mips                      loongson3_defconfig
sh                         apsh4a3a_defconfig
parisc                           alldefconfig
sh                            migor_defconfig
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
mips                           xway_defconfig
sparc64                          alldefconfig
arm                         nhk8815_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220908
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001
hexagon              randconfig-r045-20220908
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
powerpc                        fsp2_defconfig
powerpc                 mpc8272_ads_defconfig
mips                        qi_lb60_defconfig
arm                          pcm027_defconfig
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
mips                           mtx1_defconfig
mips                          ath79_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
