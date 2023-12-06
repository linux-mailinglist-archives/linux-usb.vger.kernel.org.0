Return-Path: <linux-usb+bounces-3795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A332980795F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 21:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20DBAB20FDD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 20:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBD74B124;
	Wed,  6 Dec 2023 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2Gad4ay"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D6EE9
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 12:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701894419; x=1733430419;
  h=date:from:to:cc:subject:message-id;
  bh=kDnb6sNMdxs9FhUTnAGyJDEwPBvZxjma10e61IN40iY=;
  b=S2Gad4ay6fucXHZtGNFuFWfsSpwNHoyNTNmPGWk6Nyn3q1fOkaetwACi
   QqKdFn96EVuyx+bVal59ahjs5vsJDFCP3qV+qZvxRxSFJZIideFUrrupH
   g/+Bts2ytusMbdAfp4+UIg1FGaXT1Vz4iq7RzmDY27eaLs3jv57lgFtWT
   TjjVQNSGVcDztjl69rjClx05Qr4W2GqEmHUjXHMuLNBjoRU6U/P8azJjt
   Zg9jgocZb29lS88AB0avd0k18ARWWTTz8ofkqiHpEEIrvoBtSyPBf+hkb
   mN97YxBt7dsmseGkWj46rEqgmntJMDB16UmbXrCpezZMUI+lEAqsbVbwB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7478108"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7478108"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 12:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862212071"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862212071"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2023 12:26:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAyTu-000BNy-2f;
	Wed, 06 Dec 2023 20:26:54 +0000
Date: Thu, 07 Dec 2023 04:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD REGRESSION
 24be0b3c40594a14b65141ced486ae327398faf8
Message-ID: <202312070446.ULf3NCg4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 24be0b3c40594a14b65141ced486ae327398faf8  Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"

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
|-- sparc-randconfig-001-20231206
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-traps_32.c:error:no-previous-prototype-for-trap_init
|   |-- arch-sparc-lib-cmpdi2.c:error:no-previous-prototype-for-__cmpdi2
|   |-- arch-sparc-lib-ucmpdi2.c:error:no-previous-prototype-for-__ucmpdi2
|   |-- arch-sparc-mm-leon_mm.c:error:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:error:variable-clear-set-but-not-used
|-- sparc-randconfig-002-20231206
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
`-- sparc64-randconfig-001-20231206
    `-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used

elapsed time: 1468m

configs tested: 177
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20231206   gcc  
arc                   randconfig-002-20231206   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20231206   clang
arm                   randconfig-002-20231206   clang
arm                   randconfig-003-20231206   clang
arm                   randconfig-004-20231206   clang
arm                           spitz_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231206   clang
arm64                 randconfig-002-20231206   clang
arm64                 randconfig-003-20231206   clang
arm64                 randconfig-004-20231206   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231206   gcc  
csky                  randconfig-002-20231206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231206   clang
hexagon               randconfig-002-20231206   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231206   clang
i386         buildonly-randconfig-002-20231206   clang
i386         buildonly-randconfig-003-20231206   clang
i386         buildonly-randconfig-004-20231206   clang
i386         buildonly-randconfig-005-20231206   clang
i386         buildonly-randconfig-006-20231206   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231206   clang
i386                  randconfig-002-20231206   clang
i386                  randconfig-003-20231206   clang
i386                  randconfig-004-20231206   clang
i386                  randconfig-005-20231206   clang
i386                  randconfig-006-20231206   clang
i386                  randconfig-011-20231206   gcc  
i386                  randconfig-012-20231206   gcc  
i386                  randconfig-013-20231206   gcc  
i386                  randconfig-014-20231206   gcc  
i386                  randconfig-015-20231206   gcc  
i386                  randconfig-016-20231206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231206   gcc  
loongarch             randconfig-002-20231206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231206   gcc  
nios2                 randconfig-002-20231206   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231206   gcc  
parisc                randconfig-002-20231206   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc               randconfig-001-20231206   clang
powerpc               randconfig-002-20231206   clang
powerpc               randconfig-003-20231206   clang
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231206   clang
powerpc64             randconfig-002-20231206   clang
powerpc64             randconfig-003-20231206   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231206   clang
riscv                 randconfig-002-20231206   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231206   gcc  
s390                  randconfig-002-20231206   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231206   gcc  
sh                    randconfig-002-20231206   gcc  
sh                          rsk7269_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231206   gcc  
sparc64               randconfig-002-20231206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231206   clang
um                    randconfig-002-20231206   clang
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231206   clang
x86_64       buildonly-randconfig-002-20231206   clang
x86_64       buildonly-randconfig-003-20231206   clang
x86_64       buildonly-randconfig-004-20231206   clang
x86_64       buildonly-randconfig-005-20231206   clang
x86_64       buildonly-randconfig-006-20231206   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231206   gcc  
x86_64                randconfig-002-20231206   gcc  
x86_64                randconfig-003-20231206   gcc  
x86_64                randconfig-004-20231206   gcc  
x86_64                randconfig-005-20231206   gcc  
x86_64                randconfig-006-20231206   gcc  
x86_64                randconfig-011-20231206   clang
x86_64                randconfig-012-20231206   clang
x86_64                randconfig-013-20231206   clang
x86_64                randconfig-014-20231206   clang
x86_64                randconfig-015-20231206   clang
x86_64                randconfig-016-20231206   clang
x86_64                randconfig-071-20231206   clang
x86_64                randconfig-072-20231206   clang
x86_64                randconfig-073-20231206   clang
x86_64                randconfig-074-20231206   clang
x86_64                randconfig-075-20231206   clang
x86_64                randconfig-076-20231206   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231206   gcc  
xtensa                randconfig-002-20231206   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

