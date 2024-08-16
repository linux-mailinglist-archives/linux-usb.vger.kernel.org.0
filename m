Return-Path: <linux-usb+bounces-13547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E771954B3A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 15:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97041284B9A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 13:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF66D1BB6B7;
	Fri, 16 Aug 2024 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwEGK4vs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E51B8E84
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723815490; cv=none; b=ctTcoDFELlEeIYFhvSJ/ZfTo82+9NouKwN2dqWMYbrxHzOI60dMtLtRfmo8M2eAHADcuahPOrk3ABYLLtmSyWWygBo8QJ08CuPeppREIkHffoir09bbFM4p5hNqy8hk4yQpZGi0mM4cLkjg7DCcQFI6IVxPvsvX17uSFdzOGGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723815490; c=relaxed/simple;
	bh=BelGaV/W0QhJXj12bD7m88q4SKyFPm7nf/urq1L7jWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=feSXz3Kugyv6gozs5kEvAZ+PfeoZxEWFl6ycwZ70VRDTUzuuEu+320pW3rHwr/3BZ7c4Fe86fcphSKOOWiKsMGbh5hbHXUFKqOxGGQkP2JhvJKsqCK07+gGSaS9SY78mtITSK4a/8TftH2Er+jzWjB1EfRRxCKetR/Klbonodds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwEGK4vs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723815488; x=1755351488;
  h=date:from:to:cc:subject:message-id;
  bh=BelGaV/W0QhJXj12bD7m88q4SKyFPm7nf/urq1L7jWc=;
  b=NwEGK4vsqmnhDC1J+jovuDtbAqyKaayjpmAt3TmUuAKCHnVVKLaRS9ra
   lj2CeWtgGWjBx6Etv6ek9k3Qwr5MYRJlyfOyxP4x/1cPvZ7hRm8yyC6Hq
   PeN0rQw2B+Q1Yiv5oCQTF+jE+ynN2xGQ6QcWtEEBVk95jS/fprQJv0QiM
   AGvSb6BB9CC3lY7CrzlStvjeR1OIA2XL/G2nz+wTfnO2DSpBTLA+wN54I
   JlI+AOwLxHUoIbwpiLEqGxiccSM6OV+jsTUeVnDV9jjk9s4b8GSHz1ve6
   /wiSMdk08HHc0I6Fct1PmHLZV4EW464XMMDCB0mgAfXuScXN1EX5JJciG
   w==;
X-CSE-ConnectionGUID: Vr2Onf5dTUWfvpUJyAkgHA==
X-CSE-MsgGUID: jZrV4JdeQTmyHyTKSCjp8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22257794"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="22257794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:37:57 -0700
X-CSE-ConnectionGUID: OcVwIvL+SY2w6oHlOChJLA==
X-CSE-MsgGUID: /1jbqw4lSLaes60DP0tDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="60466925"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Aug 2024 06:37:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sex9O-0006So-05;
	Fri, 16 Aug 2024 13:37:54 +0000
Date: Fri, 16 Aug 2024 21:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 af8e119f52e9c13e556be9e03f27957554a84656
Message-ID: <202408162151.veQUCDt4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: af8e119f52e9c13e556be9e03f27957554a84656  xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration

elapsed time: 1370m

configs tested: 160
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240816   gcc-13.2.0
arc                   randconfig-002-20240816   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240816   clang-20
arm                   randconfig-002-20240816   clang-20
arm                   randconfig-003-20240816   clang-20
arm                   randconfig-004-20240816   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240816   clang-20
arm64                 randconfig-002-20240816   clang-20
arm64                 randconfig-003-20240816   clang-20
arm64                 randconfig-004-20240816   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240816   gcc-14.1.0
csky                  randconfig-002-20240816   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240816   clang-20
hexagon               randconfig-002-20240816   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240816   gcc-12
i386         buildonly-randconfig-002-20240816   clang-18
i386         buildonly-randconfig-003-20240816   clang-18
i386         buildonly-randconfig-004-20240816   clang-18
i386         buildonly-randconfig-005-20240816   gcc-11
i386         buildonly-randconfig-006-20240816   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240816   clang-18
i386                  randconfig-002-20240816   gcc-12
i386                  randconfig-003-20240816   gcc-11
i386                  randconfig-004-20240816   gcc-12
i386                  randconfig-005-20240816   clang-18
i386                  randconfig-006-20240816   gcc-11
i386                  randconfig-011-20240816   gcc-12
i386                  randconfig-012-20240816   clang-18
i386                  randconfig-013-20240816   clang-18
i386                  randconfig-014-20240816   gcc-12
i386                  randconfig-015-20240816   gcc-12
i386                  randconfig-016-20240816   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240816   gcc-14.1.0
loongarch             randconfig-002-20240816   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240816   gcc-14.1.0
nios2                 randconfig-002-20240816   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240816   gcc-14.1.0
parisc                randconfig-002-20240816   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-002-20240816   clang-20
powerpc64             randconfig-001-20240816   gcc-14.1.0
powerpc64             randconfig-002-20240816   clang-20
powerpc64             randconfig-003-20240816   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240816   clang-20
riscv                 randconfig-002-20240816   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240816   gcc-14.1.0
s390                  randconfig-002-20240816   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240816   gcc-14.1.0
sh                    randconfig-002-20240816   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240816   gcc-14.1.0
sparc64               randconfig-002-20240816   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240816   clang-20
um                    randconfig-002-20240816   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240816   clang-18
x86_64       buildonly-randconfig-002-20240816   gcc-12
x86_64       buildonly-randconfig-003-20240816   gcc-12
x86_64       buildonly-randconfig-004-20240816   clang-18
x86_64       buildonly-randconfig-005-20240816   clang-18
x86_64       buildonly-randconfig-006-20240816   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240816   gcc-12
x86_64                randconfig-002-20240816   clang-18
x86_64                randconfig-003-20240816   clang-18
x86_64                randconfig-004-20240816   clang-18
x86_64                randconfig-005-20240816   clang-18
x86_64                randconfig-006-20240816   gcc-12
x86_64                randconfig-011-20240816   clang-18
x86_64                randconfig-012-20240816   gcc-12
x86_64                randconfig-013-20240816   gcc-12
x86_64                randconfig-014-20240816   clang-18
x86_64                randconfig-015-20240816   clang-18
x86_64                randconfig-016-20240816   clang-18
x86_64                randconfig-071-20240816   clang-18
x86_64                randconfig-072-20240816   gcc-11
x86_64                randconfig-073-20240816   gcc-12
x86_64                randconfig-074-20240816   clang-18
x86_64                randconfig-075-20240816   clang-18
x86_64                randconfig-076-20240816   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240816   gcc-14.1.0
xtensa                randconfig-002-20240816   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

