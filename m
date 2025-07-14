Return-Path: <linux-usb+bounces-25746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41FB03825
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 09:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA357A254E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 07:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9387F230BC6;
	Mon, 14 Jul 2025 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmaeUb+r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C87F84A3E
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752478765; cv=none; b=JaXBfotyyPEp23hR0gDxEj1yFI4Fnfd4tr2IH/et0jV1CZs/K6+YP20qBCQbz2IqlGu2HyXjFY1QFZaz0ctAdQsLfXcQL+Z4HZaxvdzMn+ILWNZQ/CtvZPTInBGlsMJCbDZM/rwe4xKmS0PGHgHDI3p0vFQErIrh0d5LGjf8pbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752478765; c=relaxed/simple;
	bh=uujPSh/8ezca/4Qz9wIQvtXDbWlzDCyO9vX8Qy7StsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CkU+0NbKqh2wvR38vHGuh06OzTfgt5lyo1Sa4P2t4hzEpPyazxmIzzLdTpl4dzpzI7Oqf2YCM232hmatlTbtzA6cymwg/zOPU4SnSewKMtKgO5sPRvJOYLB96cqHVV2egEKczjj/Ew/qhNVmhhdXfFJ8y8M+JR8/BTzYHuXEn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmaeUb+r; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752478763; x=1784014763;
  h=date:from:to:cc:subject:message-id;
  bh=uujPSh/8ezca/4Qz9wIQvtXDbWlzDCyO9vX8Qy7StsY=;
  b=kmaeUb+rCnOcJiIlgC/FlZuJoQ/nz/HuliiHLzRQz2GcGp+Np3LjUa69
   nKdXeGeRIbjwNXzdvvdyIRhq+aT0jvo3NNHwpA8MyGIy67MXaFZvBBnUm
   r5X+q7Fe9HADnlf1tAQTlXnNRgYagNrw8UvJ3Fe75tr+zCXDbdnstUqkm
   zMrjG8P18qdvvItUK2J4sB+SatZnoonC08zg3oKdCVnpCf+lGlBJwdnXm
   Q9B4P5ZuGjzBZBMgxOkD5AqvzuJ2DsralG4gqYhUwghJn1X59jRwju54o
   u1JJf6F7AM13m7nQOnnYrQOLYLmMVZeDEEpcdzd7ewya12J1XVpqqNGV+
   g==;
X-CSE-ConnectionGUID: mdLTbnZPT1mV2cfztA19Ww==
X-CSE-MsgGUID: V79j1IKqQWWrcCMpDV7olg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80099425"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="80099425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 00:39:23 -0700
X-CSE-ConnectionGUID: 6f/Gov0cSfKAMxL91ZR+ww==
X-CSE-MsgGUID: OpNgiYVqSZi0B8nI593fEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156967753"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 00:39:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubDmS-0008eH-0H;
	Mon, 14 Jul 2025 07:39:20 +0000
Date: Mon, 14 Jul 2025 15:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5724ff190b22bd04fcfd7287a39c6e5494e40f0b
Message-ID: <202507141540.p3JokILC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5724ff190b22bd04fcfd7287a39c6e5494e40f0b  usb: dwc2: gadget: Fix enter to hibernation for UTMI+ PHY

elapsed time: 921m

configs tested: 126
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250714    gcc-8.5.0
arc                   randconfig-002-20250714    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250714    clang-21
arm                   randconfig-002-20250714    gcc-8.5.0
arm                   randconfig-003-20250714    clang-21
arm                   randconfig-004-20250714    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250714    gcc-13.4.0
arm64                 randconfig-002-20250714    gcc-8.5.0
arm64                 randconfig-003-20250714    gcc-8.5.0
arm64                 randconfig-004-20250714    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250714    gcc-10.5.0
csky                  randconfig-002-20250714    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250714    clang-21
hexagon               randconfig-002-20250714    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250714    gcc-12
i386        buildonly-randconfig-002-20250714    clang-20
i386        buildonly-randconfig-003-20250714    gcc-12
i386        buildonly-randconfig-004-20250714    gcc-12
i386        buildonly-randconfig-005-20250714    gcc-12
i386        buildonly-randconfig-006-20250714    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250714    gcc-15.1.0
loongarch             randconfig-002-20250714    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250714    gcc-12.4.0
nios2                 randconfig-002-20250714    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250714    gcc-8.5.0
parisc                randconfig-002-20250714    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc                       eiger_defconfig    clang-21
powerpc               randconfig-001-20250714    gcc-10.5.0
powerpc               randconfig-002-20250714    gcc-10.5.0
powerpc               randconfig-003-20250714    gcc-8.5.0
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250714    clang-16
powerpc64             randconfig-002-20250714    gcc-8.5.0
powerpc64             randconfig-003-20250714    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250714    gcc-8.5.0
riscv                 randconfig-002-20250714    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250714    clang-21
s390                  randconfig-002-20250714    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250714    gcc-12.4.0
sh                    randconfig-002-20250714    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250714    gcc-8.5.0
sparc                 randconfig-002-20250714    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250714    clang-21
sparc64               randconfig-002-20250714    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250714    gcc-12
um                    randconfig-002-20250714    gcc-11
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250714    gcc-8.5.0
xtensa                randconfig-002-20250714    gcc-12.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

