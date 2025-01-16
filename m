Return-Path: <linux-usb+bounces-19423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E799A13EAB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 17:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63071666E4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 16:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DC522CA10;
	Thu, 16 Jan 2025 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZimCV/Xy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CE41D8A0D
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043346; cv=none; b=AuHd44HN4a6kx8L7ZSCNcoSTX04ARsHEN7XGVARNxKQdGd23RCQ02hEWvtls/eqC4tYvncYauX6Nw1iMYw7NRRBMGNQD/q6/jDUNHAaXxsCthzeM7tTwnFCms7S53LOzzmm4yDmoQR2KtlINx6KYj2G4Hj6q7HxkNyzhuX/ZhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043346; c=relaxed/simple;
	bh=8ztHMWK8Zhouc6LvwiZjOb1n3PWkw2C8leO2CpaP4kU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bd4XNirHiPue0Z8BB9tpY4V+070o2u4m+9+bXg4xjgIrYrPr654seq36CYsc4msH0mVzqkcaquXjlWXZ37OL/nNYmf2C/twxOIv8KVe3N6vq0JjlrLCECLCLb8ufE9URwF6Nlpq4aaCxxQIKzVrkqsy9rKM3UZeUEXSrSaM4Aq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZimCV/Xy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737043345; x=1768579345;
  h=date:from:to:cc:subject:message-id;
  bh=8ztHMWK8Zhouc6LvwiZjOb1n3PWkw2C8leO2CpaP4kU=;
  b=ZimCV/Xyr/07rwP6pjIrph9jBSjbKzGkmnbR4Dxnv8djGGdBFzfn6V0G
   qnvOlk/bvMMuI3egW7ftVOzvCGCYtNCKrI7iib2TrZFr8ynbhp3rQKhvG
   MMGnteqIq8IsyXhxb50PMJyWF6XimMGBu6mY8TW4XbX4web73B/Y3bfoq
   SZAdaZssxVitiBY1O8ZI0Gdgj9s9Aym23fiRsHIzCS0dK9BkONGyqJ5Io
   9oA86eaSzR4I1/6+xBGF5WMWPpPOGopbbXKsButMnliKmAqynqLjOco4y
   iHPLxj66Va/XpW/L+qW+obbWJiR1Bvk+yT0rdRbp5NUfmBSINase441Am
   Q==;
X-CSE-ConnectionGUID: GUKGAn35SGyM22YiuMziSw==
X-CSE-MsgGUID: ncf3vMW4TEm3LCNLUF5zyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36718453"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36718453"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:01:24 -0800
X-CSE-ConnectionGUID: jf+Kk2gZTA+SojvDtM9mpQ==
X-CSE-MsgGUID: iFMpFwgxSt+IpdaBIsfyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136404165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2025 08:01:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYSJ7-000S6z-0C;
	Thu, 16 Jan 2025 16:01:21 +0000
Date: Fri, 17 Jan 2025 00:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 47a836da9ca91ab95b3cf1b2218db60bd67d4514
Message-ID: <202501170038.Z7OMaPEV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 47a836da9ca91ab95b3cf1b2218db60bd67d4514  Merge tag 'thunderbolt-for-v6.14-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 1452m

configs tested: 89
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
i386                               defconfig    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
openrisc                   or1ksim_defconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv                            allnoconfig    gcc-14.2.0
riscv            nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                              allmodconfig    clang-20
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

