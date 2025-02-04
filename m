Return-Path: <linux-usb+bounces-20094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DAA27124
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A34161AA3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEA62135CF;
	Tue,  4 Feb 2025 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRFHywoB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CB0211A0B
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670759; cv=none; b=pycXnYXMHzIHZ7H/RPOdLvkMLCZrRPKPjSrBGdYmItf5OB0MRp5B0m41sZCqbHV10Wy/i71Ui/ZYFm9F2RGOVe26zMbxYA21sHrhFVUHMwdR7v6+WxA7iYjqhsmSqLrIHW0PuCccga6LJejyD37RPJ/VLOZmSD1+t7pl7bfBs8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670759; c=relaxed/simple;
	bh=lZcNATNTp9lkyHD3pRFDMERhVprmFaARYlOoR9uQdkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npRaiiAmhFv/U8xavDpXaHl6AbFfz9zTSXjQHLXOrHsai3cXrZ+unCHaCewU1blKkwyfr4fm9ePQSn2Z8YkcLU//SGLkfwQaZ9n1XSEd5gxmEin5h2KULMnU1K6Vnt5SoeKtliRHqDTgJqpeYU0bDFga+KxLeik6VDpAkXvgtgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRFHywoB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738670758; x=1770206758;
  h=date:from:to:cc:subject:message-id;
  bh=lZcNATNTp9lkyHD3pRFDMERhVprmFaARYlOoR9uQdkU=;
  b=VRFHywoB3OEGiCwmNjcp24YsnIbT+z0Tl1Bg+pM550nEB1YphB8mwj+o
   roLWZBuysS15EkT9ZbXb2uUYWXIWA47cgWwO2+xs6jWaMzmIlULJ9LFXe
   L2bUzWpUqPPmZ5k/zw+ZEFZHifHuazIpcjz0PkaPYD8SEyFQmNYbYzF3Q
   N0/ANcnMsmQTEKJQtyuG9AxQnpBgWZo1sDCYZf9HSvIEUi2889cVQjOse
   t09vwwAkgfwrmu5pVbQuFoKz6GNA5xXUyJn2YG4sU7xvghO0p8Ii71Lqd
   VlQX1tM/qLKTYAFwE3fEDZTSyyNAXhxwWErwqvBccGEhjKoNInCh25mVr
   A==;
X-CSE-ConnectionGUID: D8XZGKczR9Gv9pgwLs3rIg==
X-CSE-MsgGUID: UQDQqCCcSCGaHNdBDeQ0fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39348345"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39348345"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 04:05:57 -0800
X-CSE-ConnectionGUID: 98/JDqIgTaOyCLkvsaOZMA==
X-CSE-MsgGUID: Lm2veeNLSbKBSMCjZwhmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133821408"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 04:05:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfHgg-000sRd-09;
	Tue, 04 Feb 2025 12:05:54 +0000
Date: Tue, 04 Feb 2025 20:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 100f3a345897cf6f96d5bdcdcdfa0c9da93639c7
Message-ID: <202502042021.KbAFPPqA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 100f3a345897cf6f96d5bdcdcdfa0c9da93639c7  USB: disable all RNDIS protocol drivers

elapsed time: 1237m

configs tested: 177
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                   milbeaut_m10v_defconfig    clang-21
arm                       netwinder_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-001-20250204    gcc-13.2.0
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-002-20250204    gcc-13.2.0
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-003-20250204    gcc-13.2.0
arm                   randconfig-004-20250204    clang-21
arm                   randconfig-004-20250204    gcc-13.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-001-20250204    gcc-13.2.0
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-002-20250204    gcc-13.2.0
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-003-20250204    gcc-13.2.0
arm64                 randconfig-004-20250204    clang-21
arm64                 randconfig-004-20250204    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-002-20250204    clang-21
hexagon               randconfig-002-20250204    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250204    clang-19
i386                  randconfig-002-20250204    clang-19
i386                  randconfig-003-20250204    clang-19
i386                  randconfig-004-20250204    clang-19
i386                  randconfig-005-20250204    clang-19
i386                  randconfig-006-20250204    clang-19
i386                  randconfig-007-20250204    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    clang-21
m68k                        mvme16x_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-21
powerpc                     kmeter1_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    clang-21
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-002-20250204    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sh                           se7750_defconfig    clang-21
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250204    clang-21
um                    randconfig-001-20250204    gcc-14.2.0
um                    randconfig-002-20250204    gcc-12
um                    randconfig-002-20250204    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250204    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-21
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

