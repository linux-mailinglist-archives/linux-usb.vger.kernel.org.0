Return-Path: <linux-usb+bounces-20991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549DA432A3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 02:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B37188AAF4
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 01:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194BB78F4B;
	Tue, 25 Feb 2025 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayABUuzf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6D22619
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740448290; cv=none; b=ux3aBQNGrO9LCmGoXugQm2CymTXDWHZA8hHGUMwgT2cNqifA5mJ5C0Cc72zWSrpxvuGVpRC9p0sRsgdYvd2mt2H+PuPbZ+MlhQnlMqfI8wsB7/YaGxbozIwWEWAoQfk+Fh/mUpbaVOzwqxePlXtQAGOXQlYSqVPduhiwGTYeYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740448290; c=relaxed/simple;
	bh=6X4wlmYeGJYdIlwsfvRtwCvOnKFkTQpC6eaKxUYexK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FI+Tmp/OFHXWuDFDG3oFvTwJ0MnAIQy4Z07Tj3e2nUXEjs0JeFGlTI3Evwb4lPUpdOYwQNc6jEJQHKipujxxUnCitABpQ94ePtxdEpugagKKw4yGzHq3bdXGtXzoalhkC6T1LlbfQ+r9Gett7DHRuGaknJre0OW2ulIrm/UqFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayABUuzf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740448288; x=1771984288;
  h=date:from:to:cc:subject:message-id;
  bh=6X4wlmYeGJYdIlwsfvRtwCvOnKFkTQpC6eaKxUYexK4=;
  b=ayABUuzfT24L9VzdEsjuglyEV5/hf0sFCb8CH2dUc47lQlBuHQUVl4Zf
   Kjb8aBzj1IzZD6Dp6usCM84rrHYySpfZf2hPbT952nBpmTsDMXsir2QDs
   m6vQhPQ/GLNDWZ7V0KBr30rmliXP0dr3404PAeXn4hV9ZLvNfZjTMSkX5
   L1jqmkYUqxVKpgUXGxA9avLfJlnvw8B1kGhL5/OlOscvSLoqtzlrJtnBh
   UlfQgq/X9mo4ucId2AFMYKaysEiVWygCV+eJ+YUQ05W/STUh5Sk5Bnod+
   0uDCGl/ylZkjW9njO3qQPpr49sDzmn0En6tQUzUJqo/AQiTBsyWjdoNAC
   g==;
X-CSE-ConnectionGUID: EJhR5JCZSUaSbiOPD5jMfg==
X-CSE-MsgGUID: 0IIU3nYRTbuWWwbnAl1LQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51871455"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="51871455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 17:51:27 -0800
X-CSE-ConnectionGUID: /kkuLRGPQb28Cl//DEI7FQ==
X-CSE-MsgGUID: w0wkcGI5QuCjihbCHStALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="120865789"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 17:51:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmk6W-0009cW-1K;
	Tue, 25 Feb 2025 01:51:24 +0000
Date: Tue, 25 Feb 2025 09:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 72cef52b353cc693d71ad37d80237d975f9951d9
Message-ID: <202502250931.OXjMbKhQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 72cef52b353cc693d71ad37d80237d975f9951d9  thunderbolt: Make tb_tunnel_alloc_usb3() error paths consistent with the rest

elapsed time: 1038m

configs tested: 127
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250224    gcc-13.2.0
arc                   randconfig-002-20250224    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-21
arm                      integrator_defconfig    clang-15
arm                        mvebu_v7_defconfig    clang-15
arm                   randconfig-001-20250224    gcc-14.2.0
arm                   randconfig-002-20250224    gcc-14.2.0
arm                   randconfig-003-20250224    gcc-14.2.0
arm                   randconfig-004-20250224    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250224    gcc-14.2.0
arm64                 randconfig-002-20250224    clang-21
arm64                 randconfig-003-20250224    gcc-14.2.0
arm64                 randconfig-004-20250224    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250224    gcc-14.2.0
csky                  randconfig-002-20250224    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250224    clang-21
hexagon               randconfig-002-20250224    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250224    clang-19
i386        buildonly-randconfig-002-20250224    gcc-12
i386        buildonly-randconfig-003-20250224    clang-19
i386        buildonly-randconfig-004-20250224    gcc-12
i386        buildonly-randconfig-005-20250224    clang-19
i386        buildonly-randconfig-006-20250224    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250224    gcc-14.2.0
loongarch             randconfig-002-20250224    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250224    gcc-14.2.0
nios2                 randconfig-002-20250224    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250224    gcc-14.2.0
parisc                randconfig-002-20250224    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      chrp32_defconfig    clang-21
powerpc                       ebony_defconfig    clang-18
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250224    gcc-14.2.0
powerpc               randconfig-002-20250224    gcc-14.2.0
powerpc               randconfig-003-20250224    gcc-14.2.0
powerpc64             randconfig-002-20250224    clang-18
powerpc64             randconfig-003-20250224    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250224    gcc-14.2.0
riscv                 randconfig-002-20250224    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250224    gcc-14.2.0
s390                  randconfig-002-20250224    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250224    gcc-14.2.0
sh                    randconfig-002-20250224    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250224    gcc-14.2.0
sparc                 randconfig-002-20250224    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250224    gcc-14.2.0
sparc64               randconfig-002-20250224    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250224    gcc-12
um                    randconfig-002-20250224    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250224    gcc-11
x86_64      buildonly-randconfig-002-20250224    gcc-12
x86_64      buildonly-randconfig-003-20250224    clang-19
x86_64      buildonly-randconfig-004-20250224    gcc-12
x86_64      buildonly-randconfig-005-20250224    clang-19
x86_64      buildonly-randconfig-006-20250224    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250224    gcc-14.2.0
xtensa                randconfig-002-20250224    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

