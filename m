Return-Path: <linux-usb+bounces-9087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92489CC5F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 21:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC381F25162
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 19:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B04145B3F;
	Mon,  8 Apr 2024 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpgY4653"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB81448E2
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712604285; cv=none; b=RY1+pjRonn7ajEiARLQxhGHypA8x6d/gwj578tFUGYv/sa42I3CRhyHua6wtaCn24+sUQjpcQcKdRYcHiq+wlaRTuGWRqThjngHTtkjIa/PGosRVV3gH0UV3MxeDny7Tr/Dk+ga/+KW8lfaZAyesq7nCwKC8agHh30mJXgniFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712604285; c=relaxed/simple;
	bh=V3erAYThP67GTuIDWg+Gg3vlWoDrdVsLLwmTFD2pmXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHcD8WvI/D6tXD5ZRWX95JImg/pf4RsE27Q4hk1mzaJBAT9Ny2OQ1Xof2tqzf0mYTSWJJZnYBXWrVES7FYIulcBWrp52iw4YSG25WMMDWMrbfoZEQzHSk0xhO2YCZ20MTADG0tWs5d/M/cdCHhOHueMEHpY8Rp8kQwNN1eAxle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpgY4653; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712604283; x=1744140283;
  h=date:from:to:cc:subject:message-id;
  bh=V3erAYThP67GTuIDWg+Gg3vlWoDrdVsLLwmTFD2pmXU=;
  b=HpgY4653PAUguXtavxjrutt0xmdkwq00iSfvuyIhNEcvN5ESkFrn7a4j
   Yh1XRV/fbabXAmIlIbhb+B0dtsdDonTHnhNHAq332a5LKZGN0qW23FB9D
   tZqsf8oRU2MkVbiXCrJ9yRxtJXPGthV4GAu9qlASE8OmPDK+uQA+cosEp
   Dl6KAHe4S2rMy9GOgK6Uqyke9t8Ob2+/wkdqOZ++w8xSHgmsxgTDQh2X7
   0tnup0ikIBM5yJBjdhzQZ2Hse9/y/SvpyOyEmmn3ET37bjgH5ktGINpB4
   MyaWhn280PQH69iiKFgW7UYJdjeUHZEPD41r8XqyR+aU2iRiflnDUgGyf
   g==;
X-CSE-ConnectionGUID: 4o563s6fRuKjKs3mf/JZbQ==
X-CSE-MsgGUID: 3mF44KUgRZOxC414yF3cTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33304730"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="33304730"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:24:03 -0700
X-CSE-ConnectionGUID: nkEK/PYYR3evFE8ylZDNDQ==
X-CSE-MsgGUID: vis32rYOSrS3MYBh+OrVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24683824"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2024 12:24:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtub1-0005Rd-0p;
	Mon, 08 Apr 2024 19:23:59 +0000
Date: Tue, 09 Apr 2024 03:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 9a966517a83090ee3e26e9a93a92523e2358c5b3
Message-ID: <202404090309.agxwz32L-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 9a966517a83090ee3e26e9a93a92523e2358c5b3  thunderbolt: Enable NVM upgrade support on Intel Maple Ridge

elapsed time: 795m

configs tested: 195
configs skipped: 4

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
arc                   randconfig-001-20240408   gcc  
arc                   randconfig-002-20240408   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       imx_v4_v5_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240408   clang
arm                   randconfig-002-20240408   clang
arm                   randconfig-003-20240408   clang
arm                   randconfig-004-20240408   clang
arm                         s3c6400_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240408   clang
arm64                 randconfig-002-20240408   clang
arm64                 randconfig-003-20240408   gcc  
arm64                 randconfig-004-20240408   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240408   gcc  
csky                  randconfig-002-20240408   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240408   clang
hexagon               randconfig-002-20240408   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240408   gcc  
i386         buildonly-randconfig-002-20240408   gcc  
i386         buildonly-randconfig-003-20240408   gcc  
i386         buildonly-randconfig-004-20240408   clang
i386         buildonly-randconfig-005-20240408   clang
i386         buildonly-randconfig-006-20240408   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240408   clang
i386                  randconfig-002-20240408   clang
i386                  randconfig-003-20240408   clang
i386                  randconfig-004-20240408   clang
i386                  randconfig-005-20240408   gcc  
i386                  randconfig-006-20240408   clang
i386                  randconfig-011-20240408   clang
i386                  randconfig-012-20240408   gcc  
i386                  randconfig-013-20240408   clang
i386                  randconfig-014-20240408   gcc  
i386                  randconfig-015-20240408   gcc  
i386                  randconfig-016-20240408   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240408   gcc  
loongarch             randconfig-002-20240408   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240408   gcc  
nios2                 randconfig-002-20240408   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240408   gcc  
parisc                randconfig-002-20240408   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          g5_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc               randconfig-001-20240408   gcc  
powerpc               randconfig-002-20240408   clang
powerpc               randconfig-003-20240408   gcc  
powerpc64             randconfig-001-20240408   clang
powerpc64             randconfig-002-20240408   gcc  
powerpc64             randconfig-003-20240408   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240408   clang
riscv                 randconfig-002-20240408   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240408   clang
s390                  randconfig-002-20240408   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240408   gcc  
sh                    randconfig-002-20240408   gcc  
sh                           se7722_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240408   gcc  
sparc64               randconfig-002-20240408   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240408   clang
um                    randconfig-002-20240408   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240408   clang
x86_64       buildonly-randconfig-002-20240408   clang
x86_64       buildonly-randconfig-003-20240408   clang
x86_64       buildonly-randconfig-004-20240408   clang
x86_64       buildonly-randconfig-005-20240408   clang
x86_64       buildonly-randconfig-006-20240408   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240408   gcc  
x86_64                randconfig-002-20240408   clang
x86_64                randconfig-003-20240408   clang
x86_64                randconfig-004-20240408   clang
x86_64                randconfig-005-20240408   clang
x86_64                randconfig-006-20240408   gcc  
x86_64                randconfig-011-20240408   clang
x86_64                randconfig-012-20240408   clang
x86_64                randconfig-013-20240408   gcc  
x86_64                randconfig-014-20240408   clang
x86_64                randconfig-015-20240408   clang
x86_64                randconfig-016-20240408   clang
x86_64                randconfig-071-20240408   gcc  
x86_64                randconfig-072-20240408   clang
x86_64                randconfig-073-20240408   clang
x86_64                randconfig-074-20240408   gcc  
x86_64                randconfig-075-20240408   gcc  
x86_64                randconfig-076-20240408   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240408   gcc  
xtensa                randconfig-002-20240408   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

