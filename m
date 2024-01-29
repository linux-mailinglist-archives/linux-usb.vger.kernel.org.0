Return-Path: <linux-usb+bounces-5584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A083FB21
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 01:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4782822DA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 00:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDAB17E3;
	Mon, 29 Jan 2024 00:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBhdY2Yv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842A1C30
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706486515; cv=none; b=nHcx9zBCIFhw8K4RvzCxfQc0T4tc3v6EWWg/vzNn4teQaTJPALlyEjaUCJk6oHIv55aRxuTvf/MapksI9fttKM6pq5SuNJUkbDKILsj2EE/HZmpqrpI3hIXa/h6krDN2CgIBr3mWyshY8IIqZjHjoDgLjj0ph0tqocOp29bfQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706486515; c=relaxed/simple;
	bh=xGzt01gBNGhFdYfw3vtfd0x24wGjtm/wDpO0g5WPFaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=esy5tDoIvDV+FppRKQpUbcmZFNX7Qz6qd9wHQ9vbvfBtLOfy6AQ1+ldn+vEDAEEw7Ho2MZxrS27uMwk7gZ1Si0KG0xXy1xC0B5yoxFrbwbGjopAuksNLedfPazcxT0WuDCD5iJDrPwYzrM4RiFxKMBX2sqFZnRLIkQ4x7sKRMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBhdY2Yv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706486514; x=1738022514;
  h=date:from:to:cc:subject:message-id;
  bh=xGzt01gBNGhFdYfw3vtfd0x24wGjtm/wDpO0g5WPFaI=;
  b=VBhdY2Yv0HIuuPOxt3+fChY8VAKbfKKzcMPjz3BR3SG1L4NiH9J9QXS1
   to0zst3gfIXMRU2xVkVvlmPfj0U0Kp3ayPTi6MOIU/zlKGU+Jnq8xyAKG
   CDcC8T3geAEGMHMqxCvHqj30pOt/jmbEVSBlQJOS0GNINlPsDMCdQi3eg
   Ftw0b6Y9vIuXpwjeyhkefHA1jFpOf1vD14BlW/cZoFX5xqwdDDOnr7WU+
   Tv302BO11i2XLP+nqvTVG1+M36fmba44LMqDhvxBSgDbM0x5ew/i8NitI
   n0lZA0iyTSmWO013FaDCGwsvT32cg0CaUsCSRYhyC75736DC4BQcFzEeX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21347300"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="21347300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 16:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737211991"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="737211991"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2024 16:01:51 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUF5w-0003rp-2n;
	Mon, 29 Jan 2024 00:01:48 +0000
Date: Mon, 29 Jan 2024 08:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f1a27f081c1fa1eeebf38406e45f29636114470f
Message-ID: <202401290803.0BZPChqD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f1a27f081c1fa1eeebf38406e45f29636114470f  usb: typec: qcom-pmic-typec: allow different implementations for the port backend

elapsed time: 1320m

configs tested: 226
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240128   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-002-20240128   gcc  
arc                   randconfig-002-20240129   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-004-20240129   gcc  
arm                         s3c6400_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240129   gcc  
arm64                 randconfig-002-20240129   gcc  
arm64                 randconfig-003-20240129   gcc  
arm64                 randconfig-004-20240129   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240128   gcc  
csky                  randconfig-001-20240129   gcc  
csky                  randconfig-002-20240128   gcc  
csky                  randconfig-002-20240129   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240128   clang
i386         buildonly-randconfig-002-20240128   clang
i386         buildonly-randconfig-003-20240128   clang
i386         buildonly-randconfig-004-20240128   clang
i386         buildonly-randconfig-005-20240128   clang
i386         buildonly-randconfig-006-20240128   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240128   clang
i386                  randconfig-002-20240128   clang
i386                  randconfig-003-20240128   clang
i386                  randconfig-004-20240128   clang
i386                  randconfig-005-20240128   clang
i386                  randconfig-006-20240128   clang
i386                  randconfig-011-20240128   gcc  
i386                  randconfig-012-20240128   gcc  
i386                  randconfig-013-20240128   gcc  
i386                  randconfig-014-20240128   gcc  
i386                  randconfig-015-20240128   gcc  
i386                  randconfig-016-20240128   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240128   gcc  
loongarch             randconfig-001-20240129   gcc  
loongarch             randconfig-002-20240128   gcc  
loongarch             randconfig-002-20240129   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240128   gcc  
nios2                 randconfig-001-20240129   gcc  
nios2                 randconfig-002-20240128   gcc  
nios2                 randconfig-002-20240129   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240128   gcc  
parisc                randconfig-001-20240129   gcc  
parisc                randconfig-002-20240128   gcc  
parisc                randconfig-002-20240129   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc               randconfig-001-20240129   gcc  
powerpc               randconfig-002-20240129   gcc  
powerpc               randconfig-003-20240129   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20240129   gcc  
powerpc64             randconfig-002-20240129   gcc  
powerpc64             randconfig-003-20240129   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240129   gcc  
riscv                 randconfig-002-20240129   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240128   gcc  
s390                  randconfig-002-20240128   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240128   gcc  
sh                    randconfig-001-20240129   gcc  
sh                    randconfig-002-20240128   gcc  
sh                    randconfig-002-20240129   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240128   gcc  
sparc64               randconfig-001-20240129   gcc  
sparc64               randconfig-002-20240128   gcc  
sparc64               randconfig-002-20240129   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240129   gcc  
um                    randconfig-002-20240129   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240128   clang
x86_64       buildonly-randconfig-001-20240129   gcc  
x86_64       buildonly-randconfig-002-20240128   clang
x86_64       buildonly-randconfig-002-20240129   gcc  
x86_64       buildonly-randconfig-003-20240128   clang
x86_64       buildonly-randconfig-003-20240129   gcc  
x86_64       buildonly-randconfig-004-20240128   clang
x86_64       buildonly-randconfig-004-20240129   gcc  
x86_64       buildonly-randconfig-005-20240128   clang
x86_64       buildonly-randconfig-005-20240129   gcc  
x86_64       buildonly-randconfig-006-20240128   clang
x86_64       buildonly-randconfig-006-20240129   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240128   clang
x86_64                randconfig-011-20240129   gcc  
x86_64                randconfig-012-20240128   clang
x86_64                randconfig-012-20240129   gcc  
x86_64                randconfig-013-20240128   clang
x86_64                randconfig-013-20240129   gcc  
x86_64                randconfig-014-20240128   clang
x86_64                randconfig-014-20240129   gcc  
x86_64                randconfig-015-20240128   clang
x86_64                randconfig-015-20240129   gcc  
x86_64                randconfig-016-20240128   clang
x86_64                randconfig-016-20240129   gcc  
x86_64                randconfig-071-20240128   clang
x86_64                randconfig-071-20240129   gcc  
x86_64                randconfig-072-20240128   clang
x86_64                randconfig-072-20240129   gcc  
x86_64                randconfig-073-20240128   clang
x86_64                randconfig-073-20240129   gcc  
x86_64                randconfig-074-20240128   clang
x86_64                randconfig-074-20240129   gcc  
x86_64                randconfig-075-20240128   clang
x86_64                randconfig-075-20240129   gcc  
x86_64                randconfig-076-20240128   clang
x86_64                randconfig-076-20240129   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240128   gcc  
xtensa                randconfig-001-20240129   gcc  
xtensa                randconfig-002-20240128   gcc  
xtensa                randconfig-002-20240129   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

