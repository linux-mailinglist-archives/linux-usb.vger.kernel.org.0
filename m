Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2036CF4E7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjC2U6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 16:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjC2U6Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 16:58:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0A25258
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680123495; x=1711659495;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iqNLmvbaauMsibBLibKfY6UTbIzSLSs0jObEduVainA=;
  b=Yhi2HNGZw9jnpHLMoMWLzQM9YsyW5TJm7Jk8tF6oXAkPlcY5TM7+kgVr
   v/GqOKmBcJqIB1Zl3UmxXYJ1gXeE/xKN33/RsP4yTcYUqH9HYqp9xh+Kw
   N2Mmv3oiSlT5Mg3FP2khlJu16qTH9CeZLFz9CAnNfyybiy+Kgw4xDbDnA
   XR/tKJBaAf3DJrbjs0jQizhj+szXG0rW0uspCIkrucmCkIHawkGOcJrOK
   LWR8fIjgSKy2VjsdLsoIkRNeItt3dIy5DnYU+M380uY2Vkw6j0NWIHeLa
   YKC1PT6JKrgLPbEFWJgRyEK75zcjClTq5nPfNHfm+d2zfetAj1erqHsu+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="324917168"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="324917168"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828034234"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="828034234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 13:58:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phcs0-000Jws-21;
        Wed, 29 Mar 2023 20:58:12 +0000
Date:   Thu, 30 Mar 2023 04:57:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 4c7f9d2e413dc06a157c4e5dccde84aaf4655eb3
Message-ID: <6424a64e.HZ2dH7BYcJ7/Kjow%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 4c7f9d2e413dc06a157c4e5dccde84aaf4655eb3  usb: xhci: tegra: fix sleep in atomic call

elapsed time: 730m

configs tested: 221
configs skipped: 29

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230329   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230329   gcc  
alpha                randconfig-r005-20230329   gcc  
alpha                randconfig-r015-20230329   gcc  
alpha                randconfig-r022-20230329   gcc  
alpha                randconfig-r023-20230329   gcc  
alpha                randconfig-r024-20230329   gcc  
alpha                randconfig-r031-20230329   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230329   gcc  
arc          buildonly-randconfig-r003-20230329   gcc  
arc          buildonly-randconfig-r005-20230329   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r013-20230329   gcc  
arc                  randconfig-r016-20230329   gcc  
arc                  randconfig-r033-20230329   gcc  
arc                  randconfig-r034-20230329   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r006-20230329   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230329   gcc  
arm64        buildonly-randconfig-r002-20230329   gcc  
arm64        buildonly-randconfig-r005-20230329   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230329   gcc  
arm64                randconfig-r013-20230329   clang
arm64                randconfig-r025-20230329   clang
arm64                randconfig-r026-20230329   clang
arm64                randconfig-r032-20230329   gcc  
arm64                randconfig-r036-20230329   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230329   gcc  
csky                 randconfig-r004-20230329   gcc  
csky                 randconfig-r011-20230329   gcc  
csky                 randconfig-r021-20230329   gcc  
hexagon              randconfig-r015-20230329   clang
hexagon              randconfig-r016-20230329   clang
hexagon              randconfig-r023-20230329   clang
hexagon              randconfig-r041-20230329   clang
hexagon              randconfig-r045-20230329   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230329   gcc  
ia64         buildonly-randconfig-r005-20230329   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230329   gcc  
ia64                 randconfig-r005-20230329   gcc  
ia64                 randconfig-r036-20230329   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230329   gcc  
loongarch    buildonly-randconfig-r006-20230329   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230329   gcc  
loongarch            randconfig-r013-20230329   gcc  
loongarch            randconfig-r015-20230329   gcc  
loongarch            randconfig-r023-20230329   gcc  
loongarch            randconfig-r025-20230329   gcc  
loongarch            randconfig-r026-20230329   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230329   gcc  
m68k         buildonly-randconfig-r004-20230329   gcc  
m68k         buildonly-randconfig-r006-20230329   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r002-20230329   gcc  
m68k                 randconfig-r014-20230329   gcc  
m68k                 randconfig-r015-20230329   gcc  
m68k                 randconfig-r031-20230329   gcc  
m68k                 randconfig-r033-20230329   gcc  
m68k                 randconfig-r035-20230329   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r004-20230329   gcc  
microblaze           randconfig-r005-20230329   gcc  
microblaze           randconfig-r016-20230329   gcc  
microblaze           randconfig-r024-20230329   gcc  
microblaze           randconfig-r032-20230329   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                 randconfig-r001-20230329   clang
mips                 randconfig-r005-20230329   clang
mips                 randconfig-r012-20230329   gcc  
mips                 randconfig-r015-20230329   gcc  
mips                 randconfig-r023-20230329   gcc  
mips                 randconfig-r025-20230329   gcc  
nios2        buildonly-randconfig-r003-20230329   gcc  
nios2        buildonly-randconfig-r004-20230329   gcc  
nios2        buildonly-randconfig-r005-20230329   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230329   gcc  
nios2                randconfig-r011-20230329   gcc  
nios2                randconfig-r012-20230329   gcc  
nios2                randconfig-r016-20230329   gcc  
nios2                randconfig-r026-20230329   gcc  
nios2                randconfig-r031-20230329   gcc  
nios2                randconfig-r033-20230329   gcc  
nios2                randconfig-r035-20230329   gcc  
openrisc     buildonly-randconfig-r003-20230329   gcc  
openrisc     buildonly-randconfig-r006-20230329   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r004-20230329   gcc  
openrisc             randconfig-r006-20230329   gcc  
openrisc             randconfig-r021-20230329   gcc  
openrisc             randconfig-r025-20230329   gcc  
openrisc             randconfig-r026-20230329   gcc  
openrisc             randconfig-r032-20230329   gcc  
openrisc             randconfig-r034-20230329   gcc  
openrisc             randconfig-r036-20230329   gcc  
parisc       buildonly-randconfig-r005-20230329   gcc  
parisc       buildonly-randconfig-r006-20230329   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r011-20230329   clang
powerpc              randconfig-r024-20230329   clang
powerpc              randconfig-r032-20230329   gcc  
powerpc              randconfig-r034-20230329   gcc  
powerpc                    socrates_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r022-20230329   clang
riscv                randconfig-r032-20230329   gcc  
riscv                randconfig-r035-20230329   gcc  
riscv                randconfig-r042-20230329   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230329   gcc  
s390                 randconfig-r003-20230329   gcc  
s390                 randconfig-r014-20230329   clang
s390                 randconfig-r015-20230329   clang
s390                 randconfig-r016-20230329   clang
s390                 randconfig-r022-20230329   clang
s390                 randconfig-r023-20230329   clang
s390                 randconfig-r035-20230329   gcc  
s390                 randconfig-r044-20230329   clang
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r006-20230329   gcc  
sh                   randconfig-r022-20230329   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc        buildonly-randconfig-r003-20230329   gcc  
sparc        buildonly-randconfig-r006-20230329   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r003-20230329   gcc  
sparc64      buildonly-randconfig-r005-20230329   gcc  
sparc64      buildonly-randconfig-r006-20230329   gcc  
sparc64              randconfig-r013-20230329   gcc  
sparc64              randconfig-r031-20230329   gcc  
um                               alldefconfig   gcc  
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
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230329   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r003-20230329   gcc  
xtensa               randconfig-r012-20230329   gcc  
xtensa               randconfig-r021-20230329   gcc  
xtensa               randconfig-r024-20230329   gcc  
xtensa               randconfig-r031-20230329   gcc  
xtensa               randconfig-r033-20230329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
