Return-Path: <linux-usb+bounces-14877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8812C972A49
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C861F248FB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0B217C20F;
	Tue, 10 Sep 2024 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk61IJMe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA13F17BEBD
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952193; cv=none; b=swYG91zmaI99d49b3ZxbuqgHDbVFywaMTlout6niAzV7xSmqGAT8iX5b2lA2yT60i1Npl1dNANFsKTtVr76sFX+wANT8myjQViZRE2x7xgYQjKkKYSHRVrkAQvKpuerNHmfbtI0Sl7TAFAu78DRDqq5+kBASD2uaYIS51wu7RNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952193; c=relaxed/simple;
	bh=LZeMNTVWgwpuBjsLeCFAEeISGcQ0CfYWhGNJpZ+WcNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tmuTtRmiwaMUyN3WBIg76rzAhYzKshGBS8rUF5v27ZPTC9AKlsy8Vx9NiouBo7zHdAQLCo9nRSi/W/cRBbhanG53Bg0SYGqWvuNE08seRtMucwkmCIZMsrlcoc0a8uQc0La9TT6eiOOD79fV1/riHVQseJYSkfB06JqtgnIXzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk61IJMe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725952191; x=1757488191;
  h=date:from:to:cc:subject:message-id;
  bh=LZeMNTVWgwpuBjsLeCFAEeISGcQ0CfYWhGNJpZ+WcNg=;
  b=Mk61IJMeCxgMv73596+N0HbF7Sxizk3R68ru7nOPR72eW8agxHklf5FJ
   RUplSq0L+BTXQYPWajgOjYN+kkDY2SqqRuRB4L64VYuaWnUAF/148eMmY
   DEuLBXYS9tk9hyc0vr8yApcFIIdPAktCokPxMyGr1DzVvKCuCqh63p8k3
   YbmMjFala6znl1838pMjHHxqrZYhWFZtOzjW+bzmEeOyBpSkL+1STzrIu
   ZP0mV6yBlzkDVvBzOOal7WESvwLc7h9ZI+xsQ604Kb+sgEbq0mV16iLhM
   bte9/+C4pA9AgTU3fjxfHRAZj1Aw/9NGYLF80gNUoEnObXllbUOgE8bbG
   w==;
X-CSE-ConnectionGUID: S/TLSWTNTZ2Xnxx1Q/HTyQ==
X-CSE-MsgGUID: 206YEte+TbSlKTBIYo0dZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36062106"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="36062106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:09:51 -0700
X-CSE-ConnectionGUID: uhsJH983RkyXbr/Ms5HuvQ==
X-CSE-MsgGUID: CqdUEOqXQauEYxFupJibKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71338800"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2024 00:09:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snv0V-0000Ck-2D;
	Tue, 10 Sep 2024 07:09:47 +0000
Date: Tue, 10 Sep 2024 15:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f299cd11f7539482e87b2d2d527968a26b33f0ec
Message-ID: <202409101556.olmfXS1O-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f299cd11f7539482e87b2d2d527968a26b33f0ec  Merge 6.11-rc7 into usb-next

elapsed time: 1449m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                       imx_v4_v5_defconfig   gcc-14.1.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm                        spear6xx_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240909   clang-18
i386         buildonly-randconfig-002-20240909   gcc-12
i386         buildonly-randconfig-003-20240909   gcc-12
i386         buildonly-randconfig-004-20240909   gcc-12
i386         buildonly-randconfig-005-20240909   clang-18
i386         buildonly-randconfig-006-20240909   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240909   clang-18
i386                  randconfig-002-20240909   gcc-12
i386                  randconfig-003-20240909   clang-18
i386                  randconfig-004-20240909   gcc-12
i386                  randconfig-005-20240909   clang-18
i386                  randconfig-006-20240909   clang-18
i386                  randconfig-011-20240909   clang-18
i386                  randconfig-012-20240909   clang-18
i386                  randconfig-013-20240909   gcc-12
i386                  randconfig-014-20240909   clang-18
i386                  randconfig-015-20240909   clang-18
i386                  randconfig-016-20240909   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   gcc-14.1.0
mips                           ip27_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                         alldefconfig   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                          g5_defconfig   gcc-14.1.0
powerpc                  iss476-smp_defconfig   gcc-14.1.0
powerpc                      pasemi_defconfig   gcc-14.1.0
powerpc                     tqm8548_defconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                               allyesconfig   gcc-12
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

