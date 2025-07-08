Return-Path: <linux-usb+bounces-25567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B76AFC0EF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 04:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D4118955D4
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 02:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379922332E;
	Tue,  8 Jul 2025 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPtWwqaU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B7625
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942421; cv=none; b=eF7pKbQGD/urGkq/th4RpBL9ocUCmdufsnUB1rCLtVLVl/B2d8dj+JhBgvoLJjsqm7otGHUkEBKU0A5G8qrWQbQgqjsA1u2jEHDhF6V99QPoq69ai76/DHuW3KP4bkft///mW9lmGG3vW0J2ocX/jaKm2uyjDWJsMfQLGVQ03fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942421; c=relaxed/simple;
	bh=aTebdzRhcTSOSMRfIuYqAgk/n4zdtP+WbznDop5TiTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gFBOp+MVLcO9ce6Ibds4GYi67YtvI64ui+PEI0yPD1703JKWAsL3gYJCLHKggcl0/uW4Y/5ZMvyjSp7b817z74DuIhex6SBsga+6ZzmexABm0D/zP2DkuXLA+GUSRtYH/OPvMvFtJDzruJaOrl1Uj6/wROrieNSVVt+UPkOLgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPtWwqaU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751942420; x=1783478420;
  h=date:from:to:cc:subject:message-id;
  bh=aTebdzRhcTSOSMRfIuYqAgk/n4zdtP+WbznDop5TiTk=;
  b=EPtWwqaUouVl9Hp5fgMn2Gj11q6T7hpKEog2QSQ2v6CQyABen2hcX/Cb
   jkiask0bLkpZgOMsLB+XmJT3Tgtvb2TRhdd23bNRJhg483eYQuyYkuGTB
   BZjcbK2tz9NTdDFRf6NiMOu63X2FP4vNF8ba8xsdoPNYDZ/YvBoCUlpIV
   e73/os26h2jMZbrHb+XeXoIVMr4LsfkUjzU9OAeY73UeYoXzGVYyOsSsH
   ciUIHKeNFl/+7nfXrEdXF14BbksL9q0PljoMwveQZT4dFGRljAe0l6GF8
   hOLx2teFNWl6vOk1mjeS3iiwNuNaTR3CyyMQQ57+4eYwbFoa/15TNJ5vy
   g==;
X-CSE-ConnectionGUID: KaqBYocqQ66DdnM0lbYchQ==
X-CSE-MsgGUID: Y0XS6HMbSfWAR/oKgPht8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56783877"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="56783877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 19:40:01 -0700
X-CSE-ConnectionGUID: 2YQII0IGSxOVK3REIM391w==
X-CSE-MsgGUID: ggaISfUaTkebiKseKHKiUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154796086"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2025 19:40:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYyFR-0000vj-36;
	Tue, 08 Jul 2025 02:39:57 +0000
Date: Tue, 08 Jul 2025 10:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 67a59f82196c8c4f50c83329f0577acfb1349b50
Message-ID: <202507081023.n6BrQQAQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 67a59f82196c8c4f50c83329f0577acfb1349b50  usb: musb: fix gadget state on disconnect

elapsed time: 1005m

configs tested: 218
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-001-20250708    clang-17
arc                   randconfig-002-20250707    gcc-8.5.0
arc                   randconfig-002-20250708    clang-17
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-001-20250708    clang-17
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-003-20250708    clang-17
arm                   randconfig-004-20250707    clang-21
arm                   randconfig-004-20250708    clang-17
arm                          sp7021_defconfig    gcc-15.1.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-001-20250708    clang-17
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-002-20250708    clang-17
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-003-20250708    clang-17
arm64                 randconfig-004-20250707    gcc-14.3.0
arm64                 randconfig-004-20250708    clang-17
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-001-20250708    gcc-8.5.0
csky                  randconfig-002-20250707    gcc-12.4.0
csky                  randconfig-002-20250708    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-001-20250708    gcc-8.5.0
hexagon               randconfig-002-20250707    clang-21
hexagon               randconfig-002-20250708    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-004-20250708    clang-20
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-006-20250707    gcc-12
i386        buildonly-randconfig-006-20250708    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250708    gcc-11
i386                  randconfig-002-20250708    gcc-11
i386                  randconfig-003-20250708    gcc-11
i386                  randconfig-004-20250708    gcc-11
i386                  randconfig-005-20250708    gcc-11
i386                  randconfig-006-20250708    gcc-11
i386                  randconfig-007-20250708    gcc-11
i386                  randconfig-011-20250708    clang-20
i386                  randconfig-012-20250708    clang-20
i386                  randconfig-013-20250708    clang-20
i386                  randconfig-014-20250708    clang-20
i386                  randconfig-015-20250708    clang-20
i386                  randconfig-016-20250708    clang-20
i386                  randconfig-017-20250708    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-001-20250708    gcc-8.5.0
loongarch             randconfig-002-20250707    gcc-15.1.0
loongarch             randconfig-002-20250708    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-001-20250708    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc                randconfig-002-20250708    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-002-20250708    gcc-8.5.0
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc               randconfig-003-20250708    gcc-8.5.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250708    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-002-20250708    gcc-8.5.0
powerpc64             randconfig-003-20250707    clang-21
powerpc64             randconfig-003-20250708    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-001-20250708    clang-17
riscv                 randconfig-002-20250707    clang-21
riscv                 randconfig-002-20250708    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-001-20250708    clang-17
s390                  randconfig-002-20250707    gcc-11.5.0
s390                  randconfig-002-20250708    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-001-20250708    clang-17
sh                    randconfig-002-20250707    gcc-15.1.0
sh                    randconfig-002-20250708    clang-17
sh                           se7751_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-001-20250708    clang-17
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc                 randconfig-002-20250708    clang-17
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-001-20250708    clang-17
sparc64               randconfig-002-20250707    gcc-15.1.0
sparc64               randconfig-002-20250708    clang-17
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-001-20250708    clang-17
um                    randconfig-002-20250707    gcc-12
um                    randconfig-002-20250708    clang-17
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-005-20250708    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64      buildonly-randconfig-006-20250708    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-001-20250708    clang-17
xtensa                randconfig-002-20250707    gcc-8.5.0
xtensa                randconfig-002-20250708    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

