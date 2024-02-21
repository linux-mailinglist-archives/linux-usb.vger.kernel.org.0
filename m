Return-Path: <linux-usb+bounces-6826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6285CF28
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 04:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BA15B241D0
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 03:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBD038DE6;
	Wed, 21 Feb 2024 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtM+UwJR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34B2837E
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708487599; cv=none; b=NkNAHgdPYmLPqnJXh4ZO3QcsXUqEh7poOw4zt+BC8x7TSVz68QexWWqHD4x+xr9T3uFe1QTIfxpiT6KzpzsuEn2WGThVZnFLItMzqj/70on7qsBa0bcIPSQR8k56nD0V5guGxzKhfpujm1qvdTQqfI6bc4PqZ0tK5uYEdmXWDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708487599; c=relaxed/simple;
	bh=7X2MY2ywZ0H5Js4DPhfYUO7Swv49uHO72Ul642FHHv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kv70S7WSt0VBA4zvBcg7UN9buUECeilzYeqx4UUF4Os9bzF+Jjyte6EV9xN5xyMPq39vOjmkbpoHm2cYBYn/cs8Ks5UIgN9Qh7SzE1RAVKi4XHsVfMhviocDl1lDg2/Z+SXuLmgYWvy1LGK8tPXOhpfD7OeOJhdJSPmTe5KyOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtM+UwJR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708487597; x=1740023597;
  h=date:from:to:cc:subject:message-id;
  bh=7X2MY2ywZ0H5Js4DPhfYUO7Swv49uHO72Ul642FHHv0=;
  b=VtM+UwJRFUl8R8p0peZ0n0/LHDXgaB8NAifL7XGK5ya4TuRAhXXT2qWR
   fyfKA0neyCF8/COePdhEOjb79YBM0qsUnOFHqGYwefQH0D3ELje+IAp47
   vA0hx127AOpasK/4F1R5PGtfn1Yjnd90vtmevqd+zqPM/N4oYMtimd1Nf
   QBVpad4kOpLtOd2J+uPWbldyecakbWCmVAjP2ISFEehewruxHP5h5Psjn
   wWX02dJ2LGxIaQ3S91IDePo5DbG6o2sClzSc0mryjh1Cy7k+lHOko1gGt
   +RXnh+ffYSXowL/YnGgXDbR3jh3a1FN0Yxd185r9Tui2tfexYN55K4bsi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2752772"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2752772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 19:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5345842"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2024 19:53:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcdfB-0004zA-3C;
	Wed, 21 Feb 2024 03:53:03 +0000
Date: Wed, 21 Feb 2024 11:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 69f89168b310878be82d7d97bc0d22068ad858c0
Message-ID: <202402211146.JmhNAJi8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 69f89168b310878be82d7d97bc0d22068ad858c0  usb: typec: tpcm: Fix issues with power being removed during reset

elapsed time: 1162m

