Return-Path: <linux-usb+bounces-6633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02253858E64
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 10:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E1881C20DCE
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 09:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA51D539;
	Sat, 17 Feb 2024 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgKjl8Mm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C051CFA7
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708162925; cv=none; b=ntJEQp81QBQ+kImlNePk5TuhwvypAuL0JRM8K5epiIoCT1gXjJdkMvE8nOUtdzLOntzL/Mc4EsGKAWsq7cjOzIqQ5p702EALtGHPgrJ6BOehpnUjB+JDD4+sUDr6Yhypw+XqHbl2R0KYk9KBx5MD7Os7q2gA/2gXFfN1k0adawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708162925; c=relaxed/simple;
	bh=N6FCN9itQybCusROBrExazjw7gTiHvhwb9O74gdZ8iM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eN+GFN9jqpNkAh8TPVOylDRv4Z7dcEZX1ziAlrFpM+MgluGdcczV3Z3tBCJ9HVOtNNHZP15Za6J7P2bL7w7hVO133l9OD7j9+zu5x1zIHr25JcIoiCGwse1/t9HWaOh5eIGwRbmqQsMw6qDICkMB9CF4FZjkMjD5sCNJNtM/aGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgKjl8Mm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708162919; x=1739698919;
  h=date:from:to:cc:subject:message-id;
  bh=N6FCN9itQybCusROBrExazjw7gTiHvhwb9O74gdZ8iM=;
  b=IgKjl8Mm/32QP9IPhD3yzwmMs+CO5XkEn12fbZa9xMyF8LuDKe1ZR4NY
   skSGSXSAmwdzmNL+vZai1dislZjAXMAwYeby94Zwu9fIw8sIuxjxzMsZm
   O7YVHxuFfUtIXWgaimu960oOCwhGP2+NrfBllE1gRDCz8k+ONOJxP6PGq
   Lums08B4pgFSYa71W8k0trnpoKXLKk3Fqk0laeF4BewFpuNjxCuIqBqSz
   1k0AqhGjkt2L9b5vlB0noYFfFRs1i3/CoaBMK1Oypruhs8/omzQVbz/9l
   nuZZRA140sW/stRrGU03sUaDmJqKgm3yVsCQmk0DHh5HnVJObBKgVrlxl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2705613"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2705613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 01:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4081995"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2024 01:41:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbHCl-00020m-0O;
	Sat, 17 Feb 2024 09:41:55 +0000
Date: Sat, 17 Feb 2024 17:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 d3d17e23d1a0d1f959b4fa55b35f1802d9c584fa
Message-ID: <202402171741.UfyWk9OU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: d3d17e23d1a0d1f959b4fa55b35f1802d9c584fa  thunderbolt: Fix NULL pointer dereference in tb_port_update_credits()

elapsed time: 1455m

