Return-Path: <linux-usb+bounces-25952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681CB09DC5
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 10:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9002189DC05
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 08:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C530220F34;
	Fri, 18 Jul 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crPtd08b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF741CA84
	for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826963; cv=none; b=H2SvNMzQzx+DvopvIjPJmenMdVQHS70lhXLisn//B3nx5xPDq2tHze5QZ9sJUeI4zh0Nj1B6Q0RL4Rfp8KRKpppo+uiMO53Jn4VmkSenb0QltBkQvEqnkD8fP9Y1S88avA/WtWYKtpwHYV6ZMCh7D53J1AqhYYQFoZrkR2FJMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826963; c=relaxed/simple;
	bh=EvMSNzajSi6O5WpCKkZyZCpUnUoeyMLx3daTKzl4MIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OuOHvUZXq9RSjUsJphrI10jp6CUx2DIs8D/xqSM1Y37a+yODTd7QSfpiGH9+wSFHf+/QhB/wr4T1WAfNPI6IISMoO1Q1Zq0gp6vbnojyVDGBStHrHbNlroHBHzByFvrrnpQqUG26PhBW4YSR1ErltZyXsAKmxKQyKo43cfxcaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crPtd08b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752826961; x=1784362961;
  h=date:from:to:cc:subject:message-id;
  bh=EvMSNzajSi6O5WpCKkZyZCpUnUoeyMLx3daTKzl4MIw=;
  b=crPtd08bBZojQjyw4brBwfT9DY3A334H6aC+ygJajblll7PnnlzX+U7v
   sccd1Lf5reVtgmLX7CWvBwBxUcIYhyfCUp888c8UWmO5pVDXTxuFxgHCb
   opzoUQzeirwL74fal1YtVa27PeGlOBm0XG41iyoiuM9nqej/f2uifKHbb
   RHvTSeQCdYMYDtMY2OxI/yNvP2xCKYtZBMV77Nx896lKsciCebjfuyzYS
   dfUULLxB/JYMbmH9BvPK67g7b3e7C8koyY3oZ5rwplGRr2As9CcqY3hLI
   y1cw1QYF9sH2Nx85RM93r67E9RtRG5cOCqmdSTQYAJirdTy2w4bT0ch99
   g==;
X-CSE-ConnectionGUID: 84UuzjUORluCLDuMeTDUkA==
X-CSE-MsgGUID: 7Afiz1C1QMCoB9tKxsec4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58780372"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="58780372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:22:38 -0700
X-CSE-ConnectionGUID: h3jD88BsQ9uSujfMVaSrmw==
X-CSE-MsgGUID: UsK6IzPgQ4qnThDb4CF8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158082452"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2025 01:22:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgMV-000ERH-2L;
	Fri, 18 Jul 2025 08:22:35 +0000
Date: Fri, 18 Jul 2025 16:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f72b9aa821a2bfe4b6dfec4be19f264d0673b008
Message-ID: <202507181646.W1qQzaNQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f72b9aa821a2bfe4b6dfec4be19f264d0673b008  usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command

elapsed time: 1396m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250717    gcc-8.5.0
arc                   randconfig-002-20250717    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250717    clang-21
arm                   randconfig-002-20250717    gcc-8.5.0
arm                   randconfig-003-20250717    gcc-8.5.0
arm                   randconfig-004-20250717    clang-21
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250717    clang-18
arm64                 randconfig-002-20250717    clang-18
arm64                 randconfig-003-20250717    gcc-10.5.0
arm64                 randconfig-004-20250717    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250717    gcc-15.1.0
csky                  randconfig-002-20250717    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250717    clang-20
hexagon               randconfig-002-20250717    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250717    gcc-12
i386        buildonly-randconfig-002-20250717    gcc-12
i386        buildonly-randconfig-003-20250717    clang-20
i386        buildonly-randconfig-004-20250717    clang-20
i386        buildonly-randconfig-005-20250717    clang-20
i386        buildonly-randconfig-006-20250717    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250717    gcc-15.1.0
loongarch             randconfig-002-20250717    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250717    gcc-8.5.0
nios2                 randconfig-002-20250717    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250717    gcc-9.3.0
parisc                randconfig-002-20250717    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250717    clang-21
powerpc               randconfig-002-20250717    gcc-13.4.0
powerpc               randconfig-003-20250717    clang-21
powerpc64             randconfig-001-20250717    clang-21
powerpc64             randconfig-002-20250717    clang-18
powerpc64             randconfig-003-20250717    clang-21
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250717    gcc-14.3.0
riscv                 randconfig-002-20250717    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                  randconfig-001-20250717    gcc-8.5.0
s390                  randconfig-002-20250717    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250717    gcc-14.3.0
sh                    randconfig-002-20250717    gcc-9.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250717    gcc-14.3.0
sparc                 randconfig-002-20250717    gcc-8.5.0
sparc64               randconfig-001-20250717    gcc-12.4.0
sparc64               randconfig-002-20250717    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250717    gcc-12
um                    randconfig-002-20250717    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250717    clang-20
x86_64      buildonly-randconfig-002-20250717    clang-20
x86_64      buildonly-randconfig-003-20250717    clang-20
x86_64      buildonly-randconfig-004-20250717    gcc-12
x86_64      buildonly-randconfig-005-20250717    gcc-12
x86_64      buildonly-randconfig-006-20250717    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250717    gcc-13.4.0
xtensa                randconfig-002-20250717    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

