Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C806C78E608
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 07:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243438AbjHaFzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 01:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239560AbjHaFzV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 01:55:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F838E0
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461309; x=1724997309;
  h=date:from:to:cc:subject:message-id;
  bh=lq3SW/i0KXIj3+ZYyqXcQ6kYrvSRty0LbLJrdE+Yg0g=;
  b=ItODME8f8ghSTXNDcHfTbazLgtm3JrHmW/CeM1+9kUBOZvCLrPT6/4/g
   l8oRJ6KEpAxcP18PwhkwIHSGsLCK3crwmfKZQ6pXNq5j9FV1+glRaZen2
   doZJe6oSVDipWmxEc+wFfVKhFVklx4317iglXQMB+WgZWr331UkJZbYvA
   UyhBOrNj2jWQcgMnTMEgNHyXufW6gCVfPMZaoU6ZzYMKlswzdC2m+YE0Z
   YxQitWnSNw1uWmsTJQu3gyaXKxWvx4ghLuMHaaH2XXfd5tudNTpz8MZud
   6F/L6A/KdySPCVDbxUCf2llzV3rrWTUkgkCMgPpu53euFcBwInW8ot4pQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360810150"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="360810150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774365653"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="774365653"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 22:55:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbae3-000AqN-0R;
        Thu, 31 Aug 2023 05:55:07 +0000
Date:   Thu, 31 Aug 2023 13:54:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 895ed7eb263d7ce2d2592fdd3e211464a556084a
Message-ID: <202308311343.jxAoPWFq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 895ed7eb263d7ce2d2592fdd3e211464a556084a  Merge tag 'usb-serial-6.6-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 5423m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230827   gcc  
alpha                randconfig-r015-20230827   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230827   gcc  
arc                  randconfig-r004-20230827   gcc  
arc                  randconfig-r016-20230827   gcc  
arc                  randconfig-r025-20230827   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230827   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230827   gcc  
arm64                randconfig-r025-20230827   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230827   gcc  
csky                 randconfig-r004-20230827   gcc  
hexagon              randconfig-r011-20230827   clang
hexagon              randconfig-r022-20230827   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-015-20230827   gcc  
i386                  randconfig-016-20230827   gcc  
i386                 randconfig-r003-20230827   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230827   gcc  
loongarch            randconfig-r006-20230827   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230827   gcc  
m68k                 randconfig-r021-20230827   gcc  
m68k                 randconfig-r031-20230827   gcc  
m68k                 randconfig-r033-20230827   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r012-20230827   clang
mips                 randconfig-r013-20230827   clang
mips                 randconfig-r034-20230827   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230827   gcc  
nios2                randconfig-r036-20230827   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r004-20230827   gcc  
openrisc             randconfig-r013-20230827   gcc  
openrisc             randconfig-r015-20230827   gcc  
openrisc             randconfig-r023-20230827   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230827   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r003-20230827   clang
powerpc              randconfig-r014-20230827   gcc  
powerpc64            randconfig-r035-20230827   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230827   clang
s390                 randconfig-r012-20230827   gcc  
s390                 randconfig-r024-20230827   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r001-20230827   gcc  
sh                   randconfig-r021-20230827   gcc  
sh                   randconfig-r026-20230827   gcc  
sh                   randconfig-r034-20230827   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r022-20230827   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230827   gcc  
um                   randconfig-r033-20230827   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-004-20230827   clang
x86_64       buildonly-randconfig-006-20230827   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230827   gcc  
x86_64                randconfig-002-20230827   gcc  
x86_64                randconfig-003-20230827   gcc  
x86_64                randconfig-004-20230827   gcc  
x86_64                randconfig-005-20230827   gcc  
x86_64                randconfig-006-20230827   gcc  
x86_64                randconfig-011-20230827   clang
x86_64                randconfig-012-20230827   clang
x86_64                randconfig-013-20230827   clang
x86_64                randconfig-014-20230827   clang
x86_64                randconfig-015-20230827   clang
x86_64                randconfig-016-20230827   clang
x86_64                randconfig-071-20230827   clang
x86_64                randconfig-072-20230827   clang
x86_64                randconfig-073-20230827   clang
x86_64                randconfig-074-20230827   clang
x86_64                randconfig-075-20230827   clang
x86_64                randconfig-076-20230827   clang
x86_64               randconfig-r023-20230827   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r026-20230827   gcc  
xtensa               randconfig-r031-20230827   gcc  
xtensa               randconfig-r035-20230827   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
