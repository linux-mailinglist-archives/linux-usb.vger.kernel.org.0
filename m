Return-Path: <linux-usb+bounces-14046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716B95E237
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 08:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA981C20BC9
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 06:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD633D0C5;
	Sun, 25 Aug 2024 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmIjPxOw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC172D05D
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724566711; cv=none; b=oO7lqV2SydGy0UKOOyK5282wdwUxrUz2DMWxrV5Wc4GeQdIo7wCliBbnD4f3le9TwtmNQSugc8yiHfnNoA4ifcLcdgjJnOFpPueReLe9xFqvpmn9KDVY9R88cfvmeuZdOyuQYWapT4W8OdB9r+O/KZMXmf+6oh5tNZ9GbKcYPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724566711; c=relaxed/simple;
	bh=fUD38JqQGbNYFGwhCYZ3DckD+eZibSambR09au+35p0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C6rZ9Q9ksiYa/TQk0o3zNBDfilHJCtB2x9SbypJiQmGkkqfm8NBT8ZRKvpUGQEIbhswksgUWTkzUbIh4P7VLno28Qo8W0K2n1NsujHrFn6mkLpytGlOD2cm2+x83Ev3IEHXoF/+IPe5V4N0wOIU3nNcW/wq6cHvcTujWI83zc1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmIjPxOw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724566709; x=1756102709;
  h=date:from:to:cc:subject:message-id;
  bh=fUD38JqQGbNYFGwhCYZ3DckD+eZibSambR09au+35p0=;
  b=bmIjPxOwTow3umIhkWSSLiGrvwPNvCUoiRrOJayCUn4yqv7LEncwgyTi
   YTCMWfI2lGy4s7NdUKtURxOqfmwN3c2gYpEVqLMlpMsYv64Mu1IPTEhx1
   jxE2G5uu2h25r8DFuuRq41IP7USqukaBLIyzLUE0q2uCcsI6SceZ1OIrK
   izK9HXrtpq9RjTeMMJ8gWddiBHLU5gQkaTmBA7+8RcrL5ou4BmHIjC38Q
   qsMvBavIRszkf6G1Idr9AHe14zFBfzqYx9SGgjfqmSfyfSvQsSWMHeWpD
   JfmnaxxO060NdQyjybU9ZmkIOPx+Ozt8Mi8O/TK1i4UTcV5nOTyNjXvzG
   Q==;
X-CSE-ConnectionGUID: PdcXj8lISsGGdcJht7dUvg==
X-CSE-MsgGUID: fRpZPF7SR5SgaA21uHOtng==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25896289"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="25896289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 23:18:26 -0700
X-CSE-ConnectionGUID: M/oHtx7mSVa66LE9RoKiAQ==
X-CSE-MsgGUID: fwwhfednSIWB7NdsK3/3ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="62033038"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2024 23:18:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si6Zy-000Ezo-2B;
	Sun, 25 Aug 2024 06:18:22 +0000
Date: Sun, 25 Aug 2024 14:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 740f2e2791b98e47288b3814c83a3f566518fed2
Message-ID: <202408251443.EwSPQl3W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 740f2e2791b98e47288b3814c83a3f566518fed2  usb: cdnsp: fix for Link TRB with TC

elapsed time: 1447m

