Return-Path: <linux-usb+bounces-28043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4FB55EE9
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 08:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA415AC18D5
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 06:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DDB2E719B;
	Sat, 13 Sep 2025 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2UNra0s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD884A3E
	for <linux-usb@vger.kernel.org>; Sat, 13 Sep 2025 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757744264; cv=none; b=eLp0771Vd9smPFMfBgfzdPWxJqS3Tgb/upOIygx7uzvWrzDfx4R6OgIMeQZk+AIPzPr95zVM4Nr2FB4dRCMvTo4d2uQxclwpzAdhXe7VUVvmK14QwaILTWikhm8HoZ+YTk1Gd11vwzpN+JLy+ITOQNgwLIDaHhz2GkVZTekW6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757744264; c=relaxed/simple;
	bh=AT/89DwzPiffjHYEx8etva1sTydujvFnCGEEQG4mGy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P2f6h7lo9NJzyTMlzKEMnyTojufcvme8Jl+PpJSm+qQcXMHgFYtIvW6UzFrwClFMtfi5594DE+lLdQszMxHln/+GyVIVv+QwaUs9R0h/xY5eGKzR6NCsp5DiF8fZrOdceZT/2n3WnjhWbVd6vQrbtLGF5AzagaOZtutO4uZSL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2UNra0s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757744262; x=1789280262;
  h=date:from:to:cc:subject:message-id;
  bh=AT/89DwzPiffjHYEx8etva1sTydujvFnCGEEQG4mGy4=;
  b=M2UNra0sc8G14QfZOD0bg25DNoiK8FE44EtQt3v9lZ2dmLLsHFo5pU8L
   Nh8n2F67vcPYXJydtMKl6+xSK4HWzXvPbNL2sllRl/umVVmeQ6G+77LMR
   9j4+LVFQcqNn0A6FlVmYeGq1/qOs4izO++j+b36fW9aQIA3G//ecwtTx/
   EU9asv23Nihzih9DgsBOPPTcr54k5VtU8WblMvZT/k/8B4A4NSFj9UQn0
   pvitWgmhfjrXYddoUB/nO3H71YUxJamo+LRg2LkH3KtzhQMCsCNbaBEnK
   Dgw/9Tj+Zje6SiUVHTCZVFSVTgYiR9FbJM+wXc88ypPHwWUTX3KdWISW+
   w==;
X-CSE-ConnectionGUID: AUMIosivTwK5OJa0/bnEOg==
X-CSE-MsgGUID: q32Zx3qNSnSYAD1Ro1Hlmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77538738"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="77538738"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 23:17:41 -0700
X-CSE-ConnectionGUID: /kYjCAn8Qp2mxbOePnCMoA==
X-CSE-MsgGUID: YI37m+1HQZW1EQKyRFJPAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="179333863"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2025 23:17:40 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxJZp-0001OW-39;
	Sat, 13 Sep 2025 06:17:37 +0000
Date: Sat, 13 Sep 2025 14:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 00f2bf97544cdc7e5b166d19f896f5eaa2bb02ae
Message-ID: <202509131411.YbI0SHYH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 00f2bf97544cdc7e5b166d19f896f5eaa2bb02ae  MAINTAINERS: Update Michael Jamet's maintainer entries

elapsed time: 1450m

