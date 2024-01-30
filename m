Return-Path: <linux-usb+bounces-5611-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CF8418AD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 02:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7775F1C2435F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 01:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0C436133;
	Tue, 30 Jan 2024 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnklqNU4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E70364CA
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 01:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706579449; cv=none; b=m1oCGbAAE5glhEyPZcA7Pai4p9fvv6OXSH8IQsKcNCsfIWJWJWDy9rjuOI/f/yNbXCKqdN6+etwjOn2oHYuZFBNcW3xfokXHcCuBvq7eQQ5jFdvQU+O6O1d3MHOsJQWK84lIzi4yy0+K4/mERZ2DdrHxoj3wgBdReO/dBPYl7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706579449; c=relaxed/simple;
	bh=acM86SwP3htPsarEwWugKRjC9/blBq1qB0doIfwdeJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9KJhZyOAwVgvMUKaJLjinykTY21G9BeDL1wsdEW1EuZ58JMChBL8axhLHfsTcapjnXbymwriXTnqRno2P+TLYVCkILbFeZpeN8t1JjlCq6KmVDF/gkTZJR0m/iIWe8NKmmA9HbD5nIslrVJn6d5xNRwPR+CjO4RBZuytHi0C7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnklqNU4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706579448; x=1738115448;
  h=date:from:to:cc:subject:message-id;
  bh=acM86SwP3htPsarEwWugKRjC9/blBq1qB0doIfwdeJE=;
  b=YnklqNU4v3eapdil9uhPQPeP3Lz64BSNWi65SPaPb7Rm217Bz1JuOxpo
   r1ialw/IN7BXrA8j3ZV2Xn6jqO1i97fctfmMCbbcZ3tUBAfhPyu3qVSai
   hDzvwR8yFtDGdGKXc/OFKhoywQDzMkiFR6DNhdMi6Cgziej4W4N+5hbte
   0in4UoS4MeZEnnEZQjQht/siCUVlezmZjotgWHYzJyXOGjBVvVzYvzFy9
   +BoR+HISef4BXHRCZT2CHDKg8XphgruMl1DPPC7CFpUPu09vJZISHWq3r
   6vuZ/TBANzGx3bQWITl48JqLCqfmtD9hY2EYaDsygw4rJl1n2OfSGRhnu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24617883"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="24617883"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 17:50:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907316314"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="907316314"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 17:50:39 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUdGn-0004pq-2Y;
	Tue, 30 Jan 2024 01:50:37 +0000
Date: Tue, 30 Jan 2024 09:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 ec4d82f855ce332de26fe080892483de98cc1a19
Message-ID: <202401300925.YCDW34O7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: ec4d82f855ce332de26fe080892483de98cc1a19  thunderbolt: Fix setting the CNS bit in ROUTER_CS_5

elapsed time: 1048m

