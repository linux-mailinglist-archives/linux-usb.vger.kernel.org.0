Return-Path: <linux-usb+bounces-21788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA7A629F2
	for <lists+linux-usb@lfdr.de>; Sat, 15 Mar 2025 10:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8D13BAA12
	for <lists+linux-usb@lfdr.de>; Sat, 15 Mar 2025 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B251F4734;
	Sat, 15 Mar 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knWHnQXi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58605192B8F
	for <linux-usb@vger.kernel.org>; Sat, 15 Mar 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742030594; cv=none; b=K00Qq7ip+2YMPCrGUdSb8XzXLAlxDR/TR8cYu82b+aOXCJjafWSK2URJkJ+tjpnX0kuHsEjqY+lj0F3/rVAdXCfzj9UAIw4RNv3T7jBD1PPKmei8NpMLof/5RYgnPSSNCucVb2JFboVrZ70OgxkpCP2veckadwS6TF54aIieZC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742030594; c=relaxed/simple;
	bh=t/W7+XY4zHaCMqs4E+JRLcynreEq1Rg24RX/vwBiYnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsN/H4D6z3icRssf3J8wlffC6Jela8pLEHrY1whIOnc/x6yZQKJu9GQcK+JFnEaaSb2ZwMz9Vif8+UrgtFtdY31Lee52ucUZA0iy3z2Y6TY7ZIMGghZCz5NjF4SVC3Yiy8ttoYNoFxdJgR34vNy/K/64o3xCfcLQY1SKhPFcsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knWHnQXi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742030592; x=1773566592;
  h=date:from:to:cc:subject:message-id;
  bh=t/W7+XY4zHaCMqs4E+JRLcynreEq1Rg24RX/vwBiYnc=;
  b=knWHnQXiIPHPkWn+mV5mOk/pWxQtJBvE+Q+g2TuGgZDzgIwtsZr6Ck68
   VztxLAHLopO0gfEiCth5UvNbb+JiIj4FYdFEy4PIzm3BgHQiD0JMm9BNq
   IXdqKn2L+PaDPboaok16QJv4tPBJ3t6wyX3Cu7zAKU0iiMlErgVDTf+c/
   fEiHmCkdo0pc5SMiqTwr2gHn+kswNnzhKBCZ10WhUnydhKlHl/9/U0eIu
   8FEml9ZufLgVVFqT9sHe03TO4VbQ1SNeD03xWubtgplyhMrfpKCjegeu6
   UgAAQ5/shT+GWivBYpostg7h+liEBb/PPK9RiX2e5vjBsCcXg9ThG71Hz
   A==;
X-CSE-ConnectionGUID: 7K03gWMyQV+9L1aCSAi9Tw==
X-CSE-MsgGUID: vaGFMJswS7aZ3S2YUhp7tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46968061"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="46968061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:23:12 -0700
X-CSE-ConnectionGUID: ur9NbcVGSUW58w5ySlG5Dw==
X-CSE-MsgGUID: lC4lKzp7Q8m6t2R+CLSrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126142665"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Mar 2025 02:23:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNjY-000BDF-1l;
	Sat, 15 Mar 2025 09:23:08 +0000
Date: Sat, 15 Mar 2025 17:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f2865c6300d75a9f187dd7918d248e010970fd44
Message-ID: <202503151750.2FGluvai-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f2865c6300d75a9f187dd7918d248e010970fd44  usb: typec: tcpm: fix state transition for SNK_WAIT_CAPABILITIES state in run_state_machine()

elapsed time: 1451m

