Return-Path: <linux-usb+bounces-27268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA067B34B16
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 21:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1AE27B2A58
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 19:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4211284678;
	Mon, 25 Aug 2025 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE8iV2Os"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0E283CA2
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756151293; cv=none; b=Yw+uUrPpQMz0KuYESsnIPjzzIpBtCy0OjkyoCrfZPFS4YQnEwtGAZZLudK/vUT4TTpjZYFrzM1dr/p/dOVpkdXue36RhklVjGuligiyB+N+fMKUHataiSyfHcd/Vlonlb7dx/FrafVnQKolH7DX/HRb6A09YCTNd2ZsXgJ9idoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756151293; c=relaxed/simple;
	bh=4DbJKd3tf1QJDl11ZwG+/uIbTw31xwQ2fMPAwkfTFI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NAk+N7ps7nkoEV2xgqE6ywWQJS7DLr5IZ0UVxil7hpPF3Nm9k/qi7MD9AUrvQaT/zmahoWtMjTp2GeyLu5qGp1sBs2NIcUf7ZnUkaAHGEJlOhr303f9+G4ITGjmMAHtkC3Tp4knIwysq8BFgJVXBMvBIvBHp5OCgN+ggrF+QAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE8iV2Os; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756151292; x=1787687292;
  h=date:from:to:cc:subject:message-id;
  bh=4DbJKd3tf1QJDl11ZwG+/uIbTw31xwQ2fMPAwkfTFI8=;
  b=QE8iV2Os8egpiWWiM3LUBpumELVNRf/dJh9lP+Gn7X+Vfs9oP/vq9G6k
   tIUysirWcuDoXV+QeocDPDqRXLTag4oNvb186XLtr58nR7qQYp24q/bzF
   alkZTPwSmj6KRlcVXl5KgCGb2zFDcIqjUtq7PxvPDUda9cHEVWWhrwFJZ
   t40U0Uq/Hav7/pUgX/agfzREtO2YL0f2590EJI8mx2KfOTCBRFuwceMCt
   wTaW5khe6UVwyJsylvUZaM/XVG2PX+1goL3Ar3sLMN7xYA6aKPPev3H8K
   MftyGvWUBzOj0H3w07io2mNYIBHrNVbUn6nt48RiHdownuzNpSmMDzswG
   Q==;
X-CSE-ConnectionGUID: kBGaldJ5TQuJxZcj+ULgew==
X-CSE-MsgGUID: Y4S9wBsjQpOSEfer0cL9BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="75826165"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="75826165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:48:11 -0700
X-CSE-ConnectionGUID: ZZjd5M/2TcGsZ8dDIif6JA==
X-CSE-MsgGUID: sl/0pA9fQIyOAwhIJrZJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="168889701"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Aug 2025 12:48:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqdAf-000NyD-35;
	Mon, 25 Aug 2025 19:48:03 +0000
Date: Tue, 26 Aug 2025 03:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3474a19736f39516cffced66dcfb818be6abf2f4
Message-ID: <202508260304.zJNGhy9m-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3474a19736f39516cffced66dcfb818be6abf2f4  Merge 6.17-rc3 into usb-next

elapsed time: 725m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250825    gcc-8.5.0
arc                   randconfig-002-20250825    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20250825    gcc-12.5.0
arm                   randconfig-002-20250825    gcc-13.4.0
arm                   randconfig-003-20250825    gcc-8.5.0
arm                   randconfig-004-20250825    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250825    gcc-8.5.0
arm64                 randconfig-002-20250825    gcc-8.5.0
arm64                 randconfig-003-20250825    clang-22
arm64                 randconfig-004-20250825    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250825    gcc-12.5.0
csky                  randconfig-002-20250825    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250825    clang-18
hexagon               randconfig-002-20250825    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250825    gcc-12
i386        buildonly-randconfig-002-20250825    clang-20
i386        buildonly-randconfig-003-20250825    clang-20
i386        buildonly-randconfig-004-20250825    gcc-12
i386        buildonly-randconfig-005-20250825    gcc-12
i386        buildonly-randconfig-006-20250825    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250825    gcc-12.5.0
loongarch             randconfig-002-20250825    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250825    gcc-8.5.0
nios2                 randconfig-002-20250825    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250825    gcc-8.5.0
parisc                randconfig-002-20250825    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                      katmai_defconfig    clang-22
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-22
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250825    clang-22
powerpc               randconfig-002-20250825    clang-22
powerpc               randconfig-003-20250825    clang-22
powerpc64             randconfig-001-20250825    gcc-13.4.0
powerpc64             randconfig-002-20250825    gcc-15.1.0
powerpc64             randconfig-003-20250825    clang-20
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250825    clang-18
riscv                 randconfig-002-20250825    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250825    gcc-12.5.0
s390                  randconfig-002-20250825    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250825    gcc-14.3.0
sh                    randconfig-002-20250825    gcc-13.4.0
sh                           se7343_defconfig    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250825    gcc-15.1.0
sparc                 randconfig-002-20250825    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250825    clang-22
sparc64               randconfig-002-20250825    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250825    clang-22
um                    randconfig-002-20250825    clang-20
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250825    clang-20
x86_64      buildonly-randconfig-002-20250825    gcc-12
x86_64      buildonly-randconfig-003-20250825    gcc-12
x86_64      buildonly-randconfig-004-20250825    clang-20
x86_64      buildonly-randconfig-005-20250825    clang-20
x86_64      buildonly-randconfig-006-20250825    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250825    gcc-8.5.0
xtensa                randconfig-002-20250825    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