configs tested: 272
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-001-20240130   gcc  
arc                   randconfig-002-20240129   gcc  
arc                   randconfig-002-20240130   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-001-20240130   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-002-20240130   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-003-20240130   gcc  
arm                   randconfig-004-20240129   gcc  
arm                   randconfig-004-20240130   gcc  
arm                           spitz_defconfig   clang
arm                        vexpress_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240129   gcc  
arm64                 randconfig-001-20240130   gcc  
arm64                 randconfig-002-20240129   gcc  
arm64                 randconfig-002-20240130   gcc  
arm64                 randconfig-003-20240129   gcc  
arm64                 randconfig-003-20240130   gcc  
arm64                 randconfig-004-20240129   gcc  
arm64                 randconfig-004-20240130   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240129   gcc  
csky                  randconfig-001-20240130   gcc  
csky                  randconfig-002-20240129   gcc  
csky                  randconfig-002-20240130   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240129   gcc  
i386         buildonly-randconfig-002-20240129   gcc  
i386         buildonly-randconfig-003-20240129   gcc  
i386         buildonly-randconfig-004-20240129   gcc  
i386         buildonly-randconfig-005-20240129   gcc  
i386         buildonly-randconfig-006-20240129   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240129   gcc  
i386                  randconfig-002-20240129   gcc  
i386                  randconfig-003-20240129   gcc  
i386                  randconfig-004-20240129   gcc  
i386                  randconfig-005-20240129   gcc  
i386                  randconfig-006-20240129   gcc  
i386                  randconfig-011-20240129   clang
i386                  randconfig-011-20240130   clang
i386                  randconfig-012-20240129   clang
i386                  randconfig-012-20240130   clang
i386                  randconfig-013-20240129   clang
i386                  randconfig-013-20240130   clang
i386                  randconfig-014-20240129   clang
i386                  randconfig-014-20240130   clang
i386                  randconfig-015-20240129   clang
i386                  randconfig-015-20240130   clang
i386                  randconfig-016-20240129   clang
i386                  randconfig-016-20240130   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240129   gcc  
loongarch             randconfig-001-20240130   gcc  
loongarch             randconfig-002-20240129   gcc  
loongarch             randconfig-002-20240130   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rm200_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240129   gcc  
nios2                 randconfig-001-20240130   gcc  
nios2                 randconfig-002-20240129   gcc  
nios2                 randconfig-002-20240130   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240129   gcc  
parisc                randconfig-001-20240130   gcc  
parisc                randconfig-002-20240129   gcc  
parisc                randconfig-002-20240130   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc               randconfig-001-20240129   gcc  
powerpc               randconfig-001-20240130   gcc  
powerpc               randconfig-002-20240129   gcc  
powerpc               randconfig-002-20240130   gcc  
powerpc               randconfig-003-20240129   gcc  
powerpc               randconfig-003-20240130   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240129   gcc  
powerpc64             randconfig-001-20240130   gcc  
powerpc64             randconfig-002-20240129   gcc  
powerpc64             randconfig-002-20240130   gcc  
powerpc64             randconfig-003-20240129   gcc  
powerpc64             randconfig-003-20240130   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20240129   gcc  
riscv                 randconfig-001-20240130   gcc  
riscv                 randconfig-002-20240129   gcc  
riscv                 randconfig-002-20240130   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240129   gcc  
sh                    randconfig-001-20240130   gcc  
sh                    randconfig-002-20240129   gcc  
sh                    randconfig-002-20240130   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240129   gcc  
sparc64               randconfig-001-20240130   gcc  
sparc64               randconfig-002-20240129   gcc  
sparc64               randconfig-002-20240130   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240129   gcc  
um                    randconfig-001-20240130   gcc  
um                    randconfig-002-20240129   gcc  
um                    randconfig-002-20240130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240129   gcc  
x86_64       buildonly-randconfig-001-20240130   gcc  
x86_64       buildonly-randconfig-002-20240129   gcc  
x86_64       buildonly-randconfig-002-20240130   gcc  
x86_64       buildonly-randconfig-003-20240129   gcc  
x86_64       buildonly-randconfig-003-20240130   gcc  
x86_64       buildonly-randconfig-004-20240129   gcc  
x86_64       buildonly-randconfig-004-20240130   gcc  
x86_64       buildonly-randconfig-005-20240129   gcc  
x86_64       buildonly-randconfig-005-20240130   gcc  
x86_64       buildonly-randconfig-006-20240129   gcc  
x86_64       buildonly-randconfig-006-20240130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240129   clang
x86_64                randconfig-002-20240129   clang
x86_64                randconfig-003-20240129   clang
x86_64                randconfig-004-20240129   clang
x86_64                randconfig-005-20240129   clang
x86_64                randconfig-006-20240129   clang
x86_64                randconfig-011-20240129   gcc  
x86_64                randconfig-011-20240130   gcc  
x86_64                randconfig-012-20240129   gcc  
x86_64                randconfig-012-20240130   gcc  
x86_64                randconfig-013-20240129   gcc  
x86_64                randconfig-013-20240130   gcc  
x86_64                randconfig-014-20240129   gcc  
x86_64                randconfig-014-20240130   gcc  
x86_64                randconfig-015-20240129   gcc  
x86_64                randconfig-015-20240130   gcc  
x86_64                randconfig-016-20240129   gcc  
x86_64                randconfig-016-20240130   gcc  
x86_64                randconfig-071-20240129   gcc  
x86_64                randconfig-071-20240130   gcc  
x86_64                randconfig-072-20240129   gcc  
x86_64                randconfig-072-20240130   gcc  
x86_64                randconfig-073-20240129   gcc  
x86_64                randconfig-073-20240130   gcc  
x86_64                randconfig-074-20240129   gcc  
x86_64                randconfig-074-20240130   gcc  
x86_64                randconfig-075-20240129   gcc  
x86_64                randconfig-075-20240130   gcc  
x86_64                randconfig-076-20240129   gcc  
x86_64                randconfig-076-20240130   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240129   gcc  
xtensa                randconfig-001-20240130   gcc  
xtensa                randconfig-002-20240129   gcc  
xtensa                randconfig-002-20240130   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

