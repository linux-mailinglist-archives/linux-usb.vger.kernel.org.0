Return-Path: <linux-usb+bounces-29849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA0C1C6FA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 18:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637086668FF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 15:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C1933CE81;
	Wed, 29 Oct 2025 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G71ISrx1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C4D33A03F
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753454; cv=none; b=u+q5CDI+sDFt9eLkS/9lTuSoKMQZdDOk8TKsv47ax/fScLbRWP1SY9uHcV/dAM3TqZmXzLCST+ILchvGKh98iuVz49etUa42r+zd94umdfICY9+Vc1roL9jV2X7vh/7A53C95ALOkTswLKdZgPFs0eiWoFAnX+iPz7A+HeMYlKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753454; c=relaxed/simple;
	bh=G0mLtdvQVRy44R1ZLyi1PCJbCryu8q1ApNqauhcqa2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GNEZ7zd4O4UdxQJyCGlvB6lN/lWeR4uZZ8xMDeURgs48NgA5LL2+md06x2kgFCTrVezzf6oO7K5HHKcMPNyYMQa13qMIxRqBBk8kdyhvY6OZp7Bf+0Y+rEjr/w+n0R4TKE9j2N0ts7++TGo5sbEUmtjik/9AQ19pC34UjU1Qg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G71ISrx1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761753453; x=1793289453;
  h=date:from:to:cc:subject:message-id;
  bh=G0mLtdvQVRy44R1ZLyi1PCJbCryu8q1ApNqauhcqa2A=;
  b=G71ISrx1TC1hCVRZN16G1ig4cQk/w0Xxf6q0rKa1oilo+7SnzHO4FIFy
   g0kDZOUwRv3hEzJlrhfddT84jhoH52D/UBypEYqQkuTZXjCpbokdAzyvN
   3Mt4vxnpHgX9cnARcHjTaycxU2jvGO/bkgTaT9O3JbPFZEdvkc2XbLH9f
   N6g8htmNzT6h0zzaWJGSNiAhhfc2z1loaiGlS6AWyuVj/p3twxu3lZHSl
   CE/d94g0CBcj5N1CHpyaYcn4HyRsfIXNj479XOSkJLyZg66LHbwdrv9I5
   hOUE/Qjn/91DM6rzT1AGOWl/laD24zSD5I9zo1AODE4y16ljCdpRMRv05
   w==;
X-CSE-ConnectionGUID: dlv8sVKwR/KH0xXvITBA2w==
X-CSE-MsgGUID: NhR2uPlWRbGLudTjSkTcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64029227"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="64029227"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:57:32 -0700
X-CSE-ConnectionGUID: g9JF2GjITmSXSwbSg56+6w==
X-CSE-MsgGUID: uidIKFtaQ2SGNCaF6sHExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216566061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2025 08:57:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8Y5-000Kkd-2L;
	Wed, 29 Oct 2025 15:57:23 +0000
Date: Wed, 29 Oct 2025 23:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 18514fd70ea4ca9de137bb3bceeac1bac4bcad75
Message-ID: <202510292344.8xLC7GT1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 18514fd70ea4ca9de137bb3bceeac1bac4bcad75  usb: typec: ucsi: Add support for orientation

elapsed time: 1452m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251029    gcc-15.1.0
arc                   randconfig-002-20251029    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20251029    gcc-8.5.0
arm                   randconfig-002-20251029    clang-22
arm                   randconfig-003-20251029    clang-22
arm                   randconfig-004-20251029    clang-22
arm                           spitz_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251029    gcc-12.5.0
arm64                 randconfig-002-20251029    clang-22
arm64                 randconfig-003-20251029    gcc-13.4.0
arm64                 randconfig-004-20251029    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251029    gcc-9.5.0
csky                  randconfig-002-20251029    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251029    clang-20
hexagon               randconfig-002-20251029    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251029    gcc-14
i386        buildonly-randconfig-002-20251029    gcc-14
i386        buildonly-randconfig-003-20251029    clang-20
i386        buildonly-randconfig-004-20251029    gcc-14
i386        buildonly-randconfig-005-20251029    gcc-14
i386        buildonly-randconfig-006-20251029    gcc-14
i386                  randconfig-001-20251029    gcc-14
i386                  randconfig-002-20251029    gcc-14
i386                  randconfig-003-20251029    clang-20
i386                  randconfig-004-20251029    gcc-14
i386                  randconfig-005-20251029    clang-20
i386                  randconfig-006-20251029    gcc-14
i386                  randconfig-007-20251029    clang-20
i386                  randconfig-011-20251029    gcc-14
i386                  randconfig-012-20251029    clang-20
i386                  randconfig-013-20251029    gcc-14
i386                  randconfig-014-20251029    gcc-14
i386                  randconfig-015-20251029    gcc-14
i386                  randconfig-016-20251029    gcc-14
i386                  randconfig-017-20251029    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251029    clang-22
loongarch             randconfig-002-20251029    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251029    gcc-11.5.0
nios2                 randconfig-002-20251029    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251029    gcc-12.5.0
parisc                randconfig-002-20251029    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-22
powerpc               randconfig-001-20251029    clang-22
powerpc               randconfig-002-20251029    gcc-12.5.0
powerpc64             randconfig-001-20251029    clang-22
powerpc64             randconfig-002-20251029    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251029    clang-20
riscv                 randconfig-002-20251029    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251029    gcc-11.5.0
s390                  randconfig-002-20251029    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                    randconfig-001-20251029    gcc-11.5.0
sh                    randconfig-002-20251029    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251029    gcc-8.5.0
sparc                 randconfig-002-20251029    gcc-15.1.0
sparc64               randconfig-001-20251029    clang-20
sparc64               randconfig-002-20251029    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251029    clang-22
um                    randconfig-002-20251029    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251029    gcc-14
x86_64      buildonly-randconfig-002-20251029    clang-20
x86_64      buildonly-randconfig-003-20251029    clang-20
x86_64      buildonly-randconfig-004-20251029    clang-20
x86_64      buildonly-randconfig-005-20251029    clang-20
x86_64      buildonly-randconfig-006-20251029    clang-20
x86_64                randconfig-011-20251029    clang-20
x86_64                randconfig-012-20251029    clang-20
x86_64                randconfig-013-20251029    gcc-14
x86_64                randconfig-014-20251029    clang-20
x86_64                randconfig-015-20251029    gcc-13
x86_64                randconfig-016-20251029    gcc-13
x86_64                randconfig-071-20251029    clang-20
x86_64                randconfig-072-20251029    clang-20
x86_64                randconfig-073-20251029    gcc-14
x86_64                randconfig-074-20251029    gcc-14
x86_64                randconfig-075-20251029    gcc-14
x86_64                randconfig-076-20251029    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251029    gcc-8.5.0
xtensa                randconfig-002-20251029    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

