Return-Path: <linux-usb+bounces-13952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E395CA7B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 12:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92834B217A6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDBF1547FE;
	Fri, 23 Aug 2024 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ+P099m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B2364AB
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409088; cv=none; b=CfduZ0keEV4iGcBVv6tHHO6U24nwoqzEJ7f/5B1A9kcsCpGwTI7u3mjm67TjNlkOIaU9gwSTqerG3lHzvDvU8hj+qqyHnMmUHM22ooRCLJckCBk2QK9bTIJgo2NDGtCc3l0VlOzJn8uHVglrW5XCu5f35VI/DNAitkcHLBMhtNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409088; c=relaxed/simple;
	bh=36agNEnNxl2ST22MG2EkxxZGfb1q7OrmRMIp6bG55EM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nzHymRvtba9dcdKF4YV8msViROON4B0zwbDC2hXyS4EwF6B9aDrq7V4PxdM6nbE4aI4cauaXM+EajoFQ9Qq6OjTYYqVMUKacF6q3L9n16p3ygwWiLTOu4Ng57xc0AwY3mRZILwmsX2OtisZ76XO3Y4Darj1oFoheIM7Ge+KMluQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ+P099m; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724409086; x=1755945086;
  h=date:from:to:cc:subject:message-id;
  bh=36agNEnNxl2ST22MG2EkxxZGfb1q7OrmRMIp6bG55EM=;
  b=fQ+P099m8D/yI4l9Jo2vzf/BANhIXOrGQZciVcYbKbNBFO4Kh969AoNn
   1X1Hbe8WIgQoirtW92BDAf6EGhxtpbEbbTACExR6ovop6m7wHLCp4U+M8
   kiGshrJB+VrCqcdtBkAJAyyc8DxA6O6xf8W01tPT3sU1oMbnfD/GlmZXt
   8F7boFQll3/hasikHNdMEQbp74ZX4RJL5qN7XMDE/3WZJvwx0XhP1o84x
   2qp2gPdbGmM17Lu3gx0Rz8F/5JOqF7axPhYQBwNiNDZIv9M5PMRQ3K7bb
   5U6cAI6hfVvUJ02ys84A3pK8n97wj0Prp8h4uj9cM+WhOxpunWKg6jWHf
   g==;
X-CSE-ConnectionGUID: yBiUhgH6S8a5sj6tT7nKUQ==
X-CSE-MsgGUID: YKcjAr1eSP2u0Yj1UiN13g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="13168304"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="13168304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:31:25 -0700
X-CSE-ConnectionGUID: 7PtdS909Rey/Nn/Tn7+PTg==
X-CSE-MsgGUID: PDLgb10+SqaLl5bS69XN9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61907262"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2024 03:31:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shRZi-000DfQ-1r;
	Fri, 23 Aug 2024 10:31:22 +0000
Date: Fri, 23 Aug 2024 18:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c6f29014f04d190070769d9c8c30f20c39ec0f50
Message-ID: <202408231817.6YVjspN5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c6f29014f04d190070769d9c8c30f20c39ec0f50  usb: typec: ucsi: Remove useless error check from ucsi_read_error()

elapsed time: 1452m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240823   gcc-13.2.0
arc                   randconfig-002-20240823   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                         axm55xx_defconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                          exynos_defconfig   clang-17
arm                      integrator_defconfig   clang-20
arm                   randconfig-001-20240823   gcc-14.1.0
arm                   randconfig-002-20240823   clang-20
arm                   randconfig-003-20240823   gcc-14.1.0
arm                   randconfig-004-20240823   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240823   clang-20
arm64                 randconfig-002-20240823   gcc-14.1.0
arm64                 randconfig-003-20240823   gcc-14.1.0
arm64                 randconfig-004-20240823   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240823   gcc-14.1.0
csky                  randconfig-002-20240823   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240823   clang-20
hexagon               randconfig-002-20240823   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240823   clang-18
i386         buildonly-randconfig-002-20240823   clang-18
i386         buildonly-randconfig-003-20240823   gcc-12
i386         buildonly-randconfig-004-20240823   clang-18
i386         buildonly-randconfig-005-20240823   clang-18
i386         buildonly-randconfig-006-20240823   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240823   gcc-12
i386                  randconfig-002-20240823   gcc-12
i386                  randconfig-003-20240823   clang-18
i386                  randconfig-004-20240823   gcc-12
i386                  randconfig-005-20240823   gcc-11
i386                  randconfig-006-20240823   gcc-12
i386                  randconfig-011-20240823   clang-18
i386                  randconfig-012-20240823   clang-18
i386                  randconfig-013-20240823   gcc-12
i386                  randconfig-014-20240823   clang-18
i386                  randconfig-015-20240823   clang-18
i386                  randconfig-016-20240823   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240823   gcc-14.1.0
loongarch             randconfig-002-20240823   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240823   gcc-14.1.0
nios2                 randconfig-002-20240823   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240823   gcc-14.1.0
parisc                randconfig-002-20240823   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240823   clang-20
powerpc               randconfig-002-20240823   clang-14
powerpc64             randconfig-001-20240823   gcc-14.1.0
powerpc64             randconfig-002-20240823   gcc-14.1.0
powerpc64             randconfig-003-20240823   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240823   clang-14
riscv                 randconfig-002-20240823   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240823   gcc-14.1.0
s390                  randconfig-002-20240823   clang-15
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240823   gcc-14.1.0
sh                    randconfig-002-20240823   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240823   gcc-14.1.0
sparc64               randconfig-002-20240823   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240823   clang-20
um                    randconfig-002-20240823   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240823   gcc-12
x86_64       buildonly-randconfig-002-20240823   gcc-12
x86_64       buildonly-randconfig-003-20240823   gcc-12
x86_64       buildonly-randconfig-004-20240823   clang-18
x86_64       buildonly-randconfig-005-20240823   gcc-12
x86_64       buildonly-randconfig-006-20240823   gcc-12
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240823   clang-18
x86_64                randconfig-002-20240823   clang-18
x86_64                randconfig-003-20240823   clang-18
x86_64                randconfig-004-20240823   clang-18
x86_64                randconfig-005-20240823   clang-18
x86_64                randconfig-006-20240823   clang-18
x86_64                randconfig-011-20240823   gcc-12
x86_64                randconfig-012-20240823   clang-18
x86_64                randconfig-013-20240823   clang-18
x86_64                randconfig-014-20240823   gcc-11
x86_64                randconfig-015-20240823   clang-18
x86_64                randconfig-016-20240823   gcc-12
x86_64                randconfig-071-20240823   gcc-12
x86_64                randconfig-072-20240823   gcc-12
x86_64                randconfig-073-20240823   gcc-12
x86_64                randconfig-074-20240823   clang-18
x86_64                randconfig-075-20240823   gcc-12
x86_64                randconfig-076-20240823   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240823   gcc-14.1.0
xtensa                randconfig-002-20240823   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

