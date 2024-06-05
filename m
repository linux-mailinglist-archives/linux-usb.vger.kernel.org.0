Return-Path: <linux-usb+bounces-10933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E78FD74F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 22:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E1E1C20D8B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 20:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D81154BEF;
	Wed,  5 Jun 2024 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAfaWkkX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA91154C14
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618423; cv=none; b=eugUVD/7BvlsGOJR11v56T7dy0yucG2N6M277kJaPOSNR2ItWbK/An0dJ0fk7xMAfoS8HHEVTxQZIC7NTWwxjnCXfe+xhmSVQfRdgO2OXs81O7Ae7TunsGsSDSqbJO/Ww56N4dmBV/bhXZXOJmzpgkxjhmHx+RYDZzcQsOz3Kxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618423; c=relaxed/simple;
	bh=K+gg9fXp+zaOQbVliKJkTfBLsNXespne6OqFW5Rn6TA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OpzNFmXGB6kAagkvi5/QRbCqHw0CQPMK0Fr+lzSFySlrH1+fPkQWXE6CtqZ6+FG1PkU8bj0gjnhEa55IQVbpISswNMmJsEPAj56uAfqmM9RC/bEeNXo6O54iwm7/IYCKr2sGQeAv8M43ksLOWCwzBeho4h4qqtUuz8iy68YKYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAfaWkkX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717618422; x=1749154422;
  h=date:from:to:cc:subject:message-id;
  bh=K+gg9fXp+zaOQbVliKJkTfBLsNXespne6OqFW5Rn6TA=;
  b=PAfaWkkXA7ebOZ86owGok3dPhN0jsy/hDTzemOhIeGesqinomg7ddXO4
   f8B5PYVfTz4RNktL8PSFxMd0PIK1xNGTje/l7n8YbtM3AXazn6FdkP0qo
   yY1ONL+VCN93Dm0odeqdy50ecX506u5OKcyf8SH7CkiDUXbafmClTtFx0
   GwTmsGZWypfPuWMNLy8oATRPBxXhZ9amYOxqpwBgN/Cr3aSIls56hze7Z
   p/OssGg4usYpjbFufPutDBX2oNRQbTHdkl2MPllZIgqRGZPjR9fpn1fTc
   4dB42LLDnEYAAB7EncMe1pGzIIywdasCxXbBZD8gOMW/g77F3Y4AyonKp
   g==;
X-CSE-ConnectionGUID: qKdZa41kRZasrzQkTfVD/Q==
X-CSE-MsgGUID: E+Xr8ZDQQ3y/Ji5ufO5p1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39655567"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="39655567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 13:13:35 -0700
X-CSE-ConnectionGUID: DI2fTgVvTI+CrRhJIAnvFw==
X-CSE-MsgGUID: FpxuIcJSSyeROV9/xL+zow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37817056"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2024 13:13:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEx0m-0002Bm-1A;
	Wed, 05 Jun 2024 20:13:32 +0000
Date: Thu, 06 Jun 2024 04:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 5821bf2dffbe18fe1f097dbb027415fa15a38e9a
Message-ID: <202406060438.PDGkoxVE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 5821bf2dffbe18fe1f097dbb027415fa15a38e9a  usb: typec: ucsi: Enable UCSI v2.0 notifications

elapsed time: 1480m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240605   gcc  
i386         buildonly-randconfig-002-20240605   gcc  
i386         buildonly-randconfig-003-20240605   gcc  
i386         buildonly-randconfig-004-20240605   gcc  
i386         buildonly-randconfig-005-20240605   gcc  
i386         buildonly-randconfig-006-20240605   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240605   gcc  
i386                  randconfig-002-20240605   clang
i386                  randconfig-003-20240605   gcc  
i386                  randconfig-004-20240605   gcc  
i386                  randconfig-005-20240605   gcc  
i386                  randconfig-006-20240605   gcc  
i386                  randconfig-011-20240605   gcc  
i386                  randconfig-012-20240605   gcc  
i386                  randconfig-013-20240605   clang
i386                  randconfig-014-20240605   clang
i386                  randconfig-015-20240605   gcc  
i386                  randconfig-016-20240605   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240605   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-003-20240605   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                randconfig-073-20240605   gcc  
x86_64                randconfig-074-20240605   gcc  
x86_64                randconfig-075-20240605   gcc  
x86_64                randconfig-076-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

