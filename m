Return-Path: <linux-usb+bounces-25233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DAAECB2B
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 05:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 358C7175551
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 03:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679B7175D53;
	Sun, 29 Jun 2025 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOm/6gtM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A5125D6
	for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 03:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751168266; cv=none; b=lIbTk4QFerHgRgwTSQzKCrt2IBiJiqys++L9TnJ94iGSRdqmKacbnzj9JEMkBXur5muRxOu5mBAGRpH4xAzFC+DyKaHzAQ/N3MXeRvjJLtO0lKGzwQyIU4CYGvaFoiP3mbUkporsOJnq29rzgJJ2ThFNzxZXGdrS14U8c9AOXt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751168266; c=relaxed/simple;
	bh=KNocVvdVXI1syioc2Sbg/lyhjGSTCfWOnoP7tKAPwhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ipU/IGL9kL12X5vR6LWEeubWUUVYCrLSxxynRWi/rDkm6PJ6ome9J6F+jlj+n0Ub09MHeOlB4BIED7lSXJYnaFqAjsqtmKu703aAC89O7kawJJduUkPdWk5V1G+WZtXyEReMdCc4dL0F1HVXpd6nzCx5UQEmOqGuVEoeMx30aeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOm/6gtM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751168262; x=1782704262;
  h=date:from:to:cc:subject:message-id;
  bh=KNocVvdVXI1syioc2Sbg/lyhjGSTCfWOnoP7tKAPwhA=;
  b=IOm/6gtMYUF5YnzQZFKy1H+GoOl24UqjZk9dcjXnMOaL1Vuc1sqLbpyS
   L7oqgXO/UPNGYeBARGeGt9koQ6S6JwvU0KhSwpGX6Sn227OhOdDGZEHqq
   ldBIwUOiwWZICuKCLKsz2UlwPzahCM77KYMwIemDh2QcrBq145GoEpxwe
   OW4/sBwHgBa6OGlg4NPWR8+bj71rnqaXYOEd/6Wpi0iXRsqBrb/t+KNpR
   LLJaFeNMxpRO5DrD728m5PknJmA3x7D9KQs5hAuXqTErscPVbLUFqv7GZ
   2oOm5/bB1AKFCF4PWNbcOhpVnttu5aaa8mx7cT2geDcSJ2VGJRJiR8Jrr
   g==;
X-CSE-ConnectionGUID: pSg/C7/ASAiBJzAQ52pAdw==
X-CSE-MsgGUID: PWkQCLmxRJ2JbcC5zR5xBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64486596"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="64486596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 20:37:40 -0700
X-CSE-ConnectionGUID: d/1GWop7Tpi55dH7+7kXfg==
X-CSE-MsgGUID: bO6iWICJSAG6ZdFMbtyTPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="157414634"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2025 20:37:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVirK-000Xdi-05;
	Sun, 29 Jun 2025 03:37:38 +0000
Date: Sun, 29 Jun 2025 11:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 efe3e3ae5a66cb38ef29c909e951b4039044bae9
Message-ID: <202506291107.RFakJnMg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: efe3e3ae5a66cb38ef29c909e951b4039044bae9  xhci: dbc: Flush queued requests before stopping dbc

elapsed time: 726m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250629    gcc-8.5.0
arc                   randconfig-002-20250629    gcc-13.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250629    clang-21
arm                   randconfig-002-20250629    gcc-12.4.0
arm                   randconfig-003-20250629    gcc-8.5.0
arm                   randconfig-004-20250629    gcc-12.4.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250629    gcc-13.3.0
arm64                 randconfig-002-20250629    clang-19
arm64                 randconfig-003-20250629    gcc-14.3.0
arm64                 randconfig-004-20250629    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250629    gcc-15.1.0
csky                  randconfig-002-20250629    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250629    clang-21
hexagon               randconfig-002-20250629    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250629    clang-20
i386        buildonly-randconfig-002-20250629    clang-20
i386        buildonly-randconfig-003-20250629    clang-20
i386        buildonly-randconfig-004-20250629    gcc-12
i386        buildonly-randconfig-005-20250629    clang-20
i386        buildonly-randconfig-006-20250629    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250629    gcc-15.1.0
loongarch             randconfig-002-20250629    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250629    gcc-9.3.0
nios2                 randconfig-002-20250629    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250629    gcc-10.5.0
parisc                randconfig-002-20250629    gcc-14.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250629    clang-21
powerpc               randconfig-002-20250629    gcc-13.3.0
powerpc               randconfig-003-20250629    gcc-11.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250629    clang-21
powerpc64             randconfig-002-20250629    gcc-8.5.0
powerpc64             randconfig-003-20250629    clang-20
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250629    clang-17
riscv                 randconfig-002-20250629    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250629    clang-21
s390                  randconfig-002-20250629    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250629    gcc-15.1.0
sh                    randconfig-002-20250629    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250629    gcc-10.3.0
sparc                 randconfig-002-20250629    gcc-8.5.0
sparc64               randconfig-001-20250629    gcc-8.5.0
sparc64               randconfig-002-20250629    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250629    gcc-11
um                    randconfig-002-20250629    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250629    gcc-12
x86_64      buildonly-randconfig-002-20250629    gcc-12
x86_64      buildonly-randconfig-003-20250629    clang-20
x86_64      buildonly-randconfig-004-20250629    gcc-12
x86_64      buildonly-randconfig-005-20250629    gcc-12
x86_64      buildonly-randconfig-006-20250629    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250629    gcc-8.5.0
xtensa                randconfig-002-20250629    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

