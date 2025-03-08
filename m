Return-Path: <linux-usb+bounces-21525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6BA57A5E
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 14:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BE861891D0D
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 13:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE4B1CAA79;
	Sat,  8 Mar 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6rJm32L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA471C6FEF
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741439599; cv=none; b=Jupv4jn7Y1UMgpToDigtyyxDGIC7bRhoHsRVRKvZnl4oUlk3zbVyKLhDm8LOZBJ9tGhLXZJe0RM2LXZSKFShqQP7UpM6y6tFIczj3+v4Fp44nVIg0uZuNbSwLx673u9jqz2BBBlb5ttyx7gTWEpm5i8ehu8tNT8KnQ/RTQ6e/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741439599; c=relaxed/simple;
	bh=5y+es2MkIu5hWY9UCSI/h361eXzct7kMDzTsxVMBmvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lbXuEW6qF2kLInxB6kzy+HedhqnV40XGDu8oJGSMmyBnVgNocpahsgz+D4I8jIRS4rKrWad6QfLQiaVAHQ7mK6Vp/5QlriSvVAy+lC7/Gg+hZCcbjEeeetvacIGwGsRmE6trgzpd/FOfqbR5yUJ5WFVliRKplebNt3lph6Z2gpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6rJm32L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741439598; x=1772975598;
  h=date:from:to:cc:subject:message-id;
  bh=5y+es2MkIu5hWY9UCSI/h361eXzct7kMDzTsxVMBmvE=;
  b=S6rJm32L7rBvCKsZ4+zrhHv02rfqWwQn1Ej+aS9X+F4V7Eb0YDZnyZl5
   uhnLGBERBaSEcUYnNwZrADn2KSRbmhIUASfSMN/Yz7AbHd32zt9/oCM8o
   VDckvI605smNVyL18LWMMinLs5OsLzGcSOzeqY9ye6HTwEAgo1U/U8Zhl
   ksjhEShhExEppM9GbVNccwn79hzO5+v7SwdZV3mSDdfcilhDz7BMhjb0m
   UF1cNYXzxfSYXa1Yk76YE/3Xcg5Ig0llHKg/P13yaaEFYUy/AleqsPN3i
   rlSjF3ersrPEEkYLOEzraO1MYd4d9CHR59LCkFh4aE+shHEwh6uUiCKVI
   g==;
X-CSE-ConnectionGUID: 8qTR8Wz8T2qr5uFswlONqQ==
X-CSE-MsgGUID: sa7xgRvHRs2tpA8LcDx9Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="30062521"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="30062521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 05:13:17 -0800
X-CSE-ConnectionGUID: go/TuAlbQSyRdPzDWgQqyg==
X-CSE-MsgGUID: HE5dY/QdSluxqziogOdZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="124484292"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2025 05:13:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqtzN-0001uQ-2S;
	Sat, 08 Mar 2025 13:13:13 +0000
Date: Sat, 08 Mar 2025 21:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 502843396ec2a3eb4f58a2e4618a4a85fc5e0f46
Message-ID: <202503082114.Tw4AYlRy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 502843396ec2a3eb4f58a2e4618a4a85fc5e0f46  thunderbolt: Prevent use-after-free in resume from hibernate

elapsed time: 1450m

configs tested: 85
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250307    gcc-13.2.0
arc                   randconfig-002-20250307    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250307    clang-21
arm                   randconfig-002-20250307    gcc-14.2.0
arm                   randconfig-003-20250307    clang-19
arm                   randconfig-004-20250307    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250307    gcc-14.2.0
arm64                 randconfig-002-20250307    clang-15
arm64                 randconfig-003-20250307    gcc-14.2.0
arm64                 randconfig-004-20250307    clang-15
csky                  randconfig-001-20250308    gcc-14.2.0
csky                  randconfig-002-20250308    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250308    clang-19
hexagon               randconfig-002-20250308    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250307    gcc-11
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250307    gcc-12
i386        buildonly-randconfig-006-20250307    clang-19
loongarch             randconfig-001-20250308    gcc-14.2.0
loongarch             randconfig-002-20250308    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250308    gcc-14.2.0
nios2                 randconfig-002-20250308    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250308    gcc-14.2.0
parisc                randconfig-002-20250308    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250308    clang-18
powerpc               randconfig-002-20250308    gcc-14.2.0
powerpc               randconfig-003-20250308    gcc-14.2.0
powerpc64             randconfig-001-20250308    gcc-14.2.0
powerpc64             randconfig-003-20250308    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250307    gcc-14.2.0
riscv                 randconfig-002-20250307    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250307    gcc-14.2.0
s390                  randconfig-002-20250307    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250307    gcc-14.2.0
sh                    randconfig-002-20250307    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250307    gcc-14.2.0
sparc                 randconfig-002-20250307    gcc-14.2.0
sparc64               randconfig-001-20250307    gcc-14.2.0
sparc64               randconfig-002-20250307    gcc-14.2.0
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250307    clang-17
um                    randconfig-002-20250307    clang-21
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250307    gcc-12
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250307    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250307    gcc-14.2.0
xtensa                randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