configs tested: 242
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240824   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240824   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   clang-20
arm                         mv78xx0_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240824   gcc-13.2.0
arm                   randconfig-001-20240825   gcc-13.2.0
arm                   randconfig-002-20240824   gcc-13.2.0
arm                   randconfig-002-20240825   gcc-13.2.0
arm                   randconfig-003-20240824   gcc-13.2.0
arm                   randconfig-003-20240825   gcc-13.2.0
arm                   randconfig-004-20240824   gcc-13.2.0
arm                   randconfig-004-20240825   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                           sunxi_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240824   gcc-13.2.0
arm64                 randconfig-001-20240825   gcc-13.2.0
arm64                 randconfig-002-20240824   gcc-13.2.0
arm64                 randconfig-002-20240825   gcc-13.2.0
arm64                 randconfig-003-20240824   gcc-13.2.0
arm64                 randconfig-003-20240825   gcc-13.2.0
arm64                 randconfig-004-20240824   gcc-13.2.0
arm64                 randconfig-004-20240825   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240824   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-13.2.0
csky                  randconfig-002-20240824   gcc-13.2.0
csky                  randconfig-002-20240825   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-004-20240825   clang-18
i386         buildonly-randconfig-005-20240824   clang-18
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240824   clang-18
i386         buildonly-randconfig-006-20240825   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-001-20240825   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-002-20240825   clang-18
i386                  randconfig-003-20240824   clang-18
i386                  randconfig-003-20240825   clang-18
i386                  randconfig-004-20240824   clang-18
i386                  randconfig-004-20240825   clang-18
i386                  randconfig-005-20240824   clang-18
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240824   clang-18
i386                  randconfig-012-20240825   clang-18
i386                  randconfig-013-20240824   clang-18
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240824   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240824   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240824   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240824   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-13.2.0
loongarch             randconfig-002-20240824   gcc-13.2.0
loongarch             randconfig-002-20240825   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240824   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-13.2.0
nios2                 randconfig-002-20240824   gcc-13.2.0
nios2                 randconfig-002-20240825   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240824   gcc-13.2.0
parisc                randconfig-001-20240825   gcc-13.2.0
parisc                randconfig-002-20240824   gcc-13.2.0
parisc                randconfig-002-20240825   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      pasemi_defconfig   clang-20
powerpc                     powernv_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      ppc64e_defconfig   clang-20
powerpc               randconfig-001-20240824   gcc-13.2.0
powerpc               randconfig-001-20240825   gcc-13.2.0
powerpc               randconfig-002-20240825   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-20
powerpc64             randconfig-001-20240824   gcc-13.2.0
powerpc64             randconfig-001-20240825   gcc-13.2.0
powerpc64             randconfig-002-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240824   gcc-13.2.0
riscv                 randconfig-001-20240825   gcc-13.2.0
riscv                 randconfig-002-20240824   gcc-13.2.0
riscv                 randconfig-002-20240825   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                          debug_defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240824   gcc-13.2.0
s390                  randconfig-001-20240825   gcc-13.2.0
s390                  randconfig-002-20240824   gcc-13.2.0
s390                  randconfig-002-20240825   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240824   gcc-13.2.0
sh                    randconfig-001-20240825   gcc-13.2.0
sh                    randconfig-002-20240824   gcc-13.2.0
sh                    randconfig-002-20240825   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240824   gcc-13.2.0
sparc64               randconfig-001-20240825   gcc-13.2.0
sparc64               randconfig-002-20240824   gcc-13.2.0
sparc64               randconfig-002-20240825   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240824   gcc-13.2.0
um                    randconfig-001-20240825   gcc-13.2.0
um                    randconfig-002-20240824   gcc-13.2.0
um                    randconfig-002-20240825   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240824   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240824   clang-18
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240824   clang-18
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240824   clang-18
x86_64       buildonly-randconfig-004-20240825   gcc-12
x86_64       buildonly-randconfig-005-20240824   clang-18
x86_64       buildonly-randconfig-005-20240825   gcc-12
x86_64       buildonly-randconfig-006-20240824   clang-18
x86_64       buildonly-randconfig-006-20240825   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240824   clang-18
x86_64                randconfig-001-20240825   gcc-12
x86_64                randconfig-002-20240824   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240824   clang-18
x86_64                randconfig-003-20240825   gcc-12
x86_64                randconfig-004-20240824   clang-18
x86_64                randconfig-004-20240825   gcc-12
x86_64                randconfig-005-20240824   clang-18
x86_64                randconfig-005-20240825   gcc-12
x86_64                randconfig-006-20240824   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240824   clang-18
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240824   clang-18
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240824   clang-18
x86_64                randconfig-013-20240825   gcc-12
x86_64                randconfig-014-20240824   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240824   clang-18
x86_64                randconfig-015-20240825   gcc-12
x86_64                randconfig-016-20240824   clang-18
x86_64                randconfig-016-20240825   gcc-12
x86_64                randconfig-071-20240824   clang-18
x86_64                randconfig-071-20240825   gcc-12
x86_64                randconfig-072-20240824   clang-18
x86_64                randconfig-072-20240825   gcc-12
x86_64                randconfig-073-20240824   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240824   clang-18
x86_64                randconfig-074-20240825   gcc-12
x86_64                randconfig-075-20240824   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240824   clang-18
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240824   gcc-13.2.0
xtensa                randconfig-001-20240825   gcc-13.2.0
xtensa                randconfig-002-20240824   gcc-13.2.0
xtensa                randconfig-002-20240825   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

