Return-Path: <linux-usb+bounces-32447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888DD38C6B
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 06:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90B23303195D
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 05:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBFB2E92BA;
	Sat, 17 Jan 2026 05:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmQCqzWj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9817D500962
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 05:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768626104; cv=none; b=DhpDVNbM23mqVdOvWs5nWgzERx/ye5ZzcqDK2N1Xf1C4+9ym7YBRUOQ4MXBzuxasPNXw7T1Y0Pa7yNIFN1WxdCNjCgaNbCjvUj06zMgrMhkD1dNT7iWO4XikU2E/sgfUExCpeGxbLIdytOcj4YBSrS1kP6cAypx75z2vMlChfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768626104; c=relaxed/simple;
	bh=5q6/3oprFH5S+esZcyluVHpPJHxaQK7mVMd1hPQZ/j0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jhxyWH/vPReSCcd6Db0r9/aYMC+Q4Dyg12kDBSwSOpmG+IATYW4Lif8SZA/JLqqs8iKX8dyBI4d1S/UfWgo6KesZGhNlbUeRSS4CWD0agQQhLzNUltMvtdkhsVyu9qYKUYKWDCMDk0AklqHmZnXl4AG1HOV5zigsswVLjbGHFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmQCqzWj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768626102; x=1800162102;
  h=date:from:to:cc:subject:message-id;
  bh=5q6/3oprFH5S+esZcyluVHpPJHxaQK7mVMd1hPQZ/j0=;
  b=XmQCqzWjbd30JazW402HmPU7H67yzPO2ol6RB38uDToOUT+w53nsivx7
   MrvDsMG6v3U7iHqEgZDTWNnOWYmqBVg0ymOm/16ayrCRrMcAjNwIXXKK0
   4AGuf1N8A4S3P9si9mRMOAVvV2sEArUNxJ+sXGbJs+1uUaUkY8RjxDU02
   n6cciix4h8Etsy/d6sSVD8fzIy7mDBE7Rg31LY/719Bl53hOZ0Hak8UbH
   0Ao2q1uadJMAWysDgbIMofk5N3hXoQ2Dd5FtuRN2R5XLDM6JGLvNGuMLq
   weEN5CyIq3VV66b+LIPUMA1/qKtutirJqe/uOnZk/2+653OHlhE7tqCE7
   w==;
X-CSE-ConnectionGUID: MuQORw/8S6uJkkhZipu4Kw==
X-CSE-MsgGUID: hguUNvstR+2Q/uIaH4LhPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68945901"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="68945901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 21:01:42 -0800
X-CSE-ConnectionGUID: 8qDidh/SQQaC4ktooa8HTg==
X-CSE-MsgGUID: z5O+ZnjhRr2vucDSrFBd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205824455"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 21:01:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgyRO-00000000LZx-0Nwe;
	Sat, 17 Jan 2026 05:01:38 +0000
Date: Sat, 17 Jan 2026 13:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 dd83dc1249737b837ac5d57c81f2b0977c613d9f
Message-ID: <202601171333.HCBop3Jb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: dd83dc1249737b837ac5d57c81f2b0977c613d9f  xhci: sideband: don't dereference freed ring when removing sideband endpoint

elapsed time: 1055m

configs tested: 234
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs103_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    clang-22
arc                         haps_hs_defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-001-20260117    gcc-12.5.0
arc                   randconfig-002-20260116    gcc-8.5.0
arc                   randconfig-002-20260117    gcc-12.5.0
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                             mxs_defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-001-20260117    gcc-12.5.0
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-002-20260117    gcc-12.5.0
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-003-20260117    gcc-12.5.0
arm                   randconfig-004-20260116    gcc-8.5.0
arm                   randconfig-004-20260117    gcc-12.5.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           stm32_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260117    clang-22
arm64                 randconfig-002-20260117    clang-22
arm64                 randconfig-003-20260117    clang-22
arm64                 randconfig-004-20260117    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260117    clang-22
csky                  randconfig-002-20260117    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-001-20260117    clang-22
hexagon               randconfig-002-20260116    clang-20
hexagon               randconfig-002-20260117    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-001-20260117    gcc-13
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-002-20260117    gcc-13
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-003-20260117    gcc-13
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-004-20260117    gcc-13
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-005-20260117    gcc-13
i386        buildonly-randconfig-006-20260116    gcc-12
i386        buildonly-randconfig-006-20260117    gcc-13
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260117    gcc-14
i386                  randconfig-002-20260117    gcc-14
i386                  randconfig-003-20260117    gcc-14
i386                  randconfig-004-20260117    gcc-14
i386                  randconfig-005-20260117    gcc-14
i386                  randconfig-006-20260117    gcc-14
i386                  randconfig-007-20260117    gcc-14
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-011-20260117    gcc-14
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-012-20260117    gcc-14
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-013-20260117    gcc-14
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-014-20260117    gcc-14
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-015-20260117    gcc-14
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-016-20260117    gcc-14
i386                  randconfig-017-20260116    clang-20
i386                  randconfig-017-20260117    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-001-20260117    clang-22
loongarch             randconfig-002-20260116    clang-20
loongarch             randconfig-002-20260117    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-22
mips                         bigsur_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                           ip30_defconfig    clang-22
mips                      loongson3_defconfig    gcc-15.2.0
mips                          malta_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-001-20260117    clang-22
nios2                 randconfig-002-20260116    clang-20
nios2                 randconfig-002-20260117    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-002-20260117    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc                      ppc64e_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-002-20260117    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260117    gcc-10.5.0
riscv                 randconfig-002-20260117    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260117    gcc-10.5.0
s390                  randconfig-002-20260117    gcc-10.5.0
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260117    gcc-10.5.0
sh                    randconfig-002-20260117    gcc-10.5.0
sh                           se7750_defconfig    gcc-15.2.0
sh                           se7751_defconfig    clang-22
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260117    gcc-14.3.0
sparc                 randconfig-002-20260117    gcc-14.3.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260117    gcc-14.3.0
sparc64               randconfig-002-20260117    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260117    gcc-14.3.0
um                    randconfig-002-20260117    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260117    clang-20
x86_64      buildonly-randconfig-002-20260117    clang-20
x86_64      buildonly-randconfig-003-20260117    clang-20
x86_64      buildonly-randconfig-004-20260117    clang-20
x86_64      buildonly-randconfig-005-20260117    clang-20
x86_64      buildonly-randconfig-006-20260117    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-001-20260117    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-002-20260117    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-003-20260117    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-004-20260117    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-005-20260117    clang-20
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-006-20260117    clang-20
x86_64                randconfig-011-20260117    clang-20
x86_64                randconfig-012-20260117    clang-20
x86_64                randconfig-013-20260117    clang-20
x86_64                randconfig-014-20260117    clang-20
x86_64                randconfig-015-20260117    clang-20
x86_64                randconfig-016-20260117    clang-20
x86_64                randconfig-071-20260117    clang-20
x86_64                randconfig-072-20260117    clang-20
x86_64                randconfig-073-20260117    clang-20
x86_64                randconfig-074-20260117    clang-20
x86_64                randconfig-075-20260117    clang-20
x86_64                randconfig-076-20260117    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260117    gcc-14.3.0
xtensa                randconfig-002-20260117    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

