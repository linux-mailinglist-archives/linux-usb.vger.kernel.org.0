Return-Path: <linux-usb+bounces-3898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7E80A2BD
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 12:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259E92818DF
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 11:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F4F1BDE5;
	Fri,  8 Dec 2023 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVQZgJvL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B088C3
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702036632; x=1733572632;
  h=date:from:to:cc:subject:message-id;
  bh=0w5wFM1vuCntgtbiJTf0y49BxW5v6JdsCSmGhQiiomk=;
  b=DVQZgJvLLsl6oQMLo7dscrDvN8Fd6H48aRHndodfXrLgjSwOelqI9VBn
   JUOQws8EG3/dCSc5RwrlPg+qR7QIprPQjhbUrRWctxXXMh4/yrAXFPIFw
   /uMcdvPK8JrARhy3jwYEmLj3ud/7TqI6HVQPWAHlpWZyPT0VEBF0v2uq3
   lpj98A3QJyDUj2/JzqgJEA+uYfc9HanqD4IcX79nWm69Ax/qhkW9YVSZ3
   /O5L2VVHzbD14mDJ/Jc0MP0/3RjEpOYi5KgYPOrCGUniKW/bQC+B03QBT
   apsXxLLoWghEoj1umYq1re6Izf1KNjZipd1tgjlZcLRhJd3UNXe4Jtc2M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15947546"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="15947546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103543183"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1103543183"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Dec 2023 03:57:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBZTh-000DhZ-0g;
	Fri, 08 Dec 2023 11:57:09 +0000
Date: Fri, 08 Dec 2023 19:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD REGRESSION
 61890dc28f7d9e9aac8a9471302613824c22fae4
Message-ID: <202312081947.jNGRYbku-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 61890dc28f7d9e9aac8a9471302613824c22fae4  usb: gadget: f_hid: fix report descriptor allocation

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sparc-allmodconfig
|   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|-- sparc-allnoconfig
|   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
|   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
|   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
|   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
|-- sparc-defconfig
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
|   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
|   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
|   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
|-- sparc-randconfig-001-20231208
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
|   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
|   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
|   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
|-- sparc64-allmodconfig
|   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|-- sparc64-allyesconfig
|   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|-- sparc64-defconfig
|   `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
`-- sparc64-randconfig-001-20231208
    `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used

elapsed time: 1705m

configs tested: 129
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231208   gcc  
arc                   randconfig-002-20231208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231208   clang
arm                   randconfig-002-20231208   clang
arm                   randconfig-003-20231208   clang
arm                   randconfig-004-20231208   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231208   clang
arm64                 randconfig-002-20231208   clang
arm64                 randconfig-003-20231208   clang
arm64                 randconfig-004-20231208   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231208   gcc  
csky                  randconfig-002-20231208   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231208   clang
hexagon               randconfig-002-20231208   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231208   clang
i386         buildonly-randconfig-002-20231208   clang
i386         buildonly-randconfig-003-20231208   clang
i386         buildonly-randconfig-004-20231208   clang
i386         buildonly-randconfig-005-20231208   clang
i386         buildonly-randconfig-006-20231208   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231208   clang
i386                  randconfig-002-20231208   clang
i386                  randconfig-003-20231208   clang
i386                  randconfig-004-20231208   clang
i386                  randconfig-005-20231208   clang
i386                  randconfig-006-20231208   clang
i386                  randconfig-011-20231208   gcc  
i386                  randconfig-012-20231208   gcc  
i386                  randconfig-013-20231208   gcc  
i386                  randconfig-014-20231208   gcc  
i386                  randconfig-015-20231208   gcc  
i386                  randconfig-016-20231208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231208   gcc  
loongarch             randconfig-002-20231208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231208   gcc  
nios2                 randconfig-002-20231208   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231208   gcc  
parisc                randconfig-002-20231208   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20231208   clang
powerpc               randconfig-002-20231208   clang
powerpc               randconfig-003-20231208   clang
powerpc64             randconfig-001-20231208   clang
powerpc64             randconfig-002-20231208   clang
powerpc64             randconfig-003-20231208   clang
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231208   clang
riscv                 randconfig-002-20231208   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231208   gcc  
s390                  randconfig-002-20231208   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231208   gcc  
sh                    randconfig-002-20231208   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231208   gcc  
sparc64               randconfig-002-20231208   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231208   clang
um                    randconfig-002-20231208   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231208   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

