Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904E6770D9F
	for <lists+linux-usb@lfdr.de>; Sat,  5 Aug 2023 06:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjHEEIQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Aug 2023 00:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjHEEIO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Aug 2023 00:08:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC64E6F
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 21:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691208491; x=1722744491;
  h=date:from:to:cc:subject:message-id;
  bh=OynXY9WEQ+XAblEnQYW11PuAn9LL3xaiv/H9K3/H0Ws=;
  b=BXcpqQTNadQuEOp81ohCgBvTklmCOXFsACvKMGJZyS4bskLksn/jtgF8
   EpEqNSnJbwdtOh9U8j1uWlOertagT4FOXiNU0uftKSvmPUlRmL1vUd3FZ
   xFVwsppr97IQtc41YDqeimFfd7oOtYkgwc/d1DOZwJpGTPl3bl4+ANRl+
   X08bL6tiFBEowQN5tebzQ2ZOedY6uKejYPsiQ6Lj1E+at0uLiVMmJV0vH
   n2ZzXITtnHz+ijq8zSVIShWstgbCsIQYngfdVWApNKBR7CexcQMnktBm2
   kh/ejNn4Guc79Bp1lKS7uj077xDfKEo4z/3zgNqRsl5xG4lOZkJvNaBmO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369184856"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="369184856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 21:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976816668"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="976816668"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 21:08:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qS8aH-0003Id-1s;
        Sat, 05 Aug 2023 04:08:09 +0000
Date:   Sat, 05 Aug 2023 12:08:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 3ddaa6a274578e23745b7466346fc2650df8f959
Message-ID: <202308051200.Opqfve1N-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 3ddaa6a274578e23745b7466346fc2650df8f959  usb: dwc3: Properly handle processing of pending events

elapsed time: 901m

configs tested: 140
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230731   gcc  
alpha                randconfig-r016-20230731   gcc  
alpha                randconfig-r024-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230731   gcc  
arc                  randconfig-r043-20230731   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230801   gcc  
arm                  randconfig-r031-20230731   clang
arm                  randconfig-r046-20230731   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230731   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230731   gcc  
hexagon              randconfig-r001-20230731   clang
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i001-20230801   gcc  
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i002-20230801   gcc  
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i003-20230801   gcc  
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i004-20230801   gcc  
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i005-20230801   gcc  
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i006-20230801   gcc  
i386                 randconfig-i011-20230731   clang
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230731   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230731   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230731   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230731   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230731   clang
i386                 randconfig-i016-20230801   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                 randconfig-r016-20230801   gcc  
microblaze           randconfig-r002-20230731   gcc  
microblaze           randconfig-r005-20230801   gcc  
microblaze           randconfig-r022-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230801   gcc  
openrisc             randconfig-r015-20230801   gcc  
openrisc             randconfig-r024-20230731   gcc  
openrisc             randconfig-r025-20230731   gcc  
openrisc             randconfig-r032-20230731   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230731   gcc  
parisc               randconfig-r026-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230801   clang
riscv                randconfig-r042-20230731   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230731   gcc  
s390                 randconfig-r044-20230731   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230731   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230801   gcc  
sparc                randconfig-r036-20230731   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230801   gcc  
um                   randconfig-r033-20230731   clang
um                   randconfig-r034-20230731   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r021-20230731   clang
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r023-20230731   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
