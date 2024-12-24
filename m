Return-Path: <linux-usb+bounces-18777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A81649FBD0B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 12:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18515160A0D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 11:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43F81B6CE7;
	Tue, 24 Dec 2024 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elc8siHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0A176ADB
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735041534; cv=none; b=asfOCjv7uE8tG1pmSf31yTNohCbuk0ESh28mBj3iQuG/GVOjot1iKuMcUoRlLndmAoxEsR31TS3giQcIGx34cEjp9T4JcYWu4OluAK7rUSRfvyzavsC7RXSPyMd0Z51Gz45DQPNg/YkwTkeFgB6C8yL+yODjqimxmkL12fcTzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735041534; c=relaxed/simple;
	bh=hag6fXV9Ib47Ot6yrX5lwAryVOdw5A2gurbpALa7BDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QZU4jLdihpfDSBhIrN5bKsJJBq2uAR5eqy8nep4WEF7hwmwxSp+hNA0r9/9SkEGkaj9YvQK1WK+OEO6dTNkZruv6lEPU/emKFfZktAIImxEWl9IlHs5cQfMin2gsuATUydVpFugvo5X335ErWhemkdgaq9ScITM7sP3u1egU1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elc8siHs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735041532; x=1766577532;
  h=date:from:to:cc:subject:message-id;
  bh=hag6fXV9Ib47Ot6yrX5lwAryVOdw5A2gurbpALa7BDc=;
  b=elc8siHss3u8B6q0OplOe9Uvtqe/+deVuwV/NH2bpAdQhENGOlzISZc3
   VmqS33lGrte2F88e6cvKMcc6ZvqHtXAsAwrfY0dwEd6lmtS2ofq6yQtYP
   AbrIrH59XZqsv+oWBTGUsF79lQRvUsq4PB8JUaJ+bggZ1SIp/32ybQWhF
   xfw6JjsO+HZ3EHgj7x1LbRqeL3mcvrqichFbc5gCwKZ0PnGrPLBBE/1J2
   NuEjTrf9EJ4xLwLVJSdw0UGDip8Zqswu88kTpryzwTnPYk2yADky2jMdk
   N3bSreqC3x88Stoz5JOu4hWbNb61SMKk/sIE/r1QOPQChGlLHhaJvk5bW
   w==;
X-CSE-ConnectionGUID: GhuO3KspRcqR5Pmq87Oqeg==
X-CSE-MsgGUID: RXPSL7OyRcK1i13x3/oaOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="52915340"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="52915340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 03:58:51 -0800
X-CSE-ConnectionGUID: /WhpXRIDSAKWzer+4A1krQ==
X-CSE-MsgGUID: A+bVJBoXQTaBtBvtcILr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="99279744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Dec 2024 03:58:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ3Yl-00014p-3B;
	Tue, 24 Dec 2024 11:58:47 +0000
Date: Tue, 24 Dec 2024 19:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 5eeb59deed1b56b8979516e5cb313ae40d059a72
Message-ID: <202412241923.TLcXGhgR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 5eeb59deed1b56b8979516e5cb313ae40d059a72  USB: disable all RNDIS protocol drivers

elapsed time: 1106m

configs tested: 184
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241224    gcc-13.2.0
arc                   randconfig-002-20241224    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241224    gcc-14.2.0
arm                   randconfig-002-20241224    gcc-14.2.0
arm                   randconfig-003-20241224    clang-19
arm                   randconfig-004-20241224    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241224    gcc-14.2.0
arm64                 randconfig-002-20241224    clang-20
arm64                 randconfig-003-20241224    gcc-14.2.0
arm64                 randconfig-004-20241224    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241224    gcc-14.2.0
csky                  randconfig-002-20241224    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241224    clang-20
hexagon               randconfig-002-20241224    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241224    clang-19
i386        buildonly-randconfig-002-20241224    gcc-12
i386        buildonly-randconfig-003-20241224    clang-19
i386        buildonly-randconfig-004-20241224    clang-19
i386        buildonly-randconfig-005-20241224    clang-19
i386        buildonly-randconfig-006-20241224    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241224    clang-19
i386                  randconfig-002-20241224    clang-19
i386                  randconfig-003-20241224    clang-19
i386                  randconfig-004-20241224    clang-19
i386                  randconfig-005-20241224    clang-19
i386                  randconfig-006-20241224    clang-19
i386                  randconfig-007-20241224    clang-19
i386                  randconfig-011-20241224    gcc-12
i386                  randconfig-012-20241224    gcc-12
i386                  randconfig-013-20241224    gcc-12
i386                  randconfig-014-20241224    gcc-12
i386                  randconfig-015-20241224    gcc-12
i386                  randconfig-016-20241224    gcc-12
i386                  randconfig-017-20241224    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241224    gcc-14.2.0
loongarch             randconfig-002-20241224    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241224    gcc-14.2.0
nios2                 randconfig-002-20241224    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241224    gcc-14.2.0
parisc                randconfig-002-20241224    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241224    clang-15
powerpc               randconfig-002-20241224    clang-20
powerpc               randconfig-003-20241224    gcc-14.2.0
powerpc64             randconfig-001-20241224    clang-20
powerpc64             randconfig-002-20241224    clang-20
powerpc64             randconfig-003-20241224    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241224    clang-17
riscv                 randconfig-001-20241224    gcc-12
riscv                 randconfig-002-20241224    gcc-12
riscv                 randconfig-002-20241224    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241224    gcc-12
s390                  randconfig-001-20241224    gcc-14.2.0
s390                  randconfig-002-20241224    gcc-12
s390                  randconfig-002-20241224    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241224    gcc-12
sh                    randconfig-001-20241224    gcc-14.2.0
sh                    randconfig-002-20241224    gcc-12
sh                    randconfig-002-20241224    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241224    gcc-12
sparc                 randconfig-001-20241224    gcc-14.2.0
sparc                 randconfig-002-20241224    gcc-12
sparc                 randconfig-002-20241224    gcc-14.2.0
sparc64               randconfig-001-20241224    gcc-12
sparc64               randconfig-001-20241224    gcc-14.2.0
sparc64               randconfig-002-20241224    gcc-12
sparc64               randconfig-002-20241224    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241224    gcc-12
um                    randconfig-002-20241224    clang-15
um                    randconfig-002-20241224    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241224    clang-19
x86_64      buildonly-randconfig-002-20241224    gcc-12
x86_64      buildonly-randconfig-003-20241224    gcc-12
x86_64      buildonly-randconfig-004-20241224    clang-19
x86_64      buildonly-randconfig-005-20241224    gcc-11
x86_64      buildonly-randconfig-006-20241224    gcc-11
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241224    clang-19
x86_64                randconfig-002-20241224    clang-19
x86_64                randconfig-003-20241224    clang-19
x86_64                randconfig-004-20241224    clang-19
x86_64                randconfig-005-20241224    clang-19
x86_64                randconfig-006-20241224    clang-19
x86_64                randconfig-007-20241224    clang-19
x86_64                randconfig-008-20241224    clang-19
x86_64                randconfig-071-20241224    clang-19
x86_64                randconfig-072-20241224    clang-19
x86_64                randconfig-073-20241224    clang-19
x86_64                randconfig-074-20241224    clang-19
x86_64                randconfig-075-20241224    clang-19
x86_64                randconfig-076-20241224    clang-19
x86_64                randconfig-077-20241224    clang-19
x86_64                randconfig-078-20241224    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241224    gcc-12
xtensa                randconfig-001-20241224    gcc-14.2.0
xtensa                randconfig-002-20241224    gcc-12
xtensa                randconfig-002-20241224    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