configs tested: 236
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250912    gcc-10.5.0
arc                   randconfig-001-20250913    gcc-8.5.0
arc                   randconfig-002-20250912    gcc-12.5.0
arc                   randconfig-002-20250913    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          exynos_defconfig    clang-22
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20250912    clang-22
arm                   randconfig-001-20250913    gcc-8.5.0
arm                   randconfig-002-20250912    gcc-14.3.0
arm                   randconfig-002-20250913    gcc-8.5.0
arm                   randconfig-003-20250912    clang-22
arm                   randconfig-003-20250913    gcc-8.5.0
arm                   randconfig-004-20250912    gcc-10.5.0
arm                   randconfig-004-20250913    gcc-8.5.0
arm                        realview_defconfig    clang-22
arm                           sama5_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250912    clang-20
arm64                 randconfig-001-20250913    gcc-8.5.0
arm64                 randconfig-002-20250912    clang-16
arm64                 randconfig-002-20250913    gcc-8.5.0
arm64                 randconfig-003-20250912    clang-22
arm64                 randconfig-003-20250913    gcc-8.5.0
arm64                 randconfig-004-20250912    clang-19
arm64                 randconfig-004-20250913    gcc-8.5.0
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250912    gcc-15.1.0
csky                  randconfig-001-20250913    clang-16
csky                  randconfig-002-20250912    gcc-11.5.0
csky                  randconfig-002-20250913    clang-16
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-001-20250913    clang-16
hexagon               randconfig-002-20250912    clang-22
hexagon               randconfig-002-20250913    clang-16
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250912    gcc-14
i386        buildonly-randconfig-002-20250912    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250912    clang-20
i386        buildonly-randconfig-005-20250912    gcc-14
i386        buildonly-randconfig-006-20250912    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250913    gcc-14
i386                  randconfig-002-20250913    gcc-14
i386                  randconfig-003-20250913    gcc-14
i386                  randconfig-004-20250913    gcc-14
i386                  randconfig-005-20250913    gcc-14
i386                  randconfig-006-20250913    gcc-14
i386                  randconfig-007-20250913    gcc-14
i386                  randconfig-011-20250913    clang-20
i386                  randconfig-012-20250913    clang-20
i386                  randconfig-013-20250913    clang-20
i386                  randconfig-014-20250913    clang-20
i386                  randconfig-015-20250913    clang-20
i386                  randconfig-016-20250913    clang-20
i386                  randconfig-017-20250913    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250912    gcc-15.1.0
loongarch             randconfig-001-20250913    clang-16
loongarch             randconfig-002-20250912    clang-22
loongarch             randconfig-002-20250913    clang-16
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
mips                         bigsur_defconfig    gcc-15.1.0
mips                           jazz_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250912    gcc-11.5.0
nios2                 randconfig-001-20250913    clang-16
nios2                 randconfig-002-20250912    gcc-11.5.0
nios2                 randconfig-002-20250913    clang-16
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250912    gcc-14.3.0
parisc                randconfig-001-20250913    clang-16
parisc                randconfig-002-20250912    gcc-8.5.0
parisc                randconfig-002-20250913    clang-16
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    clang-22
powerpc               randconfig-001-20250912    gcc-8.5.0
powerpc               randconfig-001-20250913    clang-16
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-002-20250913    clang-16
powerpc               randconfig-003-20250912    clang-17
powerpc               randconfig-003-20250913    clang-16
powerpc64             randconfig-001-20250912    gcc-12.5.0
powerpc64             randconfig-001-20250913    clang-16
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-002-20250913    clang-16
powerpc64             randconfig-003-20250912    clang-19
powerpc64             randconfig-003-20250913    clang-16
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250912    clang-16
riscv                 randconfig-001-20250913    gcc-14.3.0
riscv                 randconfig-002-20250912    gcc-9.5.0
riscv                 randconfig-002-20250913    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250912    gcc-10.5.0
s390                  randconfig-001-20250913    gcc-14.3.0
s390                  randconfig-002-20250912    gcc-10.5.0
s390                  randconfig-002-20250913    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-001-20250913    gcc-14.3.0
sh                    randconfig-002-20250912    gcc-15.1.0
sh                    randconfig-002-20250913    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-8.5.0
sparc                 randconfig-001-20250913    gcc-14.3.0
sparc                 randconfig-002-20250912    gcc-13.4.0
sparc                 randconfig-002-20250913    gcc-14.3.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250912    gcc-8.5.0
sparc64               randconfig-001-20250913    gcc-14.3.0
sparc64               randconfig-002-20250912    clang-20
sparc64               randconfig-002-20250913    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250912    clang-22
um                    randconfig-001-20250913    gcc-14.3.0
um                    randconfig-002-20250912    gcc-14
um                    randconfig-002-20250913    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250912    gcc-14
x86_64      buildonly-randconfig-002-20250912    gcc-14
x86_64      buildonly-randconfig-003-20250912    clang-20
x86_64      buildonly-randconfig-004-20250912    clang-20
x86_64      buildonly-randconfig-005-20250912    clang-20
x86_64      buildonly-randconfig-006-20250912    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250913    clang-20
x86_64                randconfig-002-20250913    clang-20
x86_64                randconfig-003-20250913    clang-20
x86_64                randconfig-004-20250913    clang-20
x86_64                randconfig-005-20250913    clang-20
x86_64                randconfig-006-20250913    clang-20
x86_64                randconfig-007-20250913    clang-20
x86_64                randconfig-008-20250913    clang-20
x86_64                randconfig-071-20250913    gcc-14
x86_64                randconfig-072-20250913    gcc-14
x86_64                randconfig-073-20250913    gcc-14
x86_64                randconfig-074-20250913    gcc-14
x86_64                randconfig-075-20250913    gcc-14
x86_64                randconfig-076-20250913    gcc-14
x86_64                randconfig-077-20250913    gcc-14
x86_64                randconfig-078-20250913    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250912    gcc-9.5.0
xtensa                randconfig-001-20250913    gcc-14.3.0
xtensa                randconfig-002-20250912    gcc-12.5.0
xtensa                randconfig-002-20250913    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

