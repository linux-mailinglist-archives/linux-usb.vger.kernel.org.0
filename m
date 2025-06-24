Return-Path: <linux-usb+bounces-25052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59685AE60FF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3CAC168382
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 09:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A545827AC3C;
	Tue, 24 Jun 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gwg2VZdl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04A22D78A
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757943; cv=none; b=b/jMjHKn2RWcBb+BShk0PAQ2rRvmH+nXBSMuhynE0hzcixX9gUma9Sx1WUvyYLGtZf+wCR8s+ns/RPlJ/XudaSiRglNv+KwYM87KQqPVH+UEvW7VBo7oRjhbnuQAQbyyb5oS932STxE2IdAWKKHm2Nd4+/CXeYesgqAB9YL4cUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757943; c=relaxed/simple;
	bh=h1gLVB/e3Ify7j5aVbzPovG6ztLBT8H6mk7eqru8iGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lo1dJOEasAQ+LbqgP7ofEEFCDB3q9Izy1dA7JXdrmAIYz37YSZFV6Yf6R6QLoiNyYqkkNF2c9kZqwUuRy3rZcL74ZLwYuY6C/8OGA5T/MeWxgtVpjLpEnTBKG6lkxzACKzpb1P0KVrvP4TgxC+aTjCbz5+gzxU/0E8wl04Igrsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gwg2VZdl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750757941; x=1782293941;
  h=date:from:to:cc:subject:message-id;
  bh=h1gLVB/e3Ify7j5aVbzPovG6ztLBT8H6mk7eqru8iGM=;
  b=Gwg2VZdlJM3ZvFekMqaFlo3/f5yfIlnE3155TTwfd4H3oCCnJXRb3337
   tfVTzG9QCO0oZxEFuqWYsIGlYR/IN4+ANZVF/ud/dB3k669lfLO9O819g
   K6MnWT2ex0T00NAcnz5iOLjkccuVM2SGwjXt5nMJcxoDsJAh3dTLGMPms
   YzHV/vqmxIeGRw3FjBJC61oYASMtH2D/clDO8OIwefj/vz2KhRNmWTYpj
   Khw3uuuEo7BjeF2uZoFAmbQPaogZT7rQuuy+5gsUgL452wr3f+STuR8TX
   8RWG+GyYcNxY4VDdcJ51+RvqLU7KXbd8PpZXAcJ3xsKUNf/y7czMIkDVL
   w==;
X-CSE-ConnectionGUID: nQZWZXVzRG6k6go9wPRGtQ==
X-CSE-MsgGUID: IoPqfH/pQ8yJhnFh+N0l0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40605352"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="40605352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:39:00 -0700
X-CSE-ConnectionGUID: 1LU3Lo8wQAWp45d0w7P82A==
X-CSE-MsgGUID: Qb18MMj4TxmQ7bO7t/sRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="175468854"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2025 02:39:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU07F-000RzD-2S;
	Tue, 24 Jun 2025 09:38:57 +0000
Date: Tue, 24 Jun 2025 17:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 2cdde91c14ec358087f43287513946d493aef940
Message-ID: <202506241752.4E0ulfU4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 2cdde91c14ec358087f43287513946d493aef940  thunderbolt: Fix bit masking in tb_dp_port_set_hops()

elapsed time: 1361m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250623    gcc-10.5.0
arc                   randconfig-001-20250624    gcc-8.5.0
arc                   randconfig-002-20250623    gcc-8.5.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250623    gcc-10.5.0
arm                   randconfig-001-20250624    gcc-8.5.0
arm                   randconfig-002-20250623    clang-21
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250623    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-8.5.0
arm                   randconfig-004-20250623    gcc-10.5.0
arm                   randconfig-004-20250624    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250623    gcc-14.3.0
arm64                 randconfig-001-20250624    gcc-8.5.0
arm64                 randconfig-002-20250623    gcc-14.3.0
arm64                 randconfig-002-20250624    gcc-8.5.0
arm64                 randconfig-003-20250623    gcc-9.5.0
arm64                 randconfig-003-20250624    gcc-8.5.0
arm64                 randconfig-004-20250623    clang-16
arm64                 randconfig-004-20250624    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250623    clang-20
i386        buildonly-randconfig-001-20250624    gcc-12
i386        buildonly-randconfig-002-20250623    gcc-11
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250623    gcc-12
i386        buildonly-randconfig-003-20250624    gcc-12
i386        buildonly-randconfig-004-20250623    clang-20
i386        buildonly-randconfig-004-20250624    gcc-12
i386        buildonly-randconfig-005-20250623    gcc-12
i386        buildonly-randconfig-005-20250624    gcc-12
i386        buildonly-randconfig-006-20250623    gcc-11
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250623    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250623    gcc-12
x86_64      buildonly-randconfig-002-20250624    clang-20
x86_64      buildonly-randconfig-003-20250623    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250623    gcc-12
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250623    gcc-12
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250623    clang-20
x86_64      buildonly-randconfig-006-20250624    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

