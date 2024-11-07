Return-Path: <linux-usb+bounces-17346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132E9C125A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 00:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 569F3B21E98
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 23:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0CC219498;
	Thu,  7 Nov 2024 23:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YodFAzyB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C732170B2
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022001; cv=none; b=Nmbdegv9GJUGASR+FNYRgim7FpLgC63dtW0iWGvG6dxycWHaNGbQLI24PZfc0FoL7cQpfXf+j55Yf1yVwe2cvgexYY+KMZk+Zblsaljq/t7I0VyxdNr6oVW+6kdGBny5YPeI3yCuBW1ST5+cbDo7/Z3CqBGC8j3R0otH/HoTzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022001; c=relaxed/simple;
	bh=/wTcFvzGryhqUPThZsyx9pehruCMy4U4q2b87hsdnxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EACUFnOlcBOOADk4RCJm9Fzq3bEpy5fDJh4aA8lhgO3qZ0FPh0CLKVUZixE6f79W3ZH6GPegbu66AJHyuLV/AQ5xD76dMPhwgZ+XcuWfeCdmL7ahCH+UpVYBeuB/k0BGQ40S6zfRRe81HefqIY7KreZQDKyQnkIYN1RiwO5flAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YodFAzyB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731022000; x=1762558000;
  h=date:from:to:cc:subject:message-id;
  bh=/wTcFvzGryhqUPThZsyx9pehruCMy4U4q2b87hsdnxE=;
  b=YodFAzyBWjI2LwPr4RZnkmcPlJFb/vYOBX31xTSlCpismajnpXk1WCVx
   HbIPkljGNl0rJONqao5LBsCCgHvDQD4EaKH0tzoJmajoQIENxYonPoAv2
   LAC4LpPsiqGTkjuHttWOd00QvPvDd9+WGHyEBtaN8piwEbZ8xlJ14Mbao
   5TX2zRGczrjGpNuSllBwt+7Y50UahIiOUOCRvOHkVpgGQzqAwiq/m9alW
   NRNCLaDHqHUbUv+DO91iYdpmg+Uf5vRAzFo9RAxt28/5S+uTRyeXbd3oy
   UuExvbgs5U2uElqRr2eZ0p/xcB7vUC+wrKgyQG3JC7vFEBTlIfjHYoFXZ
   A==;
X-CSE-ConnectionGUID: 2cVndnHwRLivyJT/xwgeUA==
X-CSE-MsgGUID: H4BJxZlyQwe2iImlyKpBdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34584769"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34584769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 15:26:38 -0800
X-CSE-ConnectionGUID: Yzk9Q8uYSdOq7RlqOJQ6cA==
X-CSE-MsgGUID: qM0JzEG0QWKxIdK2DlK6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85389677"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2024 15:26:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Bta-000qly-16;
	Thu, 07 Nov 2024 23:26:34 +0000
Date: Fri, 08 Nov 2024 07:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 40aeea50444793ed106997a49c7083b656bccfa7
Message-ID: <202411080716.SVM9fHo1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 40aeea50444793ed106997a49c7083b656bccfa7  thunderbolt: Replace deprecated PCI functions

elapsed time: 723m

configs tested: 278
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241107    gcc-14.2.0
arm                   randconfig-004-20241108    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241107    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241107    gcc-14.2.0
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-003-20241108    clang-19
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241107    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-004-20241108    clang-19
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-006-20241108    clang-19
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-011-20241108    clang-19
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-015-20241108    clang-19
i386                  randconfig-016-20241107    clang-19
i386                  randconfig-016-20241108    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                           ip30_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241107    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    clang-20
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241107    gcc-14.2.0
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-001-20241108    clang-19
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-005-20241108    clang-19
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64      buildonly-randconfig-006-20241108    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-001-20241108    clang-19
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-002-20241108    clang-19
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-003-20241108    clang-19
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-004-20241108    clang-19
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-005-20241108    clang-19
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-006-20241108    clang-19
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-011-20241108    clang-19
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-012-20241108    clang-19
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-013-20241108    clang-19
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-014-20241108    clang-19
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-015-20241108    clang-19
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-016-20241108    clang-19
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-071-20241108    clang-19
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-072-20241108    clang-19
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-073-20241108    clang-19
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-074-20241108    clang-19
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-075-20241108    clang-19
x86_64                randconfig-076-20241107    clang-19
x86_64                randconfig-076-20241108    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