configs tested: 260
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-001-20240221   gcc  
arc                   randconfig-002-20240220   gcc  
arc                   randconfig-002-20240221   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                           h3600_defconfig   gcc  
arm                      jornada720_defconfig   clang
arm                         lpc18xx_defconfig   clang
arm                   randconfig-001-20240220   clang
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-003-20240221   gcc  
arm                   randconfig-004-20240220   gcc  
arm                           sama7_defconfig   clang
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240220   clang
arm64                 randconfig-001-20240221   gcc  
arm64                 randconfig-002-20240220   clang
arm64                 randconfig-002-20240221   gcc  
arm64                 randconfig-003-20240220   clang
arm64                 randconfig-003-20240221   gcc  
arm64                 randconfig-004-20240220   clang
arm64                 randconfig-004-20240221   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-001-20240221   gcc  
csky                  randconfig-002-20240220   gcc  
csky                  randconfig-002-20240221   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240220   clang
hexagon               randconfig-002-20240220   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240220   gcc  
i386         buildonly-randconfig-001-20240221   gcc  
i386         buildonly-randconfig-002-20240220   gcc  
i386         buildonly-randconfig-002-20240221   clang
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-003-20240221   gcc  
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-004-20240221   gcc  
i386         buildonly-randconfig-005-20240220   gcc  
i386         buildonly-randconfig-005-20240221   gcc  
i386         buildonly-randconfig-006-20240220   gcc  
i386         buildonly-randconfig-006-20240221   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240220   gcc  
i386                  randconfig-001-20240221   gcc  
i386                  randconfig-002-20240220   gcc  
i386                  randconfig-002-20240221   clang
i386                  randconfig-003-20240220   clang
i386                  randconfig-003-20240221   clang
i386                  randconfig-004-20240220   clang
i386                  randconfig-004-20240221   gcc  
i386                  randconfig-005-20240220   gcc  
i386                  randconfig-005-20240221   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-006-20240221   clang
i386                  randconfig-011-20240220   clang
i386                  randconfig-011-20240221   gcc  
i386                  randconfig-012-20240220   gcc  
i386                  randconfig-012-20240221   clang
i386                  randconfig-013-20240220   gcc  
i386                  randconfig-013-20240221   gcc  
i386                  randconfig-014-20240220   clang
i386                  randconfig-014-20240221   clang
i386                  randconfig-015-20240220   clang
i386                  randconfig-015-20240221   gcc  
i386                  randconfig-016-20240220   clang
i386                  randconfig-016-20240221   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-001-20240221   gcc  
loongarch             randconfig-002-20240220   gcc  
loongarch             randconfig-002-20240221   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-001-20240221   gcc  
nios2                 randconfig-002-20240220   gcc  
nios2                 randconfig-002-20240221   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-001-20240221   gcc  
parisc                randconfig-002-20240220   gcc  
parisc                randconfig-002-20240221   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240220   gcc  
powerpc               randconfig-001-20240221   gcc  
powerpc               randconfig-002-20240220   clang
powerpc               randconfig-002-20240221   gcc  
powerpc               randconfig-003-20240220   clang
powerpc               randconfig-003-20240221   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-001-20240221   gcc  
powerpc64             randconfig-002-20240220   gcc  
powerpc64             randconfig-002-20240221   gcc  
powerpc64             randconfig-003-20240220   clang
powerpc64             randconfig-003-20240221   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240220   clang
riscv                 randconfig-002-20240220   clang
riscv                 randconfig-002-20240221   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240220   gcc  
s390                  randconfig-002-20240220   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-001-20240221   gcc  
sh                    randconfig-002-20240220   gcc  
sh                    randconfig-002-20240221   gcc  
sh                          sdk7786_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-001-20240221   gcc  
sparc64               randconfig-002-20240220   gcc  
sparc64               randconfig-002-20240221   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240220   gcc  
um                    randconfig-001-20240221   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-002-20240221   gcc  
x86_64       buildonly-randconfig-003-20240220   gcc  
x86_64       buildonly-randconfig-003-20240221   gcc  
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240220   gcc  
x86_64       buildonly-randconfig-006-20240220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240220   gcc  
x86_64                randconfig-001-20240221   gcc  
x86_64                randconfig-002-20240220   gcc  
x86_64                randconfig-002-20240221   gcc  
x86_64                randconfig-003-20240220   gcc  
x86_64                randconfig-003-20240221   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-004-20240221   gcc  
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-005-20240221   gcc  
x86_64                randconfig-006-20240220   gcc  
x86_64                randconfig-006-20240221   gcc  
x86_64                randconfig-011-20240220   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-012-20240221   gcc  
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240220   gcc  
x86_64                randconfig-014-20240221   gcc  
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-015-20240221   gcc  
x86_64                randconfig-016-20240220   gcc  
x86_64                randconfig-016-20240221   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-071-20240221   gcc  
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-072-20240221   gcc  
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-073-20240221   gcc  
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-074-20240221   gcc  
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240220   clang
x86_64                randconfig-076-20240221   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-001-20240221   gcc  
xtensa                randconfig-002-20240220   gcc  
xtensa                randconfig-002-20240221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

