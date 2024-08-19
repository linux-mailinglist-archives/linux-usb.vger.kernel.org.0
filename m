Return-Path: <linux-usb+bounces-13664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA795724A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 19:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8211D1C22CBB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 17:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5918D187FFF;
	Mon, 19 Aug 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cigkqYrp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35D49620
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089438; cv=none; b=jLNzheS//UCGmPlBCWH2dO3Ifrtl4d+7rX0MI225T9ILDM2vnnHvGPZdh7zPqk4c/YTUOQmf+skKU5JIp1eUh+O+aLWtvmePG86oiVBBIo2HZvdOqoXZY5AfcAjWfGmUZq1QIXLDbFu14v0msaApHIlZ5EoMsCpi4jIsEHrCWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089438; c=relaxed/simple;
	bh=n1L6VSpgrAS72ddIJGH10n2NXQM0AFX+cupBmy/xHqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psvkqEif7P1WCZ28RKEuYMkqh6jZ6pfXJ2hL/lytHcvT2RDVqlG2sFUnAuvGm59mI/M4Qg5Tx5NvvXJ/KHVcuyxs4ntWFQ+4mf0Q7FlFh/Wg94DVjBbQywyf5bQfclO4u/bvvQ1ilvOIR5e7ENLt8453U3rLS6tFEs5u0GlLgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cigkqYrp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724089437; x=1755625437;
  h=date:from:to:cc:subject:message-id;
  bh=n1L6VSpgrAS72ddIJGH10n2NXQM0AFX+cupBmy/xHqA=;
  b=cigkqYrpyL1IWf6DEy0OAZdYFhccXI4PI717C3MUQEktDmPjlQWk1k+G
   Rs/O53YPrkFigNRSyVSk9Q+UCCiSPDPNOBrhz4SIApWRKvu4bMwaTCge3
   p884zDN6gsfW0LUHCdyVyRL4yQ0fF24zG/X0c4JkJtOjRQ4mrul7tnH6S
   Zz+YEUGdODD4R8bozuWeYqjdskTlDhmJLwiQXAxCaFLti5EN79jp/Phl8
   9/QLYpBmm1mXD+E4vxGIXYGikJ59lEM6qlVtWnAymNZo4cJo9iVkX36K3
   ndD6TEzCgwizElXUb28KkzpyqRpRChblwQP7V+EvJk0e3t0Aqic8FmGZt
   w==;
X-CSE-ConnectionGUID: 9vOqUBzZQTeVEAMwP3yu6A==
X-CSE-MsgGUID: KBZB9QHmSi2jSNxhK7ND1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26108175"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="26108175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:43:57 -0700
X-CSE-ConnectionGUID: QDu339sES3qxzlQO+QnRzw==
X-CSE-MsgGUID: EX1RrtBoQ8iUl2EvE5oPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60154075"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 10:43:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg6Q4-0009GC-2C;
	Mon, 19 Aug 2024 17:43:52 +0000
Date: Tue, 20 Aug 2024 01:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ca7df2c7bb5f83fe46aa9ce998b7352c6b28f3a1
Message-ID: <202408200126.6WFiRUNw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ca7df2c7bb5f83fe46aa9ce998b7352c6b28f3a1  Merge 6.11-rc4 into usb-next

elapsed time: 737m

configs tested: 171
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-002-20240819   clang-18
i386         buildonly-randconfig-002-20240819   gcc-12
i386         buildonly-randconfig-003-20240819   clang-18
i386         buildonly-randconfig-003-20240819   gcc-11
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-005-20240819   clang-18
i386         buildonly-randconfig-005-20240819   gcc-12
i386         buildonly-randconfig-006-20240819   clang-18
i386         buildonly-randconfig-006-20240819   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   clang-18
i386                  randconfig-001-20240819   gcc-12
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-003-20240819   clang-18
i386                  randconfig-003-20240819   gcc-12
i386                  randconfig-004-20240819   clang-18
i386                  randconfig-004-20240819   gcc-12
i386                  randconfig-005-20240819   clang-18
i386                  randconfig-005-20240819   gcc-12
i386                  randconfig-006-20240819   clang-18
i386                  randconfig-006-20240819   gcc-12
i386                  randconfig-011-20240819   clang-18
i386                  randconfig-011-20240819   gcc-12
i386                  randconfig-012-20240819   clang-18
i386                  randconfig-012-20240819   gcc-12
i386                  randconfig-013-20240819   clang-18
i386                  randconfig-013-20240819   gcc-12
i386                  randconfig-014-20240819   clang-18
i386                  randconfig-014-20240819   gcc-12
i386                  randconfig-015-20240819   clang-18
i386                  randconfig-015-20240819   gcc-12
i386                  randconfig-016-20240819   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                            alldefconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       ebony_defconfig   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240819   gcc-12
x86_64       buildonly-randconfig-002-20240819   gcc-12
x86_64       buildonly-randconfig-003-20240819   gcc-12
x86_64       buildonly-randconfig-004-20240819   gcc-12
x86_64       buildonly-randconfig-005-20240819   gcc-12
x86_64       buildonly-randconfig-006-20240819   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240819   clang-18
x86_64                randconfig-001-20240819   gcc-12
x86_64                randconfig-002-20240819   clang-18
x86_64                randconfig-002-20240819   gcc-12
x86_64                randconfig-003-20240819   gcc-12
x86_64                randconfig-004-20240819   gcc-12
x86_64                randconfig-005-20240819   clang-18
x86_64                randconfig-005-20240819   gcc-12
x86_64                randconfig-006-20240819   clang-18
x86_64                randconfig-006-20240819   gcc-12
x86_64                randconfig-011-20240819   gcc-12
x86_64                randconfig-012-20240819   clang-18
x86_64                randconfig-012-20240819   gcc-12
x86_64                randconfig-013-20240819   clang-18
x86_64                randconfig-013-20240819   gcc-12
x86_64                randconfig-014-20240819   gcc-12
x86_64                randconfig-015-20240819   gcc-12
x86_64                randconfig-016-20240819   gcc-12
x86_64                randconfig-071-20240819   gcc-12
x86_64                randconfig-072-20240819   gcc-12
x86_64                randconfig-073-20240819   clang-18
x86_64                randconfig-073-20240819   gcc-12
x86_64                randconfig-074-20240819   gcc-12
x86_64                randconfig-075-20240819   gcc-12
x86_64                randconfig-076-20240819   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

