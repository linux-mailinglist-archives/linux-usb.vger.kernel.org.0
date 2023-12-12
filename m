Return-Path: <linux-usb+bounces-4015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B180E673
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E16A28296B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 08:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2B724B33;
	Tue, 12 Dec 2023 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/b6bjQz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194DCCF
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 00:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702370607; x=1733906607;
  h=date:from:to:cc:subject:message-id;
  bh=jPwea4xmf53z3qG58HKWqqJ//V1JYPjrTKwMoncjHhg=;
  b=m/b6bjQz3+LgkzWVhBv6hb+GcMpFOO06VsSJaymbDu1G6Aibrmc6s6Xk
   Nr1RXkaWOlfW733K0axvPX2e2WtnPkGnDn1o7gOlGPBlrBsI6lFqzPA/H
   YsNMI1Qdognnme21jyeQcyDGy8rp83APPoYjuVRTWk/OmXPUALlFUXVwG
   XGrVHVHfwEkYLm0DjAM8L/99u/wyLSAf7oFeaEuVtxC+BVcWaFSWUcz7N
   Vg694v09HA4jYRCdsnix8+jU6Nu5nc1QuN3vwYRp8wWZCo/IUMRI3MyOh
   2VrC7JzbyIWScOTE6v7iMD+0lgAgGJ1eLIif7Pxwd8paNuoyADLZ2ZN9c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1589188"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1589188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 00:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="864133302"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="864133302"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Dec 2023 00:43:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCyMN-000Ivt-1H;
	Tue, 12 Dec 2023 08:43:23 +0000
Date: Tue, 12 Dec 2023 16:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 fefa5dd02e1900017bcb9be4a819301e5969fbe5
Message-ID: <202312121606.9FfQotAA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: fefa5dd02e1900017bcb9be4a819301e5969fbe5  USB: disable all RNDIS protocol drivers

elapsed time: 1468m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231211   gcc  
arc                   randconfig-001-20231212   gcc  
arc                   randconfig-002-20231211   gcc  
arc                   randconfig-002-20231212   gcc  
arc                           tb10x_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mps2_defconfig   gcc  
arm                   randconfig-001-20231212   gcc  
arm                   randconfig-002-20231212   gcc  
arm                   randconfig-003-20231212   gcc  
arm                   randconfig-004-20231212   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231212   gcc  
arm64                 randconfig-003-20231212   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231211   gcc  
csky                  randconfig-001-20231212   gcc  
csky                  randconfig-002-20231211   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231211   clang
i386         buildonly-randconfig-002-20231211   clang
i386         buildonly-randconfig-003-20231211   clang
i386         buildonly-randconfig-004-20231211   clang
i386         buildonly-randconfig-005-20231211   clang
i386         buildonly-randconfig-006-20231211   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231211   clang
i386                  randconfig-002-20231211   clang
i386                  randconfig-003-20231211   clang
i386                  randconfig-004-20231211   clang
i386                  randconfig-005-20231211   clang
i386                  randconfig-006-20231211   clang
i386                  randconfig-011-20231211   gcc  
i386                  randconfig-012-20231211   gcc  
i386                  randconfig-013-20231211   gcc  
i386                  randconfig-014-20231211   gcc  
i386                  randconfig-015-20231211   gcc  
i386                  randconfig-016-20231211   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231211   gcc  
loongarch             randconfig-002-20231211   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231211   gcc  
nios2                 randconfig-002-20231211   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231211   gcc  
parisc                randconfig-002-20231211   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231211   gcc  
s390                  randconfig-002-20231211   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231211   gcc  
sh                    randconfig-002-20231211   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231211   gcc  
sparc64               randconfig-002-20231211   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231211   clang
x86_64       buildonly-randconfig-001-20231212   gcc  
x86_64       buildonly-randconfig-002-20231211   clang
x86_64       buildonly-randconfig-002-20231212   gcc  
x86_64       buildonly-randconfig-003-20231211   clang
x86_64       buildonly-randconfig-003-20231212   gcc  
x86_64       buildonly-randconfig-004-20231211   clang
x86_64       buildonly-randconfig-004-20231212   gcc  
x86_64       buildonly-randconfig-005-20231211   clang
x86_64       buildonly-randconfig-005-20231212   gcc  
x86_64       buildonly-randconfig-006-20231211   clang
x86_64       buildonly-randconfig-006-20231212   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231212   clang
x86_64                randconfig-002-20231212   clang
x86_64                randconfig-003-20231212   clang
x86_64                randconfig-004-20231212   clang
x86_64                randconfig-005-20231212   clang
x86_64                randconfig-011-20231211   clang
x86_64                randconfig-011-20231212   gcc  
x86_64                randconfig-012-20231211   clang
x86_64                randconfig-013-20231211   clang
x86_64                randconfig-014-20231211   clang
x86_64                randconfig-015-20231211   clang
x86_64                randconfig-016-20231211   clang
x86_64                randconfig-071-20231211   clang
x86_64                randconfig-072-20231211   clang
x86_64                randconfig-073-20231211   clang
x86_64                randconfig-074-20231211   clang
x86_64                randconfig-075-20231211   clang
x86_64                randconfig-076-20231211   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231211   gcc  
xtensa                randconfig-002-20231211   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

