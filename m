Return-Path: <linux-usb+bounces-31041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464DC92950
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 17:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24DDB3A8CD5
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 16:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798312773CC;
	Fri, 28 Nov 2025 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fk3hPZ5n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF8230BD9
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347609; cv=none; b=GAEFHDbwOX3A7cvFK00dzllQEGVvCg/xiazJV8S+++NGomp5uJ9/DwlD+5Ne7aXwtDWL7HBuIwnQ2gQ3cUh/laam4lwqVbCc6owSLgxhR5fMp3q1XlsjbJT9FjFHnvvZt3HQ0aB6q4hMelPMbMWjBJobDvhR4srsYrJ+JDyE8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347609; c=relaxed/simple;
	bh=8s8sJDJxxizVuM2gYpaBBifkbR9WpviPo2zAztiWv/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mmNL8VYh98UA1rIQuawnMbypdrp3r9+lK2oQIMBsbMvBt1Mnrc6Xmmq+pxKSW+9PvNdtkSD75Y8xbC4jjLdNo5t8XUhtq9dc9sSOX167MR9MVh2gTtesog+eNHj0rYpLHSx3pB8USLCLfDG+n1hBc7Z0dfL6QhjqRG1stiAmZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fk3hPZ5n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764347606; x=1795883606;
  h=date:from:to:cc:subject:message-id;
  bh=8s8sJDJxxizVuM2gYpaBBifkbR9WpviPo2zAztiWv/I=;
  b=fk3hPZ5neCG00cWXdnypcDNDz7gDCK9a1JKtTNObGv1Vf5ndVZnOLZyG
   rUeDm5mp1V7Vpzm0cfwAchbBM+vtThltprf/xZQL1oeVYFChtWlyOlHZ+
   5m6lq/47sG8EmfZCti+Eyl/rbdHrmuGUoh/KZTd9CIkdOkX+X2Tp0mou6
   eWlQ6Na+8UPvg/6vYtlhaSL6oO6M6fRJCaGcWF36r0e4rolyPXWnkmC1Y
   poaVqmBTxtaxSV/5MQIT3IpKk2vJv6v2a7+aecs05PKS7wllAgsbhxXaf
   5hPPPY1bPBlvJvqwhwmCSbY/iz7C7+tv4BpXNxDji0FCeJNhk/PkYMWw6
   A==;
X-CSE-ConnectionGUID: RL9jPHKAT6ajWybi4rZw6A==
X-CSE-MsgGUID: n7tn8AHSSqufXoVAQHdR4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77741336"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="77741336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 08:33:25 -0800
X-CSE-ConnectionGUID: 3byFCeAoSauwcQmoQHHZZA==
X-CSE-MsgGUID: pZ6sh6tRRGqoPb4dXX3xNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="230783003"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 08:33:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP1PO-000000006Z3-2bu6;
	Fri, 28 Nov 2025 16:33:22 +0000
Date: Sat, 29 Nov 2025 00:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 2585973c7f9ee31d21e5848c996fab2521fd383d
Message-ID: <202511290051.e3xzsbhP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 2585973c7f9ee31d21e5848c996fab2521fd383d  usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt

elapsed time: 1852m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251127    gcc-15.1.0
arc                   randconfig-002-20251127    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-004-20251127    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-002-20251128    clang-20
arm64                 randconfig-003-20251128    clang-22
arm64                 randconfig-004-20251128    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-12.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251128    gcc-14
i386        buildonly-randconfig-002-20251128    clang-20
i386        buildonly-randconfig-003-20251128    clang-20
i386        buildonly-randconfig-004-20251128    clang-20
i386        buildonly-randconfig-005-20251128    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20251128    clang-20
i386                  randconfig-002-20251128    clang-20
i386                  randconfig-003-20251128    clang-20
i386                  randconfig-004-20251128    gcc-14
i386                  randconfig-005-20251128    clang-20
i386                  randconfig-006-20251128    clang-20
i386                  randconfig-007-20251128    gcc-14
i386                  randconfig-011-20251128    gcc-12
i386                  randconfig-012-20251128    gcc-14
i386                  randconfig-014-20251128    clang-20
i386                  randconfig-015-20251128    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251128    gcc-15.1.0
loongarch             randconfig-002-20251128    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251128    gcc-8.5.0
nios2                 randconfig-002-20251128    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    gcc-14.3.0
parisc                randconfig-002-20251128    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20251128    gcc-11.5.0
powerpc               randconfig-002-20251128    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-002-20251128    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251128    gcc-11.5.0
riscv                 randconfig-002-20251128    gcc-8.5.0
s390                             alldefconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251128    clang-22
s390                  randconfig-002-20251128    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                    randconfig-001-20251128    gcc-13.4.0
sh                    randconfig-002-20251128    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    gcc-8.5.0
sparc                 randconfig-002-20251128    gcc-15.1.0
sparc64               randconfig-001-20251128    gcc-12.5.0
sparc64               randconfig-002-20251128    gcc-12.5.0
um                                allnoconfig    clang-22
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251128    clang-20
x86_64      buildonly-randconfig-002-20251128    gcc-14
x86_64      buildonly-randconfig-003-20251128    gcc-14
x86_64      buildonly-randconfig-004-20251128    gcc-14
x86_64      buildonly-randconfig-005-20251128    clang-20
x86_64      buildonly-randconfig-006-20251128    clang-20
x86_64                randconfig-011-20251128    gcc-14
x86_64                randconfig-012-20251128    gcc-13
x86_64                randconfig-072-20251128    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251128    gcc-15.1.0
xtensa                randconfig-002-20251128    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

