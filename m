Return-Path: <linux-usb+bounces-25413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D06AF5C88
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 17:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784424E3A2D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 15:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F7E27A12F;
	Wed,  2 Jul 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJe3BzH2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852372D3757
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469396; cv=none; b=H1ALXK0di+m0x+5IN0rRVmv7GNHeoqWA3RzzQzAjUmy3cJxboTs5GgZXXT8uzGksFFev8UkoAI7xYI5j7TR8IOQkfCxFDxOI6f+lJim4gh5tObKbfQWH0t6k3EYreiha+z5XPSbXiBgTo11MHH60vDIy3XolGFjJeVqhBESjHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469396; c=relaxed/simple;
	bh=lvtbA030rzdWpHJQ2TfHUYYHyKQfcZJCRaxmhxKs4U4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r/WjcZHVweAFNOWfTU+ni0Sm1iOEIrTHzxV6a1E7Qg0J+EfHLLh4/URM9/5RtYE1G+uigF37aCBNHJow/Ushxq1SDwknzsIPNtQBeHxKySRjL//l/TO+o/zZR5vDBIhDr3x9XQKHkfHJGu55tYq0tVAp0ZZeT4xV+KJksY2cD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJe3BzH2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469395; x=1783005395;
  h=date:from:to:cc:subject:message-id;
  bh=lvtbA030rzdWpHJQ2TfHUYYHyKQfcZJCRaxmhxKs4U4=;
  b=WJe3BzH2RVHM5lEauci3cRBduDUIKzqAKZVewJljG+BijKnOC08617Ug
   ZGlWWbUcqyBPYoJdL6cVSKx79dvv5a7inid3OcYQIzOscfOaXe5WRKfF8
   pEIpdyDx1KVH5pDJ1c8tGP3lt43MFX7HSRORd41hBi/wzcoSUPX5Skmmy
   xvdEpx0lzy5bpbeX7ZOGv8zO0Tuqx2c70oO3mH8z90RsgoCwiP6Ak/Bz8
   sRRY0pxCNicuq2Ii0I6tJNGM6vSnMVGBkklBGRLmkLD1xwpW02FzzBd8d
   q+oE7w9zcZGKmZ0yf0lXsQoSyiLW4gJ3LRC5HU/3x6EkPRq/a1CyX+2Wg
   Q==;
X-CSE-ConnectionGUID: qlIriCfaSgWaQ3K2TYdYtA==
X-CSE-MsgGUID: LcBNWufcSuu2Vp46UnG7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57582966"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57582966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:16:31 -0700
X-CSE-ConnectionGUID: 3yhzPr8UTGWipN7+8QgRdg==
X-CSE-MsgGUID: dkirLVWGQEuPOjDoOe3uiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="177783074"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2025 08:16:29 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWzCE-0000mj-1r;
	Wed, 02 Jul 2025 15:16:26 +0000
Date: Wed, 02 Jul 2025 23:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 cf16f408364efd8a68f39011a3b073c83a03612d
Message-ID: <202507022323.YmgxR5Ns-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: cf16f408364efd8a68f39011a3b073c83a03612d  usb: core: config: Prevent OOB read in SS endpoint companion parsing

elapsed time: 1448m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250702    gcc-10.5.0
arc                   randconfig-002-20250702    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          ep93xx_defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250702    clang-17
arm                   randconfig-002-20250702    clang-19
arm                   randconfig-003-20250702    clang-21
arm                   randconfig-004-20250702    clang-17
arm                           sama5_defconfig    gcc-15.1.0
arm                           sama7_defconfig    clang-21
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250702    clang-21
arm64                 randconfig-002-20250702    clang-21
arm64                 randconfig-003-20250702    clang-21
arm64                 randconfig-004-20250702    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250702    gcc-15.1.0
csky                  randconfig-002-20250702    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250702    clang-21
hexagon               randconfig-002-20250702    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250702    clang-20
i386        buildonly-randconfig-002-20250702    gcc-12
i386        buildonly-randconfig-003-20250702    clang-20
i386        buildonly-randconfig-004-20250702    clang-20
i386        buildonly-randconfig-005-20250702    gcc-12
i386        buildonly-randconfig-006-20250702    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250702    gcc-15.1.0
loongarch             randconfig-002-20250702    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250702    gcc-14.2.0
nios2                 randconfig-002-20250702    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250702    gcc-12.4.0
parisc                randconfig-002-20250702    gcc-9.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250702    gcc-11.5.0
powerpc               randconfig-002-20250702    gcc-11.5.0
powerpc               randconfig-003-20250702    clang-21
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250702    clang-21
powerpc64             randconfig-002-20250702    clang-19
powerpc64             randconfig-003-20250702    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250702    clang-21
riscv                 randconfig-002-20250702    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250702    gcc-10.5.0
s390                  randconfig-002-20250702    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250702    gcc-15.1.0
sh                    randconfig-002-20250702    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250702    gcc-12.4.0
sparc                 randconfig-002-20250702    gcc-15.1.0
sparc64               randconfig-001-20250702    gcc-9.3.0
sparc64               randconfig-002-20250702    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250702    clang-21
um                    randconfig-002-20250702    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250702    gcc-12
x86_64      buildonly-randconfig-002-20250702    gcc-11
x86_64      buildonly-randconfig-003-20250702    clang-20
x86_64      buildonly-randconfig-004-20250702    clang-20
x86_64      buildonly-randconfig-005-20250702    clang-20
x86_64      buildonly-randconfig-006-20250702    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250702    gcc-14.3.0
xtensa                randconfig-002-20250702    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

