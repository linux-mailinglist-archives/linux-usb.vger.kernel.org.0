Return-Path: <linux-usb+bounces-18695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4269F9206
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 13:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9873B7A31D4
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 12:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470631DC9A2;
	Fri, 20 Dec 2024 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPFpGIZY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4B1D63FF
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697281; cv=none; b=CVeBrElMSw9GTSH3VTE80U90/jjkJpHM4yH/WOIt57sf5FPJciL1FD3U+6ljyGecBcTIgB5XT3zbIhXMZxEsTfh2dR8rpVss1zzK7IQH/GV+8ZyWo4vugoW800Su0GP/QqaBOd7Ua7ZoZj708F5M2Sv+caqRuUEbTs0OK6tbhEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697281; c=relaxed/simple;
	bh=8d4Q0C2znU8MHzQ4BGUXioJMfRxy19Shq1g1fs4tACA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bUXXqbC5dkYrgKDFV6b3yvTggsG6wX/uuxNL9mh3llahHj6kUa4JNcVWZ9ck1C033QtklgmI3Sz0LOkQESxY4F800f6OH6XKt5bOdUeJbEBJyDSDlavYDuBjRDfLcfqxr7Ho5/caK0Uco9bApIBdqvURzvG/g5yVxFGa78kC4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPFpGIZY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734697280; x=1766233280;
  h=date:from:to:cc:subject:message-id;
  bh=8d4Q0C2znU8MHzQ4BGUXioJMfRxy19Shq1g1fs4tACA=;
  b=lPFpGIZYAWuJ0ct1f/muf/veMKXPLSrPigfQn8Xt5JMg5bHHSyqDRknM
   LhTNBKFtnsLcNEAE3IBvQc0k+1dc59JPDplmlUQf+9Zij02oAb7xyug9U
   QZnX2Ji0otlQSLkGgoY/Z4nrP9wGnrkkmtQTzGR9eL2hV0Wp5lODZC54f
   UmhccbrtQxnIJHCPNG6fVsEknc2c0fbJp5LkRfe5ZdLLes6OrEXyReVMA
   c2ARcpYKcg8SC/PKJqEk3O7WQ1q+i47XiU1r8h+u7trzkgQiJRPPIaR/T
   OVV52Z+CIkADGjsyh7J2dMz3tp/N3Ffr8FArzwkeDPq5ungKWt+K6Rfio
   A==;
X-CSE-ConnectionGUID: NeIiA26LR3CcLTTJgoutrQ==
X-CSE-MsgGUID: nNyfkuo7QN6fgsQUQA9eoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57716327"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="57716327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 04:21:20 -0800
X-CSE-ConnectionGUID: KkWHYuQtTtyNmtYBORfgWw==
X-CSE-MsgGUID: lecIgrAHRXyB6zO7zmlz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129464690"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 04:21:18 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOc0K-00018P-0C;
	Fri, 20 Dec 2024 12:21:16 +0000
Date: Fri, 20 Dec 2024 20:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1b62f3cb74d2965e8f96f20241b1fe85017aa3e8
Message-ID: <202412202055.Ia0fsahw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1b62f3cb74d2965e8f96f20241b1fe85017aa3e8  Merge tag 'thunderbolt-for-v6.13-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 1449m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241219    gcc-14.2.0
csky                  randconfig-002-20241219    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241219    clang-19
hexagon               randconfig-002-20241219    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241219    gcc-12
i386        buildonly-randconfig-002-20241219    gcc-12
i386        buildonly-randconfig-003-20241219    clang-19
i386        buildonly-randconfig-004-20241219    clang-19
i386        buildonly-randconfig-005-20241219    gcc-12
i386        buildonly-randconfig-006-20241219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241219    gcc-14.2.0
loongarch             randconfig-002-20241219    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241219    gcc-14.2.0
parisc                randconfig-002-20241219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241219    clang-18
powerpc               randconfig-002-20241219    clang-16
powerpc               randconfig-003-20241219    clang-20
powerpc                     tqm8541_defconfig    clang-15
powerpc64             randconfig-001-20241219    gcc-14.2.0
powerpc64             randconfig-002-20241219    clang-18
powerpc64             randconfig-003-20241219    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241219    clang-16
riscv                 randconfig-002-20241219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241219    gcc-14.2.0
s390                  randconfig-002-20241219    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241219    gcc-14.2.0
sh                    randconfig-002-20241219    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241219    gcc-14.2.0
sparc                 randconfig-002-20241219    gcc-14.2.0
sparc64               randconfig-001-20241219    gcc-14.2.0
sparc64               randconfig-002-20241219    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241219    gcc-12
um                    randconfig-002-20241219    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241220    clang-19
x86_64      buildonly-randconfig-001-20241220    gcc-12
x86_64      buildonly-randconfig-002-20241220    clang-19
x86_64      buildonly-randconfig-003-20241220    clang-19
x86_64      buildonly-randconfig-003-20241220    gcc-12
x86_64      buildonly-randconfig-004-20241220    clang-19
x86_64      buildonly-randconfig-004-20241220    gcc-12
x86_64      buildonly-randconfig-005-20241220    clang-19
x86_64      buildonly-randconfig-006-20241220    clang-19
x86_64      buildonly-randconfig-006-20241220    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241219    gcc-14.2.0
xtensa                randconfig-002-20241219    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

