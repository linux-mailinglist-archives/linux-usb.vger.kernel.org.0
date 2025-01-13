Return-Path: <linux-usb+bounces-19276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5379A0C2DB
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 21:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2F11888953
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 20:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640581C9B62;
	Mon, 13 Jan 2025 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VExyO1mz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9135280
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736801930; cv=none; b=h2TXTgt3BP+GBFsSEVbXGA9yAVF5CvPE+KZ4+b5UjgMtNmSy3PuISxaiYXSdrCB9uiZ1GNvJXuXREGvO2mnY6CPCk9z0wG6+D41toIzn8BFqlaZ4rHu6xwk+anwxKNcUcLlsgk7LC3zeAFWhCO+cczLn4+W7GVEyi7K2+Xu+f6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736801930; c=relaxed/simple;
	bh=j06LBVqMe1uOQizFRK6494JtsLIBaSl4+sndh1OVITU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IJFdrbUtTg8UsVbsW9Ip39r+lzeruNVsA75BjYbVqXUPC4kV/eoDrPwRLcxYMcQ4Fok84iPxAAmanP1n657MMg+j0zCVSVVO/8VdhjYbNBpF5QtToa5yQ5ZGmVbfytFzUPG5ceML6LM/91HtEqyvHg51I2ysdkm10/Mtgp/kSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VExyO1mz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736801929; x=1768337929;
  h=date:from:to:cc:subject:message-id;
  bh=j06LBVqMe1uOQizFRK6494JtsLIBaSl4+sndh1OVITU=;
  b=VExyO1mzHy2qSGAE8zGgfGPWnSh+NlH0hm5jZ/S6AM6fCutJRFQ1jgLM
   YhfFK3Vj8ZpwpIO63mLwohKjgl8ltvDVIHRx2WCA2Odc/dA530UQfUFnU
   bITZzHowBMfgYohlZEG3JH7zpR8bkFPiaHZa5qUB2fruC4/vb3/OrFyCz
   U/yH14JE4Fm7N89e6wiw+ehF4aPm2AglEVeZNUTnKQ3a0sVtJ2d2apXYX
   9oJk6BqxvmoduDaeKI09ewPfRATb+ko2KsdB13SGhrUodYujXPdP6tCb9
   NT8Mt6iRlNsAGwJPrm1B+mptMFZtsC7eN008DrFJQcWUsDrTnUGNoYJzp
   Q==;
X-CSE-ConnectionGUID: Xeswcvq4Sl+RnU5rTdqc1A==
X-CSE-MsgGUID: dZukxhAlTSmjTQmO9HCRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40759799"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="40759799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 12:58:48 -0800
X-CSE-ConnectionGUID: FS1HzTj6QzWUVk6YOoGv6g==
X-CSE-MsgGUID: 7Yr64H/NQPaSvTLm5OJ2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104462114"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2025 12:58:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXRWH-000Nff-0T;
	Mon, 13 Jan 2025 20:58:45 +0000
Date: Tue, 14 Jan 2025 04:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 0350d447113a0e77dafc2d7c7e26d0103a347b18
Message-ID: <202501140449.wJifZOJk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 0350d447113a0e77dafc2d7c7e26d0103a347b18  USB: disable all RNDIS protocol drivers

elapsed time: 926m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250113    gcc-13.2.0
arc                   randconfig-002-20250113    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                       imx_v4_v5_defconfig    clang-16
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20250113    gcc-14.2.0
arm                   randconfig-002-20250113    gcc-14.2.0
arm                   randconfig-003-20250113    gcc-14.2.0
arm                   randconfig-004-20250113    clang-20
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250113    gcc-14.2.0
arm64                 randconfig-002-20250113    clang-18
arm64                 randconfig-003-20250113    clang-20
arm64                 randconfig-004-20250113    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250113    gcc-14.2.0
csky                  randconfig-002-20250113    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250113    clang-20
hexagon               randconfig-002-20250113    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250113    clang-19
i386        buildonly-randconfig-002-20250113    gcc-12
i386        buildonly-randconfig-003-20250113    clang-19
i386        buildonly-randconfig-004-20250113    clang-19
i386        buildonly-randconfig-005-20250113    clang-19
i386        buildonly-randconfig-006-20250113    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250113    gcc-14.2.0
loongarch             randconfig-002-20250113    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250113    gcc-14.2.0
nios2                 randconfig-002-20250113    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250113    gcc-14.2.0
parisc                randconfig-002-20250113    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      chrp32_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                      katmai_defconfig    clang-18
powerpc               randconfig-001-20250113    clang-18
powerpc               randconfig-002-20250113    gcc-14.2.0
powerpc               randconfig-003-20250113    clang-20
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250113    clang-20
powerpc64             randconfig-002-20250113    gcc-14.2.0
powerpc64             randconfig-003-20250113    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250113    gcc-14.2.0
riscv                 randconfig-002-20250113    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250113    gcc-14.2.0
s390                  randconfig-002-20250113    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250113    gcc-14.2.0
sh                    randconfig-002-20250113    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250113    gcc-14.2.0
sparc                 randconfig-002-20250113    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250113    gcc-14.2.0
sparc64               randconfig-002-20250113    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250113    gcc-12
um                    randconfig-002-20250113    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250113    gcc-12
x86_64      buildonly-randconfig-002-20250113    gcc-12
x86_64      buildonly-randconfig-003-20250113    gcc-12
x86_64      buildonly-randconfig-004-20250113    gcc-12
x86_64      buildonly-randconfig-005-20250113    clang-19
x86_64      buildonly-randconfig-006-20250113    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250113    gcc-14.2.0
xtensa                randconfig-002-20250113    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

