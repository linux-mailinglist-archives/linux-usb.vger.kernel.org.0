Return-Path: <linux-usb+bounces-31819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30883CE8270
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 21:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A30893021E40
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 20:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E79C2C21F0;
	Mon, 29 Dec 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/fqk9Vu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A42E413
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040798; cv=none; b=ewHjYgaY9tYFYCQ5TzypmGQDkcuc/1wVicEG4SGfEsZ+/yJgrfNyHq7SkVI7wSn59bipBfDwmqnexLNq832Z1wRjXdNK937pTbcXfo+Wt/Th0VRydkx2omdgLhGkNjDTKlA2WK27wKhbmTsdf1MarX/5qpfulXXjN2qXlKrAyEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040798; c=relaxed/simple;
	bh=fBT8X2wOVZjQGh0zFY0Q7eAQhkUCR6UMwZOqV7FdE00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e/tdq/UYYrpXMHQIU90sTSwfwoAofGzJha5vgAqFtoPIgONocAKFetAcMnrpLdqanx2RPj9rS0bBkV/QxUMoTG0p7kJqvdHs79sGRU+DG25+Q3b10yzLA6QOyw9yriSLCP8Gwb26uGC5SVBPRLbNjHArOVtuFLNMXW1f6D1mZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/fqk9Vu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767040797; x=1798576797;
  h=date:from:to:cc:subject:message-id;
  bh=fBT8X2wOVZjQGh0zFY0Q7eAQhkUCR6UMwZOqV7FdE00=;
  b=H/fqk9Vux/N+ZetOW/W8+Cbr9dCXV8N4MB1Glszf6e6Q4czX3GvuSpLr
   vItA0xggvW5loViJrjdRsDAw5mssOqAtYGSLGcNIZuVDIMzqCsuTtGQRL
   dUEWiKNvHwG47i1i1LcRusRk1Zx4V5agZe7BDX3DmL6dK4RlguMl0awEW
   r/Y7JM/isk+fPYqFCf28tcZGI3pP0RxuihEjuc1wvzMVnCYs6WIngVdFC
   RZ65c5ivzBd0Wp5OXraWucLTt7+L4lchPYNSdVlyWoZmlPg7Ph1hd3wXw
   t1eu2Z0TWXxWudE7RlDv4LR+9odx0QkiKAV9YF0ZEm4Kf6wRaUz9QkbOi
   Q==;
X-CSE-ConnectionGUID: D8Flas/1Sl2VrJI3/+IOgQ==
X-CSE-MsgGUID: 89BF+8epSJCI1Kq+xDj79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80096550"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="80096550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 12:39:57 -0800
X-CSE-ConnectionGUID: SXqzO9n1TOGTrcTWKg6OAQ==
X-CSE-MsgGUID: 87kuW7bwRfCPazsBUhgL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200222933"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2025 12:39:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaK1p-000000007yR-31Cx;
	Mon, 29 Dec 2025 20:39:49 +0000
Date: Tue, 30 Dec 2025 04:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e46bcc4e856e0e4352752ff9247af6240334f822
Message-ID: <202512300421.e3TLOkVD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e46bcc4e856e0e4352752ff9247af6240334f822  Merge 6.19-rc3 into usb-next

elapsed time: 727m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251229    gcc-13.4.0
arc                   randconfig-002-20251229    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-22
arm                       imx_v6_v7_defconfig    clang-16
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20251229    gcc-15.1.0
arm                   randconfig-002-20251229    gcc-12.5.0
arm                   randconfig-003-20251229    clang-22
arm                   randconfig-004-20251229    gcc-15.1.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251229    clang-22
arm64                 randconfig-002-20251229    clang-22
arm64                 randconfig-003-20251229    gcc-10.5.0
arm64                 randconfig-004-20251229    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251229    gcc-15.1.0
csky                  randconfig-002-20251229    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251229    clang-20
i386        buildonly-randconfig-002-20251229    gcc-14
i386        buildonly-randconfig-003-20251229    gcc-13
i386        buildonly-randconfig-004-20251229    clang-20
i386        buildonly-randconfig-005-20251229    gcc-14
i386        buildonly-randconfig-006-20251229    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251229    gcc-14
i386                  randconfig-002-20251229    clang-20
i386                  randconfig-003-20251229    clang-20
i386                  randconfig-004-20251229    clang-20
i386                  randconfig-005-20251229    clang-20
i386                  randconfig-006-20251229    clang-20
i386                  randconfig-007-20251229    clang-20
i386                  randconfig-011-20251229    gcc-14
i386                  randconfig-012-20251229    gcc-14
i386                  randconfig-013-20251229    gcc-14
i386                  randconfig-014-20251229    gcc-14
i386                  randconfig-015-20251229    gcc-14
i386                  randconfig-016-20251229    gcc-14
i386                  randconfig-017-20251229    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251229    clang-18
loongarch             randconfig-002-20251229    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
mips                          malta_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251229    gcc-11.5.0
nios2                 randconfig-002-20251229    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251229    gcc-13.4.0
parisc                randconfig-002-20251229    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251229    gcc-15.1.0
riscv                 randconfig-002-20251229    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251229    clang-22
s390                  randconfig-002-20251229    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251229    gcc-10.5.0
sh                    randconfig-002-20251229    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251229    gcc-13.4.0
sparc                 randconfig-002-20251229    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251229    clang-20
sparc64               randconfig-002-20251229    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251229    gcc-14
um                    randconfig-002-20251229    clang-22
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251229    clang-20
x86_64      buildonly-randconfig-002-20251229    clang-20
x86_64      buildonly-randconfig-003-20251229    gcc-14
x86_64      buildonly-randconfig-004-20251229    clang-20
x86_64      buildonly-randconfig-005-20251229    gcc-14
x86_64      buildonly-randconfig-006-20251229    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251229    gcc-14
x86_64                randconfig-002-20251229    clang-20
x86_64                randconfig-003-20251229    gcc-14
x86_64                randconfig-004-20251229    clang-20
x86_64                randconfig-005-20251229    gcc-14
x86_64                randconfig-006-20251229    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251229    clang-20
x86_64                randconfig-072-20251229    gcc-14
x86_64                randconfig-073-20251229    gcc-13
x86_64                randconfig-074-20251229    clang-20
x86_64                randconfig-075-20251229    clang-20
x86_64                randconfig-076-20251229    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251229    gcc-8.5.0
xtensa                randconfig-002-20251229    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

