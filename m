Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715834C3BC6
	for <lists+linux-usb@lfdr.de>; Fri, 25 Feb 2022 03:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiBYChR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 21:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiBYChP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 21:37:15 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068A23983F
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 18:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645756603; x=1677292603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PJgPPtKSX2w4WU/M42QZNU1f+tFdKtAevNiPXnPZj+o=;
  b=K7sCSnpPqtVl8OrNSAvF4XAUiMReLnmo1PRXbPcCdwa0kMi+epJr/L0g
   FjjYELGJBIEPENYixCL5LNR0iVLZWMKQayE5aR1qPFYhCayQqC+8PCrg5
   KdJ/3prEJjLVEEx+O0seykVomjeD1Z4mBXnJmm3yZoeHU4Y2lE458HMjg
   QO3ajIyczkJ/HH2cJqozmUOsvVF7e2D23U+amsfsfepaf3rfIlwNKEufQ
   hO6lNS5FmT5pYAuYr1oD2/63yAao6SRsMttQ4AMphk3w9JVMFygparQz5
   0pa2oamXQVe7bCqYSuKnZeLYNHwVI2+xWqndatJGOVqMaChyTagTeCCIN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315621983"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="315621983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 18:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="789433518"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2022 18:36:42 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNQTJ-0003k8-HH; Fri, 25 Feb 2022 02:36:41 +0000
Date:   Fri, 25 Feb 2022 10:35:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 19eae24b76c27dedfb166dc06a8c48e052cbc814
Message-ID: <62184089.PDLE0Q2iW5Accw6w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 19eae24b76c27dedfb166dc06a8c48e052cbc814  Merge tag 'usb-serial-5.17-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 720m

configs tested: 143
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220223
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
riscv                            allyesconfig
um                             i386_defconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
arm                        spear6xx_defconfig
powerpc                     sequoia_defconfig
microblaze                      mmu_defconfig
powerpc                  iss476-smp_defconfig
arm                         axm55xx_defconfig
xtensa                          iss_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7780_defconfig
arm                         nhk8815_defconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
powerpc                     taishan_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
arm                           viper_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
arm                          gemini_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
arc                  randconfig-r043-20220223
riscv                randconfig-r042-20220224
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220224
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
mips                 randconfig-c004-20220224
i386                          randconfig-c001
riscv                randconfig-c006-20220224
powerpc              randconfig-c003-20220223
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220223
riscv                randconfig-c006-20220223
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
arm                            mmp2_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220224
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
