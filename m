Return-Path: <linux-usb+bounces-20692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D5A372E7
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 09:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53D9C16EA27
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B53C17BB16;
	Sun, 16 Feb 2025 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltmMwNPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFC16EB4C
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696387; cv=none; b=VGOirO1XcJf2LTFFZSSahNcZba4+s9TrOB/mRKkvfOzu2Y1JL0ls3xrmbLfpn4Fo8JwEiKASwsX/jOm6M0WYA0lWCeb/xgxW/Xgt+jc3P3VFxGyadh4htbT54Vcqd1EoqOYbhnrLwp48pLfLsw4cJFKOUC3rNkfmVY6Igsgr0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696387; c=relaxed/simple;
	bh=rWPgj/nUD2e8wEHHFFs5Gzl1v0P0PQWOR2yJDaM11ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l00bJVfZO+g21KsaJv6gcngtYHANiFvmmY0tZcahTShqOm/PFQXyePfo4D49cJmT83cHwPL1GBPPXaCmRfP0SirMe3Mwf/AquJTBdCK3ecPO88zFEfCju3TJgRTdPaoTg8tr3tQoIJjf5IiLbsHazE50HVybgYbMthW9Kib+p0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltmMwNPT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739696385; x=1771232385;
  h=date:from:to:cc:subject:message-id;
  bh=rWPgj/nUD2e8wEHHFFs5Gzl1v0P0PQWOR2yJDaM11ik=;
  b=ltmMwNPTmApIWv9Sp4VKfuY6UharNXv3V1VbghPygcb1JXIsbihKojOP
   og/H9htBmwT9CY+cEL5tT8/GU69yFCJqkbM6UbHvGZ2mDy3kQ+tYUyded
   EP0R1a+GA1VgRKwBdNybapwJpIe0ObIag/eBLn0dBhZ4UbL3yjFnfkFnx
   EKJEHjW8YS0UenUMNZKO7BopIDYA1pByE7BpBp8Gd0JylMLNgJaeZGxLB
   pKaJ6hRjp2I7BMm00+Amz+25glap2AAXuAl1+uCaOykvDEEKl/vf6kvs1
   M4yxcjdfs3pXIpXqlUumANIDh2br6oHxroLaeIamcmrDb0S6zV+0/LY8W
   A==;
X-CSE-ConnectionGUID: yFSxQAlRT0W6OdB621nQxA==
X-CSE-MsgGUID: BsyHTPTyRFS/e5q4FxW2nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51810805"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="51810805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 00:59:45 -0800
X-CSE-ConnectionGUID: EP4bEeMsQV+ciq+nP+jCkw==
X-CSE-MsgGUID: /a/i1LtiTDKFDPyoFU3Ykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="113587218"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Feb 2025 00:59:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjaV3-001Bkm-20;
	Sun, 16 Feb 2025 08:59:41 +0000
Date: Sun, 16 Feb 2025 16:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 257a087c8b5206e046048de6053fc8b3fa1af814
Message-ID: <202502161616.N0UYFiVb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 257a087c8b5206e046048de6053fc8b3fa1af814  usb: typec: Add support for Parade PS8830 Type-C Retimer

elapsed time: 1445m

