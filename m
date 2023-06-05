Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6BF7233A4
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 01:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjFEXZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 19:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjFEXZm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 19:25:42 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D27D131
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686007532; x=1717543532;
  h=date:from:to:cc:subject:message-id;
  bh=FbYlU2ZNjyUisRdAsoYIOeaiNY9t23xuH0G1aO6NHeM=;
  b=SDFtuiJRnfflANqtWpdtgjXMqmZBZYeqGdTi8d7Tg8fwxC0W6ZFOvgoj
   cX0DR8/xGIi4hZgTU+vLkLP2KKN6sXu/yT41ASQqx87amIpxsNoCcj2YU
   DIHM0E8Nc7vlqofX4FYm8vI4TVN5zJu1BUvHV56OJNr9VSJ8+aRfNClY3
   WlZQvztZwYEXGzlnNE/M/Q7sh1RO8DRt0k5D2IYO2pED0tIKhbzqqDV0U
   SwFif4jmjbgGuQc7NvLDGO/M+U7S+aQh6LKAiXf6ioktmYmmzpafnjtec
   hHi1LL1kwZHrfjzHzRi31J7NYqXBBfYqqwrkjj/sDXEWildC8uUyBTI7E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341148372"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="341148372"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778753340"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="778753340"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2023 16:25:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6JZq-0004XW-0o;
        Mon, 05 Jun 2023 23:25:30 +0000
Date:   Tue, 06 Jun 2023 07:24:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 592295e61b5c51ea89fd1959932fd0f121f08c46
Message-ID: <20230605232443.qOuj_%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 592295e61b5c51ea89fd1959932fd0f121f08c46  Merge tag 'thunderbolt-for-v6.4-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 724m

