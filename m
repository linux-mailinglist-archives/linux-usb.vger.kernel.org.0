Return-Path: <linux-usb+bounces-25571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C80AFC257
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 08:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810653A070D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 06:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EFF217739;
	Tue,  8 Jul 2025 06:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxYeRsw8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22589288A8
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954484; cv=none; b=fdGKKL3mJ6GRAtDY3c8Y31aAze86KZNSW3b3xTfAjldkOMQj67MUmJ83YcAIjxUMDF0jSfc70bf9OnIOGz35NGNHb4E08maHT1x620zW8hCeNNaS6hVfEYIALFxPyE9rsXIKgI5wh7Qcp6UgGAP0LCBdswf6AkM+RZlw1k0+8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954484; c=relaxed/simple;
	bh=KUxFABYw4eNWUi3dBbxXOLF+j68wrcLGrdh/PA0c7JE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n6U5OXnfvG4LjLwADtHlaSMv27EeuiquAKVNZSVz8JV12jKgn0I+JavaS22F2+RRLALfvQay7p1NBTwtR2jeklUazS0tXdSjfojP6q/Kj8TW72vW4290oSH+ak4rDhQX5yvqZmFYljMnx7y2mD8P8Ezgd1Zf/gHTaPlamQeQaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxYeRsw8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751954482; x=1783490482;
  h=date:from:to:cc:subject:message-id;
  bh=KUxFABYw4eNWUi3dBbxXOLF+j68wrcLGrdh/PA0c7JE=;
  b=GxYeRsw82I847ekY9n+iwHpoR518URexVg61idbgn+nEShgfMd4o48OW
   kFJHg/Kzw0O6nMA77sH1WwyKkjBFQbQDyzM9q2g7OQPfxWEhI8xeLV7vA
   0C65KahqzA79bs8e2ijOL6T62W3Y+EF6RXgUqrgyE9uVxg04pvnLdQUsY
   mg/PWR+vrAaf92Vhl0oZop2f5QE6uEyVsclnnf6uK5lSRHqu+RxdUQCU6
   Uius79LVzGchywPw8l9FslgJ0p39xYm6R+vu6vj4xNTetP6iNu7TK757P
   YjPeSsGTWG30J9IYOZEGzIWjJELjc5o+CGHq3KNmKz1x9dsev5YLtHA5C
   g==;
X-CSE-ConnectionGUID: 5nCx5gqWQC+ePeZLb4qAgQ==
X-CSE-MsgGUID: h/zr/o65TyaQA7ZCAIjq1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54039098"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="54039098"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 23:01:21 -0700
X-CSE-ConnectionGUID: hMg2g1TkR5+y86Qx39DnFg==
X-CSE-MsgGUID: KUB71r8LTTKMh+WA3mF+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="159448933"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2025 23:01:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ1OI-00012d-0L;
	Tue, 08 Jul 2025 06:01:18 +0000
Date: Tue, 08 Jul 2025 14:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 0c43c19bf7a6cf2883b4a7ff08171be4af8ef814
Message-ID: <202507081457.F1gGtDxw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 0c43c19bf7a6cf2883b4a7ff08171be4af8ef814  Merge tag 'thunderbolt-for-v6.17-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 1207m

configs tested: 230
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-001-20250708    clang-17
arc                   randconfig-002-20250707    gcc-8.5.0
arc                   randconfig-002-20250708    clang-17
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
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
arm64                               defconfig    clang-19
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
csky                                defconfig    clang-19
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-001-20250708    gcc-8.5.0
csky                  randconfig-002-20250707    gcc-12.4.0
csky                  randconfig-002-20250708    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
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
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250708    gcc-11
i386                  randconfig-002-20250708    gcc-11
i386                  randconfig-003-20250708    gcc-11
i386                  randconfig-004-20250708    gcc-11
i386                  randconfig-005-20250708    gcc-11
i386                  randconfig-006-20250708    gcc-11
i386                  randconfig-007-20250708    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-001-20250708    gcc-8.5.0
loongarch             randconfig-002-20250707    gcc-15.1.0
loongarch             randconfig-002-20250708    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
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
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-001-20250708    clang-17
riscv                 randconfig-002-20250707    clang-21
riscv                 randconfig-002-20250708    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-001-20250708    clang-17
s390                  randconfig-002-20250707    gcc-11.5.0
s390                  randconfig-002-20250708    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
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
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-001-20250708    clang-17
sparc64               randconfig-002-20250707    gcc-15.1.0
sparc64               randconfig-002-20250708    clang-17
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-001-20250708    clang-17
um                    randconfig-002-20250707    gcc-12
um                    randconfig-002-20250708    clang-17
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
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
x86_64                randconfig-001-20250708    gcc-12
x86_64                randconfig-002-20250708    gcc-12
x86_64                randconfig-003-20250708    gcc-12
x86_64                randconfig-004-20250708    gcc-12
x86_64                randconfig-005-20250708    gcc-12
x86_64                randconfig-006-20250708    gcc-12
x86_64                randconfig-007-20250708    gcc-12
x86_64                randconfig-008-20250708    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-001-20250708    clang-17
xtensa                randconfig-002-20250707    gcc-8.5.0
xtensa                randconfig-002-20250708    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

