Return-Path: <linux-usb+bounces-16390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 304109A32F1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 04:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C1C2861B7
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 02:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13F14D280;
	Fri, 18 Oct 2024 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChR8P3U2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2781E493
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729218962; cv=none; b=DBLrro197pstIhw+C+OZhpEommvKF8oWcRnygsknNv9XWU8HPZVmDVWll8ksDBgOSDOqeEsu3Nc9fqtEkXAvdQYiw2DLsZRYahaVgc0FPeuwLpT4IE8oFIXIimbgarccAcbK6C460ojIfhzBZ4tkOgLvheCpOwiaiH3mXbQuBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729218962; c=relaxed/simple;
	bh=Osid0UMKqygizKyQmPSg5f0e+L0PaO5QQAQJnlIEccs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVNlgxBCBySByTifIU+rMNduzBnRGgSJBMeYQvGgzCdxpNYw3BsX6qrqsK9CQluBHMkM/LvO6lMeTAHhbKQrjJq5HqGfkArYMycO/sH02cCJmECPhI2YS3j7+WyGkF0K0A2OBrWgKyNaHsyXPN1HwYzvJfOOdgEtoKuk7LVsFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChR8P3U2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729218961; x=1760754961;
  h=date:from:to:cc:subject:message-id;
  bh=Osid0UMKqygizKyQmPSg5f0e+L0PaO5QQAQJnlIEccs=;
  b=ChR8P3U2p7bhtqGjaSMjqHlHI/eie24W4G7aQnR8CXNo2YLG/E41v1/O
   JB48i45SAs+i28kTU8Q8zusJrUML4UfFeGxT7+ksn91YuoEAWxPCfeNbc
   mRxke7nw6RjkelOo3pm/fhSIpKFTEDggi+j9ARBoluta/1r1fpk0pMYFc
   Ip4o9yyDFis5eGF5IBplQJoWiOyEGn+xuI6NnL+yGfNYeMoWnP2+X6fMo
   3non59f3o1LrejInYWjDvXK2b6JxZIKk5AqJgfBKWCblZ5vzSSlC/ulO5
   zSZc5Mlc3dpjxkN6UjPQnKZEY7u8xhTw9Sdtqu92EGNDgAeHzfqsLaZMx
   g==;
X-CSE-ConnectionGUID: 0QPoRfJpRi2xJ+8PRSB+1g==
X-CSE-MsgGUID: w6M9ilDCQ8m7mWmUjAwx6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28616401"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28616401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 19:36:00 -0700
X-CSE-ConnectionGUID: K8kjaalKTd6NYhVrNwDxHg==
X-CSE-MsgGUID: 1lw9fYJCQ0eIl8hQhrGnkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="79537320"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Oct 2024 19:36:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1cqK-000NBM-2S;
	Fri, 18 Oct 2024 02:35:56 +0000
Date: Fri, 18 Oct 2024 10:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 30c9ae5ece8ecd69d36e6912c2c0896418f2468c
Message-ID: <202410181048.b6qr6f4n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 30c9ae5ece8ecd69d36e6912c2c0896418f2468c  xhci: dbc: honor usb transfer size boundaries.

elapsed time: 1133m

configs tested: 109
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        keystone_defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm                             rpc_defconfig    gcc-14.1.0
arm                         s5pv210_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241018    gcc-11
i386        buildonly-randconfig-002-20241018    gcc-11
i386        buildonly-randconfig-003-20241018    gcc-11
i386        buildonly-randconfig-004-20241018    gcc-11
i386        buildonly-randconfig-005-20241018    gcc-11
i386        buildonly-randconfig-006-20241018    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20241018    gcc-11
i386                  randconfig-002-20241018    gcc-11
i386                  randconfig-003-20241018    gcc-11
i386                  randconfig-004-20241018    gcc-11
i386                  randconfig-005-20241018    gcc-11
i386                  randconfig-006-20241018    gcc-11
i386                  randconfig-011-20241018    gcc-11
i386                  randconfig-012-20241018    gcc-11
i386                  randconfig-013-20241018    gcc-11
i386                  randconfig-014-20241018    gcc-11
i386                  randconfig-015-20241018    gcc-11
i386                  randconfig-016-20241018    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.1.0
riscv                    nommu_virt_defconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

