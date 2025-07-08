Return-Path: <linux-usb+bounces-25568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6473CAFC18A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 05:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1568B18936E5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 03:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFC923BD13;
	Tue,  8 Jul 2025 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyELKr+a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6C1548C
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751946130; cv=none; b=kmot1t0ucU6tg5aJDhOhLEOZb/FKvw6DHWFg9MXk67yW03R6h2eMx3oqm+sLzaewFdnCrL9YqxMP01whjwLg6wC+OV8V07dvuirne7p5QN2LfOEWnyXBxeJlWgDExAWjC2RTnQFMHUxNhlJ71ST4CpVGoFMfVZAPf05UU5mjNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751946130; c=relaxed/simple;
	bh=rmAWP0hheaYMDMpqYbrnSFuDsAQYwnIA3Kb5Irbyv1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ri+MfQmoEGqQFBxIoULjNaWHDYSdxa34iiIqDxP8BcWDhOc+uBmx+kFcHa4SF1ZatMURX5x0bHor1DCZkEuxKvyk1ceJ2ZDF7SFFF19DUT7EDE03kUsldn1stUEWKJS+OO/lIK8yBT4/ya4+qLQSJTTAfBXcj4zJLcyOblUyxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyELKr+a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751946128; x=1783482128;
  h=date:from:to:cc:subject:message-id;
  bh=rmAWP0hheaYMDMpqYbrnSFuDsAQYwnIA3Kb5Irbyv1s=;
  b=CyELKr+asbK7wF02FxwssQ01GUe3pJ77GuZvWcXhFkCivySjX1eDO3l6
   1WfoW8W7rYV8HWFklCPBlo3osU4QAAze79FYaQZF95oZXAOR/ketF7Wqo
   PcBYRG5J7kV0mvZeanvk225Dz2WiOhh4IHaIF5e3/ZQ+c0MxxbwU+VCX2
   WTAWT/IRjuMhDp2IF11WflNcbExVGMrtO95ql7a1DiMJp1w1u69cB4T+s
   sfk4e/qB+oL7pqd8qn0qOljesd7ZnMv7+IrrrAMG8mcO5V2lP5hP6ZtpG
   Li7UbNDtqYj+pH8hm0nGaOKKpUQT6vs3vlmNmv5u/wTCVF42Q7K0CBvM7
   A==;
X-CSE-ConnectionGUID: d7mDrNmjTX62isJTJPuaig==
X-CSE-MsgGUID: 0EgXZWrKTHeTilVw6JlBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54059305"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="54059305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 20:42:07 -0700
X-CSE-ConnectionGUID: YwWGrxmPSJaXyKMMNSHeNw==
X-CSE-MsgGUID: ORH9gClFRDOU5hxbDcyyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="155966687"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2025 20:42:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYzDX-0000xf-34;
	Tue, 08 Jul 2025 03:42:03 +0000
Date: Tue, 08 Jul 2025 11:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d1b07cc0868fe14f4540cbc48c1a7c1a8055e284
Message-ID: <202507081153.k4o6zaey-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d1b07cc0868fe14f4540cbc48c1a7c1a8055e284  arm64: dts: s32g: Add USB device tree information for s32g2/s32g3

elapsed time: 1067m

configs tested: 126
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-002-20250707    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-004-20250707    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-004-20250707    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-002-20250707    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-002-20250707    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-002-20250707    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-003-20250707    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-002-20250707    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-002-20250707    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-002-20250707    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-002-20250707    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-002-20250707    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-002-20250707    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

