Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4704077A26F
	for <lists+linux-usb@lfdr.de>; Sat, 12 Aug 2023 22:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjHLUWV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Aug 2023 16:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjHLUWV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Aug 2023 16:22:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C31CE
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691871744; x=1723407744;
  h=date:from:to:cc:subject:message-id;
  bh=hW8ZohnuVVrUiAZaUOscpx3gPduzlsEcqvijCzXMoZA=;
  b=AzYe3HFtn2bg+KGx4tJJuXyz2l0pqPJc6RkOC5ktNB5Uoor1rI6Kcfc7
   q/z5ED6M2HoCb4yajOooi2nrcJkM1ltEH6x0COKOfavAdV5eUMZPCK7Dz
   ZULGdQD2C+KUdYSldXb3QHXLQtuXjNyAlt4cSzCzwf/v/A91jj5sRDTYJ
   2JbwDoYqF950To6dBgQquL3rCcA5TKZN/bsr62BWyETidHo4AyvSSUK+Q
   31xjG6EKoGxzfE7gRcPOfGLqOgSyThh8FDrAelJr/4bENquULqXdQy2Uf
   9Kq81GuSC6VqUdo9ZVYxuZU07tcEM8+AiDTISZmPK/uBc2/7t/l1XTK2Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="438180904"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="438180904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 13:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="798377462"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="798377462"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2023 13:22:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qUv7t-0008lX-2g;
        Sat, 12 Aug 2023 20:22:21 +0000
Date:   Sun, 13 Aug 2023 04:22:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 55c3e571d2a0aabef4f1354604443f1c415d2e85
Message-ID: <202308130404.3W0P2XKV-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 55c3e571d2a0aabef4f1354604443f1c415d2e85  USB: gadget: f_mass_storage: Fix unused variable warning

elapsed time: 723m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230812   gcc  
arc                  randconfig-r016-20230812   gcc  
arc                  randconfig-r043-20230812   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230812   gcc  
arm                  randconfig-r046-20230812   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230812   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r001-20230812   clang
hexagon              randconfig-r041-20230812   clang
hexagon              randconfig-r045-20230812   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230812   gcc  
i386         buildonly-randconfig-r005-20230812   gcc  
i386         buildonly-randconfig-r006-20230812   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230812   gcc  
i386                 randconfig-i002-20230812   gcc  
i386                 randconfig-i003-20230812   gcc  
i386                 randconfig-i004-20230812   gcc  
i386                 randconfig-i005-20230812   gcc  
i386                 randconfig-i006-20230812   gcc  
i386                 randconfig-i011-20230812   clang
i386                 randconfig-i012-20230812   clang
i386                 randconfig-i013-20230812   clang
i386                 randconfig-i014-20230812   clang
i386                 randconfig-i015-20230812   clang
i386                 randconfig-i016-20230812   clang
i386                 randconfig-r023-20230812   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230812   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r025-20230812   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230812   gcc  
nios2                randconfig-r035-20230812   gcc  
openrisc             randconfig-r012-20230812   gcc  
openrisc             randconfig-r024-20230812   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230812   gcc  
parisc               randconfig-r006-20230812   gcc  
parisc               randconfig-r026-20230812   gcc  
parisc               randconfig-r031-20230812   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230812   gcc  
riscv                randconfig-r042-20230812   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230812   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230812   gcc  
x86_64       buildonly-randconfig-r002-20230812   gcc  
x86_64       buildonly-randconfig-r003-20230812   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230812   clang
x86_64               randconfig-r033-20230812   gcc  
x86_64               randconfig-x001-20230812   clang
x86_64               randconfig-x002-20230812   clang
x86_64               randconfig-x003-20230812   clang
x86_64               randconfig-x004-20230812   clang
x86_64               randconfig-x005-20230812   clang
x86_64               randconfig-x006-20230812   clang
x86_64               randconfig-x011-20230812   gcc  
x86_64               randconfig-x012-20230812   gcc  
x86_64               randconfig-x013-20230812   gcc  
x86_64               randconfig-x014-20230812   gcc  
x86_64               randconfig-x015-20230812   gcc  
x86_64               randconfig-x016-20230812   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230812   gcc  
xtensa               randconfig-r015-20230812   gcc  
xtensa               randconfig-r036-20230812   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
