Return-Path: <linux-usb+bounces-26708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9DB214DB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 20:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC4A97A628B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 18:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29661E2858;
	Mon, 11 Aug 2025 18:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij+EkklN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080FB10F2
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754938061; cv=none; b=JfDSJyrNLkzhwFv88quHz7Sssp2KqEpeuKguSUVYawpsZiUuFHbYL+tTy0puVfBgkhpP5YGLeW+hs4E3EklfWnJ3dP1KSAfXa4CwaQ453pp4dgvZvK3l6u6qlfTS8TsJdcrUbjmXCMFycKG/oIC/jXViEuISoEOr5LxbHccAF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754938061; c=relaxed/simple;
	bh=oRkbG85HCQqkpF2Ip6BZ2AjMJWQwjw1c1ctNSLZtzPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lNfpzKVUpCBBgRQeAnb5IYEiZb+ArCy0Jc2vpnXDNBPT3kTHTCc+YqqEHt189cqqcxTgZ89AB9og5epMk4AkJAoGMXRCshdhOUZJUkRelNd5HykWzQbYPKSP1dbrLfNAzR8pds0IXgEFPvziMhu6b0F45LJIhmQsydDoLFCOOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ij+EkklN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754938059; x=1786474059;
  h=date:from:to:cc:subject:message-id;
  bh=oRkbG85HCQqkpF2Ip6BZ2AjMJWQwjw1c1ctNSLZtzPo=;
  b=ij+EkklNmC3Wln83vvDi4NODViwwOcqyeL+WelvQEQlSwlnBwwVlZ3ae
   kJRG26O8oRoAdjX8Ka1+++ZID1zNxYzOeRmCVPxaxU56LtHh5B4DCMf8D
   iYe2sd6m5TUAYKQUExEAE/y/XW2okyaZS3toYvChRoxKIFvgTi69Fxb0m
   qhtEWn5FE9DF6zgChNQZh53v3exR+y+4bgOnNtxjthLy8IWUcqH99G69i
   ytoE0Sl1I+5sqp90kQoyI0fSopoM1aeZcMsShS8QRRButE+m3V8i+upKo
   pgojJGv2e0x94bEVhDbJuvJJbbqYzB1BNda+39BG4+1ljR9zMpQPIX4K7
   g==;
X-CSE-ConnectionGUID: NnKzLJn0RXigV6IVHW4yiw==
X-CSE-MsgGUID: 7secLAOFQkiPMj3IfhnINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68655854"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68655854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 11:47:38 -0700
X-CSE-ConnectionGUID: YCSlyj6zS+K8NkhI59Me4Q==
X-CSE-MsgGUID: WMSqwvaBT3uu7clhOnnPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="171231436"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Aug 2025 11:47:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulXY8-00068g-2K;
	Mon, 11 Aug 2025 18:47:21 +0000
Date: Tue, 12 Aug 2025 02:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 0eff12ce88e1e77c465cbaa22d450fd268cd9b74
Message-ID: <202508120241.SFKVBJGA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 0eff12ce88e1e77c465cbaa22d450fd268cd9b74  thunderbolt: Use HMAC-SHA256 library instead of crypto_shash

elapsed time: 723m