configs tested: 206
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r004-20230605   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230605   gcc  
arc          buildonly-randconfig-r004-20230605   gcc  
arc          buildonly-randconfig-r005-20230605   gcc  
arc          buildonly-randconfig-r006-20230605   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230605   gcc  
arc                  randconfig-r026-20230605   gcc  
arc                  randconfig-r043-20230605   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                  randconfig-r031-20230605   gcc  
arm                  randconfig-r032-20230605   gcc  
arm                  randconfig-r046-20230605   clang
arm                        realview_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230605   clang
arm64                randconfig-r012-20230605   gcc  
arm64                randconfig-r013-20230605   gcc  
arm64                randconfig-r016-20230605   gcc  
arm64                randconfig-r034-20230605   clang
csky         buildonly-randconfig-r001-20230605   gcc  
csky         buildonly-randconfig-r005-20230605   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230605   gcc  
csky                 randconfig-r031-20230605   gcc  
csky                 randconfig-r034-20230605   gcc  
hexagon              randconfig-r004-20230605   clang
hexagon              randconfig-r025-20230605   clang
hexagon              randconfig-r041-20230605   clang
hexagon              randconfig-r045-20230605   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230605   clang
i386                 randconfig-i002-20230605   clang
i386                 randconfig-i003-20230605   clang
i386                 randconfig-i004-20230605   clang
i386                 randconfig-i005-20230605   clang
i386                 randconfig-i006-20230605   clang
i386                 randconfig-i011-20230605   gcc  
i386                 randconfig-i012-20230605   gcc  
i386                 randconfig-i013-20230605   gcc  
i386                 randconfig-i014-20230605   gcc  
i386                 randconfig-i015-20230605   gcc  
i386                 randconfig-i016-20230605   gcc  
i386                 randconfig-i051-20230605   clang
i386                 randconfig-i052-20230605   clang
i386                 randconfig-i053-20230605   clang
i386                 randconfig-i054-20230605   clang
i386                 randconfig-i055-20230605   clang
i386                 randconfig-i056-20230605   clang
i386                 randconfig-i061-20230605   clang
i386                 randconfig-i062-20230605   clang
i386                 randconfig-i063-20230605   clang
i386                 randconfig-i064-20230605   clang
i386                 randconfig-i065-20230605   clang
i386                 randconfig-i066-20230605   clang
i386                 randconfig-r011-20230605   gcc  
i386                 randconfig-r021-20230605   gcc  
i386                 randconfig-r022-20230605   gcc  
i386                 randconfig-r025-20230605   gcc  
i386                 randconfig-r026-20230605   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230606   gcc  
loongarch            randconfig-r012-20230605   gcc  
loongarch            randconfig-r016-20230605   gcc  
loongarch            randconfig-r025-20230605   gcc  
loongarch            randconfig-r031-20230605   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230605   gcc  
m68k         buildonly-randconfig-r006-20230605   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230606   gcc  
m68k                 randconfig-r004-20230605   gcc  
m68k                 randconfig-r021-20230605   gcc  
m68k                 randconfig-r023-20230605   gcc  
microblaze           randconfig-r002-20230605   gcc  
microblaze           randconfig-r003-20230606   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230605   gcc  
mips         buildonly-randconfig-r003-20230605   gcc  
mips                        omega2p_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r003-20230605   gcc  
mips                 randconfig-r035-20230605   gcc  
nios2        buildonly-randconfig-r005-20230605   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230605   gcc  
nios2                randconfig-r011-20230605   gcc  
nios2                randconfig-r016-20230605   gcc  
nios2                randconfig-r021-20230605   gcc  
nios2                randconfig-r024-20230605   gcc  
nios2                randconfig-r032-20230605   gcc  
nios2                randconfig-r035-20230605   gcc  
openrisc     buildonly-randconfig-r001-20230605   gcc  
openrisc     buildonly-randconfig-r003-20230605   gcc  
openrisc     buildonly-randconfig-r004-20230605   gcc  
openrisc             randconfig-r006-20230605   gcc  
openrisc             randconfig-r023-20230605   gcc  
openrisc             randconfig-r036-20230605   gcc  
parisc       buildonly-randconfig-r003-20230605   gcc  
parisc       buildonly-randconfig-r004-20230605   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230605   gcc  
parisc               randconfig-r012-20230605   gcc  
parisc               randconfig-r015-20230605   gcc  
parisc               randconfig-r022-20230605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230605   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r013-20230605   gcc  
powerpc              randconfig-r014-20230605   gcc  
powerpc              randconfig-r015-20230605   gcc  
powerpc              randconfig-r035-20230605   clang
powerpc              randconfig-r036-20230605   clang
powerpc                     redwood_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230605   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230605   clang
riscv                randconfig-r005-20230605   clang
riscv                randconfig-r006-20230605   clang
riscv                randconfig-r015-20230605   gcc  
riscv                randconfig-r042-20230605   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230606   gcc  
s390                 randconfig-r016-20230605   gcc  
s390                 randconfig-r035-20230605   clang
s390                 randconfig-r044-20230605   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230605   gcc  
sh                   randconfig-r013-20230605   gcc  
sh                   randconfig-r026-20230605   gcc  
sh                   randconfig-r032-20230605   gcc  
sh                   randconfig-r033-20230605   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230605   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230605   gcc  
sparc                randconfig-r022-20230605   gcc  
sparc                randconfig-r025-20230605   gcc  
sparc                randconfig-r033-20230605   gcc  
sparc                randconfig-r035-20230605   gcc  
sparc64      buildonly-randconfig-r001-20230605   gcc  
sparc64      buildonly-randconfig-r002-20230605   gcc  
sparc64      buildonly-randconfig-r003-20230605   gcc  
sparc64      buildonly-randconfig-r006-20230605   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230605   clang
x86_64               randconfig-a002-20230605   clang
x86_64               randconfig-a003-20230605   clang
x86_64               randconfig-a004-20230605   clang
x86_64               randconfig-a005-20230605   clang
x86_64               randconfig-a006-20230605   clang
x86_64               randconfig-a011-20230605   gcc  
x86_64               randconfig-a012-20230605   gcc  
x86_64               randconfig-a013-20230605   gcc  
x86_64               randconfig-a014-20230605   gcc  
x86_64               randconfig-a015-20230605   gcc  
x86_64               randconfig-a016-20230605   gcc  
x86_64               randconfig-r005-20230605   clang
x86_64               randconfig-r024-20230605   gcc  
x86_64               randconfig-r031-20230605   clang
x86_64               randconfig-x051-20230605   gcc  
x86_64               randconfig-x052-20230605   gcc  
x86_64               randconfig-x053-20230605   gcc  
x86_64               randconfig-x054-20230605   gcc  
x86_64               randconfig-x055-20230605   gcc  
x86_64               randconfig-x056-20230605   gcc  
x86_64               randconfig-x061-20230605   gcc  
x86_64               randconfig-x062-20230605   gcc  
x86_64               randconfig-x063-20230605   gcc  
x86_64               randconfig-x064-20230605   gcc  
x86_64               randconfig-x065-20230605   gcc  
x86_64               randconfig-x066-20230605   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230605   gcc  
xtensa               randconfig-r011-20230605   gcc  
xtensa               randconfig-r013-20230605   gcc  
xtensa               randconfig-r015-20230605   gcc  
xtensa               randconfig-r023-20230605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
