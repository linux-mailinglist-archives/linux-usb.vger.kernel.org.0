Return-Path: <linux-usb+bounces-18962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5DA010C3
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 00:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB70188441F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 23:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B113B1BF311;
	Fri,  3 Jan 2025 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTS6h6wc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC01BDAA1
	for <linux-usb@vger.kernel.org>; Fri,  3 Jan 2025 23:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945830; cv=none; b=We687UHU/dLXM5DYuWFuzNyjsCquUzP0crzEYyrUpk/ZDMM4Sdh1LLX+ou5IIGvLLMu1YsAWVGIlpeVfbOf8UU6bm3n3Fo3McbLCsGJnyACyZv6USRYmWv/OHExNS/hbXyg8hDuv4oE33bfzDgbPz2aYXTZlABFx2VVcOpUTIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945830; c=relaxed/simple;
	bh=BtFVSCIXkYEUuW8pD9hZlPfpxy6UblbRUb+WIa38FPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBmpKW4l5pzYEaQR3a2jxQ/Fdhd63CrrZJDiXzwbfhruAZhchpzrA2uByNeJY8IoQbZvMJ7DbRW4ndgCx2tGG3lT5xHtUn8gX7qy2x27Wl6Y2i5Q62IlW487eXx+Zwdc744neH0+G7Bl8hD21YFrBbWWUsr+BcGfLv5sG6odhn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTS6h6wc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735945828; x=1767481828;
  h=date:from:to:cc:subject:message-id;
  bh=BtFVSCIXkYEUuW8pD9hZlPfpxy6UblbRUb+WIa38FPY=;
  b=UTS6h6wcuZU48HmFUxsZ6J0IBBuGQQADFvr2jKisB1N2lpmkDUCYni2K
   ZKUa9+DAStTL9Anvql8nJWCQvHSg6ZWzYDDyChlzKH+JWQQ7VgEmuLM23
   7nAnws4iKOw+Zuy49UXvDfguAqm71/9OKXMAwdVcTbSRWJ5wAFVQCT4rx
   D3k6zmdSxY7SctfsSXpN3w87UPGhgMqj/QHGBKuWHR0cNqzOHrqdhc6uq
   AEW1pwSSsZZjwHjSnUC9Q4AaZ+rLFvnvLBexyzed4+C6+MFOkdYhnZYzy
   aTenvs/RWU79wLbstXMK7ULsMn5ElPZze8Z4o7P5bKoai6VHlquWdMKAt
   g==;
X-CSE-ConnectionGUID: 11C62JXCSjitEcuEPJKjiw==
X-CSE-MsgGUID: uP+DABgfRrC48TrztvRPkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46773509"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="46773509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 15:10:28 -0800
X-CSE-ConnectionGUID: VF+kFgUsSOeBu9TnmM37Sg==
X-CSE-MsgGUID: oBFbBPffR4KlqheC5nZPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105949447"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jan 2025 15:10:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTqoD-000AQS-0R;
	Fri, 03 Jan 2025 23:10:25 +0000
Date: Sat, 04 Jan 2025 07:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 d6d458d42e1e1544a18f37f1d5c840e00d5261b9
Message-ID: <202501040715.xfgha3eY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: d6d458d42e1e1544a18f37f1d5c840e00d5261b9  thunderbolt: Handle DisplayPort tunnel activation asynchronously

elapsed time: 731m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250103    gcc-13.2.0
arc                   randconfig-002-20250103    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-19
arm                            hisi_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                   randconfig-001-20250103    clang-20
arm                   randconfig-002-20250103    clang-15
arm                   randconfig-003-20250103    gcc-14.2.0
arm                   randconfig-004-20250103    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250103    clang-19
arm64                 randconfig-002-20250103    clang-20
arm64                 randconfig-003-20250103    clang-19
arm64                 randconfig-004-20250103    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250103    gcc-14.2.0
csky                  randconfig-002-20250103    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250103    clang-20
hexagon               randconfig-002-20250103    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250103    clang-19
i386        buildonly-randconfig-002-20250103    clang-19
i386        buildonly-randconfig-003-20250103    gcc-12
i386        buildonly-randconfig-004-20250103    clang-19
i386        buildonly-randconfig-005-20250103    clang-19
i386        buildonly-randconfig-006-20250103    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250103    gcc-14.2.0
loongarch             randconfig-002-20250103    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250103    gcc-14.2.0
nios2                 randconfig-002-20250103    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250103    gcc-14.2.0
parisc                randconfig-002-20250103    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250103    clang-17
powerpc               randconfig-002-20250103    clang-19
powerpc               randconfig-003-20250103    gcc-14.2.0
powerpc64             randconfig-001-20250103    clang-19
powerpc64             randconfig-002-20250103    gcc-14.2.0
powerpc64             randconfig-003-20250103    clang-19
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250103    clang-20
riscv                 randconfig-002-20250103    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250103    gcc-14.2.0
s390                  randconfig-002-20250103    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250103    gcc-14.2.0
sh                    randconfig-002-20250103    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250103    gcc-14.2.0
sparc                 randconfig-002-20250103    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250103    gcc-14.2.0
sparc64               randconfig-002-20250103    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250103    gcc-11
um                    randconfig-002-20250103    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250103    gcc-12
x86_64      buildonly-randconfig-002-20250103    clang-19
x86_64      buildonly-randconfig-003-20250103    gcc-12
x86_64      buildonly-randconfig-004-20250103    clang-19
x86_64      buildonly-randconfig-005-20250103    clang-19
x86_64      buildonly-randconfig-006-20250103    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250103    gcc-14.2.0
xtensa                randconfig-002-20250103    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

