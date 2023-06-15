Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B69D732319
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 01:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjFOXJA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 19:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjFOXI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 19:08:58 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882EF272C
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686870537; x=1718406537;
  h=date:from:to:cc:subject:message-id;
  bh=Ao9y/vPqUOQYtxnDLZrmoWVyEaaBN9WDuICtR6XdNts=;
  b=fKNKsSy2UcA1i91MME0O79B1iqnPVVkX/D0LM5hm7NAyB7lf4DrfJG+G
   Nz1st/maKt/9nt6rbn6BUF35gGWaGl3iUqLMG5CwQcrW+7amzOUP7CVCA
   idtUGpHzAUzOCtyw59xpw5T4Wz7On6+we4m9GffN3vMFU4Ab0Hl3JI1oD
   S1TRFhJOFoW2R+mr5UFHQLXuj7vEnqh4SX5KlBDREmaGLBr0Z5ypwHCzm
   kAFqDdwljUMig/oqZzXr2gWbY7hJx9eJf5yJ8sHAJWhgXeZ3NdLrffZCz
   o7F6dmQ5ovxjtt7yqcAugEDrWk97RFSrqy1M7fJxrNYVkF5coIw5csC9Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356552523"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="356552523"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 16:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="777919348"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="777919348"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 16:08:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q9w5H-0000VQ-1Z;
        Thu, 15 Jun 2023 23:08:55 +0000
Date:   Fri, 16 Jun 2023 07:08:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 88d8f3ac9c67e2d00db671dbb0af50efb7c358cb
Message-ID: <202306160739.5sFSGAgd-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 88d8f3ac9c67e2d00db671dbb0af50efb7c358cb  usb: typec: add support for the nb7vpq904m Type-C Linear Redriver

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
`-- riscv-allyesconfig
    `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead

elapsed time: 724m

configs tested: 116
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r034-20230615   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r024-20230615   gcc  
arm                  randconfig-r046-20230615   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230615   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r035-20230615   clang
hexagon              randconfig-r041-20230615   clang
hexagon              randconfig-r045-20230615   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i011-20230614   gcc  
i386                 randconfig-i012-20230614   gcc  
i386                 randconfig-i013-20230614   gcc  
i386                 randconfig-i014-20230614   gcc  
i386                 randconfig-i015-20230614   gcc  
i386                 randconfig-i016-20230614   gcc  
i386                 randconfig-r032-20230615   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230615   gcc  
loongarch            randconfig-r015-20230614   gcc  
loongarch            randconfig-r021-20230615   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r033-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                   sb1250_swarm_defconfig   clang
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r004-20230614   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230614   gcc  
powerpc      buildonly-randconfig-r005-20230614   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r011-20230614   gcc  
powerpc              randconfig-r023-20230615   clang
powerpc              randconfig-r026-20230615   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230615   gcc  
riscv                randconfig-r014-20230614   gcc  
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230614   gcc  
s390                 randconfig-r025-20230615   clang
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230615   gcc  
xtensa               randconfig-r016-20230614   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
