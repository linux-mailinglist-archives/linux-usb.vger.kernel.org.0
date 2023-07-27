Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D04D765F01
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 00:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjG0WM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 18:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbjG0WM2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 18:12:28 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4819E2D59
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690495947; x=1722031947;
  h=date:from:to:cc:subject:message-id;
  bh=3TXwWKJTxzlXcp+hF14+eXjp8+4VLKS0VYvdxULJx3U=;
  b=C51jiU05dXbJW0soKVuMQGaB+78yl4UTKvuVaGArewHun34zuZ7GMJSe
   C0twVmAnthnjz2zJH4YfqEYviIXhmIiCZ9YkdS0zIP88CWKvxd16+2vm5
   VAUrgz/NhSi7ufQRLN+b42eJ3J9sJbtPlJswIujMzsUkT9dfgSIcRCgFA
   Q/ctJhI+4N7yZg+6mfOJVOvUSBDYAELp3kan6nuv8lbS8g8mpaWIBFnia
   jsD7aryEkOZUKPMqui1uZcZka3xQVzrIcczjXIezwTyTa6bg6RN4DHE0p
   6Y1DmJcVMEUAY2GafrkOzMSG1Qz3s6w/jnPX5l1oVjjyv91VtAFUAD0UG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368463293"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="368463293"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900998008"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="900998008"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 15:12:25 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qP9Dc-0002dH-39;
        Thu, 27 Jul 2023 22:12:24 +0000
Date:   Fri, 28 Jul 2023 06:12:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7f2327666a9080e428166964e37548b0168cd5e9
Message-ID: <202307280618.sBim5erY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7f2327666a9080e428166964e37548b0168cd5e9  usb: misc: ehset: fix wrong if condition

elapsed time: 723m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230727   gcc  
alpha                randconfig-r026-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230727   gcc  
arc                  randconfig-r022-20230727   gcc  
arc                  randconfig-r036-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r016-20230727   clang
arm                  randconfig-r025-20230727   clang
arm                  randconfig-r033-20230727   gcc  
arm                  randconfig-r046-20230727   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230727   gcc  
arm64                randconfig-r024-20230727   gcc  
arm64                randconfig-r032-20230727   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230727   gcc  
csky                 randconfig-r036-20230727   gcc  
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r001-20230727   clang
i386                 randconfig-r003-20230727   clang
i386                 randconfig-r012-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230727   gcc  
loongarch            randconfig-r034-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230727   gcc  
m68k                 randconfig-r024-20230727   gcc  
m68k                 randconfig-r026-20230727   gcc  
m68k                 randconfig-r031-20230727   gcc  
microblaze           randconfig-r005-20230727   gcc  
microblaze           randconfig-r013-20230727   gcc  
microblaze           randconfig-r025-20230727   gcc  
microblaze           randconfig-r031-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r011-20230727   clang
mips                 randconfig-r021-20230727   clang
mips                 randconfig-r022-20230727   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230727   gcc  
parisc               randconfig-r015-20230727   gcc  
parisc               randconfig-r035-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230727   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230727   clang
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230727   clang
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r002-20230727   gcc  
sparc64              randconfig-r023-20230727   gcc  
sparc64              randconfig-r033-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230727   gcc  
um                   randconfig-r032-20230727   gcc  
um                   randconfig-r035-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
