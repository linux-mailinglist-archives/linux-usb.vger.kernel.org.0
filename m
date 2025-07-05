Return-Path: <linux-usb+bounces-25508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2825AFA12A
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jul 2025 20:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B59E16E4C5
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jul 2025 18:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27164215F6B;
	Sat,  5 Jul 2025 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9WbkbeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDA1DE3DB
	for <linux-usb@vger.kernel.org>; Sat,  5 Jul 2025 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751740109; cv=none; b=sV/INjgIrAWUJ+TQS9dvS+hGB8aUTCtcpRCziAdTJxGd+Nd+eDgAmTTit6Ix5ixJZVCLZWpuTy/SZrWbWAYTlLPGQhRfEGRLWa9Sr+NuuzNLL7RVFdVXmYjEIi2HxDGt6tlNWtJIyVZL8X8M5BYGutS6KWvC9KobhmOQMoupi+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751740109; c=relaxed/simple;
	bh=b7gJbVYTEaX1KH3xRXmHevdSPN/zZQQa8mUigx77Wvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCSUTQ1+qFXJp/9ANU6UQiggT0Oj+4AvAMqZPY2NmOrDbPB08oFgtpJaVvVLkhOtQxtDKChxomCEbRgZNI17mJOnBlD+1UPaw0FEOudmOvjLb6BVWbra0FrFs33t9irUUmGT1QAWd8LmbJIVJTK5/5ZYQ4Pbw/81LIZ8Rmhtv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9WbkbeU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751740108; x=1783276108;
  h=date:from:to:cc:subject:message-id;
  bh=b7gJbVYTEaX1KH3xRXmHevdSPN/zZQQa8mUigx77Wvc=;
  b=h9WbkbeUGG9+M0U+ZKKdC6nCWpLwWlPscjnugHYv2CgddfUmEbGlqTU3
   pAMXL0ajEa8S7UTlP7+ATssZE1iQUee17OyN0AtxxChvZ9GpcMNKkN9/u
   ybEnYLsp9REmi8xeAPvMLyaJCr7yeLiXftB0jOmnkzqjD5co0bRF8oale
   TbUu5aVY2hNBWD/39VOhscAYWpBIEWIduYBn/N+nqizGYIVQwUdj9RA+6
   AUO9SAGIhAL31sj5m9Z0FPtGGoHM4adQZpavD/XYYgRY17FbZqEDoW5uT
   Vv9+AUU5YnunZvD0bcjq+EdOYrw0sRQB/L8eUX7RUBQ3OsqtuMWO3Qqyw
   g==;
X-CSE-ConnectionGUID: EybPXNvqSM2pp8o0sffNeQ==
X-CSE-MsgGUID: s0NHLCpUQ6Gdjzq413UDJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="41645347"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="41645347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 11:28:27 -0700
X-CSE-ConnectionGUID: mhdqaFEyRgyEd2FtnjdxDg==
X-CSE-MsgGUID: 1RxYpt6jS6OhJ3/1pWDg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="159132310"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2025 11:28:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY7ce-0004fn-1R;
	Sat, 05 Jul 2025 18:28:24 +0000
Date: Sun, 06 Jul 2025 02:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 81c3b7256f9ec3c9f7659e4a2aec8d8ead0d4c3b
Message-ID: <202507060205.dYGS7wNz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 81c3b7256f9ec3c9f7659e4a2aec8d8ead0d4c3b  Merge merge point of tag 'usb-6.16-rc5' into usb-next

elapsed time: 721m

configs tested: 133
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250705    gcc-8.5.0
arc                   randconfig-002-20250705    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                         orion5x_defconfig    clang-21
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250705    gcc-12.4.0
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250705    gcc-8.5.0
arm                   randconfig-004-20250705    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250705    gcc-10.5.0
arm64                 randconfig-002-20250705    clang-17
arm64                 randconfig-003-20250705    gcc-11.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250705    gcc-10.5.0
csky                  randconfig-002-20250705    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250705    clang-19
hexagon               randconfig-002-20250705    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-11
i386        buildonly-randconfig-002-20250705    clang-20
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250705    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250705    gcc-8.5.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250705    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250705    gcc-11.5.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250705    gcc-12.4.0
powerpc64             randconfig-001-20250705    clang-21
powerpc64             randconfig-002-20250705    clang-21
powerpc64             randconfig-003-20250705    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250705    clang-21
riscv                 randconfig-002-20250705    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250705    clang-21
s390                  randconfig-002-20250705    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-15.1.0
sh                    randconfig-002-20250705    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-13.4.0
sparc                 randconfig-002-20250705    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250705    gcc-8.5.0
sparc64               randconfig-002-20250705    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    clang-20
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250705    gcc-12.4.0
xtensa                randconfig-002-20250705    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

