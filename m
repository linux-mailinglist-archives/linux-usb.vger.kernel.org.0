Return-Path: <linux-usb+bounces-2536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3707E0F0A
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 12:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7CA8281D1E
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 11:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A862415486;
	Sat,  4 Nov 2023 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0UZNyok"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634E3D68
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 11:22:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CF8B7
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699096963; x=1730632963;
  h=date:from:to:cc:subject:message-id;
  bh=DO9ne9qN8QbjUYci6eA6cEokgCUeykOd6ScdyKj2BIE=;
  b=i0UZNyokDlBqqbqaYsOcmNwZn3u7cqZk+je5bsU8H/nt1IKEu3lgzHjn
   pZp/F1ha+XI0FlV5lU9e+LSmle4GcDdLokJ6deGbIszmqGsKFMCpTaUrq
   Z+mcCnPvZ3oh22aJzfLWV2g17hEDIvYorHCi6hN/cePV+iALUMwMDkL4o
   NhebROpZit1nIxeXgiP9OycByEO9wvQ++B/Zyx9dVy7PVrN2iwfEjVm4J
   pOU1W4+wiP5BFl94pzTu5DGlz0hOTdukd+IottLlr8ZPJHMpcS6u7uIMo
   jDE2Gm4VXCmAQGL6U2pFqI4sEgydjqwDFtrAjat8NCPtfpzqYcVk8Xt0B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392968943"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="392968943"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093321192"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1093321192"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2023 04:22:41 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzEje-00041E-2K;
	Sat, 04 Nov 2023 11:22:38 +0000
Date: Sat, 04 Nov 2023 19:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 386b7aff72fd3cc1b325f5bae4af2fc76d34a041
Message-ID: <202311041935.TCwD5tPe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 386b7aff72fd3cc1b325f5bae4af2fc76d34a041  USB: disable all RNDIS protocol drivers

elapsed time: 7358m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231030   gcc  
arc                   randconfig-002-20231030   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231030   gcc  
arm                   randconfig-002-20231030   gcc  
arm                   randconfig-003-20231030   gcc  
arm                   randconfig-004-20231030   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231030   gcc  
arm64                 randconfig-002-20231030   gcc  
arm64                 randconfig-003-20231030   gcc  
arm64                 randconfig-004-20231030   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231030   gcc  
csky                  randconfig-002-20231030   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231030   gcc  
i386         buildonly-randconfig-002-20231030   gcc  
i386         buildonly-randconfig-003-20231030   gcc  
i386         buildonly-randconfig-004-20231030   gcc  
i386         buildonly-randconfig-005-20231030   gcc  
i386         buildonly-randconfig-006-20231030   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231030   gcc  
i386                  randconfig-002-20231030   gcc  
i386                  randconfig-003-20231030   gcc  
i386                  randconfig-004-20231030   gcc  
i386                  randconfig-005-20231030   gcc  
i386                  randconfig-006-20231030   gcc  
i386                  randconfig-011-20231030   gcc  
i386                  randconfig-012-20231030   gcc  
i386                  randconfig-013-20231030   gcc  
i386                  randconfig-014-20231030   gcc  
i386                  randconfig-015-20231030   gcc  
i386                  randconfig-016-20231030   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231030   gcc  
loongarch             randconfig-002-20231030   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231030   gcc  
nios2                 randconfig-002-20231030   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231030   gcc  
parisc                randconfig-002-20231030   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231030   gcc  
powerpc               randconfig-002-20231030   gcc  
powerpc               randconfig-003-20231030   gcc  
powerpc64             randconfig-001-20231030   gcc  
powerpc64             randconfig-002-20231030   gcc  
powerpc64             randconfig-003-20231030   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231030   gcc  
riscv                 randconfig-002-20231030   gcc  
riscv                          rv32_defconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231030   gcc  
s390                  randconfig-002-20231030   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231031   gcc  
sh                    randconfig-002-20231031   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231031   gcc  
sparc                 randconfig-002-20231031   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231031   gcc  
sparc64               randconfig-002-20231031   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231031   gcc  
um                    randconfig-002-20231031   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231030   gcc  
x86_64       buildonly-randconfig-002-20231030   gcc  
x86_64       buildonly-randconfig-003-20231030   gcc  
x86_64       buildonly-randconfig-004-20231030   gcc  
x86_64       buildonly-randconfig-005-20231030   gcc  
x86_64       buildonly-randconfig-006-20231030   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231030   gcc  
x86_64                randconfig-002-20231030   gcc  
x86_64                randconfig-003-20231030   gcc  
x86_64                randconfig-004-20231030   gcc  
x86_64                randconfig-005-20231030   gcc  
x86_64                randconfig-006-20231030   gcc  
x86_64                randconfig-011-20231030   gcc  
x86_64                randconfig-012-20231030   gcc  
x86_64                randconfig-013-20231030   gcc  
x86_64                randconfig-014-20231030   gcc  
x86_64                randconfig-015-20231030   gcc  
x86_64                randconfig-016-20231030   gcc  
x86_64                randconfig-071-20231030   gcc  
x86_64                randconfig-072-20231030   gcc  
x86_64                randconfig-073-20231030   gcc  
x86_64                randconfig-074-20231030   gcc  
x86_64                randconfig-075-20231030   gcc  
x86_64                randconfig-076-20231030   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231031   gcc  
xtensa                randconfig-002-20231031   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

