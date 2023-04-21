Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D086EB089
	for <lists+linux-usb@lfdr.de>; Fri, 21 Apr 2023 19:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjDUR0Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Apr 2023 13:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbjDUR0X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 13:26:23 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAAA13FB8
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682097981; x=1713633981;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9zN2umlYtk/uw6gWs45Ix+tOUAppl50bgqpzrYvq8Uo=;
  b=L5lvkta88Hi0cU7Tn05leQlRUUkmWNPB2dnjsIEoWx+/ZpxYjTn4MrN7
   8puZQAOGklV8xU2XU4sfwtIDLaqrOGHuhpLxV0Afxe2sjsiIAqT8isJuM
   u8ljt6fyO/6wXtYauPvA4pgdKCsVRVCSeBeo4MueH7mTl0n7xiixZoYq4
   ulD/IVhSxQWfScXElj6Gd0zbD/uI43ivWTgbBVi21A8NzxybYM7YRNTkg
   DeD1bhWPTMiYVlX0MHI0gqos9XKhKDBE0UGB1q6d0cX1se/tUKNfUNrXf
   E+aay4tjiawvleW/D/brjcjd1goFjsLW64r3HPdbrxvHY4BwF6QnC1RBm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346059073"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="346059073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 10:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="685781521"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="685781521"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Apr 2023 10:26:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppuWY-000ghI-0D;
        Fri, 21 Apr 2023 17:26:18 +0000
Date:   Sat, 22 Apr 2023 01:26:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8f40fc0808137c157dd408d2632e63bfca2aecdb
Message-ID: <6442c72f.4xe79BDTL9R+PLCg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8f40fc0808137c157dd408d2632e63bfca2aecdb  usb: dwc3: gadget: Refactor EP0 forced stall/restart into a separate API

elapsed time: 722m

