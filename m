Return-Path: <linux-usb+bounces-30222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED1C42EDA
	for <lists+linux-usb@lfdr.de>; Sat, 08 Nov 2025 16:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724703B2C04
	for <lists+linux-usb@lfdr.de>; Sat,  8 Nov 2025 15:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66865170A11;
	Sat,  8 Nov 2025 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYAFMzu0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8072556E
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762615873; cv=none; b=kcSnQGUXkAZDPJJCOnYmVUIgbQzBi1aji3/ALO1dXby5tQa7/e5oUIfHJN6LRwonJV6n1eiyd35wUbrIDP8obSrT03r1fW+vvfkzPUX9H6C9IkWkGKnNDXx6BGljY4AJgURwjBXH17PN9EWgWYpcTnzyw/o9VbMhOAoDc2IkrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762615873; c=relaxed/simple;
	bh=WTgUVwfVkXTv2FvjhC7vmdWJPGX/4YSGwzzLD2wvNLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GZDLSJI7VgRmZ2Zm1TDuJCIQpJ7Dzvv3Aybx9Xt1QzWpCSmxa2+vDjAmVh6+FMkjN6HKsFE+J+L39LGYl7x+ebXfX4qLg9OJ50tV3KwJxE4lG2h5uRcuvfYhRAcIH6jvlcAJbXvp8Ip6DfQnFdgVRi4EK3RQA1inNDRC8muxVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYAFMzu0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762615872; x=1794151872;
  h=date:from:to:cc:subject:message-id;
  bh=WTgUVwfVkXTv2FvjhC7vmdWJPGX/4YSGwzzLD2wvNLk=;
  b=QYAFMzu0R3vRKgl7l3sPInmD1tXqyubYFnH31Gt5G/9Xw7I9oBo+bf+t
   GhwWm1bXBeo11fRkRNFGamGcS07Odbc6dvU92wIMHRc6xzMteZhvB3qAy
   YH8iaDT//mB6LJ79dRcY4dfpx0jqdnHY3IC7rxKD+hmX7Pv57UIZAhVz4
   qfBv02WnDmV5gsdRQmRmmmmZegtAvI0t8xYIDrKhZKgqYDYFAyYmpbg+A
   jgBETYBGKLcn5y1BteKrZFSHUNzTE48bQVglv48+AHLcuEm2vQylKbBgK
   jxIOHvQeIHPHw9h1e9+GFCoomxr8iX06Kw3YV1VDgi8uXelXAj8OfpkPg
   Q==;
X-CSE-ConnectionGUID: PZsIUsyJQ5u1rdWzuumHYw==
X-CSE-MsgGUID: Kze3Fyh3Q9OFMDAeZOeiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64653262"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64653262"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 07:31:10 -0800
X-CSE-ConnectionGUID: uwBqcMC5TeaBme5T1CnSmw==
X-CSE-MsgGUID: gwCnM3ucRd6fW7i99dPbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="193470982"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2025 07:31:08 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHkuA-000194-1h;
	Sat, 08 Nov 2025 15:31:06 +0000
Date: Sat, 08 Nov 2025 23:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 9393a3a4207f35a2cd1ff5994ed17e8fbd9ce787
Message-ID: <202511082320.Lx1P8FsV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 9393a3a4207f35a2cd1ff5994ed17e8fbd9ce787  thunderbolt: Replace use of system_wq with system_percpu_wq

elapsed time: 1741m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251108    gcc-12.5.0
arc                   randconfig-002-20251108    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                   randconfig-001-20251108    gcc-14.3.0
arm                   randconfig-002-20251108    gcc-15.1.0
arm                   randconfig-003-20251108    clang-22
arm                   randconfig-004-20251108    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251108    gcc-8.5.0
arm64                 randconfig-002-20251108    clang-22
arm64                 randconfig-003-20251108    clang-22
arm64                 randconfig-004-20251108    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251108    gcc-15.1.0
csky                  randconfig-002-20251108    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251107    clang-22
hexagon               randconfig-002-20251107    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-002-20251108    gcc-14
i386        buildonly-randconfig-003-20251108    gcc-14
i386        buildonly-randconfig-004-20251108    gcc-14
i386                  randconfig-004-20251108    gcc-12
i386                  randconfig-011-20251108    gcc-14
i386                  randconfig-012-20251108    clang-20
i386                  randconfig-013-20251108    gcc-14
i386                  randconfig-014-20251108    clang-20
i386                  randconfig-015-20251108    gcc-14
i386                  randconfig-016-20251108    gcc-14
i386                  randconfig-017-20251108    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251107    gcc-15.1.0
loongarch             randconfig-002-20251107    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251107    gcc-11.5.0
nios2                 randconfig-002-20251107    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251108    gcc-8.5.0
parisc                randconfig-002-20251108    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-22
powerpc               randconfig-001-20251108    gcc-8.5.0
powerpc               randconfig-002-20251108    gcc-9.5.0
powerpc                     skiroot_defconfig    clang-22
powerpc64             randconfig-001-20251108    gcc-8.5.0
powerpc64             randconfig-002-20251108    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251107    clang-22
riscv                 randconfig-002-20251107    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251107    gcc-8.5.0
s390                  randconfig-002-20251107    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251107    gcc-13.4.0
sh                    randconfig-002-20251107    gcc-11.5.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251108    gcc-14.3.0
sparc                 randconfig-002-20251108    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251108    clang-20
sparc64               randconfig-002-20251108    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251108    gcc-14
um                    randconfig-002-20251108    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251108    gcc-14
x86_64      buildonly-randconfig-002-20251108    gcc-12
x86_64      buildonly-randconfig-003-20251108    clang-20
x86_64      buildonly-randconfig-004-20251108    gcc-14
x86_64      buildonly-randconfig-005-20251108    gcc-14
x86_64      buildonly-randconfig-006-20251108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251108    clang-20
x86_64                randconfig-012-20251108    gcc-14
x86_64                randconfig-013-20251108    clang-20
x86_64                randconfig-014-20251108    clang-20
x86_64                randconfig-015-20251108    clang-20
x86_64                randconfig-016-20251108    gcc-14
x86_64                randconfig-071-20251108    gcc-14
x86_64                randconfig-072-20251108    clang-20
x86_64                randconfig-073-20251108    clang-20
x86_64                randconfig-074-20251108    clang-20
x86_64                randconfig-076-20251108    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251108    gcc-8.5.0
xtensa                randconfig-002-20251108    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

