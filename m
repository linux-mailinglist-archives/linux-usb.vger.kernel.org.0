Return-Path: <linux-usb+bounces-13913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4503E95C31D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 04:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC563B229AB
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 02:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DBE1CAA2;
	Fri, 23 Aug 2024 02:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHMz/QZf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876DA934
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724378894; cv=none; b=Rljl31KzIG+J6Av7zOBCUqz+KZZ0vhugxN2VMwi8zWGDgE4gBx1qKGG+cbfd00nUqnYjUGOa0VDYP2yznYVM0hjYF3d2Pm3kwOptoACUGhYXaWKOSz7p4zqENRIrsaly8Gm+mW5V/t59yAM4eZOxdaVRIJRdPbz/txltxoYrw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724378894; c=relaxed/simple;
	bh=MgD/yy7AzEBY4N1gu85mhqCTOjiNlIEgH9ldGnWL/Jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cUrCOeyWD5yo9vESARRKtSes5hXt4xA98wq3lVjFSe33kPFYk9sr7oKlYNYjb0GMpZLY19z3gdMIFi07/jDhtvWvulE/wkFMMwDPDfke9O35xkYKkec46ZQ1d4LwFW44FjGCppiPDO8uBtCOcv6pAltj3VJjINEDj3ImCNAXZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHMz/QZf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724378892; x=1755914892;
  h=date:from:to:cc:subject:message-id;
  bh=MgD/yy7AzEBY4N1gu85mhqCTOjiNlIEgH9ldGnWL/Jc=;
  b=AHMz/QZf+RKRGhnidDjtkc3dLtsKbVefb5wVWxGTj96D3fHAzjcdfq8G
   L4L6Dlfelzg8/GZye02gMT2ylgTmFzcpByWL6CWgsY3+NywsyqR1/j6wq
   owCg1/rX23+/IRNN65gFD6TkCb5CMV0PYhxBcTeTq1MzKlJ4Q0mNTnsYU
   5scSJKCMk15V84JUnMfBTSYCY0kX878M1ATjOcuDtf/gPT2PgnqdsSe8T
   0McqhQmfptFAzlq9WezswknbKdK7WU+oevkcRfZ8URuEB7UOt5RjeQDw/
   GoHBYZIbuc4ul2D67R8YKK4SfmD5DHFSlyhsC63IRmXkq0PcWIH+fmJt7
   g==;
X-CSE-ConnectionGUID: U1czqBM9S6OaDlOPxcfU2w==
X-CSE-MsgGUID: CT5RZflWTxygqseTpTUtWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23010117"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="23010117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 19:08:11 -0700
X-CSE-ConnectionGUID: SSJmLcOkTYeVxZtz10sC5Q==
X-CSE-MsgGUID: c7AER7AhRlitZlQhUP/vzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="65858073"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2024 19:08:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shJii-000DNo-2E;
	Fri, 23 Aug 2024 02:08:08 +0000
Date: Fri, 23 Aug 2024 10:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 10904df3f20cf36e418e78ab73c2fbcecda512b8
Message-ID: <202408231027.0XWbHIW7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 10904df3f20cf36e418e78ab73c2fbcecda512b8  thunderbolt: Improve software receiver lane margining

elapsed time: 1241m

configs tested: 168
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240822   gcc-13.2.0
arc                   randconfig-002-20240822   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          exynos_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                   randconfig-001-20240822   gcc-13.2.0
arm                   randconfig-002-20240822   gcc-13.2.0
arm                   randconfig-003-20240822   gcc-13.2.0
arm                   randconfig-004-20240822   gcc-13.2.0
arm                        vexpress_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240822   gcc-13.2.0
arm64                 randconfig-002-20240822   gcc-13.2.0
arm64                 randconfig-003-20240822   gcc-13.2.0
arm64                 randconfig-004-20240822   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240822   gcc-13.2.0
csky                  randconfig-002-20240822   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240822   gcc-12
i386         buildonly-randconfig-002-20240822   gcc-12
i386         buildonly-randconfig-003-20240822   gcc-12
i386         buildonly-randconfig-004-20240822   gcc-12
i386         buildonly-randconfig-005-20240822   gcc-12
i386         buildonly-randconfig-006-20240822   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240822   gcc-12
i386                  randconfig-002-20240822   gcc-12
i386                  randconfig-003-20240822   gcc-12
i386                  randconfig-004-20240822   gcc-12
i386                  randconfig-005-20240822   gcc-12
i386                  randconfig-006-20240822   gcc-12
i386                  randconfig-011-20240822   gcc-12
i386                  randconfig-012-20240822   gcc-12
i386                  randconfig-013-20240822   gcc-12
i386                  randconfig-014-20240822   gcc-12
i386                  randconfig-015-20240822   gcc-12
i386                  randconfig-016-20240822   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240822   gcc-13.2.0
loongarch             randconfig-002-20240822   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          hp300_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip32_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240822   gcc-13.2.0
nios2                 randconfig-002-20240822   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240822   gcc-13.2.0
parisc                randconfig-002-20240822   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240822   gcc-13.2.0
powerpc64             randconfig-002-20240822   gcc-13.2.0
powerpc64             randconfig-003-20240822   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240822   gcc-13.2.0
riscv                 randconfig-002-20240822   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240822   gcc-13.2.0
s390                  randconfig-002-20240822   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240822   gcc-13.2.0
sh                    randconfig-002-20240822   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7721_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240822   gcc-13.2.0
sparc64               randconfig-002-20240822   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240822   gcc-13.2.0
um                    randconfig-002-20240822   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240822   gcc-12
x86_64       buildonly-randconfig-002-20240822   gcc-12
x86_64       buildonly-randconfig-003-20240822   gcc-12
x86_64       buildonly-randconfig-004-20240822   gcc-12
x86_64       buildonly-randconfig-005-20240822   gcc-12
x86_64       buildonly-randconfig-006-20240822   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240822   gcc-12
x86_64                randconfig-002-20240822   gcc-12
x86_64                randconfig-003-20240822   gcc-12
x86_64                randconfig-004-20240822   gcc-12
x86_64                randconfig-005-20240822   gcc-12
x86_64                randconfig-006-20240822   gcc-12
x86_64                randconfig-011-20240822   gcc-12
x86_64                randconfig-012-20240822   gcc-12
x86_64                randconfig-013-20240822   gcc-12
x86_64                randconfig-014-20240822   gcc-12
x86_64                randconfig-015-20240822   gcc-12
x86_64                randconfig-016-20240822   gcc-12
x86_64                randconfig-071-20240822   gcc-12
x86_64                randconfig-072-20240822   gcc-12
x86_64                randconfig-073-20240822   gcc-12
x86_64                randconfig-074-20240822   gcc-12
x86_64                randconfig-075-20240822   gcc-12
x86_64                randconfig-076-20240822   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240822   gcc-13.2.0
xtensa                randconfig-002-20240822   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

