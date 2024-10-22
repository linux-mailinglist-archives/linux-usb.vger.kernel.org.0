Return-Path: <linux-usb+bounces-16499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36B9A9544
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 03:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340C51F22769
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 01:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E12142AB3;
	Tue, 22 Oct 2024 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeStjHKi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492D323D
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729559465; cv=none; b=jG46ezFczbSwTVHRbG9KbdOn5meJw9IMhz8nxWrA3zKV1XRIIeymKcvtwBWdwCAovGk8TC+DFXczq3ZJKauRdld8oHzvl77j3L2WZSnCuc5kwPoIQUT97nJQQgNBadciv1+jLqbZiMqcVByN0t+GzcnjLKcMluIatuZ2w02eOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729559465; c=relaxed/simple;
	bh=u/UuJ32FebJ3WjLKffgZ62NA0Or6VScn86VqOBpqStg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g01hX4DMv0z9LlgDzx4y05VCgdMvLDKJEYr7vOtbIQ8iPS5vYwj1GqEpLTNsN7qljExWErIHKZiAkYGW8FQStfGkgXqfro/FpYJzkRxDSM0qQaL/QXPSnA9aWyW3wSJfPDYgqE1DyVcsA1WU4ZcS1t76IXtEPM8cVJNE9Zq42X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeStjHKi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729559464; x=1761095464;
  h=date:from:to:cc:subject:message-id;
  bh=u/UuJ32FebJ3WjLKffgZ62NA0Or6VScn86VqOBpqStg=;
  b=ZeStjHKi71LtfMnyg6vdepe4GXcTlsY4f0l1ouH19fuJcE9zc+euWzXe
   vQL0uTJV/TuXJ5YSunhh29KUKfpqsVjHvnE6saY5zMWLc6nhAPz3dUHiF
   v8teeGKSvy/5Xvbtrm9WIkm9V6Yr2fl14Z9VbDTn0VzWyuabFhAapEUA0
   zVCjGLCOiQOgxWd/r1Fl3yyxYJr5qOtWI9fCEZzxDMxm7Lf0Nwdngdw58
   V5dBpDGt0I83t5o0aoIkuaisELH6B8BdBpLD7vV4e4ArEpuYmHmhydbaZ
   IDz275M+07VkK8aFbVS/J5ualPsQH0QPQoh9RGDG7XWnqvXXyvV0pkTTn
   g==;
X-CSE-ConnectionGUID: 0qjdi5W+QOG0SeUjum+cFg==
X-CSE-MsgGUID: ZwJ/mxpBTNCf3/UMen25nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29186394"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29186394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 18:11:03 -0700
X-CSE-ConnectionGUID: BLTz+0AdQwOg+v6yruE42w==
X-CSE-MsgGUID: itnRBx5hShqKgIPbZASTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84304832"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2024 18:11:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t33QJ-000Sri-0I;
	Tue, 22 Oct 2024 01:10:59 +0000
Date: Tue, 22 Oct 2024 09:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c6d9e43954bfa7415a1e9efdb2806ec1d8a8afc8
Message-ID: <202410220934.MDCkCDgV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c6d9e43954bfa7415a1e9efdb2806ec1d8a8afc8  Merge 6.12-rc4 into usb-next

elapsed time: 1025m

configs tested: 188
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241021    gcc-14.1.0
arc                   randconfig-002-20241021    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                             mxs_defconfig    gcc-14.1.0
arm                       omap2plus_defconfig    gcc-14.1.0
arm                   randconfig-001-20241021    gcc-14.1.0
arm                   randconfig-002-20241021    gcc-14.1.0
arm                   randconfig-003-20241021    gcc-14.1.0
arm                   randconfig-004-20241021    gcc-14.1.0
arm                             rpc_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241021    gcc-14.1.0
arm64                 randconfig-002-20241021    gcc-14.1.0
arm64                 randconfig-003-20241021    gcc-14.1.0
arm64                 randconfig-004-20241021    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241021    gcc-14.1.0
csky                  randconfig-002-20241021    gcc-14.1.0
hexagon                          alldefconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241021    gcc-14.1.0
hexagon               randconfig-002-20241021    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241021    clang-18
i386        buildonly-randconfig-002-20241021    clang-18
i386        buildonly-randconfig-003-20241021    clang-18
i386        buildonly-randconfig-004-20241021    clang-18
i386        buildonly-randconfig-005-20241021    clang-18
i386        buildonly-randconfig-006-20241021    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241021    clang-18
i386                  randconfig-002-20241021    clang-18
i386                  randconfig-003-20241021    clang-18
i386                  randconfig-004-20241021    clang-18
i386                  randconfig-005-20241021    clang-18
i386                  randconfig-006-20241021    clang-18
i386                  randconfig-011-20241021    clang-18
i386                  randconfig-012-20241021    clang-18
i386                  randconfig-013-20241021    clang-18
i386                  randconfig-014-20241021    clang-18
i386                  randconfig-015-20241021    clang-18
i386                  randconfig-016-20241021    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241021    gcc-14.1.0
loongarch             randconfig-002-20241021    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                          eyeq6_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241021    gcc-14.1.0
nios2                 randconfig-002-20241021    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241021    gcc-14.1.0
parisc                randconfig-002-20241021    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241021    gcc-14.1.0
powerpc               randconfig-002-20241021    gcc-14.1.0
powerpc               randconfig-003-20241021    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241021    gcc-14.1.0
powerpc64             randconfig-002-20241021    gcc-14.1.0
powerpc64             randconfig-003-20241021    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241021    gcc-14.1.0
riscv                 randconfig-002-20241021    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241021    gcc-14.1.0
s390                  randconfig-002-20241021    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                          landisk_defconfig    gcc-14.1.0
sh                    randconfig-001-20241021    gcc-14.1.0
sh                    randconfig-002-20241021    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241021    gcc-14.1.0
sparc64               randconfig-002-20241021    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241021    gcc-14.1.0
um                    randconfig-002-20241021    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241022    clang-18
x86_64      buildonly-randconfig-002-20241022    clang-18
x86_64      buildonly-randconfig-003-20241022    clang-18
x86_64      buildonly-randconfig-004-20241022    clang-18
x86_64      buildonly-randconfig-005-20241022    clang-18
x86_64      buildonly-randconfig-006-20241022    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241022    clang-18
x86_64                randconfig-002-20241022    clang-18
x86_64                randconfig-003-20241022    clang-18
x86_64                randconfig-004-20241022    clang-18
x86_64                randconfig-005-20241022    clang-18
x86_64                randconfig-006-20241022    clang-18
x86_64                randconfig-011-20241022    clang-18
x86_64                randconfig-012-20241022    clang-18
x86_64                randconfig-013-20241022    clang-18
x86_64                randconfig-014-20241022    clang-18
x86_64                randconfig-015-20241022    clang-18
x86_64                randconfig-016-20241022    clang-18
x86_64                randconfig-071-20241022    clang-18
x86_64                randconfig-072-20241022    clang-18
x86_64                randconfig-073-20241022    clang-18
x86_64                randconfig-074-20241022    clang-18
x86_64                randconfig-075-20241022    clang-18
x86_64                randconfig-076-20241022    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241021    gcc-14.1.0
xtensa                randconfig-002-20241021    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