configs tested: 253
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250215    gcc-13.2.0
arc                   randconfig-001-20250216    gcc-14.2.0
arc                   randconfig-002-20250215    gcc-13.2.0
arc                   randconfig-002-20250216    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                         lpc32xx_defconfig    clang-21
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250215    clang-15
arm                   randconfig-001-20250216    gcc-14.2.0
arm                   randconfig-002-20250215    clang-17
arm                   randconfig-002-20250216    gcc-14.2.0
arm                   randconfig-003-20250215    gcc-14.2.0
arm                   randconfig-003-20250216    gcc-14.2.0
arm                   randconfig-004-20250215    gcc-14.2.0
arm                   randconfig-004-20250216    gcc-14.2.0
arm                        realview_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    clang-21
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250215    clang-21
arm64                 randconfig-001-20250216    gcc-14.2.0
arm64                 randconfig-002-20250215    gcc-14.2.0
arm64                 randconfig-002-20250216    gcc-14.2.0
arm64                 randconfig-003-20250215    clang-17
arm64                 randconfig-003-20250216    gcc-14.2.0
arm64                 randconfig-004-20250215    gcc-14.2.0
arm64                 randconfig-004-20250216    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250215    gcc-14.2.0
csky                  randconfig-001-20250216    clang-15
csky                  randconfig-002-20250215    gcc-14.2.0
csky                  randconfig-002-20250216    clang-15
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250215    clang-21
hexagon               randconfig-001-20250216    clang-15
hexagon               randconfig-002-20250215    clang-21
hexagon               randconfig-002-20250216    clang-15
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250215    gcc-12
i386        buildonly-randconfig-001-20250216    gcc-12
i386        buildonly-randconfig-002-20250215    clang-19
i386        buildonly-randconfig-002-20250216    gcc-12
i386        buildonly-randconfig-003-20250215    clang-19
i386        buildonly-randconfig-003-20250216    gcc-12
i386        buildonly-randconfig-004-20250215    gcc-12
i386        buildonly-randconfig-004-20250216    gcc-12
i386        buildonly-randconfig-005-20250215    clang-19
i386        buildonly-randconfig-005-20250216    gcc-12
i386        buildonly-randconfig-006-20250215    clang-19
i386        buildonly-randconfig-006-20250216    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250216    gcc-12
i386                  randconfig-002-20250216    gcc-12
i386                  randconfig-003-20250216    gcc-12
i386                  randconfig-004-20250216    gcc-12
i386                  randconfig-005-20250216    gcc-12
i386                  randconfig-006-20250216    gcc-12
i386                  randconfig-007-20250216    gcc-12
i386                  randconfig-011-20250216    gcc-12
i386                  randconfig-012-20250216    gcc-12
i386                  randconfig-013-20250216    gcc-12
i386                  randconfig-014-20250216    gcc-12
i386                  randconfig-015-20250216    gcc-12
i386                  randconfig-016-20250216    gcc-12
i386                  randconfig-017-20250216    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250215    gcc-14.2.0
loongarch             randconfig-001-20250216    clang-15
loongarch             randconfig-002-20250215    gcc-14.2.0
loongarch             randconfig-002-20250216    clang-15
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250215    gcc-14.2.0
nios2                 randconfig-001-20250216    clang-15
nios2                 randconfig-002-20250215    gcc-14.2.0
nios2                 randconfig-002-20250216    clang-15
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250215    gcc-14.2.0
parisc                randconfig-001-20250216    clang-15
parisc                randconfig-002-20250215    gcc-14.2.0
parisc                randconfig-002-20250216    clang-15
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250215    gcc-14.2.0
powerpc               randconfig-001-20250216    clang-15
powerpc               randconfig-002-20250215    clang-21
powerpc               randconfig-002-20250216    clang-15
powerpc               randconfig-003-20250215    clang-19
powerpc               randconfig-003-20250216    clang-15
powerpc                     tqm5200_defconfig    clang-21
powerpc                         wii_defconfig    clang-21
powerpc64             randconfig-001-20250215    gcc-14.2.0
powerpc64             randconfig-001-20250216    clang-15
powerpc64             randconfig-002-20250215    clang-21
powerpc64             randconfig-002-20250216    clang-15
powerpc64             randconfig-003-20250215    gcc-14.2.0
powerpc64             randconfig-003-20250216    clang-15
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250215    clang-17
riscv                 randconfig-001-20250216    gcc-12
riscv                 randconfig-002-20250215    clang-19
riscv                 randconfig-002-20250216    gcc-12
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250215    gcc-14.2.0
s390                  randconfig-001-20250216    gcc-12
s390                  randconfig-002-20250215    gcc-14.2.0
s390                  randconfig-002-20250216    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250215    gcc-14.2.0
sh                    randconfig-001-20250216    gcc-12
sh                    randconfig-002-20250215    gcc-14.2.0
sh                    randconfig-002-20250216    gcc-12
sh                           se7619_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250215    gcc-14.2.0
sparc                 randconfig-001-20250216    gcc-12
sparc                 randconfig-002-20250215    gcc-14.2.0
sparc                 randconfig-002-20250216    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250215    gcc-14.2.0
sparc64               randconfig-001-20250216    gcc-12
sparc64               randconfig-002-20250215    gcc-14.2.0
sparc64               randconfig-002-20250216    gcc-12
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250215    clang-21
um                    randconfig-001-20250216    gcc-12
um                    randconfig-002-20250215    clang-19
um                    randconfig-002-20250216    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250215    gcc-12
x86_64      buildonly-randconfig-001-20250216    gcc-12
x86_64      buildonly-randconfig-002-20250215    clang-19
x86_64      buildonly-randconfig-002-20250216    gcc-12
x86_64      buildonly-randconfig-003-20250215    gcc-12
x86_64      buildonly-randconfig-003-20250216    gcc-12
x86_64      buildonly-randconfig-004-20250215    clang-19
x86_64      buildonly-randconfig-004-20250216    gcc-12
x86_64      buildonly-randconfig-005-20250215    clang-19
x86_64      buildonly-randconfig-005-20250216    gcc-12
x86_64      buildonly-randconfig-006-20250215    clang-19
x86_64      buildonly-randconfig-006-20250216    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250216    clang-19
x86_64                randconfig-002-20250216    clang-19
x86_64                randconfig-003-20250216    clang-19
x86_64                randconfig-004-20250216    clang-19
x86_64                randconfig-005-20250216    clang-19
x86_64                randconfig-006-20250216    clang-19
x86_64                randconfig-007-20250216    clang-19
x86_64                randconfig-008-20250216    clang-19
x86_64                randconfig-071-20250216    gcc-12
x86_64                randconfig-072-20250216    gcc-12
x86_64                randconfig-073-20250216    gcc-12
x86_64                randconfig-074-20250216    gcc-12
x86_64                randconfig-075-20250216    gcc-12
x86_64                randconfig-076-20250216    gcc-12
x86_64                randconfig-077-20250216    gcc-12
x86_64                randconfig-078-20250216    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-21
xtensa                randconfig-001-20250215    gcc-14.2.0
xtensa                randconfig-001-20250216    gcc-12
xtensa                randconfig-002-20250215    gcc-14.2.0
xtensa                randconfig-002-20250216    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

