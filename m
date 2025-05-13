Return-Path: <linux-usb+bounces-23931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E648AB5FFB
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 01:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33711B46958
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 23:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D992116EB;
	Tue, 13 May 2025 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBGqipb1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16D1AA1E0
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747180283; cv=none; b=duaYGy29TlLc/vxK3ake1KXj4InINjTyRm8SU1LWv7/70fSZmY92Q82NpqzxyPGAbS7RMm5fg47c9o+3hWulL88Slw9Z68ZhwuzSZW2EyQXmgto7UJPZuNobEJkSrnyixHcg1Hg8D87B1QiKCWfevcrJiALH5Oi8ZVodDjn0lGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747180283; c=relaxed/simple;
	bh=gJ2Dwn2Dnx1Ti2WH6Wzu/IbGLKvDw4o7S+7h4rnNwbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KJM6OrjBboTZc6aAVfXQkYfaMmi5oFl9Nyo5UHJn7ZY/rELBNjCrPB+xvUNmpdhrFOE0vzB2vxblVs6656n8F/5b1dux/a5P5kmkJand0s7Q9g1I5NNAmQ2SqGzbdWSl/1E9edtAGA0KCpCxOZzPzX/mQRCOj4gwDWJlyfs2r4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBGqipb1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747180282; x=1778716282;
  h=date:from:to:cc:subject:message-id;
  bh=gJ2Dwn2Dnx1Ti2WH6Wzu/IbGLKvDw4o7S+7h4rnNwbE=;
  b=dBGqipb1fOuKE90OmpY6KeY09viAw8ffLWqo9A3O3i04xU1rDn+mt03e
   a4W72a4hLivWuVZi2JHW+GXkIIK3Pz39CNlAF3HirtDKPP6uCL/+xyqfd
   S2Iwea0vHe/aZL5EATRLEyKgn2Aw+cDmG6xydvZb4uTPChA8qrKhUfWY3
   09tqhBFl8OoNvo/t9whernJ6yZMEKptlK/3Ngx+0yZiJjw2ZBDO5p2eQ/
   PH/6emNcYS+wEItwCDxEOoCdHkDR1eDlpfDzbLGpAv7w+XRB9lPR6/cbZ
   14skKKQIlEsj8PI6ybGPGbIDiG4xDslHi3/s9qrhafYA9u9jQwYZTUBI0
   g==;
X-CSE-ConnectionGUID: OtZcz0FLR5GXUuKaVrhiIw==
X-CSE-MsgGUID: 4j+Suj6mTDaaEPbbtVoO+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66465434"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="66465434"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 16:51:20 -0700
X-CSE-ConnectionGUID: QljPCWQDT+iedwkcbDu8kQ==
X-CSE-MsgGUID: cYaxPjHaQd+jSDlL/AKwrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="168955482"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2025 16:51:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEzP2-000GVc-2l;
	Tue, 13 May 2025 23:51:16 +0000
Date: Wed, 14 May 2025 07:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ab6dc9a6c721c2eed867c157447764ae68ff9b7e
Message-ID: <202505140725.4B07OZW3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ab6dc9a6c721c2eed867c157447764ae68ff9b7e  Merge 6.15-rc6 into usb-next

elapsed time: 984m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250513    gcc-14.2.0
arc                   randconfig-002-20250513    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250513    gcc-7.5.0
arm                   randconfig-002-20250513    gcc-8.5.0
arm                   randconfig-003-20250513    gcc-8.5.0
arm                   randconfig-004-20250513    clang-16
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250513    clang-21
arm64                 randconfig-002-20250513    clang-21
arm64                 randconfig-003-20250513    gcc-6.5.0
arm64                 randconfig-004-20250513    clang-21
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-002-20250513    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-005-20250513    gcc-12
i386        buildonly-randconfig-006-20250513    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-002-20250513    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-002-20250513    gcc-8.5.0
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250513    gcc-14.2.0
riscv                 randconfig-002-20250513    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250513    clang-21
s390                  randconfig-002-20250513    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250513    gcc-12.4.0
sh                    randconfig-002-20250513    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250513    gcc-11.5.0
sparc                 randconfig-002-20250513    gcc-13.3.0
sparc64               randconfig-001-20250513    gcc-11.5.0
sparc64               randconfig-002-20250513    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250513    clang-19
um                    randconfig-002-20250513    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-003-20250513    clang-20
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-005-20250513    clang-20
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250513    gcc-7.5.0
xtensa                randconfig-002-20250513    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

