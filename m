Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B92A776F36
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 06:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjHJEvF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 00:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjHJEvE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 00:51:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6F92111
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 21:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691643061; x=1723179061;
  h=date:from:to:cc:subject:message-id;
  bh=uge6p/mygBh/7gwHLY4i9vc80Fdyag6KMRvG2Bear4A=;
  b=PA9r1viA1yr5Bdir/4RzCCPGv8hL5DSAv4OS4lXlAss64FX5XM1MI06p
   tUaFdr5T2UOM4ntG7c+orDZ7nONj5QX+37drIyGGd3R9YtF2e32BxdvpL
   8zP/gtshhcW0hUHDt1yPB6FdWNK1Bs4GA5k8au9BhbTv5DhVMDVK9GgCa
   OC5KdQPwF9ikv6nnwrvG5idDo/HOkCFmxuecTUko/o+9Zs+RBgRVsXIVa
   Qv4+RPXDkNakG//DuHWE6czLY41gqRvA3AU4e6nSCcDbhI3ed8dximvNF
   YJkzjuZXBn7zGIMrEOL1Ty2p4yTldP7mou3sRt8OqpcFbrwC9J10pAPP3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356262768"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="356262768"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 21:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905901568"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="905901568"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 21:50:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qTxdS-0006iy-2m;
        Thu, 10 Aug 2023 04:50:58 +0000
Date:   Thu, 10 Aug 2023 12:50:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 f176638af476c6d46257cc3303f5c7cf47d5967d
Message-ID: <202308101210.D93EVRbX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f176638af476c6d46257cc3303f5c7cf47d5967d  USB: Remove Wireless USB and UWB documentation

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/usb/core/usb.c:648:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]
drivers/usb/core/usb.c:651:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r001-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arm-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- arm64-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-buildonly-randconfig-r004-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-buildonly-randconfig-r006-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-debian-10.3
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-randconfig-i004-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- i386-randconfig-i005-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- loongarch-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- loongarch-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- loongarch-randconfig-r025-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- m68k-randconfig-r014-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- m68k-randconfig-r034-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- microblaze-randconfig-r003-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- nios2-randconfig-r012-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- nios2-randconfig-r035-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- parisc-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- parisc64-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- riscv-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- riscv-rv32_defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- sparc64-randconfig-r024-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- x86_64-buildonly-randconfig-r002-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- x86_64-defconfig
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
|-- x86_64-randconfig-x011-20230809
|   `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used
`-- x86_64-rhel-8.3
    `-- drivers-usb-core-usb.c:warning:variable-root_hub-set-but-not-used

elapsed time: 949m

configs tested: 115
configs skipped: 6

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230809   gcc  
alpha                randconfig-r005-20230809   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230809   gcc  
arc                  randconfig-r025-20230809   gcc  
arc                  randconfig-r032-20230809   gcc  
arc                  randconfig-r043-20230809   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230809   clang
arm                  randconfig-r016-20230809   gcc  
arm                  randconfig-r033-20230809   clang
arm                  randconfig-r035-20230809   clang
arm                  randconfig-r046-20230809   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r034-20230809   gcc  
hexagon              randconfig-r015-20230809   clang
hexagon              randconfig-r031-20230809   clang
hexagon              randconfig-r041-20230809   clang
hexagon              randconfig-r045-20230809   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230809   gcc  
i386         buildonly-randconfig-r005-20230809   gcc  
i386         buildonly-randconfig-r006-20230809   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230809   gcc  
i386                 randconfig-i002-20230809   gcc  
i386                 randconfig-i003-20230809   gcc  
i386                 randconfig-i004-20230809   gcc  
i386                 randconfig-i005-20230809   gcc  
i386                 randconfig-i006-20230809   gcc  
i386                 randconfig-i011-20230809   clang
i386                 randconfig-i012-20230809   clang
i386                 randconfig-i013-20230809   clang
i386                 randconfig-i014-20230809   clang
i386                 randconfig-i015-20230809   clang
i386                 randconfig-i016-20230809   clang
i386                 randconfig-r004-20230809   gcc  
i386                 randconfig-r036-20230809   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230809   gcc  
m68k                 randconfig-r034-20230809   gcc  
microblaze           randconfig-r001-20230809   gcc  
microblaze           randconfig-r003-20230809   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230809   gcc  
openrisc             randconfig-r006-20230809   gcc  
openrisc             randconfig-r013-20230809   gcc  
openrisc             randconfig-r021-20230809   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230809   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230809   gcc  
s390                 randconfig-r004-20230809   gcc  
s390                 randconfig-r022-20230809   clang
s390                 randconfig-r023-20230809   clang
s390                 randconfig-r044-20230809   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r014-20230809   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r036-20230809   gcc  
sparc64              randconfig-r024-20230809   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230809   gcc  
x86_64       buildonly-randconfig-r002-20230809   gcc  
x86_64       buildonly-randconfig-r003-20230809   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r026-20230809   clang
x86_64               randconfig-x001-20230809   clang
x86_64               randconfig-x002-20230809   clang
x86_64               randconfig-x003-20230809   clang
x86_64               randconfig-x004-20230809   clang
x86_64               randconfig-x005-20230809   clang
x86_64               randconfig-x006-20230809   clang
x86_64               randconfig-x011-20230809   gcc  
x86_64               randconfig-x012-20230809   gcc  
x86_64               randconfig-x013-20230809   gcc  
x86_64               randconfig-x014-20230809   gcc  
x86_64               randconfig-x015-20230809   gcc  
x86_64               randconfig-x016-20230809   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