configs tested: 233
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230417   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230416   gcc  
alpha                randconfig-r021-20230409   gcc  
alpha                randconfig-r021-20230417   gcc  
alpha                randconfig-r025-20230410   gcc  
alpha                randconfig-r025-20230420   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230418   gcc  
arc          buildonly-randconfig-r004-20230417   gcc  
arc          buildonly-randconfig-r004-20230419   gcc  
arc          buildonly-randconfig-r006-20230416   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230416   gcc  
arc                  randconfig-r014-20230417   gcc  
arc                  randconfig-r021-20230420   gcc  
arc                  randconfig-r024-20230409   gcc  
arc                  randconfig-r025-20230417   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arc                  randconfig-r043-20230418   gcc  
arc                  randconfig-r043-20230419   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                  randconfig-r011-20230416   clang
arm                  randconfig-r021-20230418   clang
arm                  randconfig-r024-20230420   clang
arm                  randconfig-r026-20230409   clang
arm                  randconfig-r026-20230415   gcc  
arm                  randconfig-r031-20230418   gcc  
arm                  randconfig-r032-20230416   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm                  randconfig-r046-20230418   clang
arm                  randconfig-r046-20230419   gcc  
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230418   clang
arm64        buildonly-randconfig-r005-20230416   clang
arm64        buildonly-randconfig-r005-20230419   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230416   clang
arm64                randconfig-r012-20230416   gcc  
arm64                randconfig-r024-20230415   clang
arm64                randconfig-r024-20230421   clang
arm64                randconfig-r025-20230421   clang
arm64                randconfig-r035-20230417   gcc  
arm64                randconfig-r035-20230421   gcc  
csky         buildonly-randconfig-r004-20230416   gcc  
csky         buildonly-randconfig-r006-20230418   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230417   gcc  
csky                 randconfig-r024-20230410   gcc  
csky                 randconfig-r032-20230417   gcc  
csky                 randconfig-r036-20230420   gcc  
hexagon              randconfig-r013-20230416   clang
hexagon              randconfig-r023-20230415   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230418   clang
hexagon              randconfig-r041-20230419   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230418   clang
hexagon              randconfig-r045-20230419   clang
hexagon              randconfig-r045-20230420   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                 randconfig-r026-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230417   gcc  
ia64                 randconfig-r011-20230416   gcc  
ia64                 randconfig-r014-20230418   gcc  
ia64                 randconfig-r021-20230421   gcc  
ia64                 randconfig-r023-20230409   gcc  
ia64                 randconfig-r023-20230410   gcc  
ia64                 randconfig-r036-20230418   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230417   gcc  
m68k                 randconfig-r015-20230416   gcc  
m68k                 randconfig-r021-20230410   gcc  
m68k                 randconfig-r022-20230409   gcc  
m68k                 randconfig-r033-20230418   gcc  
microblaze   buildonly-randconfig-r003-20230418   gcc  
microblaze           randconfig-r001-20230417   gcc  
microblaze           randconfig-r006-20230417   gcc  
microblaze           randconfig-r024-20230418   gcc  
microblaze           randconfig-r034-20230418   gcc  
microblaze           randconfig-r036-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                 randconfig-r001-20230416   gcc  
mips                 randconfig-r013-20230417   gcc  
mips                 randconfig-r025-20230409   clang
mips                 randconfig-r025-20230418   clang
mips                 randconfig-r026-20230410   clang
mips                 randconfig-r031-20230417   clang
mips                 randconfig-r032-20230421   clang
mips                 randconfig-r033-20230416   gcc  
nios2                         3c120_defconfig   gcc  
nios2        buildonly-randconfig-r006-20230417   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230418   gcc  
nios2                randconfig-r022-20230420   gcc  
openrisc     buildonly-randconfig-r001-20230418   gcc  
openrisc     buildonly-randconfig-r002-20230416   gcc  
openrisc             randconfig-r014-20230416   gcc  
openrisc             randconfig-r023-20230421   gcc  
openrisc             randconfig-r033-20230420   gcc  
parisc       buildonly-randconfig-r002-20230417   gcc  
parisc       buildonly-randconfig-r003-20230419   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230421   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                 mpc837x_mds_defconfig   gcc  
powerpc              randconfig-r002-20230416   clang
powerpc              randconfig-r003-20230416   clang
powerpc              randconfig-r005-20230417   gcc  
powerpc              randconfig-r015-20230417   clang
powerpc              randconfig-r016-20230416   gcc  
powerpc              randconfig-r022-20230410   gcc  
powerpc              randconfig-r023-20230417   clang
powerpc              randconfig-r031-20230416   clang
powerpc              randconfig-r032-20230418   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230416   gcc  
riscv        buildonly-randconfig-r003-20230417   clang
riscv        buildonly-randconfig-r006-20230419   clang
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230418   gcc  
riscv                randconfig-r015-20230416   gcc  
riscv                randconfig-r024-20230417   clang
riscv                randconfig-r026-20230421   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                randconfig-r042-20230418   gcc  
riscv                randconfig-r042-20230419   clang
riscv                randconfig-r042-20230420   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230417   clang
s390                 randconfig-r015-20230417   clang
s390                 randconfig-r022-20230415   clang
s390                 randconfig-r034-20230417   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
s390                 randconfig-r044-20230418   gcc  
s390                 randconfig-r044-20230419   clang
s390                 randconfig-r044-20230420   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230416   gcc  
sh                        edosk7760_defconfig   gcc  
sh                   randconfig-r011-20230418   gcc  
sh                   randconfig-r012-20230417   gcc  
sh                   randconfig-r013-20230418   gcc  
sh                   randconfig-r023-20230418   gcc  
sh                   randconfig-r026-20230418   gcc  
sh                   randconfig-r026-20230420   gcc  
sh                   randconfig-r035-20230416   gcc  
sh                   randconfig-r036-20230421   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230417   gcc  
sparc                randconfig-r012-20230416   gcc  
sparc                randconfig-r021-20230415   gcc  
sparc                randconfig-r022-20230418   gcc  
sparc                randconfig-r032-20230420   gcc  
sparc                randconfig-r033-20230421   gcc  
sparc                randconfig-r034-20230421   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230419   gcc  
sparc64              randconfig-r003-20230417   gcc  
sparc64              randconfig-r005-20230416   gcc  
sparc64              randconfig-r016-20230416   gcc  
sparc64              randconfig-r016-20230418   gcc  
sparc64              randconfig-r022-20230421   gcc  
sparc64              randconfig-r033-20230417   gcc  
sparc64              randconfig-r035-20230420   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r034-20230416   gcc  
xtensa               randconfig-r035-20230418   gcc  
xtensa               randconfig-r036-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
