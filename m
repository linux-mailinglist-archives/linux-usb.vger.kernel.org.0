Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270274B38BA
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 00:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbiBLXzn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 18:55:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiBLXzm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 18:55:42 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1E75FF34
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 15:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644710138; x=1676246138;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AHoA2qdG2kkbFldHQ6Ppp5MwOx+WHDughGLzgqS6Cpw=;
  b=RqKdIhVaZMoTJeQJ9c/GMeM5SWYGctNRD1lfM+eRi+3tVcRIsywxjKwn
   yOoF9LygKgRZDg8g+aDY02zdxPcY8rEwevEAw6jEaTqwjve+iULuGm95+
   Ik6T9BCoG+R+W3l41bVFEAg5za43ykwa2qn9MFMkXGOEk9puxKl9JTV4q
   Q3mxJbG6ZEvEv2+0aOsC66diI73uhHCD+1t82h6vzqH19hSz96ccF0grr
   sITpO9EpVTNSLpnJkAUglNoZMzHVHJgEqb7bE+zbriQ/sit8rc7IrWBwW
   6FR3RGQwGlNCxhOJ21mkdQ+Ai+EF/ImtysMyEbDdWYmT2NsEXRxGBdnqQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="230549805"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="230549805"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 15:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="501141210"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Feb 2022 15:55:36 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJ2Ep-0006mg-VA; Sat, 12 Feb 2022 23:55:35 +0000
Date:   Sun, 13 Feb 2022 07:54:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 736e8d89044c1c330967fb938fa766cd9e0d8af0
Message-ID: <620848bb.aDrij1HzrmIkqjMt%lkp@intel.com>
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
branch HEAD: 736e8d89044c1c330967fb938fa766cd9e0d8af0  Revert "usb: dwc2: drd: fix soft connect when gadget is unconfigured"

elapsed time: 722m

configs tested: 214
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
openrisc                            defconfig
mips                          rb532_defconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
sh                               allmodconfig
m68k                          hp300_defconfig
mips                        bcm47xx_defconfig
xtensa                  cadence_csp_defconfig
sh                             espt_defconfig
arm                           u8500_defconfig
arm                      footbridge_defconfig
sh                             shx3_defconfig
sh                              ul2_defconfig
arm                          lpd270_defconfig
sh                          kfr2r09_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
powerpc                     stx_gp3_defconfig
mips                        vocore2_defconfig
powerpc                       ppc64_defconfig
ia64                        generic_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
powerpc                      tqm8xx_defconfig
h8300                       h8s-sim_defconfig
powerpc                     redwood_defconfig
riscv                               defconfig
xtensa                         virt_defconfig
arm                         axm55xx_defconfig
m68k                       m5475evb_defconfig
powerpc                    sam440ep_defconfig
riscv                            allyesconfig
powerpc                     mpc83xx_defconfig
sh                           se7721_defconfig
sparc                            allyesconfig
arc                            hsdk_defconfig
mips                 decstation_r4k_defconfig
sh                            titan_defconfig
powerpc                      ppc6xx_defconfig
um                               alldefconfig
powerpc                      makalu_defconfig
powerpc                  iss476-smp_defconfig
mips                           ip32_defconfig
m68k                        stmark2_defconfig
sh                        dreamcast_defconfig
alpha                            allyesconfig
m68k                        m5407c3_defconfig
parisc                generic-64bit_defconfig
arm                             ezx_defconfig
h8300                            allyesconfig
sh                           se7722_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            mps2_defconfig
arc                     haps_hs_smp_defconfig
m68k                         apollo_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
alpha                               defconfig
arm                          pxa3xx_defconfig
xtensa                generic_kc705_defconfig
arm                     eseries_pxa_defconfig
arm                           sama5_defconfig
powerpc                      bamboo_defconfig
arc                     nsimosci_hs_defconfig
sh                          landisk_defconfig
arc                              allyesconfig
sh                           se7751_defconfig
xtensa                              defconfig
openrisc                    or1ksim_defconfig
arm                         cm_x300_defconfig
powerpc                     tqm8548_defconfig
m68k                        mvme16x_defconfig
mips                       bmips_be_defconfig
sh                          polaris_defconfig
powerpc                 mpc834x_itx_defconfig
nds32                             allnoconfig
powerpc                      arches_defconfig
mips                           ci20_defconfig
arm                       omap2plus_defconfig
x86_64                           alldefconfig
powerpc                     tqm8555_defconfig
nds32                               defconfig
arm                        realview_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8541_defconfig
alpha                            alldefconfig
powerpc                    adder875_defconfig
mips                      fuloong2e_defconfig
sh                      rts7751r2d1_defconfig
powerpc                   motionpro_defconfig
arm                       aspeed_g5_defconfig
arm                           viper_defconfig
sh                                  defconfig
arm                          gemini_defconfig
powerpc                 linkstation_defconfig
arm                         vf610m4_defconfig
ia64                            zx1_defconfig
arm                        clps711x_defconfig
sh                          rsk7264_defconfig
sh                           se7619_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220213
arm                  randconfig-c002-20220211
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220212
arc                  randconfig-r043-20220211
arc                  randconfig-r043-20220212
s390                 randconfig-r044-20220212
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
riscv                randconfig-c006-20220211
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220211
arm                  randconfig-c002-20220211
i386                          randconfig-c001
mips                 randconfig-c004-20220211
riscv                randconfig-c006-20220213
powerpc              randconfig-c003-20220213
arm                  randconfig-c002-20220213
mips                 randconfig-c004-20220213
powerpc                   bluestone_defconfig
arm                          pcm027_defconfig
hexagon                          alldefconfig
arm                        neponset_defconfig
arm                      tct_hammer_defconfig
powerpc                      ppc64e_defconfig
mips                       lemote2f_defconfig
powerpc                     mpc512x_defconfig
mips                      malta_kvm_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
powerpc                       ebony_defconfig
powerpc                     kmeter1_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     pseries_defconfig
mips                           ip27_defconfig
mips                          ath79_defconfig
arm                              alldefconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          imote2_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220213
hexagon              randconfig-r041-20220213
riscv                randconfig-r042-20220213
hexagon              randconfig-r045-20220212
hexagon              randconfig-r045-20220211
hexagon              randconfig-r041-20220212
hexagon              randconfig-r041-20220211
riscv                randconfig-r042-20220211
s390                 randconfig-r044-20220211
s390                 randconfig-r044-20220213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