configs tested: 197
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250314    gcc-13.2.0
arc                   randconfig-001-20250315    gcc-14.2.0
arc                   randconfig-002-20250314    gcc-13.2.0
arc                   randconfig-002-20250315    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250314    clang-21
arm                   randconfig-001-20250315    gcc-14.2.0
arm                   randconfig-002-20250314    gcc-14.2.0
arm                   randconfig-002-20250315    gcc-14.2.0
arm                   randconfig-003-20250314    gcc-14.2.0
arm                   randconfig-003-20250315    gcc-14.2.0
arm                   randconfig-004-20250314    gcc-14.2.0
arm                   randconfig-004-20250315    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250314    gcc-14.2.0
arm64                 randconfig-001-20250315    gcc-14.2.0
arm64                 randconfig-002-20250314    clang-21
arm64                 randconfig-002-20250315    gcc-14.2.0
arm64                 randconfig-003-20250314    clang-15
arm64                 randconfig-003-20250315    gcc-14.2.0
arm64                 randconfig-004-20250314    clang-21
arm64                 randconfig-004-20250315    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250314    gcc-14.2.0
csky                  randconfig-001-20250315    gcc-14.2.0
csky                  randconfig-002-20250314    gcc-14.2.0
csky                  randconfig-002-20250315    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250314    clang-21
hexagon               randconfig-001-20250315    gcc-14.2.0
hexagon               randconfig-002-20250314    clang-21
hexagon               randconfig-002-20250315    gcc-14.2.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250314    clang-19
i386        buildonly-randconfig-001-20250315    clang-19
i386        buildonly-randconfig-002-20250314    clang-19
i386        buildonly-randconfig-002-20250315    clang-19
i386        buildonly-randconfig-003-20250314    gcc-12
i386        buildonly-randconfig-003-20250315    clang-19
i386        buildonly-randconfig-004-20250314    gcc-12
i386        buildonly-randconfig-004-20250315    clang-19
i386        buildonly-randconfig-005-20250314    gcc-12
i386        buildonly-randconfig-005-20250315    clang-19
i386        buildonly-randconfig-006-20250314    gcc-12
i386        buildonly-randconfig-006-20250315    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250315    clang-19
i386                  randconfig-002-20250315    clang-19
i386                  randconfig-003-20250315    clang-19
i386                  randconfig-004-20250315    clang-19
i386                  randconfig-005-20250315    clang-19
i386                  randconfig-006-20250315    clang-19
i386                  randconfig-007-20250315    clang-19
i386                  randconfig-011-20250315    gcc-12
i386                  randconfig-012-20250315    gcc-12
i386                  randconfig-013-20250315    gcc-12
i386                  randconfig-014-20250315    gcc-12
i386                  randconfig-015-20250315    gcc-12
i386                  randconfig-016-20250315    gcc-12
i386                  randconfig-017-20250315    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250314    gcc-14.2.0
loongarch             randconfig-001-20250315    gcc-14.2.0
loongarch             randconfig-002-20250314    gcc-14.2.0
loongarch             randconfig-002-20250315    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250314    gcc-14.2.0
nios2                 randconfig-001-20250315    gcc-14.2.0
nios2                 randconfig-002-20250314    gcc-14.2.0
nios2                 randconfig-002-20250315    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250314    gcc-14.2.0
parisc                randconfig-001-20250315    gcc-14.2.0
parisc                randconfig-002-20250314    gcc-14.2.0
parisc                randconfig-002-20250315    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250314    clang-21
powerpc               randconfig-001-20250315    gcc-14.2.0
powerpc               randconfig-002-20250314    gcc-14.2.0
powerpc               randconfig-002-20250315    gcc-14.2.0
powerpc               randconfig-003-20250314    gcc-14.2.0
powerpc               randconfig-003-20250315    gcc-14.2.0
powerpc64             randconfig-001-20250314    gcc-14.2.0
powerpc64             randconfig-001-20250315    gcc-14.2.0
powerpc64             randconfig-002-20250314    clang-17
powerpc64             randconfig-002-20250315    gcc-14.2.0
powerpc64             randconfig-003-20250314    clang-21
powerpc64             randconfig-003-20250315    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250314    clang-19
riscv                 randconfig-001-20250315    gcc-14.2.0
riscv                 randconfig-002-20250314    gcc-14.2.0
riscv                 randconfig-002-20250315    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250314    gcc-14.2.0
s390                  randconfig-001-20250315    gcc-14.2.0
s390                  randconfig-002-20250314    gcc-14.2.0
s390                  randconfig-002-20250315    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250314    gcc-14.2.0
sh                    randconfig-001-20250315    gcc-14.2.0
sh                    randconfig-002-20250314    gcc-14.2.0
sh                    randconfig-002-20250315    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-21
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250314    gcc-14.2.0
sparc                 randconfig-001-20250315    gcc-14.2.0
sparc                 randconfig-002-20250314    gcc-14.2.0
sparc                 randconfig-002-20250315    gcc-14.2.0
sparc64               randconfig-001-20250314    gcc-14.2.0
sparc64               randconfig-001-20250315    gcc-14.2.0
sparc64               randconfig-002-20250314    gcc-14.2.0
sparc64               randconfig-002-20250315    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250314    gcc-12
um                    randconfig-001-20250315    gcc-14.2.0
um                    randconfig-002-20250314    gcc-12
um                    randconfig-002-20250315    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250314    clang-19
x86_64      buildonly-randconfig-001-20250315    clang-19
x86_64      buildonly-randconfig-002-20250314    clang-19
x86_64      buildonly-randconfig-002-20250315    clang-19
x86_64      buildonly-randconfig-003-20250314    gcc-12
x86_64      buildonly-randconfig-003-20250315    clang-19
x86_64      buildonly-randconfig-004-20250314    clang-19
x86_64      buildonly-randconfig-004-20250315    clang-19
x86_64      buildonly-randconfig-005-20250314    gcc-12
x86_64      buildonly-randconfig-005-20250315    clang-19
x86_64      buildonly-randconfig-006-20250314    gcc-12
x86_64      buildonly-randconfig-006-20250315    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250315    clang-19
x86_64                randconfig-002-20250315    clang-19
x86_64                randconfig-003-20250315    clang-19
x86_64                randconfig-004-20250315    clang-19
x86_64                randconfig-005-20250315    clang-19
x86_64                randconfig-006-20250315    clang-19
x86_64                randconfig-007-20250315    clang-19
x86_64                randconfig-008-20250315    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250314    gcc-14.2.0
xtensa                randconfig-001-20250315    gcc-14.2.0
xtensa                randconfig-002-20250314    gcc-14.2.0
xtensa                randconfig-002-20250315    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

