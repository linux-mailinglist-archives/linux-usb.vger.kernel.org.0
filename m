Return-Path: <linux-usb+bounces-20736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA2A39116
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 04:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4960E1894CA7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 03:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1743D155A4D;
	Tue, 18 Feb 2025 03:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cg6j8yig"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48B9475
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739847798; cv=none; b=l+Tin4GwyIcS87gdj1v8cyT+/KvUNpTT+AvEnlsYm9KC+QQZPr4cTUpo866ATJnAoGJPB0QgD3YzVTu9+/0LB8Vsjfs0TVCed06+JY2iHYDfIf0dM3xOR7h8D+44OzXM9cIVA42IYt0XF60QZyZKLBkrF7Qn+KeuSYcjc9gNUy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739847798; c=relaxed/simple;
	bh=Wub5873HXFjQ3BMx7W/th7zUS+oebbC+vbVMOOHjGko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijk69OYSK8fAl22D96sa0dofxykXE+YyHBerm+yIIr2lInHT9GcJIWzk+PGqkQ4eF2gLe8w+9Dmfr91xjETeTNqvcq9vxjLGvRQHlf7fEQPffGRTvRZFd17nLzAAKxBG9Vyb/Xo4sJa7X5RICdRxKT7IteaEJut9OGrTMrF+by8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cg6j8yig; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739847797; x=1771383797;
  h=date:from:to:cc:subject:message-id;
  bh=Wub5873HXFjQ3BMx7W/th7zUS+oebbC+vbVMOOHjGko=;
  b=Cg6j8yigoxWaC05Aspf00uAY8UnM2+8uJbcjhtc+46TZ17vDjhIoJAg9
   BSuj+APNkYxF+0SqC6yMMmmilNwJRBhZx5XWozkW4rQf8YIPRedPjSUjC
   Cm86yqF8tK6XmztHV/tebYdypvkMby+JJgzpcM4lbbI2sk7LUvf9b8DAJ
   q7h0HncjyPOyfWivvUkQDu9MbAhCawJUW0y0N7IIqsMAKSRWBvhCDYs8B
   9PpX0Ea+9GR/Q/NqQcD+KUdWRnjDFLl1v14GrDcUVYmXZB3Z5+dDBFnsi
   ++iGfo8s+5+0J1PbOk9iykJVvTP23pzVBinqMfcMCa4zIN//cudf5cbE6
   w==;
X-CSE-ConnectionGUID: 0bF8xKqlSSOsnOdT08dHKg==
X-CSE-MsgGUID: P+zbEZDMQ3aqiRlpM5n71Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51963177"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51963177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 19:02:16 -0800
X-CSE-ConnectionGUID: hpp5HPFdQkmWwlMSG8i+mw==
X-CSE-MsgGUID: jlkByJWDQmS9rMJ5b6qvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151462296"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 19:02:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkDrq-00006Y-1W;
	Tue, 18 Feb 2025 03:02:00 +0000
Date: Tue, 18 Feb 2025 11:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f8da37e46253316d29a274a6747cb69007bc81f2
Message-ID: <202502181115.IP5mfyE2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f8da37e46253316d29a274a6747cb69007bc81f2  Merge 6.14-rc3 into usb-next

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250217
|   `-- arch-arm64-boot-dts-hisilicon-hi3660-hikey960.dtb:usb-ff100000:Unevaluated-properties-are-not-allowed-(-dr_mode-maximum-speed-phy-names-phy_type-phys-port-resets-role-switch-default-mode-snps-dis-del-
|-- arm64-randconfig-052-20250217
|   `-- arch-arm64-boot-dts-hisilicon-hi3660-hikey960.dtb:usb-ff100000:Unevaluated-properties-are-not-allowed-(-dr_mode-maximum-speed-phy-names-phy_type-phys-port-resets-role-switch-default-mode-snps-dis-del-
|-- arm64-randconfig-053-20250217
|   `-- arch-arm64-boot-dts-hisilicon-hi3660-hikey960.dtb:usb-ff100000:Unevaluated-properties-are-not-allowed-(-dr_mode-maximum-speed-phy-names-phy_type-phys-port-resets-role-switch-default-mode-snps-dis-del-
|-- arm64-randconfig-054-20250217
|   `-- arch-arm64-boot-dts-hisilicon-hi3660-hikey960.dtb:usb-ff100000:Unevaluated-properties-are-not-allowed-(-dr_mode-maximum-speed-phy-names-phy_type-phys-port-resets-role-switch-default-mode-snps-dis-del-
`-- arm64-randconfig-055-20250217
    `-- arch-arm64-boot-dts-hisilicon-hi3660-hikey960.dtb:usb-ff100000:Unevaluated-properties-are-not-allowed-(-dr_mode-maximum-speed-phy-names-phy_type-phys-port-resets-role-switch-default-mode-snps-dis-del-

elapsed time: 1156m

configs tested: 139
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250217    gcc-13.2.0
arc                   randconfig-002-20250217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250217    gcc-14.2.0
arm                   randconfig-002-20250217    gcc-14.2.0
arm                   randconfig-003-20250217    gcc-14.2.0
arm                   randconfig-004-20250217    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250217    gcc-14.2.0
arm64                 randconfig-002-20250217    clang-21
arm64                 randconfig-003-20250217    clang-15
arm64                 randconfig-004-20250217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250217    gcc-14.2.0
csky                  randconfig-002-20250217    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250217    clang-21
hexagon               randconfig-002-20250217    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250217    clang-19
i386        buildonly-randconfig-002-20250217    gcc-12
i386        buildonly-randconfig-003-20250217    clang-19
i386        buildonly-randconfig-004-20250217    gcc-12
i386        buildonly-randconfig-005-20250217    gcc-12
i386        buildonly-randconfig-006-20250217    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250217    gcc-14.2.0
loongarch             randconfig-002-20250217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
mips                          rb532_defconfig    clang-17
mips                       rbtx49xx_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250217    gcc-14.2.0
nios2                 randconfig-002-20250217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250217    gcc-14.2.0
parisc                randconfig-002-20250217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250217    clang-17
powerpc               randconfig-002-20250217    clang-15
powerpc               randconfig-003-20250217    gcc-14.2.0
powerpc                     redwood_defconfig    clang-21
powerpc64             randconfig-001-20250217    clang-19
powerpc64             randconfig-002-20250217    clang-21
powerpc64             randconfig-003-20250217    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250217    gcc-14.2.0
riscv                 randconfig-002-20250217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250217    gcc-14.2.0
s390                  randconfig-002-20250217    clang-18
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250217    gcc-14.2.0
sh                    randconfig-002-20250217    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250217    gcc-14.2.0
sparc                 randconfig-002-20250217    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250217    gcc-14.2.0
sparc64               randconfig-002-20250217    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250217    clang-19
um                    randconfig-002-20250217    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250217    gcc-12
x86_64      buildonly-randconfig-002-20250217    clang-19
x86_64      buildonly-randconfig-003-20250217    clang-19
x86_64      buildonly-randconfig-004-20250217    gcc-12
x86_64      buildonly-randconfig-005-20250217    gcc-12
x86_64      buildonly-randconfig-006-20250217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250217    gcc-14.2.0
xtensa                randconfig-002-20250217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

