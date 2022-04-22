Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D95650C54E
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 02:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiDVX5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 19:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiDVX5X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 19:57:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0308187469
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 16:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650671668; x=1682207668;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wa2uPNvL9TlgPQkkG0AauQ/KF+fNdSTtPW/ncABc09s=;
  b=gH8hZnjlfd3ZUa3MLKC1DRww+N0N6Ng+HagVqYGUhvYZGvkICDf3PBcs
   ilI2SOD5Mq86sBDj6WLvY/o2FAPYCdWd/mnBSNK3Gcwl6Gc2RJ/UgqJ0g
   Ar3anrf+5nRSV5G2A7abpa98LPfsZbl4t/dPyZdcHeg0wBT7lTJP65z/r
   k47vTRzz5yHEsHNBOB3s431jtII3MJXtwUwffwS7uJ6/nAtsoLSYGhVph
   9ItqU9sdA7tArbXf0F1cHiR2xURvc6oghv63tz6dHIBKv7OsWZ+2gAzXS
   zGfcVg1MeRCsaOD8xvmW30JrxGwkilV7/h7c+3rAXLG7ehokDuxzIOqb4
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245388893"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="245388893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 16:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="703755435"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2022 16:54:27 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ni36Y-000AhC-OG;
        Fri, 22 Apr 2022 23:54:26 +0000
Date:   Sat, 23 Apr 2022 07:53:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 5c29e864999763baec9eedb9ea5bd557aa4cbd77
Message-ID: <62634000.0rEz16m0RxTD14cg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 5c29e864999763baec9eedb9ea5bd557aa4cbd77  usb: musb: mediatek: Use clk_bulk API to simplify clock operations

elapsed time: 1775m

configs tested: 168
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                     asp8347_defconfig
um                           x86_64_defconfig
powerpc                      ppc40x_defconfig
powerpc                     redwood_defconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
sh                          rsk7201_defconfig
powerpc                 linkstation_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          rsk7203_defconfig
riscv                            allmodconfig
m68k                          hp300_defconfig
arm                           imxrt_defconfig
m68k                         apollo_defconfig
ia64                             allyesconfig
nios2                         10m50_defconfig
openrisc                  or1klitex_defconfig
sh                           se7721_defconfig
arm                        realview_defconfig
ia64                      gensparse_defconfig
m68k                        m5407c3_defconfig
um                                  defconfig
arm                          simpad_defconfig
powerpc                      pcm030_defconfig
powerpc                   currituck_defconfig
powerpc                       ppc64_defconfig
powerpc                        cell_defconfig
powerpc                    sam440ep_defconfig
openrisc                 simple_smp_defconfig
sh                               alldefconfig
arm                        shmobile_defconfig
powerpc                       holly_defconfig
arm                      footbridge_defconfig
arc                          axs101_defconfig
sh                          r7785rp_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc64_defconfig
m68k                       m5275evb_defconfig
sh                         microdev_defconfig
mips                        bcm47xx_defconfig
sparc64                             defconfig
um                               alldefconfig
ia64                        generic_defconfig
arm                           viper_defconfig
ia64                         bigsur_defconfig
sh                        apsh4ad0a_defconfig
arm                           sama5_defconfig
alpha                            alldefconfig
m68k                            mac_defconfig
sh                           se7705_defconfig
arm                           stm32_defconfig
xtensa                    smp_lx200_defconfig
mips                           xway_defconfig
xtensa                          iss_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
m68k                       m5475evb_defconfig
powerpc                 canyonlands_defconfig
microblaze                          defconfig
xtensa                  cadence_csp_defconfig
powerpc                      arches_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
ia64                             allmodconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                  randconfig-r043-20220421
s390                 randconfig-r044-20220421
riscv                randconfig-r042-20220421
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220422
mips                 randconfig-c004-20220422
x86_64                        randconfig-c007
arm                  randconfig-c002-20220422
powerpc              randconfig-c003-20220422
i386                          randconfig-c001
powerpc                    ge_imp3a_defconfig
arm                       aspeed_g4_defconfig
powerpc                      acadia_defconfig
mips                           ip27_defconfig
riscv                            alldefconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     ksi8560_defconfig
mips                          ath25_defconfig
powerpc                     tqm8540_defconfig
arm                         orion5x_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
powerpc                  mpc885_ads_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8560_ads_defconfig
mips                           ip22_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220422
s390                 randconfig-r044-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422
hexagon              randconfig-r041-20220421
hexagon              randconfig-r045-20220421

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
