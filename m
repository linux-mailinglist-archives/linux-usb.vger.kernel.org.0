Return-Path: <linux-usb+bounces-21841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB07A6725A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 12:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8332A7A492E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 11:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2610220371E;
	Tue, 18 Mar 2025 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n71NkDty"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39601AA1E0
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296551; cv=none; b=Bly12Wx6JpXi5K6u+0FXxD/nj4VqOF8kjpCY2V+KedZtBtCNaO5gJxMXfRxXJUr/kJIITaXpUN8/7gF2v1RG6vqVl7pPKUYZryVma9cZuUd+yNfrXpoCyzl2UYxrV9Eibf14AKN+bv6DlFutJ11hXV0OaF98dKatqtX8u5WxP3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296551; c=relaxed/simple;
	bh=5K4p6IJTom9APqsYZ9HbZv+WQX1xrJ1daUFtBxtSa+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3CDAU3RmRbhrzd2SSzC8nbEIFmfumxW6mVlrVwEDaZOePKI2KD3BQhsOeciaz+ZUr6nj9GNkpHzmYVG03cQfnR8W4Yh22X28MLlu5jyeQgh0r3yJAVGO0D4l1W2F2MkNRul6m5eufRskv/8A7GFsu+zlIAPAuZlMyK8445kM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n71NkDty; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742296546; x=1773832546;
  h=date:from:to:cc:subject:message-id;
  bh=5K4p6IJTom9APqsYZ9HbZv+WQX1xrJ1daUFtBxtSa+o=;
  b=n71NkDtyfnfqkoXdDNJS1FkYQTXdzbnzoA98TPQp5g6UoC2qKy68ZIbk
   yAnkssE2E+t8devFqYE6VY0FrT7KN/nC/rNE1a05YRBdKTx4rvObkPDwm
   1sX6goxnTduU3QLo6y1e4MnMu9ZR4lUxQ82W0QTbmI25u7S1T3xxFUPbv
   Jk+WxcyfWSBnw6b3m7GhgtDMHCRukxsbtptFL0thm+ccmYrjHjXEY2Ui1
   yr16oe/pZYjLoXChArS/CIJsS5/3yXV+H0EhZ4jH5B2xubA1pMRy0+ALb
   G7TxdHCklKvq7V8E4Il3baGyoqqoEyHGrfOv/bBMe8Db3J/yCpEH4DFaO
   A==;
X-CSE-ConnectionGUID: WvN17kTLQfOTu9NXgWuT7Q==
X-CSE-MsgGUID: BO3DVF5PQgO6edwOigQVmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54060462"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54060462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 04:15:45 -0700
X-CSE-ConnectionGUID: nrH6XUa4Thqqdh4GTDvaeg==
X-CSE-MsgGUID: jHljHW8UR7iuOLB4+gCdzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="126890612"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2025 04:15:44 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuUv7-000DhW-3C;
	Tue, 18 Mar 2025 11:15:41 +0000
Date: Tue, 18 Mar 2025 19:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 ad79c278e478ca8c1a3bf8e7a0afba8f862a48a1
Message-ID: <202503181952.dtN7QRxC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: ad79c278e478ca8c1a3bf8e7a0afba8f862a48a1  thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer

elapsed time: 1464m

