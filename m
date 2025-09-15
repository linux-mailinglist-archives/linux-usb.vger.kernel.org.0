Return-Path: <linux-usb+bounces-28071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2FB56E2F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 04:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5566179B3C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 02:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5C721D3CC;
	Mon, 15 Sep 2025 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPMfCx5a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF01E98EF
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757902459; cv=none; b=CRb1UCLaw6Rzwg4uARSy13VN8ftVoXDFjxFaMRY+X0BhnFLI0HYNuyr2M1UvDWz3oN6R/BSmOz0aLblcYZFMjutH/vbE/UytWv3jiQ/fgAG0okA5ssTHV9H8p6rJvV7TabLdJkfxmk9w6hPqBP9qyjfnDa/FShEdULHVhf62iQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757902459; c=relaxed/simple;
	bh=T2F+N7ye2u7PHdmam/6/LtfK1iYYmMNigo/ZMfy5z0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0E3idmQMtdGzVS9wjwktZ8zgzKWT9JoVE/9Y2+NCntOAsiG+bVT3LRytWvrw6Ox7DfZY/s9iIT8EehWvtss6NgG+0tclcFT9ZaQbimk1EQl6qwnJTi7IUkSbfa/HbdTwYkM+UWz3fXGE6yuJiqG0Kb3qvT3TVSW6hP8OoANMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPMfCx5a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757902458; x=1789438458;
  h=date:from:to:cc:subject:message-id;
  bh=T2F+N7ye2u7PHdmam/6/LtfK1iYYmMNigo/ZMfy5z0A=;
  b=dPMfCx5aYmYJVIqXODVxMrgTKkdtTlh4ElZXR9TK9OWHBySXIpu6U3G8
   8LkdivPfQvqcB1cFAxfL4WJ+z2J1l1zyHBhsnMrCqq10NWq4ETSadVADg
   qPNUCj7/8h5azlqXIc9Q8AUpi9cIqqsGcvXCpvq7rlWgmZHUA2QvDbAbE
   QsONyxgBokmGT4OxYzS6xQIsCZoCNqJUMU8iZekzkDB7BLgFgoGsq4/c1
   lig8Xv6VXrK8TDhxlZgjfBDdosacSiOKhEo2VwLqziKPrSGFehVDvrofV
   ukcSzOuxy3BhZt5MFthg9vfNFqxw7YcJE9nFbbq07NlWWggxgipYG9g1g
   A==;
X-CSE-ConnectionGUID: BxWWQIvRQ/ixSa8XDlW9FA==
X-CSE-MsgGUID: V0qObTaLTQmqgt1C73Tlww==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59846998"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59846998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 19:14:17 -0700
X-CSE-ConnectionGUID: yTkBvtRXQ3un3qQF2pzrRg==
X-CSE-MsgGUID: +Ve0vnQWSvmIFTYiSnVbqQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2025 19:14:16 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxyjN-0002sk-26;
	Mon, 15 Sep 2025 02:14:13 +0000
Date: Mon, 15 Sep 2025 10:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 82432bbfb9e83b7e81d04660fe129b99a29b2ac2
Message-ID: <202509151057.DAjdCsP3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 82432bbfb9e83b7e81d04660fe129b99a29b2ac2  usb: typec: tipd: Handle mode transitions for CD321x

elapsed time: 724m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250914    gcc-9.5.0
arc                   randconfig-002-20250914    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                   randconfig-001-20250914    clang-22
arm                   randconfig-002-20250914    clang-19
arm                   randconfig-003-20250914    gcc-14.3.0
arm                   randconfig-004-20250914    gcc-12.5.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250914    gcc-9.5.0
arm64                 randconfig-002-20250914    clang-22
arm64                 randconfig-003-20250914    clang-17
arm64                 randconfig-004-20250914    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250914    gcc-15.1.0
csky                  randconfig-002-20250914    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250914    clang-22
hexagon               randconfig-002-20250914    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250914    gcc-13
i386        buildonly-randconfig-002-20250914    gcc-14
i386        buildonly-randconfig-003-20250914    gcc-14
i386        buildonly-randconfig-004-20250914    gcc-14
i386        buildonly-randconfig-005-20250914    clang-20
i386        buildonly-randconfig-006-20250914    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250914    clang-22
loongarch             randconfig-002-20250914    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250914    gcc-10.5.0
nios2                 randconfig-002-20250914    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250914    gcc-8.5.0
parisc                randconfig-002-20250914    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250914    clang-22
powerpc               randconfig-002-20250914    clang-22
powerpc               randconfig-003-20250914    clang-22
powerpc64             randconfig-001-20250914    clang-22
powerpc64             randconfig-002-20250914    clang-22
powerpc64             randconfig-003-20250914    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250914    clang-22
riscv                 randconfig-002-20250914    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250914    gcc-10.5.0
s390                  randconfig-002-20250914    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250914    gcc-15.1.0
sh                    randconfig-002-20250914    gcc-10.5.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250914    gcc-11.5.0
sparc                 randconfig-002-20250914    gcc-14.3.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250914    gcc-8.5.0
sparc64               randconfig-002-20250914    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250914    clang-22
um                    randconfig-002-20250914    clang-18
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250914    clang-20
x86_64      buildonly-randconfig-002-20250914    clang-20
x86_64      buildonly-randconfig-003-20250914    clang-20
x86_64      buildonly-randconfig-004-20250914    clang-20
x86_64      buildonly-randconfig-005-20250914    gcc-14
x86_64      buildonly-randconfig-006-20250914    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250914    gcc-14.3.0
xtensa                randconfig-002-20250914    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

