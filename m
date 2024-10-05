Return-Path: <linux-usb+bounces-15757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B439914FC
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 08:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ECB31C21959
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 06:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6704475809;
	Sat,  5 Oct 2024 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3hdHfcD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70720E6
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728111123; cv=none; b=Wq/c/p8kA5UQ5Mwsufp8Vf/rtBUr0QMd5XVSy7MWClQuiV7KNKDgsGKRwiyphrV/TM5UmJ18t6kgq+KUT2NVhLt+P8wJ8UPu4FmBgATW9Uvp/w8mWxkzX2NURXtjtXhrxfH6KZMxJj4+kIvA2Fb3eVE7TJoSlUZDMPy6mOL8g+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728111123; c=relaxed/simple;
	bh=HZpOZ9R0fnINve1Bxh+0JyBhmY8wCJrP7XIMNYd2fx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fSkEf/pkO+LeIzp4DHG2ZVo5JUX5NOdJUlCUCiHZjT2/s75Yvk/NmOKtrps1mtZxW4dKBYfOw0q623papH816qjkYtD7gXaLZ+218ydjlwkczaNmZTFF6d07qA4TyD+yBZcmSj8kSoUrsCRnE575QEr+I2PaEpmom0JXo2xG4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3hdHfcD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728111122; x=1759647122;
  h=date:from:to:cc:subject:message-id;
  bh=HZpOZ9R0fnINve1Bxh+0JyBhmY8wCJrP7XIMNYd2fx0=;
  b=Y3hdHfcDInCY1q+J8DTBytkwAGIPfhVMVDsDtHnkRU3mZOPQHWHJwdQk
   zpBIlPFxvHl5jnq8JPSySHHKYpPMnAyo5yx/IPepO5eGsYZlBoTRMg8Vp
   +8cBa64ze1ys5BtEn9J+OTzVIVHVTp7oAOWZpNCYEHtK1IAsVNTESO+PO
   o7Wm66BW/mXiVVn1/mzCOqwzkHMVX8DyCy5CljjWklujMbt3+F2WSE0BO
   NOWwHQLH2fwXrHRIv2/05wiVVswgyoruH8+C6+7iVDZqPJtryIYOx16fC
   NJFWXn42v6C6TUNDXDyzSICmVpk81NnxP/3RkplbBiuNF22jBjkYI0xho
   g==;
X-CSE-ConnectionGUID: jlf5CX83REGU+Kkn0/4Yqg==
X-CSE-MsgGUID: wfUjF2hLQyuNUZTeMbSFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31035744"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31035744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:52:01 -0700
X-CSE-ConnectionGUID: GPM7zd9sQtelp6Tnkr1xmQ==
X-CSE-MsgGUID: kDdAluX8QvW1Rosb6dpYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105770650"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 23:52:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swydx-0002gs-0g;
	Sat, 05 Oct 2024 06:51:57 +0000
Date: Sat, 05 Oct 2024 14:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d44238d8254a36249d576c96473269dbe500f5e4
Message-ID: <202410051430.ANp2z3ss-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: d44238d8254a36249d576c96473269dbe500f5e4  usb: xhci: Fix problem with xhci resume from suspend

elapsed time: 1023m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241005    gcc-12
x86_64      buildonly-randconfig-002-20241005    gcc-12
x86_64      buildonly-randconfig-003-20241005    gcc-12
x86_64      buildonly-randconfig-004-20241005    gcc-12
x86_64      buildonly-randconfig-005-20241005    gcc-12
x86_64      buildonly-randconfig-006-20241005    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241005    gcc-12
x86_64                randconfig-002-20241005    gcc-12
x86_64                randconfig-003-20241005    gcc-12
x86_64                randconfig-004-20241005    gcc-12
x86_64                randconfig-005-20241005    gcc-12
x86_64                randconfig-006-20241005    gcc-12
x86_64                randconfig-011-20241005    gcc-12
x86_64                randconfig-012-20241005    gcc-12
x86_64                randconfig-013-20241005    gcc-12
x86_64                randconfig-014-20241005    gcc-12
x86_64                randconfig-015-20241005    gcc-12
x86_64                randconfig-016-20241005    gcc-12
x86_64                randconfig-071-20241005    gcc-12
x86_64                randconfig-072-20241005    gcc-12
x86_64                randconfig-073-20241005    gcc-12
x86_64                randconfig-074-20241005    gcc-12
x86_64                randconfig-075-20241005    gcc-12
x86_64                randconfig-076-20241005    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