configs tested: 213
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.3.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250317    gcc-13.2.0
arc                   randconfig-002-20250317    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                      integrator_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250317    gcc-14.2.0
arm                   randconfig-002-20250317    gcc-14.2.0
arm                   randconfig-003-20250317    gcc-14.2.0
arm                   randconfig-004-20250317    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    clang-15
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250317    gcc-14.2.0
arm64                 randconfig-002-20250317    gcc-14.2.0
arm64                 randconfig-003-20250317    gcc-14.2.0
arm64                 randconfig-004-20250317    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250317    gcc-14.2.0
csky                  randconfig-001-20250318    gcc-8.5.0
csky                  randconfig-002-20250317    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250317    clang-21
hexagon               randconfig-001-20250318    gcc-8.5.0
hexagon               randconfig-002-20250317    clang-21
hexagon               randconfig-002-20250318    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250317    gcc-12
i386        buildonly-randconfig-002-20250317    clang-20
i386        buildonly-randconfig-003-20250317    clang-20
i386        buildonly-randconfig-004-20250317    clang-20
i386        buildonly-randconfig-005-20250317    gcc-12
i386        buildonly-randconfig-006-20250317    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250318    clang-20
i386                  randconfig-002-20250318    clang-20
i386                  randconfig-003-20250318    clang-20
i386                  randconfig-004-20250318    clang-20
i386                  randconfig-005-20250318    clang-20
i386                  randconfig-006-20250318    clang-20
i386                  randconfig-007-20250318    clang-20
i386                  randconfig-011-20250318    clang-20
i386                  randconfig-012-20250318    clang-20
i386                  randconfig-013-20250318    clang-20
i386                  randconfig-014-20250318    clang-20
i386                  randconfig-015-20250318    clang-20
i386                  randconfig-016-20250318    clang-20
i386                  randconfig-017-20250318    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250317    gcc-14.2.0
loongarch             randconfig-001-20250318    gcc-8.5.0
loongarch             randconfig-002-20250317    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-8.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-11.5.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-11.5.0
m68k                          sun3x_defconfig    gcc-5.5.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-11.5.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250317    gcc-14.2.0
nios2                 randconfig-001-20250318    gcc-8.5.0
nios2                 randconfig-002-20250317    gcc-14.2.0
nios2                 randconfig-002-20250318    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-5.5.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-5.5.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250317    gcc-14.2.0
parisc                randconfig-001-20250318    gcc-8.5.0
parisc                randconfig-002-20250317    gcc-14.2.0
parisc                randconfig-002-20250318    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-5.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-5.5.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250317    clang-15
powerpc               randconfig-001-20250318    gcc-8.5.0
powerpc               randconfig-002-20250317    clang-21
powerpc               randconfig-002-20250318    gcc-8.5.0
powerpc               randconfig-003-20250317    gcc-14.2.0
powerpc               randconfig-003-20250318    gcc-8.5.0
powerpc                     redwood_defconfig    clang-21
powerpc64             randconfig-001-20250317    gcc-14.2.0
powerpc64             randconfig-001-20250318    gcc-8.5.0
powerpc64             randconfig-002-20250317    gcc-14.2.0
powerpc64             randconfig-002-20250318    gcc-8.5.0
powerpc64             randconfig-003-20250317    clang-21
powerpc64             randconfig-003-20250318    gcc-8.5.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-5.5.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250317    gcc-14.2.0
riscv                 randconfig-002-20250317    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250317    clang-15
s390                  randconfig-002-20250317    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-11.5.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250317    gcc-14.2.0
sh                    randconfig-002-20250317    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-11.5.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250317    gcc-14.2.0
sparc                 randconfig-002-20250317    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250317    gcc-14.2.0
sparc64               randconfig-002-20250317    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250317    gcc-12
um                    randconfig-002-20250317    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250317    gcc-12
x86_64      buildonly-randconfig-002-20250317    clang-20
x86_64      buildonly-randconfig-003-20250317    gcc-12
x86_64      buildonly-randconfig-004-20250317    gcc-12
x86_64      buildonly-randconfig-005-20250317    gcc-12
x86_64      buildonly-randconfig-006-20250317    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250318    gcc-12
x86_64                randconfig-002-20250318    gcc-12
x86_64                randconfig-003-20250318    gcc-12
x86_64                randconfig-004-20250318    gcc-12
x86_64                randconfig-005-20250318    gcc-12
x86_64                randconfig-006-20250318    gcc-12
x86_64                randconfig-007-20250318    gcc-12
x86_64                randconfig-008-20250318    gcc-12
x86_64                randconfig-071-20250318    gcc-12
x86_64                randconfig-072-20250318    gcc-12
x86_64                randconfig-073-20250318    gcc-12
x86_64                randconfig-074-20250318    gcc-12
x86_64                randconfig-075-20250318    gcc-12
x86_64                randconfig-076-20250318    gcc-12
x86_64                randconfig-077-20250318    gcc-12
x86_64                randconfig-078-20250318    gcc-12
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-11.5.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250317    gcc-14.2.0
xtensa                randconfig-002-20250317    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

