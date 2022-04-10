Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C174FABA1
	for <lists+linux-usb@lfdr.de>; Sun, 10 Apr 2022 05:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbiDJDmv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Apr 2022 23:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiDJDmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Apr 2022 23:42:49 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9B6657A
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 20:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649562038; x=1681098038;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3zgxNGT0yXzRAxD5ayvkU42ubOdswgA3jAqYORG6tys=;
  b=htTBYUcolS1hytJqCN8KTaayBOtai7zxYExqRFNjA9oHnto/hQMl7FQB
   yrT72hkD5NNfrtIR2uNM4olX9dnOSJY3eN4ZKzDntBol3lJT8kj+pHn1Q
   4FSI/FG2rDsspTsr3lGyuSGqM3VguVgFTWOW4S5GH9WvhCQ/sdqPt70QY
   maSjMAokLHepwDex3XrJLUjR0HgJnAnlKKdngJZVhB9HOIJ+QbPTqKOx6
   kcbdZ8cbssXsk4l7dOuFjIjLRgxhYKRz8jYmIEG5BdZDSxoWWM8CHNz4K
   0Wxx5oj63ezURf8uWT59b+fkozeRpEUFH36Zvyv2SC6XB2svhcJ46K9x+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="259536817"
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="259536817"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2022 20:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; 
   d="scan'208";a="525533936"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Apr 2022 20:40:33 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndORE-0000fD-MP;
        Sun, 10 Apr 2022 03:40:32 +0000
Date:   Sun, 10 Apr 2022 11:39:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b3fa25de31fb7e9afebe9599b8ff32eda13d7c94
Message-ID: <6252517f.w+mtnQtnwK+lxSmo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: b3fa25de31fb7e9afebe9599b8ff32eda13d7c94  usb: cdns3: Fix issue for clear halt endpoint

elapsed time: 724m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220410
i386                          randconfig-c001
powerpc                      ppc40x_defconfig
powerpc64                        alldefconfig
m68k                            q40_defconfig
m68k                        mvme147_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
xtensa                  nommu_kc705_defconfig
xtensa                  audio_kc705_defconfig
ia64                         bigsur_defconfig
sh                           sh2007_defconfig
mips                        vocore2_defconfig
m68k                         apollo_defconfig
powerpc                    adder875_defconfig
arm                           imxrt_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      chrp32_defconfig
powerpc                      pasemi_defconfig
powerpc                   motionpro_defconfig
arm                          badge4_defconfig
s390                                defconfig
arm                            zeus_defconfig
x86_64                              defconfig
arc                        vdk_hs38_defconfig
powerpc                 canyonlands_defconfig
openrisc                    or1ksim_defconfig
sh                          lboxre2_defconfig
sh                          sdk7786_defconfig
mips                            gpr_defconfig
sh                         ecovec24_defconfig
xtensa                              defconfig
m68k                       m5249evb_defconfig
arm                            xcep_defconfig
xtensa                         virt_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220409
arm                  randconfig-c002-20220410
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                             allyesconfig
sparc                               defconfig
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220409
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220410
arm                  randconfig-c002-20220410
i386                          randconfig-c001
riscv                randconfig-c006-20220410
mips                 randconfig-c004-20220410
powerpc              randconfig-c003-20220409
riscv                randconfig-c006-20220409
mips                 randconfig-c004-20220409
arm                  randconfig-c002-20220409
hexagon                          alldefconfig
powerpc                    mvme5100_defconfig
mips                           ip27_defconfig
arm                          pxa168_defconfig
mips                        qi_lb60_defconfig
arm                          imote2_defconfig
powerpc                 mpc832x_mds_defconfig
arm                       aspeed_g4_defconfig
powerpc                      ppc64e_defconfig
powerpc                     skiroot_defconfig
powerpc                     mpc512x_defconfig
mips                     cu1000-neo_defconfig
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
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
riscv                randconfig-r042-20220410
hexagon              randconfig-r041-20220410
hexagon              randconfig-r045-20220410
hexagon              randconfig-r041-20220409
hexagon              randconfig-r045-20220409
s390                 randconfig-r044-20220409
riscv                randconfig-r042-20220409

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
