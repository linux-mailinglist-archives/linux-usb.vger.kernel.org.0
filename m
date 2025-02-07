Return-Path: <linux-usb+bounces-20332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D659BA2C9B5
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 18:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69CF116452A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 17:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133F190664;
	Fri,  7 Feb 2025 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1//deUj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8168018F2C3
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947878; cv=none; b=qD9OJ7squ34vsbGL4R7qnFY5oBUHSEdIax68l1xbVz5mAdcCPDZizCCNVjAKpiNA3TFjcJPjvT67ubNqv8yV+1joy4z7Dnyzq0L1/L+KTGIm+5ncOlobe7JC3DmaKJYdSWtbD1GP/EttWdDX6bW3Qlgb3uDFjgLltV/M/iWSWk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947878; c=relaxed/simple;
	bh=m/Vth0RjKAydzYRoGPsCrhK4DHn7sNT4DYdMtqVEGJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5jLf/hkLkBNtvUdFitqdc9GxokSwTMa2JUrpFCTtcbWBUBaldLkMlxCKUcOnv/ZkKsD1hXcBjnD/rSSw+NABYUSOTIe7NS03kdxtwRgwzH/ebxUEO7q7jdMCDw+r0SJ+7drmxp1r0k/kzd1djosV7edqoX9O+YFi5EJ1R5W204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1//deUj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738947876; x=1770483876;
  h=date:from:to:cc:subject:message-id;
  bh=m/Vth0RjKAydzYRoGPsCrhK4DHn7sNT4DYdMtqVEGJM=;
  b=F1//deUjDG07VHBo3I16+M4wEeNgQvphPxk5OGWVIsC4wPWTo1yp7xIZ
   L+AwJGpyQM2PeyVoPLtSKMYb87JONIGkprPreiVYj3KeAi0amhkmfoa3j
   Rn8ess0WNuJKeucpfiMLnOVIuQ4ySTJdEGQzjreS6uetekTfPLrQ15C/C
   eNnZZy5r2s0RQxCipRn1REjth+/e2UnVyn0KEgmDlqBBIZqMNo+Rtjsq/
   Q3f8XFmd/IzO5HTpTSsHU/hlLPo9+/IP8wtQG9Y/pE0rNs/5LL3wAnZFr
   AJ6fmBMV6fRv6LPXxthgRT96IOXZTZGbG4I7S0sCPPRd/bvdg8IEcy8s9
   A==;
X-CSE-ConnectionGUID: PwgE3idzQOSRZaovMnXFPw==
X-CSE-MsgGUID: 0Qgalk8SSc2u03IMN7dHbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43357694"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="43357694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 09:04:35 -0800
X-CSE-ConnectionGUID: le5VSSsnSnm0rq1AuUe51A==
X-CSE-MsgGUID: zFPuoUHISguwed9Gnj0BQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112091670"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 09:04:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgRmK-000yeV-11;
	Fri, 07 Feb 2025 17:04:32 +0000
Date: Sat, 08 Feb 2025 01:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 35ad0d62da83b2e027e2e3c8b3b265ce6a678c5a
Message-ID: <202502080139.CcMinfRj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 35ad0d62da83b2e027e2e3c8b3b265ce6a678c5a  MAINTAINERS: Use my kernel.org address for USB4/Thunderbolt work

elapsed time: 1456m

