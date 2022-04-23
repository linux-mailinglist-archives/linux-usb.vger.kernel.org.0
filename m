Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7C550CE01
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 01:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbiDWXG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Apr 2022 19:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiDWXG5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Apr 2022 19:06:57 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39354E541D
        for <linux-usb@vger.kernel.org>; Sat, 23 Apr 2022 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650755038; x=1682291038;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SpiIF3mfvKyHGDr69zKBzr70L/9GW6KvkX+X8QkvI2M=;
  b=WNCVW4NJ1E/50n7pBgfnYzxW0xnXeKLiHjezccpQEL7MaSxbjba/nanJ
   2L8qqsrNUkbKqkPvEim+w/H2i9qHJNoIAUFZBwHIYRCIciiYsrepSWTbo
   PjS33VXWoInALNcMQvEQOuEMvV+5Ih8Wk96lecAmE7qzd4JtkoW6N4Nuv
   6T2WisLPycmuC3b3lndBC43BQBEmZ5SlU2VR0YAbrK35K6S7OwPtSNB3i
   dWUu4bIOtoVihbc7NkVR5id7qPzC4C0vBx30A+SsynFxBvW3bawhxSeR7
   vkIOjKgp0uHT0AAhZKMRrp0tuEPWPCQu7aj7p7lgJ2AMC9lvZ6zvo9hcu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="252306057"
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="252306057"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 16:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,285,1643702400"; 
   d="scan'208";a="615935489"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2022 16:03:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1niOnD-0000g9-GG;
        Sat, 23 Apr 2022 23:03:55 +0000
Date:   Sun, 24 Apr 2022 07:03:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 da609eda81a8b842417ccf74bdf6bf9b5d403549
Message-ID: <626485a9.vW1jfYNNQ8J7SPxs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: da609eda81a8b842417ccf74bdf6bf9b5d403549  Merge tag 'usb-serial-5.18-rc4' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 820m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                       aspeed_g5_defconfig
sh                          rsk7201_defconfig
sparc                               defconfig
arm                             pxa_defconfig
sparc                       sparc64_defconfig
xtensa                          iss_defconfig
ia64                             alldefconfig
xtensa                  audio_kc705_defconfig
arm                           imxrt_defconfig
xtensa                              defconfig
alpha                               defconfig
um                                  defconfig
m68k                          atari_defconfig
mips                  maltasmvp_eva_defconfig
arm                          badge4_defconfig
powerpc                           allnoconfig
arm                        trizeps4_defconfig
sh                             shx3_defconfig
arm                           h3600_defconfig
xtensa                       common_defconfig
m68k                        mvme147_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           viper_defconfig
openrisc                    or1ksim_defconfig
arc                        vdk_hs38_defconfig
sh                        edosk7760_defconfig
arm                             rpc_defconfig
sh                            hp6xx_defconfig
openrisc                            defconfig
ia64                        generic_defconfig
mips                        bcm47xx_defconfig
um                               alldefconfig
sparc64                             defconfig
sh                               j2_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    klondike_defconfig
arm                         lubbock_defconfig
sh                           sh2007_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
arm                             ezx_defconfig
arm                         vf610m4_defconfig
powerpc                         ps3_defconfig
sh                           se7780_defconfig
arm                        spear6xx_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig
sh                          lboxre2_defconfig
powerpc                      chrp32_defconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
h8300                               defconfig
powerpc                     tqm8541_defconfig
xtensa                  cadence_csp_defconfig
sparc64                          alldefconfig
m68k                         amcore_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7722_defconfig
arm                            xcep_defconfig
sh                           se7619_defconfig
arm                            zeus_defconfig
riscv                            allyesconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
arm                  randconfig-c002-20220424
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
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
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220422
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
arm                        magician_defconfig
powerpc                      walnut_defconfig
powerpc                     kilauea_defconfig
mips                           ip27_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc64e_defconfig
powerpc                      pmac32_defconfig
arm                  colibri_pxa300_defconfig
mips                      malta_kvm_defconfig
arm                         lpc32xx_defconfig
arm                         hackkit_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc44x_defconfig
mips                        omega2p_defconfig
powerpc                     ppa8548_defconfig
arm                          pxa168_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                  mpc885_ads_defconfig
arm                         socfpga_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
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
hexagon              randconfig-r041-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422
s390                 randconfig-r044-20220422
hexagon              randconfig-r041-20220424
riscv                randconfig-r042-20220424
hexagon              randconfig-r045-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
