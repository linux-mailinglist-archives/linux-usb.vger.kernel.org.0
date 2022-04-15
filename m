Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0607F502E3D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Apr 2022 19:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344647AbiDORJ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Apr 2022 13:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235654AbiDORJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Apr 2022 13:09:55 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C5495A29
        for <linux-usb@vger.kernel.org>; Fri, 15 Apr 2022 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650042447; x=1681578447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p2JgkKk/W9T915Bh6u++1p8mgTLGOvcREE1jGDFfdRQ=;
  b=A8CED9/Ec66slh0CpRw2XomXDA8bUE7xGIuiUE+0MBqe/HWNh7HYceOT
   Bq8gGf4nDy+04p0K2xoL4UJxG3AiMhRGMN2MCQXU8i1Mi/dG3fgupR08K
   U5h2JO6vLrh/sHf6uLsfnMWWXDXZPFYOPZ9FI1IFUSHPmnooccLcqXVN4
   M9G6sC/m88GyH0azxZRwz5oYLGt7Msp+ZwgV48v9CqRoICnMl2NCzdj05
   KMDWPqObZAOmOsG5g74+4Xi/DzDrn/Nj6oujwfU58mY98iwEiN9xHubMI
   XAAnfs85BQxE9oe+CJyaQL3iZtb7e7vVvfVoFSRGPQoQzmAmx2pmFymBW
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="349632834"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="349632834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 10:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="527472561"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2022 10:07:25 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nfPPo-0002D1-Lt;
        Fri, 15 Apr 2022 17:07:24 +0000
Date:   Sat, 16 Apr 2022 01:06:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ec547af8a9ea6441864bad34172676b5652ceb96
Message-ID: <6259a630.GrRXgMx0LQ0kXJhO%lkp@intel.com>
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
branch HEAD: ec547af8a9ea6441864bad34172676b5652ceb96  USB: quirks: add STRING quirk for VCOM device

elapsed time: 1384m

configs tested: 123
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
powerpc              randconfig-c003-20220414
sh                   secureedge5410_defconfig
powerpc                   motionpro_defconfig
arc                     haps_hs_smp_defconfig
arc                          axs103_defconfig
m68k                        stmark2_defconfig
sparc                       sparc64_defconfig
sh                          rsk7264_defconfig
mips                           xway_defconfig
xtensa                       common_defconfig
powerpc64                           defconfig
powerpc                      bamboo_defconfig
microblaze                          defconfig
sparc                            allyesconfig
mips                     loongson1b_defconfig
arm                          pxa910_defconfig
powerpc                         wii_defconfig
arc                        vdk_hs38_defconfig
mips                           jazz_defconfig
sh                           se7724_defconfig
arm                           imxrt_defconfig
arm                            mps2_defconfig
mips                     decstation_defconfig
s390                          debug_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220414
arm                  randconfig-c002-20220415
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
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220414
riscv                randconfig-r042-20220415
arc                  randconfig-r043-20220415
s390                 randconfig-r044-20220415
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
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
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220414
arm                  randconfig-c002-20220414
i386                          randconfig-c001
riscv                randconfig-c006-20220414
x86_64                           allyesconfig
mips                           ip28_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      acadia_defconfig
powerpc                      obs600_defconfig
riscv                             allnoconfig
powerpc                     kmeter1_defconfig
arm                       mainstone_defconfig
mips                       rbtx49xx_defconfig
arm                      tct_hammer_defconfig
powerpc                     tqm5200_defconfig
arm                        multi_v5_defconfig
mips                           mtx1_defconfig
arm                        spear3xx_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                randconfig-r042-20220414
hexagon              randconfig-r041-20220414
hexagon              randconfig-r045-20220414
s390                 randconfig-r044-20220414

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
