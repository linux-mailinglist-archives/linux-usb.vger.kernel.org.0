Return-Path: <linux-usb+bounces-23174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B695AA912EC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 07:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C383E443B83
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 05:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7127B1DEFEC;
	Thu, 17 Apr 2025 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0jvXF9/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA8A1DD526
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868586; cv=none; b=gyp7QQV/Ncj2sk/fKFoA3TAfPuj8zp/taXjLNZVno9jpCUi/gKAl919PTj+ixcu4rLpVSwo0PfAT4alaUlfxHIbbnQ52nYFt6bAm5xzI5kkdyc178TtAGDbItMQMbIQVMTDRSOhTj4i1StBkVMJDn0AxGsI+pDfYDukfVOdaw/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868586; c=relaxed/simple;
	bh=PNIhbvAeph6tHvgV11FPkJ10dfOyjwW6rl2AHF2DHqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IG7Vq65yC/YoLL+pqJfPoZapZb25xpz2sxoFhAeGM1VdpBUZWAX8lLHu/7MYTZX0dhN0HIuLecUVWUR5M8evJxDvfz9qrunNMYL+Q4Acpy5+nINqnyvnDQ9xovONEMdRfp23lkjjTKSZrMOA2mfqlzDelnC2cMbA6btmc5QTbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0jvXF9/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744868585; x=1776404585;
  h=date:from:to:cc:subject:message-id;
  bh=PNIhbvAeph6tHvgV11FPkJ10dfOyjwW6rl2AHF2DHqE=;
  b=b0jvXF9/jemc5OEm/26iyp138OLkU701+uJUcCiOsnd+p4mS4pyfZBF2
   GMeXekFV4Lp9XSNQIVxJcfIW96zg+NHKW/2fIT0arVwQzY8CFf2Sy6lGj
   BR4Gm7rwjnL2KHPV5EPX+9Iwk3FoLlWNNHIqmlx64AYPj7MvlOCm+IZDR
   SQiyVOVUWsC2NSZGjpHT1FJPGqgMEUnWe+kqyM9KNCuvpFuKuK46JF0iH
   iGY3ppBcMVZDrt49ykfJnJvanK6iOYTwUu4ho5k1S4Y/kGNTDcKtQDpoo
   Z2Si8MVgwH/3Xf5TzPM5Y4ZjGUOfrmz7B5HLDjaKDv/f3yxbWtC6y3ba4
   A==;
X-CSE-ConnectionGUID: /+LnHjaRSZmgYRNlP8lSkA==
X-CSE-MsgGUID: vEhAKyn/RVu4VTPBVqJ0AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46570054"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46570054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 22:43:04 -0700
X-CSE-ConnectionGUID: suScr2DqRLeAGZ4UWOWGlg==
X-CSE-MsgGUID: uX5sKI92RWSEKQSosKUmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135516716"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 22:43:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5I1d-000LQe-0V;
	Thu, 17 Apr 2025 05:43:01 +0000
Date: Thu, 17 Apr 2025 13:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f41f7b3d9daff26e34ee820af5a44d6c66e23412
Message-ID: <202504171312.w2eIDz5H-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f41f7b3d9daff26e34ee820af5a44d6c66e23412  MAINTAINERS: Update Intel LJCA maintainer

elapsed time: 1464m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-12.4.0
arc                   randconfig-002-20250416    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250416    clang-17
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250416    clang-21
arm                   randconfig-004-20250416    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250416    gcc-8.5.0
arm64                 randconfig-002-20250416    clang-21
arm64                 randconfig-003-20250416    gcc-6.5.0
arm64                 randconfig-004-20250416    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-002-20250416    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-003-20250416    clang-21
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-003-20250416    gcc-6.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250416    clang-20
riscv                 randconfig-002-20250416    gcc-8.5.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250416    clang-21
s390                  randconfig-002-20250416    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250416    gcc-6.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250416    gcc-11.5.0
sparc                 randconfig-002-20250416    gcc-11.5.0
sparc64               randconfig-001-20250416    gcc-5.5.0
sparc64               randconfig-002-20250416    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250416    clang-21
um                    randconfig-002-20250416    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250416    gcc-7.5.0
xtensa                randconfig-002-20250416    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

