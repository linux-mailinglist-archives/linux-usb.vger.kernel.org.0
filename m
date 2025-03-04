Return-Path: <linux-usb+bounces-21306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7FA4D2B3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 05:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E28D3AC5D6
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 04:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA47F1F418D;
	Tue,  4 Mar 2025 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJAPf83T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C41EC00F
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 04:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741064283; cv=none; b=OwlfBRylZ8nQ5Mf2+EBYO9+FCDQL6TGP2SPvUOGXxx9ReGV1S6pP0cELpC2Gdh+0WBsN4/iv/xR0i9crb/QIcDDXuO2Mu7q7tO0DvtZzq8OEu9ojRmDiHQFypJnkeatPtWUNJ/bbB6Zpq9GGCZdP2/QjpOXLlki7722bEcIDpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741064283; c=relaxed/simple;
	bh=2r/kpNuuCVDqLGGTeHtAeFl6cNpsiwGg7sKZMnUYVGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fx8ZeeDTrA5+v85ACJmh0rZfMjD0x5Ki1xhsH+4SLp2resIo45e14uyAQZvvJ3wZ3miM5lkxSPAstZr7c5w71pSdM+RmjvDy4XaSGguJphSjLzzSivqeV/+q1AAbJ+KfYdYeiltnGHcom/ePut0vel00qtDHsoYw8WXBXZ77ons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJAPf83T; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741064281; x=1772600281;
  h=date:from:to:cc:subject:message-id;
  bh=2r/kpNuuCVDqLGGTeHtAeFl6cNpsiwGg7sKZMnUYVGA=;
  b=KJAPf83TPl/TLtwL9T2WRMabfmMEaeT5yrpmyJ0W0tAAJo1q2If3e9NO
   broW0Gyd54Hlev8/Yn6lBDZFWXVNCSB6k0Zxotxm1RUucLgEVvvKY3Hg8
   oh2UeHE/aXZ7eGlh60nXspA4p0O4TUyVzFiMgXR31gDXs7970mR/3Wlg1
   JsFV1XM9orCy7IN3HwGF6m/6IOqYlnGZJ/x0q6QxUAMW1nH9YNW8Q97UF
   sKSwIjluLb+pP8zm+W81p96xF9JsDRBtTf8nehTC5iNsF6ougf0tYtdoA
   cxc4KnY4xE2xTg57Qr13TAvgL2iijLJ1HMFrmnh0UCi9ggDdCDwOpEJHr
   g==;
X-CSE-ConnectionGUID: ioW8q6EnTCeqFdi4LJYK3Q==
X-CSE-MsgGUID: Pfqr6JNMTR2iSly2ZSdBLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41673152"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41673152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 20:58:00 -0800
X-CSE-ConnectionGUID: Z5K8qWM5TVGSXnIggnW4Xg==
X-CSE-MsgGUID: PdJpTmnyQ7qcEvX/gLkJkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="123202035"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2025 20:58:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpKLY-000JHO-2b;
	Tue, 04 Mar 2025 04:57:51 +0000
Date: Tue, 04 Mar 2025 12:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 811d22141369d572319ee3350ff8b40fa05850f8
Message-ID: <202503041239.zY3kYffT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 811d22141369d572319ee3350ff8b40fa05850f8  usb: dwc3: exynos: add support for exynos7870

elapsed time: 1144m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250303    gcc-13.2.0
arc                   randconfig-002-20250303    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                            mmp2_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250303    clang-15
arm                   randconfig-002-20250303    gcc-14.2.0
arm                   randconfig-003-20250303    gcc-14.2.0
arm                   randconfig-004-20250303    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250303    clang-21
arm64                 randconfig-002-20250303    clang-19
arm64                 randconfig-003-20250303    gcc-14.2.0
arm64                 randconfig-004-20250303    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250303    gcc-14.2.0
csky                  randconfig-002-20250303    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250303    clang-21
hexagon               randconfig-002-20250303    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250303    gcc-12
i386        buildonly-randconfig-002-20250303    clang-19
i386        buildonly-randconfig-003-20250303    clang-19
i386        buildonly-randconfig-004-20250303    gcc-12
i386        buildonly-randconfig-005-20250303    gcc-12
i386        buildonly-randconfig-006-20250303    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250303    gcc-14.2.0
loongarch             randconfig-002-20250303    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250303    gcc-14.2.0
nios2                 randconfig-002-20250303    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250303    gcc-14.2.0
parisc                randconfig-002-20250303    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   bluestone_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250303    clang-15
powerpc               randconfig-002-20250303    clang-21
powerpc               randconfig-003-20250303    clang-21
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-002-20250303    gcc-14.2.0
powerpc64             randconfig-003-20250303    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250303    gcc-14.2.0
riscv                 randconfig-002-20250303    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250303    clang-18
s390                  randconfig-002-20250303    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250303    gcc-14.2.0
sh                    randconfig-002-20250303    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250303    gcc-14.2.0
sparc                 randconfig-002-20250303    gcc-14.2.0
sparc64               randconfig-001-20250303    gcc-14.2.0
sparc64               randconfig-002-20250303    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250303    gcc-12
um                    randconfig-002-20250303    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250303    clang-19
x86_64      buildonly-randconfig-002-20250303    gcc-12
x86_64      buildonly-randconfig-003-20250303    clang-19
x86_64      buildonly-randconfig-004-20250303    gcc-12
x86_64      buildonly-randconfig-005-20250303    gcc-12
x86_64      buildonly-randconfig-006-20250303    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250303    gcc-14.2.0
xtensa                randconfig-002-20250303    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

