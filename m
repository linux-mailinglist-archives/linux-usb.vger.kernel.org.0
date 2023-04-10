Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD7B6DCC64
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 22:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjDJU5F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 16:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjDJU4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 16:56:51 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C35226A6
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681160209; x=1712696209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/5BG36p6H0iHiGt3ulIEwxXb97tDQtyWTI6tOtgsQYw=;
  b=AHQTH/JOv8SzvkH0MWODHIZOWZwyq1uvTchfn3bfMdiaqYxkGFE0TdN1
   8Zf3R0JGtmvnVnhEflM/TssnAJFuFJ2LWGbF5nGGsUDWfML85A9hLEZHT
   mLbltTIbXDz924hNSo39kG40Ij8wko1e4tiqum7FYHVx5ZcSiskliUGLI
   Ukg0lAc/u9ox/vyYG2AvhOmlmoiFjaxjtKLjUTJAD7YCYkF/CA3gFlEJV
   OyAipB3tMMrmi8bbj77ih2+UxCEhEgdy5fuKtcbf345qafkmrsY+3PTvF
   SepGKj5jxkT2NKeoybteYz+QpY1UnBQChivdfa4ZBwBFRvNPKEq0tX52s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408591730"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="408591730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 13:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="665723671"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="665723671"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Apr 2023 13:55:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1plyY6-000VfL-2I;
        Mon, 10 Apr 2023 20:55:38 +0000
Date:   Tue, 11 Apr 2023 04:54:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8e86652e3e7152bba80c3b4d03814e40ede1abc7
Message-ID: <64347798.TkWYZ4QsLHXVIkq9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8e86652e3e7152bba80c3b4d03814e40ede1abc7  Merge 6.3-rc6 into usb-next

elapsed time: 826m

configs tested: 202
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230410   gcc  
alpha                randconfig-r034-20230409   gcc  
alpha                randconfig-r036-20230409   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230409   gcc  
arc          buildonly-randconfig-r002-20230410   gcc  
arc          buildonly-randconfig-r005-20230410   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230409   gcc  
arc                  randconfig-r013-20230410   gcc  
arc                  randconfig-r015-20230409   gcc  
arc                  randconfig-r035-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                  randconfig-r016-20230409   clang
arm                  randconfig-r033-20230410   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                         s3c6400_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230410   gcc  
arm64                randconfig-r026-20230409   gcc  
csky         buildonly-randconfig-r003-20230410   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230410   gcc  
csky                 randconfig-r003-20230409   gcc  
csky                 randconfig-r021-20230409   gcc  
csky                 randconfig-r021-20230410   gcc  
csky                 randconfig-r024-20230410   gcc  
csky                 randconfig-r031-20230410   gcc  
csky                 randconfig-r033-20230409   gcc  
hexagon      buildonly-randconfig-r006-20230410   clang
hexagon              randconfig-r006-20230409   clang
hexagon              randconfig-r011-20230410   clang
hexagon              randconfig-r026-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r002-20230410   clang
i386                 randconfig-r036-20230410   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230410   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230410   gcc  
ia64                 randconfig-r004-20230409   gcc  
ia64                 randconfig-r015-20230410   gcc  
ia64                 randconfig-r024-20230410   gcc  
ia64                 randconfig-r031-20230410   gcc  
ia64                 randconfig-r033-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230409   gcc  
loongarch    buildonly-randconfig-r006-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230409   gcc  
loongarch            randconfig-r002-20230409   gcc  
loongarch            randconfig-r004-20230409   gcc  
loongarch            randconfig-r016-20230410   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230409   gcc  
m68k                 randconfig-r006-20230409   gcc  
m68k                 randconfig-r031-20230409   gcc  
m68k                 randconfig-r032-20230409   gcc  
m68k                 randconfig-r032-20230410   gcc  
m68k                 randconfig-r036-20230409   gcc  
microblaze           randconfig-r005-20230410   gcc  
microblaze           randconfig-r025-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                 randconfig-r001-20230410   gcc  
mips                 randconfig-r006-20230410   gcc  
mips                 randconfig-r012-20230409   clang
mips                           rs90_defconfig   clang
nios2        buildonly-randconfig-r004-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230410   gcc  
nios2                randconfig-r011-20230409   gcc  
nios2                randconfig-r024-20230409   gcc  
nios2                randconfig-r035-20230410   gcc  
openrisc     buildonly-randconfig-r006-20230409   gcc  
openrisc             randconfig-r003-20230409   gcc  
openrisc             randconfig-r006-20230410   gcc  
openrisc             randconfig-r014-20230409   gcc  
openrisc             randconfig-r033-20230409   gcc  
openrisc             randconfig-r035-20230410   gcc  
parisc       buildonly-randconfig-r002-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230410   gcc  
parisc               randconfig-r012-20230409   gcc  
parisc               randconfig-r024-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230409   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                 mpc836x_mds_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r014-20230410   gcc  
powerpc              randconfig-r021-20230410   gcc  
powerpc              randconfig-r025-20230409   gcc  
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230409   clang
riscv                randconfig-r012-20230410   gcc  
riscv                randconfig-r014-20230410   gcc  
riscv                randconfig-r022-20230409   gcc  
riscv                randconfig-r025-20230410   gcc  
riscv                randconfig-r026-20230410   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230410   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230410   gcc  
s390                 randconfig-r015-20230410   gcc  
s390                 randconfig-r025-20230410   gcc  
s390                 randconfig-r031-20230409   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh           buildonly-randconfig-r004-20230410   gcc  
sh                   randconfig-r004-20230409   gcc  
sh                   randconfig-r005-20230409   gcc  
sh                   randconfig-r012-20230410   gcc  
sh                   randconfig-r014-20230409   gcc  
sh                   randconfig-r015-20230409   gcc  
sh                   randconfig-r021-20230409   gcc  
sh                   randconfig-r022-20230409   gcc  
sh                   randconfig-r023-20230409   gcc  
sh                   randconfig-r032-20230409   gcc  
sh                   randconfig-r034-20230410   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r001-20230409   gcc  
sparc64      buildonly-randconfig-r003-20230409   gcc  
sparc64              randconfig-r001-20230409   gcc  
sparc64              randconfig-r004-20230410   gcc  
sparc64              randconfig-r005-20230410   gcc  
sparc64              randconfig-r006-20230409   gcc  
sparc64              randconfig-r011-20230409   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230410   clang
x86_64               randconfig-r022-20230410   gcc  
x86_64               randconfig-r034-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230410   gcc  
xtensa               randconfig-r023-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
