Return-Path: <linux-usb+bounces-19014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2C2A01F1D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 07:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8711884D4F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 06:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B1019A288;
	Mon,  6 Jan 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnJn/Au7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3817ADF7
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143742; cv=none; b=rMnamAsJZK5PiuSBiQcz8SstcRm56zKbr69V5Od53LXX6vQghkO7LsM/kkl6GcThe1mTkOhl2Va7YBn9K3A59Fb4v/2nemeDfzv8kCi1mEFL+e3tLNtiMLZw9AKUKnKREcNNMLGpCExfn+3ahUOrPChnIU5may29kAKylLk3GdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143742; c=relaxed/simple;
	bh=f4aM+HpUyYpblhOqwCMK1fb9C6qWURIOCHmG7qS2qFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yw2Afw5qNLVu3imVYoWGLFAGw+aQ8xGGq/yrPJDJScHI0RZsWgxB6mFX6Fymdp8ZBOtMj5FB7kKmPZxX3pictLn7zysMJTexsPBk1ipIOjNaS80dZEmM0LFqwpjl17gJx9F1ggIzRuEUsRBfMqS7SB3RXrnD23M/hN3FVA33G48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnJn/Au7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736143741; x=1767679741;
  h=date:from:to:cc:subject:message-id;
  bh=f4aM+HpUyYpblhOqwCMK1fb9C6qWURIOCHmG7qS2qFk=;
  b=YnJn/Au7aNs50ocOvgyQFprZTW3osLJTylN3u0Q15WWpXD3+7tx6FQss
   2Yvihj8TyF09Cl6TxhBamqwyOFZxonjJLyWoFHf/vygJqyZMpf0NBukyu
   TwBFUZuWpqfzHwipF83V8d4kkqlToaGbssCAS3kZgMXonwzHvsPRBaVKk
   Bj2do3FNpOLPiQb4Uat012G+W0ovJ0G3Jg4az6ludvOj7t2cluWX9lJNR
   FneQi7VjvZ4w3hxYBflCYq3d9kP/qi+lF0UfO5GbGB3me2EMpNvOG++nF
   iqWw+ddZxcMO3rCI+wMtcSfT6CkiNDQa5QYCgDulw7FDjKTdVnxOWR1LJ
   A==;
X-CSE-ConnectionGUID: JCYiCDdhSFWr7F1pT4eCCg==
X-CSE-MsgGUID: C+oPS1iDRu+T57O/aNnKCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35521860"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35521860"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 22:09:00 -0800
X-CSE-ConnectionGUID: T3PM4nXsT7STm+mAEX2ESQ==
X-CSE-MsgGUID: B/UiqhEkTXiL0hBGgWFGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102836357"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2025 22:08:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUgIL-000CJ9-0Z;
	Mon, 06 Jan 2025 06:08:57 +0000
Date: Mon, 06 Jan 2025 14:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 43d84701d2aa147eab39b529919ffaf35f724bbb
Message-ID: <202501061425.vhrEX0kC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 43d84701d2aa147eab39b529919ffaf35f724bbb  thunderbolt: Expose router DROM through debugfs

elapsed time: 1210m

configs tested: 137
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                   randconfig-001-20250105    gcc-13.2.0
arc                   randconfig-002-20250105    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                   randconfig-001-20250105    gcc-14.2.0
arm                   randconfig-002-20250105    clang-20
arm                   randconfig-003-20250105    clang-20
arm                   randconfig-004-20250105    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250105    clang-20
arm64                 randconfig-002-20250105    clang-19
arm64                 randconfig-003-20250105    clang-20
arm64                 randconfig-004-20250105    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250105    gcc-14.2.0
csky                  randconfig-002-20250105    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20250105    clang-20
hexagon               randconfig-002-20250105    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250105    clang-19
i386        buildonly-randconfig-002-20250105    clang-19
i386        buildonly-randconfig-003-20250105    gcc-12
i386        buildonly-randconfig-004-20250105    clang-19
i386        buildonly-randconfig-005-20250105    clang-19
i386        buildonly-randconfig-006-20250105    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250105    gcc-14.2.0
loongarch             randconfig-002-20250105    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250105    gcc-14.2.0
nios2                 randconfig-002-20250105    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250105    gcc-14.2.0
parisc                randconfig-002-20250105    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc               randconfig-001-20250105    clang-15
powerpc               randconfig-002-20250105    clang-20
powerpc               randconfig-003-20250105    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250105    clang-20
powerpc64             randconfig-002-20250105    clang-20
powerpc64             randconfig-003-20250105    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250105    gcc-14.2.0
riscv                 randconfig-002-20250105    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250105    gcc-14.2.0
s390                  randconfig-002-20250105    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250105    gcc-14.2.0
sh                    randconfig-002-20250105    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250105    gcc-14.2.0
sparc                 randconfig-002-20250105    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250105    gcc-14.2.0
sparc64               randconfig-002-20250105    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250105    gcc-12
um                    randconfig-002-20250105    clang-19
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250105    gcc-12
x86_64      buildonly-randconfig-002-20250105    clang-19
x86_64      buildonly-randconfig-003-20250105    clang-19
x86_64      buildonly-randconfig-004-20250105    clang-19
x86_64      buildonly-randconfig-005-20250105    clang-19
x86_64      buildonly-randconfig-006-20250105    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250105    gcc-14.2.0
xtensa                randconfig-002-20250105    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