configs tested: 193
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-19
arc                   randconfig-001-20250207    gcc-13.2.0
arc                   randconfig-002-20250207    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250207    gcc-13.2.0
arm                   randconfig-001-20250207    gcc-14.2.0
arm                   randconfig-002-20250207    gcc-13.2.0
arm                   randconfig-002-20250207    gcc-14.2.0
arm                   randconfig-003-20250207    gcc-13.2.0
arm                   randconfig-003-20250207    gcc-14.2.0
arm                   randconfig-004-20250207    clang-21
arm                   randconfig-004-20250207    gcc-13.2.0
arm                         s3c6400_defconfig    clang-19
arm                         wpcm450_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250207    gcc-13.2.0
arm64                 randconfig-001-20250207    gcc-14.2.0
arm64                 randconfig-002-20250207    gcc-13.2.0
arm64                 randconfig-002-20250207    gcc-14.2.0
arm64                 randconfig-003-20250207    clang-16
arm64                 randconfig-003-20250207    gcc-13.2.0
arm64                 randconfig-004-20250207    clang-21
arm64                 randconfig-004-20250207    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250207    gcc-14.2.0
csky                  randconfig-002-20250207    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250207    clang-21
hexagon               randconfig-001-20250207    gcc-14.2.0
hexagon               randconfig-002-20250207    clang-17
hexagon               randconfig-002-20250207    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250207    gcc-12
i386        buildonly-randconfig-002-20250207    gcc-12
i386        buildonly-randconfig-003-20250207    gcc-12
i386        buildonly-randconfig-004-20250207    gcc-12
i386        buildonly-randconfig-005-20250207    clang-19
i386        buildonly-randconfig-005-20250207    gcc-12
i386        buildonly-randconfig-006-20250207    clang-19
i386        buildonly-randconfig-006-20250207    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250207    gcc-12
i386                  randconfig-002-20250207    gcc-12
i386                  randconfig-003-20250207    gcc-12
i386                  randconfig-004-20250207    gcc-12
i386                  randconfig-005-20250207    gcc-12
i386                  randconfig-006-20250207    gcc-12
i386                  randconfig-007-20250207    gcc-12
i386                  randconfig-011-20250207    gcc-12
i386                  randconfig-012-20250207    gcc-12
i386                  randconfig-013-20250207    gcc-12
i386                  randconfig-014-20250207    gcc-12
i386                  randconfig-015-20250207    gcc-12
i386                  randconfig-016-20250207    gcc-12
i386                  randconfig-017-20250207    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250207    gcc-14.2.0
loongarch             randconfig-002-20250207    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250207    gcc-14.2.0
nios2                 randconfig-002-20250207    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250207    gcc-14.2.0
parisc                randconfig-002-20250207    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                 canyonlands_defconfig    clang-19
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250207    clang-21
powerpc               randconfig-001-20250207    gcc-14.2.0
powerpc               randconfig-002-20250207    clang-21
powerpc               randconfig-002-20250207    gcc-14.2.0
powerpc               randconfig-003-20250207    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-19
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250207    gcc-14.2.0
powerpc64             randconfig-002-20250207    clang-21
powerpc64             randconfig-002-20250207    gcc-14.2.0
powerpc64             randconfig-003-20250207    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250207    gcc-14.2.0
riscv                 randconfig-002-20250207    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250207    gcc-14.2.0
s390                  randconfig-002-20250207    clang-21
s390                  randconfig-002-20250207    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250207    gcc-14.2.0
sh                    randconfig-002-20250207    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250207    gcc-14.2.0
sparc                 randconfig-002-20250207    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250207    gcc-14.2.0
sparc64               randconfig-002-20250207    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250207    clang-21
um                    randconfig-001-20250207    gcc-14.2.0
um                    randconfig-002-20250207    gcc-12
um                    randconfig-002-20250207    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250207    clang-19
x86_64      buildonly-randconfig-001-20250207    gcc-12
x86_64      buildonly-randconfig-002-20250207    clang-19
x86_64      buildonly-randconfig-003-20250207    clang-19
x86_64      buildonly-randconfig-004-20250207    clang-19
x86_64      buildonly-randconfig-005-20250207    clang-19
x86_64      buildonly-randconfig-006-20250207    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250207    clang-19
x86_64                randconfig-002-20250207    clang-19
x86_64                randconfig-003-20250207    clang-19
x86_64                randconfig-004-20250207    clang-19
x86_64                randconfig-005-20250207    clang-19
x86_64                randconfig-006-20250207    clang-19
x86_64                randconfig-007-20250207    clang-19
x86_64                randconfig-008-20250207    clang-19
x86_64                randconfig-071-20250207    gcc-12
x86_64                randconfig-072-20250207    gcc-12
x86_64                randconfig-073-20250207    gcc-12
x86_64                randconfig-074-20250207    gcc-12
x86_64                randconfig-075-20250207    gcc-12
x86_64                randconfig-076-20250207    gcc-12
x86_64                randconfig-077-20250207    gcc-12
x86_64                randconfig-078-20250207    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250207    gcc-14.2.0
xtensa                randconfig-002-20250207    gcc-14.2.0
xtensa                         virt_defconfig    clang-19

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

