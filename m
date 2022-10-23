Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3566095D8
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 21:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiJWTkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 15:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiJWTkc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 15:40:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAEE61D5E
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666554029; x=1698090029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hOXPKtOf/Ocf3onl4eIHJiw12bLu/GTObgeRk/HHZMY=;
  b=Vfe0WsG5vANZ9SP39Ogzj3iE61EuzHLn9OudltBfZVqTTe2ZfJkV6oip
   zfLLfwIgcjSEcg2FegfGrAT4OoKv38vl1wvwicuohZ2On+TLJdzsyxulD
   4Y1My6Z/lw0Dyh3nxz9AfNWsBMy8H1s3+4fouJ7+lFUXOh0+sC/VNWKV/
   D8ZCgwQf/KVuXODtsby6YN2VR38ghcjn3qT4mXn+jQd7hts8qUXsct+G2
   pQvlMX1hgF3K9FDGN9tiVZyGbPafsLCecCrGkUyG9ZEl8AyHGGMRqVtur
   VsT7+4ey8AJ8zCfQh5aKuZO5UtbMYf7YFGV3hK0L8W1vRpDf7fmPkkTbo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369362504"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="369362504"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2022 12:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="662219155"
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="662219155"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Oct 2022 12:40:27 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omgpf-0004c0-0i;
        Sun, 23 Oct 2022 19:40:27 +0000
Date:   Mon, 24 Oct 2022 03:39:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 b9589c417fedab6b963cf084ef305665166f5326
Message-ID: <63559887.afcqJTUkqQb+hchL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: b9589c417fedab6b963cf084ef305665166f5326  thunderbolt: Remove redundant assignment to variable len

elapsed time: 724m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
um                             i386_defconfig
arc                              allyesconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221023
m68k                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                        randconfig-a006
arc                                 defconfig
i386                          randconfig-a012
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
i386                          randconfig-a016
s390                                defconfig
i386                          randconfig-a005
arm                                 defconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
m68k                             alldefconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     tqm8555_defconfig
arm                          lpd270_defconfig
arm                        clps711x_defconfig
mips                       bmips_be_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
sh                          r7785rp_defconfig
sh                          polaris_defconfig
arm                            zeus_defconfig
sh                           se7206_defconfig
sh                          r7780mp_defconfig
sparc64                          alldefconfig
powerpc                    adder875_defconfig
sparc64                             defconfig
sh                   rts7751r2dplus_defconfig
sh                         ap325rxa_defconfig
arm                          exynos_defconfig
powerpc                   currituck_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                      footbridge_defconfig
csky                              allnoconfig
sh                          urquell_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                        realview_defconfig
powerpc                    sam440ep_defconfig
ia64                      gensparse_defconfig
m68k                           virt_defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sparc                       sparc64_defconfig
ia64                        generic_defconfig
arc                          axs103_defconfig
sh                          kfr2r09_defconfig
sh                           sh2007_defconfig
arm                            xcep_defconfig
sh                            migor_defconfig
arc                         haps_hs_defconfig

clang tested configs:
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221023
i386                          randconfig-a013
riscv                randconfig-r042-20221023
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
s390                 randconfig-r044-20221023
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon                          alldefconfig
mips                           rs90_defconfig
powerpc                     pseries_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-k001
mips                      malta_kvm_defconfig
hexagon                             defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      walnut_defconfig
arm                            mmp2_defconfig
mips                          ath79_defconfig
arm                           spitz_defconfig
arm                      pxa255-idp_defconfig
arm                         socfpga_defconfig
arm                             mxs_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
