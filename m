Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC306FC13E
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 10:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbjEIIHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 04:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbjEIIGr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 04:06:47 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C95610A1D
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683619578; x=1715155578;
  h=date:from:to:cc:subject:message-id;
  bh=PqDn9jcDdoNm3ehaOpm8ZdwEdfC9bqbBLOnvKCUDkw4=;
  b=ShnDIBYzo2vbI0KN4laJARfwgtLGWAq+bEFJzpzDf2+W8+vMDgrLkA51
   Dy5HOJtiPod4/tv20Iy3P7v80nm4EIb77Ip7/D/xZ/VF1LeWDDb8XgHsp
   VlGFTeJb015BadeSroEeyKZxlnSCiezGEoIU/9H5zeU48UC9baw8ZZBw7
   W/cUoqB5C8Jdi0bq1iHP58Mjuh6vztftmdmFJtR1vsfiKeiao2pHtodW7
   6+ojj/pXBw2Er2Stbndxx7mULtGaPvtbyV7KnX84cRgx0bS/f8U24QJo7
   YQajTIpbiItOPr9hXYmhVUJEzj5Rl2ogGbI/YNWbFhCIudV+lFaVnMbVl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413103480"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="413103480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 01:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763721871"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="763721871"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 01:05:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwILi-0001xS-30;
        Tue, 09 May 2023 08:05:30 +0000
Date:   Tue, 09 May 2023 16:04:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 986866c3dfb0f930c5cc109a6c509c1391d96b5f
Message-ID: <20230509080454.ZXhgC%lkp@intel.com>
User-Agent: s-nail v14.9.24
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
branch HEAD: 986866c3dfb0f930c5cc109a6c509c1391d96b5f  usb: typec: mux: Remove some unneeded includes

elapsed time: 919m

configs tested: 122
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230508   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230507   clang
arm                  randconfig-r023-20230507   gcc  
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230508   gcc  
arm64                randconfig-r016-20230508   gcc  
arm64                randconfig-r031-20230507   gcc  
csky         buildonly-randconfig-r003-20230508   gcc  
csky         buildonly-randconfig-r004-20230507   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230507   gcc  
csky                 randconfig-r012-20230508   gcc  
csky                 randconfig-r024-20230507   gcc  
hexagon              randconfig-r006-20230507   clang
hexagon              randconfig-r015-20230507   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r002-20230508   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230508   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230508   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230508   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230507   gcc  
loongarch            randconfig-r035-20230507   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230507   gcc  
m68k                 randconfig-r013-20230507   gcc  
m68k                 randconfig-r014-20230508   gcc  
microblaze   buildonly-randconfig-r006-20230507   gcc  
microblaze           randconfig-r004-20230508   gcc  
microblaze           randconfig-r014-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r005-20230508   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230507   gcc  
openrisc     buildonly-randconfig-r005-20230507   gcc  
openrisc             randconfig-r001-20230507   gcc  
openrisc             randconfig-r034-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230507   clang
powerpc              randconfig-r005-20230508   clang
powerpc              randconfig-r006-20230508   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230507   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230508   gcc  
riscv                randconfig-r032-20230507   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230508   clang
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r036-20230507   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230507   gcc  
sparc64              randconfig-r026-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-r011-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r021-20230507   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