configs tested: 233
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240216   gcc  
arc                   randconfig-001-20240217   gcc  
arc                   randconfig-002-20240216   gcc  
arc                   randconfig-002-20240217   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240216   clang
arm                   randconfig-002-20240216   clang
arm                   randconfig-002-20240217   gcc  
arm                   randconfig-003-20240216   gcc  
arm                   randconfig-003-20240217   gcc  
arm                   randconfig-004-20240216   gcc  
arm                   randconfig-004-20240217   gcc  
arm                         s5pv210_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240216   clang
arm64                 randconfig-002-20240216   gcc  
arm64                 randconfig-002-20240217   gcc  
arm64                 randconfig-003-20240216   clang
arm64                 randconfig-003-20240217   gcc  
arm64                 randconfig-004-20240216   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240216   gcc  
csky                  randconfig-001-20240217   gcc  
csky                  randconfig-002-20240216   gcc  
csky                  randconfig-002-20240217   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240216   clang
hexagon               randconfig-002-20240216   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240216   gcc  
i386         buildonly-randconfig-001-20240217   gcc  
i386         buildonly-randconfig-002-20240216   clang
i386         buildonly-randconfig-002-20240217   clang
i386         buildonly-randconfig-003-20240216   clang
i386         buildonly-randconfig-003-20240217   gcc  
i386         buildonly-randconfig-004-20240216   gcc  
i386         buildonly-randconfig-004-20240217   gcc  
i386         buildonly-randconfig-005-20240216   gcc  
i386         buildonly-randconfig-005-20240217   gcc  
i386         buildonly-randconfig-006-20240216   clang
i386         buildonly-randconfig-006-20240217   clang
i386                                defconfig   clang
i386                  randconfig-001-20240216   clang
i386                  randconfig-001-20240217   gcc  
i386                  randconfig-002-20240216   clang
i386                  randconfig-002-20240217   gcc  
i386                  randconfig-003-20240216   gcc  
i386                  randconfig-003-20240217   clang
i386                  randconfig-004-20240216   clang
i386                  randconfig-004-20240217   gcc  
i386                  randconfig-005-20240216   gcc  
i386                  randconfig-005-20240217   gcc  
i386                  randconfig-006-20240216   clang
i386                  randconfig-006-20240217   clang
i386                  randconfig-011-20240216   gcc  
i386                  randconfig-011-20240217   gcc  
i386                  randconfig-012-20240216   gcc  
i386                  randconfig-012-20240217   gcc  
i386                  randconfig-013-20240216   gcc  
i386                  randconfig-013-20240217   clang
i386                  randconfig-014-20240216   clang
i386                  randconfig-014-20240217   clang
i386                  randconfig-015-20240216   gcc  
i386                  randconfig-015-20240217   clang
i386                  randconfig-016-20240216   gcc  
i386                  randconfig-016-20240217   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240216   gcc  
loongarch             randconfig-001-20240217   gcc  
loongarch             randconfig-002-20240216   gcc  
loongarch             randconfig-002-20240217   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240216   gcc  
nios2                 randconfig-001-20240217   gcc  
nios2                 randconfig-002-20240216   gcc  
nios2                 randconfig-002-20240217   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240216   gcc  
parisc                randconfig-001-20240217   gcc  
parisc                randconfig-002-20240216   gcc  
parisc                randconfig-002-20240217   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc                     kmeter1_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240216   clang
powerpc               randconfig-001-20240217   gcc  
powerpc               randconfig-002-20240216   clang
powerpc               randconfig-002-20240217   gcc  
powerpc               randconfig-003-20240216   clang
powerpc               randconfig-003-20240217   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240216   clang
powerpc64             randconfig-002-20240216   clang
powerpc64             randconfig-002-20240217   gcc  
powerpc64             randconfig-003-20240216   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240216   gcc  
riscv                 randconfig-001-20240217   gcc  
riscv                 randconfig-002-20240216   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240216   gcc  
s390                  randconfig-002-20240216   gcc  
s390                  randconfig-002-20240217   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240216   gcc  
sh                    randconfig-001-20240217   gcc  
sh                    randconfig-002-20240216   gcc  
sh                    randconfig-002-20240217   gcc  
sh                          sdk7780_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240216   gcc  
sparc64               randconfig-001-20240217   gcc  
sparc64               randconfig-002-20240216   gcc  
sparc64               randconfig-002-20240217   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240216   gcc  
um                    randconfig-002-20240216   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240217   gcc  
x86_64       buildonly-randconfig-003-20240217   gcc  
x86_64       buildonly-randconfig-004-20240217   gcc  
x86_64       buildonly-randconfig-006-20240217   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240217   gcc  
x86_64                randconfig-011-20240217   gcc  
x86_64                randconfig-012-20240217   gcc  
x86_64                randconfig-014-20240217   gcc  
x86_64                randconfig-015-20240217   gcc  
x86_64                randconfig-071-20240217   gcc  
x86_64                randconfig-072-20240217   gcc  
x86_64                randconfig-073-20240217   gcc  
x86_64                randconfig-075-20240217   gcc  
x86_64                randconfig-076-20240217   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240216   gcc  
xtensa                randconfig-001-20240217   gcc  
xtensa                randconfig-002-20240216   gcc  
xtensa                randconfig-002-20240217   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