configs tested: 190
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250811    gcc-8.5.0
arc                   randconfig-002-20250811    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                           omap1_defconfig    clang-22
arm                   randconfig-001-20250811    gcc-10.5.0
arm                   randconfig-002-20250811    gcc-13.4.0
arm                   randconfig-003-20250811    clang-22
arm                   randconfig-004-20250811    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-22
arm64                 randconfig-001-20250811    clang-22
arm64                 randconfig-002-20250811    clang-19
arm64                 randconfig-003-20250811    clang-20
arm64                 randconfig-004-20250811    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250811    gcc-13.4.0
csky                  randconfig-001-20250811    gcc-15.1.0
csky                  randconfig-002-20250811    gcc-13.4.0
csky                  randconfig-002-20250811    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250811    clang-17
hexagon               randconfig-001-20250811    gcc-13.4.0
hexagon               randconfig-002-20250811    clang-16
hexagon               randconfig-002-20250811    gcc-13.4.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250811    clang-20
i386        buildonly-randconfig-002-20250811    clang-20
i386        buildonly-randconfig-003-20250811    gcc-12
i386        buildonly-randconfig-004-20250811    gcc-12
i386        buildonly-randconfig-005-20250811    gcc-12
i386        buildonly-randconfig-006-20250811    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250811    clang-20
i386                  randconfig-002-20250811    clang-20
i386                  randconfig-003-20250811    clang-20
i386                  randconfig-004-20250811    clang-20
i386                  randconfig-005-20250811    clang-20
i386                  randconfig-006-20250811    clang-20
i386                  randconfig-007-20250811    clang-20
i386                  randconfig-011-20250811    gcc-12
i386                  randconfig-012-20250811    gcc-12
i386                  randconfig-013-20250811    gcc-12
i386                  randconfig-014-20250811    gcc-12
i386                  randconfig-015-20250811    gcc-12
i386                  randconfig-016-20250811    gcc-12
i386                  randconfig-017-20250811    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250811    gcc-13.4.0
loongarch             randconfig-001-20250811    gcc-15.1.0
loongarch             randconfig-002-20250811    gcc-12.5.0
loongarch             randconfig-002-20250811    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250811    gcc-10.5.0
nios2                 randconfig-001-20250811    gcc-13.4.0
nios2                 randconfig-002-20250811    gcc-11.5.0
nios2                 randconfig-002-20250811    gcc-13.4.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250811    gcc-13.4.0
parisc                randconfig-001-20250811    gcc-9.5.0
parisc                randconfig-002-20250811    gcc-13.4.0
parisc                randconfig-002-20250811    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20250811    gcc-13.4.0
powerpc               randconfig-002-20250811    clang-22
powerpc               randconfig-002-20250811    gcc-13.4.0
powerpc               randconfig-003-20250811    gcc-13.4.0
powerpc64             randconfig-001-20250811    clang-22
powerpc64             randconfig-001-20250811    gcc-13.4.0
powerpc64             randconfig-002-20250811    clang-22
powerpc64             randconfig-002-20250811    gcc-13.4.0
powerpc64             randconfig-003-20250811    gcc-13.4.0
powerpc64             randconfig-003-20250811    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250811    gcc-8.5.0
riscv                 randconfig-002-20250811    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250811    gcc-8.5.0
s390                  randconfig-002-20250811    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20250811    gcc-15.1.0
sh                    randconfig-002-20250811    gcc-15.1.0
sh                             sh03_defconfig    clang-22
sh                     sh7710voipgw_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250811    gcc-8.5.0
sparc                 randconfig-002-20250811    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250811    clang-22
sparc64               randconfig-002-20250811    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250811    clang-18
um                    randconfig-002-20250811    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250811    clang-20
x86_64      buildonly-randconfig-001-20250811    gcc-12
x86_64      buildonly-randconfig-002-20250811    clang-20
x86_64      buildonly-randconfig-003-20250811    clang-20
x86_64      buildonly-randconfig-004-20250811    clang-20
x86_64      buildonly-randconfig-005-20250811    clang-20
x86_64      buildonly-randconfig-006-20250811    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250811    gcc-11
x86_64                randconfig-002-20250811    gcc-11
x86_64                randconfig-003-20250811    gcc-11
x86_64                randconfig-004-20250811    gcc-11
x86_64                randconfig-005-20250811    gcc-11
x86_64                randconfig-006-20250811    gcc-11
x86_64                randconfig-007-20250811    gcc-11
x86_64                randconfig-008-20250811    gcc-11
x86_64                randconfig-071-20250811    clang-20
x86_64                randconfig-072-20250811    clang-20
x86_64                randconfig-073-20250811    clang-20
x86_64                randconfig-074-20250811    clang-20
x86_64                randconfig-075-20250811    clang-20
x86_64                randconfig-076-20250811    clang-20
x86_64                randconfig-077-20250811    clang-20
x86_64                randconfig-078-20250811    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250811    gcc-9.5.0
xtensa                randconfig-002-20250811    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

