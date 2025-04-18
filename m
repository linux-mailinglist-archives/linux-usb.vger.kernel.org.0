Return-Path: <linux-usb+bounces-23220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B72A935E7
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 12:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C587189BC59
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE3A26FDA1;
	Fri, 18 Apr 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcJ/TK+P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A59204C26
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971437; cv=none; b=u6YsSukEx3Kcbg+ej9p/4TbulgEalDVsoA4Jcam6LrUH6CLJBZQBxOM69cpdXiAKvLzeeP871WQYYJZa5FRJ/dbg7kF8G5uF2xIBe0c56Z+e/aYzyK6ysZouC7q9Si+HAEFCQorCBsK7AdxhJcN3/8Ugq23g8R4MNxywnQxGkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971437; c=relaxed/simple;
	bh=DeFdHFLLHRTgr0PQs0tWuJkwotc2Ea0En6IbUcXJkqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E5XHfxjNHFfPqmqQ22EH7KQ07Kz3HXwW/JBlkUkpn0L0ehOsc2LUDVEFTScIrKaygHDwSpMGZz2nrgVRkTwXGAXdxhVV4HE4uVr9kDfMriyIPqX0r5e2qhY/hX2Qoeh8Cq/FtdFahF9Hef0oKZKMxBbCFp3qtRFROKw15jaaXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcJ/TK+P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744971435; x=1776507435;
  h=date:from:to:cc:subject:message-id;
  bh=DeFdHFLLHRTgr0PQs0tWuJkwotc2Ea0En6IbUcXJkqY=;
  b=WcJ/TK+Pvk+01kZoIlYr9torCwI3PvtRc3ewRgeFMz6SgGNywT3X+Zem
   sg1ko07YpTjTj9PyX4ZZ3QrU2RaPGIpHCdTWjfwT6HEWQuizbINeoQ7Uj
   hZUCc/DoXZhEpfNzWCsnkVlDzQLdBqyL2owdjcftxUrEY7uuD3fu+GU7y
   g/vkgYY+F86vD72n4FYmW8LdFOhqmNqQ+ys2lKz2ldbKbrakja9t9M5uE
   b/06Qq0gAQMfXhoQrmocMWe+HhCgLi5fsiPRQse0kC84WcWBarTXn7U9q
   BI+6Nc6J6q0yO7DvmE9yjaNkb/zijg7AqqZKFgfYurACNY5aOatrykK0p
   g==;
X-CSE-ConnectionGUID: 98b9rSxPS6mbVVoWEnXJAQ==
X-CSE-MsgGUID: ft0mcMKTRpCByiHRjm/d4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="56770121"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="56770121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 03:17:14 -0700
X-CSE-ConnectionGUID: 19ySRq9wQAKp+8y/rk3zjQ==
X-CSE-MsgGUID: ZQtnNSPsRdCDy7rf+27ZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="135934450"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Apr 2025 03:17:14 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5imV-0002lB-0A;
	Fri, 18 Apr 2025 10:17:11 +0000
Date: Fri, 18 Apr 2025 18:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 4fd7a1f0f7f281dcbdf2e42a2e30b6d2159deaf4
Message-ID: <202504181822.8apQH2G2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 4fd7a1f0f7f281dcbdf2e42a2e30b6d2159deaf4  usb: typec: Connect Type-C port with associated USB4 port

elapsed time: 1467m

configs tested: 110
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-21
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250417    gcc-13.3.0
csky                  randconfig-002-20250417    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250417    clang-21
hexagon               randconfig-002-20250417    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250417    clang-20
i386        buildonly-randconfig-002-20250417    gcc-12
i386        buildonly-randconfig-003-20250417    gcc-12
i386        buildonly-randconfig-004-20250417    gcc-12
i386        buildonly-randconfig-005-20250417    clang-20
i386        buildonly-randconfig-006-20250417    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250417    gcc-14.2.0
loongarch             randconfig-002-20250417    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250417    gcc-7.5.0
riscv                 randconfig-002-20250417    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250417    gcc-7.5.0
s390                  randconfig-002-20250417    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                    randconfig-001-20250417    gcc-13.3.0
sh                    randconfig-002-20250417    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250417    gcc-12.4.0
sparc                 randconfig-002-20250417    gcc-14.2.0
sparc64               randconfig-001-20250417    gcc-14.2.0
sparc64               randconfig-002-20250417    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250417    gcc-12
um                    randconfig-002-20250417    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250417    clang-20
x86_64      buildonly-randconfig-002-20250417    clang-20
x86_64      buildonly-randconfig-003-20250417    gcc-12
x86_64      buildonly-randconfig-004-20250417    clang-20
x86_64      buildonly-randconfig-005-20250417    clang-20
x86_64      buildonly-randconfig-006-20250417    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250417    gcc-8.5.0
xtensa                randconfig-002-20250417    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

