Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAAE6D91E0
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 10:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236084AbjDFImy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 04:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbjDFImx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 04:42:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496A77ED8
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680770568; x=1712306568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HB87BtEeNdQaLOxI9BHHXidwQyWKoB2Dvx+t+tqqvB0=;
  b=O6jmc13judY/mDe1Pe7cGAS7f02LI0/I5949emWWL/RSzdWjJ4OgVgzk
   MjJuHzBlMriLCZo4bm4TwKSJrf5UvsMUueYX8v8YJj6rhiOnFdONEj2aB
   CfFHmxtQmpiIL0c33zmKqhtPrRTiYU0u1Vgbtb7ag6cfWHojJHFB6OpoD
   WTooAUINyzALZXly9rZz2L4IuKiCFvHrhBxHKYXdEgu/HKnjRgQOWwSR7
   wz/Hf8dGzyjAQhIzPDZ+Nd0DBGjv3AUyvGioNDE4yA023z8+x6YZn/dQj
   qtaPPu7Ey9aGQEccrrbkVVKWjnzXnNQJNGJDvlTlnayMmiOsfglEZAUNU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323062506"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323062506"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 01:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="933117981"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="933117981"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2023 01:42:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pkLCe-000REc-2B;
        Thu, 06 Apr 2023 08:42:44 +0000
Date:   Thu, 06 Apr 2023 16:42:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1edf48991a783d00a3a18dc0d27c88139e4030a2
Message-ID: <642e85f8.or8VRAi7I33NJx18%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1edf48991a783d00a3a18dc0d27c88139e4030a2  usb: cdnsp: Fixes error: uninitialized symbol 'len'

elapsed time: 855m

configs tested: 153
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230403   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230403   gcc  
alpha                randconfig-r016-20230403   gcc  
alpha                randconfig-r023-20230403   gcc  
alpha                randconfig-r034-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230403   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230403   gcc  
arc                  randconfig-r022-20230403   gcc  
arc                  randconfig-r034-20230403   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230403   clang
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230403   clang
arm                  randconfig-r025-20230403   clang
arm                  randconfig-r031-20230403   gcc  
arm                  randconfig-r035-20230403   gcc  
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230403   clang
arm64                randconfig-r012-20230403   gcc  
arm64                randconfig-r021-20230403   gcc  
arm64                randconfig-r035-20230403   clang
csky                                defconfig   gcc  
csky                 randconfig-r012-20230403   gcc  
csky                 randconfig-r035-20230403   gcc  
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r041-20230406   clang
hexagon              randconfig-r045-20230403   clang
hexagon              randconfig-r045-20230406   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                 randconfig-r015-20230403   gcc  
i386                 randconfig-r016-20230403   gcc  
i386                 randconfig-r021-20230403   gcc  
i386                 randconfig-r022-20230403   gcc  
i386                 randconfig-r023-20230403   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230403   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230403   gcc  
loongarch            randconfig-r031-20230403   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230403   gcc  
m68k         buildonly-randconfig-r006-20230403   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230403   gcc  
m68k                 randconfig-r024-20230403   gcc  
microblaze   buildonly-randconfig-r005-20230403   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230403   gcc  
mips                 randconfig-r005-20230403   gcc  
mips                 randconfig-r024-20230403   clang
mips                 randconfig-r026-20230403   clang
nios2        buildonly-randconfig-r003-20230403   gcc  
nios2        buildonly-randconfig-r004-20230403   gcc  
nios2        buildonly-randconfig-r006-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230403   gcc  
openrisc             randconfig-r011-20230403   gcc  
openrisc             randconfig-r026-20230403   gcc  
openrisc             randconfig-r034-20230403   gcc  
parisc       buildonly-randconfig-r003-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230403   gcc  
parisc               randconfig-r011-20230403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r014-20230403   gcc  
powerpc              randconfig-r025-20230403   gcc  
powerpc              randconfig-r036-20230403   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230403   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230403   gcc  
riscv                randconfig-r042-20230403   gcc  
riscv                randconfig-r042-20230406   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230403   clang
s390                 randconfig-r044-20230403   gcc  
s390                 randconfig-r044-20230406   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230403   gcc  
sh                   randconfig-r003-20230403   gcc  
sh                   randconfig-r034-20230403   gcc  
sh                   randconfig-r036-20230403   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230403   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230403   gcc  
sparc64      buildonly-randconfig-r002-20230403   gcc  
sparc64      buildonly-randconfig-r006-20230403   gcc  
sparc64              randconfig-r003-20230403   gcc  
sparc64              randconfig-r014-20230403   gcc  
sparc64              randconfig-r031-20230403   gcc  
sparc64              randconfig-r033-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64               randconfig-k001-20230403   gcc  
x86_64               randconfig-r001-20230403   clang
x86_64               randconfig-r012-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230403   gcc  
xtensa               randconfig-r006-20230403   gcc  
xtensa               randconfig-r026-20230403   gcc  
xtensa               randconfig-r033-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
