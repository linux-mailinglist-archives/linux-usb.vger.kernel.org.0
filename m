Return-Path: <linux-usb+bounces-25055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E01AE6266
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 12:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4866C3AE19E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B138428540E;
	Tue, 24 Jun 2025 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7IzUTm9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8E27C866
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760888; cv=none; b=ASf0v3jrQAoUR8wyEbZYGHTNWM1UVwddiGFPRl3uE0xndC94DCYh0AHL/8TjbnlILCChYqvOS8zXmbKmdQuVTNBscXoGVOykfIJ0RAoBT6aZ9eAPCYWsDO4sF37bRAiH5DbnmXDwe44KkHiHPuTFRm1uEFlj3rUtM5Q8RW67Dps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760888; c=relaxed/simple;
	bh=n9DAeVtdFP+anIT+HLJO0rfQq+NVnsgWUynhfT34VwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2u73uJBkcflkOpz0SIC4Z3kv2aEmAzH4WZIowLs5HLmxjgqGeTcSrH0+Uq2xabBTosk4R3XxgF1FoozEWBsXhzSohFKB85nM3zfiBuFbS4PW6IQSGrrWsudHSDq7r+GuRYTodeoeUxDWUqD+vCkWKRd/iqsznTB/speDASLjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7IzUTm9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750760887; x=1782296887;
  h=date:from:to:cc:subject:message-id;
  bh=n9DAeVtdFP+anIT+HLJO0rfQq+NVnsgWUynhfT34VwE=;
  b=a7IzUTm9W2usVJRWjNJ6S35Fp1CZWQaf7UfnZ/9afr9hi5AG5IQMHS8G
   3Iyu9s9YYsL045XO0/HvdL9EOBF8GguYWyijf52qz2ZEFxv8ACbQzTCKq
   0bnwDYYg3tl1I0EPYmrUZgcxAC94qdks6YAJXfiapptZD6bQu3d/Ti/f0
   5uB+endeR1WfehKAbA3GpSvKAHottSqR4kQhExZSn4KsruxPlz1fW/f0f
   yn5/688BCiBX6UqYCRLD+vSQbGAf6PeZCEw+kIppbrkDFw7VbD7tJWodT
   r8ywo/h90fgxwzMJGj5E87xnMnpFsfpk2NqJnBN3expfD7jxlhwFM2F20
   A==;
X-CSE-ConnectionGUID: O4CeAyweTROaJ6io6aTdHQ==
X-CSE-MsgGUID: k5/c2/JfRhWQSALKo6iTZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53132667"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53132667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:28:05 -0700
X-CSE-ConnectionGUID: oKFNHHuZREmqm5X5lVKbnw==
X-CSE-MsgGUID: CVGO0LRNRKO6sEOJE4xOVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151473028"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2025 03:28:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU0sk-000S1I-0G;
	Tue, 24 Jun 2025 10:28:02 +0000
Date: Tue, 24 Jun 2025 18:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 2d1beba54fdaac0d624b016025d4ec5856713fb1
Message-ID: <202506241855.L0tMV3X1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 2d1beba54fdaac0d624b016025d4ec5856713fb1  thunderbolt: Fix typos in documentation comments

elapsed time: 1410m

configs tested: 128
configs skipped: 2

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

