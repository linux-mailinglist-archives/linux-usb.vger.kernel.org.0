Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6924C50FA
	for <lists+linux-usb@lfdr.de>; Fri, 25 Feb 2022 22:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbiBYVwC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Feb 2022 16:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiBYVwB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Feb 2022 16:52:01 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD002118F1
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645825889; x=1677361889;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cp5ZosfwlyT5tcTHlFkku5r8dmRJd/nia2wowF05fSg=;
  b=WqY2og/10o4irxnXpp3o8SZfOVV6CfmQJqDcNcVu6bnwAEcx6AACeFpw
   TM+qxm5zSW9SCZyhk/nw0IxBILba+7JpzwxVe3yMriwcP427dGlCnklQY
   I833y4kNl85w/ssIVFZTS/fLs+fGpg40wkXQuiaXnf2Y7w9Vofj8CXnj0
   uQQhmTSsvOmv/D4hQgGQHKty9e4LdY/kS9hyfGOZJmMIpR6sj4GbQf87J
   wYVz6ee0L5m2oE3mX7tFo1nNhmyhq0GCnuCo3XdRury6WUL1SLVHcY+/4
   9CRXnTbMIL1shOp3d87LuSjsvxykhrRYbmoPbV6tAELEHkOKC+3qdjVsx
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="315801705"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="315801705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 13:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="640251158"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Feb 2022 13:51:26 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNiUn-0004lN-DB; Fri, 25 Feb 2022 21:51:25 +0000
Date:   Sat, 26 Feb 2022 05:51:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 bc25c55812ff72cd3f2c310ba42f78a812dac95e
Message-ID: <62194f49.2tkL0A9AhHmeTW7T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: bc25c55812ff72cd3f2c310ba42f78a812dac95e  dt-bindings: usb: qcom,dwc3: Add msm8953 compatible

elapsed time: 726m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220225
m68k                          sun3x_defconfig
powerpc                    klondike_defconfig
powerpc                      pcm030_defconfig
sh                          rsk7203_defconfig
s390                          debug_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
sparc                       sparc32_defconfig
sh                     sh7710voipgw_defconfig
arc                        nsim_700_defconfig
mips                            ar7_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
powerpc                     asp8347_defconfig
arm                          exynos_defconfig
arm                       imx_v6_v7_defconfig
arm                         assabet_defconfig
mips                  decstation_64_defconfig
sh                        dreamcast_defconfig
xtensa                         virt_defconfig
s390                             allyesconfig
arm                           tegra_defconfig
arm                           sama5_defconfig
sh                            shmin_defconfig
mips                         rt305x_defconfig
arm64                            alldefconfig
mips                           gcw0_defconfig
sh                         apsh4a3a_defconfig
sh                        apsh4ad0a_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
mips                        vocore2_defconfig
arm                        trizeps4_defconfig
sparc64                             defconfig
mips                             allmodconfig
riscv                               defconfig
sh                              ul2_defconfig
m68k                          hp300_defconfig
parisc                generic-32bit_defconfig
powerpc                      ppc40x_defconfig
mips                         tb0226_defconfig
xtensa                       common_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7721_defconfig
sh                        edosk7760_defconfig
mips                     decstation_defconfig
um                               alldefconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220225
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a016
i386                          randconfig-a014
i386                          randconfig-a012
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
s390                             alldefconfig
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     pseries_defconfig
powerpc                     ppa8548_defconfig
arm                         bcm2835_defconfig
arm                              alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                         palmz72_defconfig
powerpc                          allyesconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220225
s390                 randconfig-r044-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
