Return-Path: <linux-usb+bounces-32366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF7D224BA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 04:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4A0E301E981
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 03:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE3A28A3EF;
	Thu, 15 Jan 2026 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kikc7OhA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8FA1A9FA8
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447606; cv=none; b=Yf20lgjU8pLcgTpUVwIQG2ivflyqR5n1P15evKaqbjZrjr/7ZPZKSnP4ccx0qwePlwtr7cIGfkDhH4oP7OQTCX4lNpEiQptwRCuxLbDUmZckqJutkufeGbBBQIvYuHKkaYR4isTP/Kg63F+U726UMTLwZz5pTqLYLTx6aTrTIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447606; c=relaxed/simple;
	bh=32hRVf2zU+kV/fe3SkQVqmQjSdrkuSFexzZgfccutDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k0HLtCMvgSDB90peyrFMjUIZt7tkqOi0znF/ckeWTE+MsyfcL1CP39L4NBrB8WpsCeILDGEUj7ac7YmVNfh4zi5gIpmx/gNa2NPgc9Weh6gMNkQeMZKhnGYggYWx/D/8nVX+0TBtMaxrjyZa2YvwNyUjWdqG+HreXZuBPc9lfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kikc7OhA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768447604; x=1799983604;
  h=date:from:to:cc:subject:message-id;
  bh=32hRVf2zU+kV/fe3SkQVqmQjSdrkuSFexzZgfccutDU=;
  b=kikc7OhAnheuoby2LSLUN67bLU2mi1Y5IKW7jSEtIHqHU5cmuf8hwIOj
   tH7nqjLk8MneFYQ/lj9b/K9US1jWr5BzyTtyM4hG7XjQvzSAaf+Va5CEb
   CyM0blklnZZokFVNRoPgLO1RQp3Vx3XXBrYwDzlljctgLeoIhcKBLkNik
   q6iRFgSwY/JrYS+K6dUpwQF4QQLueXwllRL+tpVx9HB98WnAyNRKKSMi2
   TzzDQNLeMudrgsLRmpED+ZnKy7sTDZk5Mw9XPVNFyQOHwjJFlrvy1+8OS
   2aptY4C47r/WfXlUZM+Jy4VCA/yZTtk4tMRDgYFMWsiU9jlSKPfaDzTqQ
   w==;
X-CSE-ConnectionGUID: fauGNTe4SVOf/9y+ALqc0g==
X-CSE-MsgGUID: NGS+0u6IQc2FoiJOz7yBbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80864925"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80864925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:26:44 -0800
X-CSE-ConnectionGUID: uxicmLY+SEq64ILTF1LRyg==
X-CSE-MsgGUID: GEhOPB9zSl2asBz2EI+DiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209899200"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2026 19:26:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgE0N-00000000HTc-3F9e;
	Thu, 15 Jan 2026 03:26:39 +0000
Date: Thu, 15 Jan 2026 11:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9bcb4c4c330ca36ba7ab398c03d75c15b769d59d
Message-ID: <202601151135.iTVkxmW3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 9bcb4c4c330ca36ba7ab398c03d75c15b769d59d  usb: gadget: uvc: retry vb2_reqbufs() with vb_vmalloc_memops if use_sg fail

elapsed time: 739m

configs tested: 196
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260115    clang-22
arc                   randconfig-002-20260115    clang-22
arc                    vdk_hs38_smp_defconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260115    clang-22
arm                   randconfig-002-20260115    clang-22
arm                   randconfig-003-20260115    clang-22
arm                   randconfig-004-20260115    clang-22
arm                        shmobile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260115    clang-22
arm64                 randconfig-002-20260115    clang-22
arm64                 randconfig-003-20260115    clang-22
arm64                 randconfig-004-20260115    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260115    clang-22
csky                  randconfig-002-20260115    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260115    clang-22
hexagon               randconfig-002-20260115    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260115    gcc-14
i386        buildonly-randconfig-002-20260115    gcc-14
i386        buildonly-randconfig-003-20260115    gcc-14
i386        buildonly-randconfig-004-20260115    gcc-14
i386        buildonly-randconfig-005-20260115    gcc-14
i386        buildonly-randconfig-006-20260115    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260115    clang-20
i386                  randconfig-002-20260115    clang-20
i386                  randconfig-003-20260115    clang-20
i386                  randconfig-004-20260115    clang-20
i386                  randconfig-005-20260115    clang-20
i386                  randconfig-006-20260115    clang-20
i386                  randconfig-007-20260115    clang-20
i386                  randconfig-011-20260115    gcc-14
i386                  randconfig-012-20260115    gcc-14
i386                  randconfig-013-20260115    gcc-14
i386                  randconfig-014-20260115    gcc-14
i386                  randconfig-015-20260115    gcc-14
i386                  randconfig-016-20260115    gcc-14
i386                  randconfig-017-20260115    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260115    clang-22
loongarch             randconfig-002-20260115    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-22
mips                       rbtx49xx_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260115    clang-22
nios2                 randconfig-002-20260115    clang-22
openrisc                         alldefconfig    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    clang-22
parisc                generic-64bit_defconfig    clang-22
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260115    clang-22
parisc                randconfig-002-20260115    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    clang-22
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc                     rainier_defconfig    clang-22
powerpc               randconfig-001-20260115    clang-22
powerpc               randconfig-002-20260115    clang-22
powerpc                      tqm8xx_defconfig    clang-22
powerpc                         wii_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260115    clang-22
powerpc64             randconfig-002-20260115    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260115    gcc-10.5.0
riscv                 randconfig-002-20260115    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260115    gcc-10.5.0
s390                  randconfig-002-20260115    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          r7785rp_defconfig    clang-22
sh                          r7785rp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260115    gcc-10.5.0
sh                    randconfig-002-20260115    gcc-10.5.0
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7722_defconfig    clang-22
sh                              ul2_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260115    clang-22
sparc                 randconfig-002-20260115    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260115    clang-22
sparc64               randconfig-002-20260115    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260115    clang-22
um                    randconfig-002-20260115    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260115    clang-20
x86_64      buildonly-randconfig-002-20260115    clang-20
x86_64      buildonly-randconfig-003-20260115    clang-20
x86_64      buildonly-randconfig-004-20260115    clang-20
x86_64      buildonly-randconfig-005-20260115    clang-20
x86_64      buildonly-randconfig-006-20260115    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260115    clang-20
x86_64                randconfig-002-20260115    clang-20
x86_64                randconfig-003-20260115    clang-20
x86_64                randconfig-004-20260115    clang-20
x86_64                randconfig-005-20260115    clang-20
x86_64                randconfig-006-20260115    clang-20
x86_64                randconfig-011-20260115    clang-20
x86_64                randconfig-012-20260115    clang-20
x86_64                randconfig-013-20260115    clang-20
x86_64                randconfig-014-20260115    clang-20
x86_64                randconfig-015-20260115    clang-20
x86_64                randconfig-016-20260115    clang-20
x86_64                randconfig-071-20260115    gcc-14
x86_64                randconfig-072-20260115    gcc-14
x86_64                randconfig-073-20260115    gcc-14
x86_64                randconfig-074-20260115    gcc-14
x86_64                randconfig-075-20260115    gcc-14
x86_64                randconfig-076-20260115    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260115    clang-22
xtensa                randconfig-002-20260115    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

