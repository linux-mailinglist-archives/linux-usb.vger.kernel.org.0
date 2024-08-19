Return-Path: <linux-usb+bounces-13600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E5956587
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 817301F2286F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFA215B10D;
	Mon, 19 Aug 2024 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AssdzotU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948C15B0EB
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055876; cv=none; b=pMyCw2skzF9gntR+62HRyWP4kXnEGLJszREopKR3gArrDJvRV1njaTL2uoJrIrz+KNwSXo/fzLyRNBJ/XPesfigzW8rjMGxdfHcsDwzK8DC7MFv5csBGlki64BuE5VtobLUcXmC8K/SUyYDeG/CYky2ZEBeazP8XmrZAJIQVY+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055876; c=relaxed/simple;
	bh=sFLseUGdKXFNe9Iw2e6xqOBTsccebVrt3xXcSBoPPig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=COnEPpwmciimL/C8s4xL1wKQyMADuEOV/2QBFfkMuQhNttKjr5Eh18rpqIFXEcsbhJlPMH6e48mHZ/WJP4G3E1I+m83WY7jvlWRxvuhCnj3zrKhytpBRc/O/Y+Sndr3a3mhNPcuuKSMcLcs3NnZJ4ODfcK4jzMtsRsmXCx6fX8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AssdzotU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724055875; x=1755591875;
  h=date:from:to:cc:subject:message-id;
  bh=sFLseUGdKXFNe9Iw2e6xqOBTsccebVrt3xXcSBoPPig=;
  b=AssdzotU5zIuI7cWrs3Vg1m6I0mW6sUfebdb3mt2Njuo1l5GDd9FP8AP
   8p0YVs3b5jFGmgcunGcVUn6k4Qdh0dxdAZxfyeQ0vl2hoKL+47o4EwYe8
   GKC5e10OdShYiCfz3vGgMg+ofqPqFVdondROaHqFI9tL9tILacvhrUYuz
   ZUyy3OSMZb62tvJ5Og338eHHCw0M+fRQlHDPHRDm0OA42phZz+MJ8ejD2
   LfM67Lr7D1R/2SB1KajbSUBG5HC77kCmcJDtxMhDqdFbWkE/ISfMG14Do
   D3Rupr7ukvUZ2Fwtr2SETart9XKOmdmcbRGzA/72TerJcq+XHDMTJcgXW
   g==;
X-CSE-ConnectionGUID: hALsSBu3T8CWKemA/4HU1A==
X-CSE-MsgGUID: FkplVn2WRJ6m1OLPrivVJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39803390"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="39803390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:24:34 -0700
X-CSE-ConnectionGUID: LkuxT3B2Rv6kKcFGzGd7fw==
X-CSE-MsgGUID: +mhosRX9QbOtBATU1Ay+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="83518172"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 01:24:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfxgl-0008ne-0K;
	Mon, 19 Aug 2024 08:24:31 +0000
Date: Mon, 19 Aug 2024 16:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 d58670229617eedc19990093f66d2c3dc0d76d5d
Message-ID: <202408191620.olABv8GF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: d58670229617eedc19990093f66d2c3dc0d76d5d  USB: disable all RNDIS protocol drivers

elapsed time: 992m

configs tested: 243
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240819   gcc-13.2.0
arc                   randconfig-002-20240819   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                          collie_defconfig   gcc-13.3.0
arm                                 defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-13.3.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                          pxa910_defconfig   gcc-13.3.0
arm                   randconfig-001-20240819   gcc-13.2.0
arm                   randconfig-002-20240819   gcc-13.2.0
arm                   randconfig-003-20240819   gcc-13.2.0
arm                   randconfig-004-20240819   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                        spear6xx_defconfig   gcc-13.2.0
arm                        vexpress_defconfig   gcc-13.2.0
arm                         vf610m4_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240819   gcc-13.2.0
arm64                 randconfig-002-20240819   gcc-13.2.0
arm64                 randconfig-003-20240819   gcc-13.2.0
arm64                 randconfig-004-20240819   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240819   gcc-13.2.0
csky                  randconfig-002-20240819   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-002-20240819   clang-18
i386         buildonly-randconfig-002-20240819   gcc-12
i386         buildonly-randconfig-003-20240819   clang-18
i386         buildonly-randconfig-003-20240819   gcc-11
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-005-20240819   clang-18
i386         buildonly-randconfig-005-20240819   gcc-12
i386         buildonly-randconfig-006-20240819   clang-18
i386         buildonly-randconfig-006-20240819   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   clang-18
i386                  randconfig-001-20240819   gcc-12
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-003-20240819   clang-18
i386                  randconfig-003-20240819   gcc-12
i386                  randconfig-004-20240819   clang-18
i386                  randconfig-004-20240819   gcc-12
i386                  randconfig-005-20240819   clang-18
i386                  randconfig-005-20240819   gcc-12
i386                  randconfig-006-20240819   clang-18
i386                  randconfig-006-20240819   gcc-12
i386                  randconfig-011-20240819   clang-18
i386                  randconfig-011-20240819   gcc-12
i386                  randconfig-012-20240819   clang-18
i386                  randconfig-012-20240819   gcc-12
i386                  randconfig-013-20240819   clang-18
i386                  randconfig-013-20240819   gcc-12
i386                  randconfig-014-20240819   clang-18
i386                  randconfig-014-20240819   gcc-12
i386                  randconfig-015-20240819   clang-18
i386                  randconfig-015-20240819   gcc-12
i386                  randconfig-016-20240819   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240819   gcc-13.2.0
loongarch             randconfig-002-20240819   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.3.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.3.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.3.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                            alldefconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240819   gcc-13.2.0
nios2                 randconfig-002-20240819   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240819   gcc-13.2.0
parisc                randconfig-002-20240819   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        cell_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.3.0
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-13.3.0
powerpc                  mpc885_ads_defconfig   gcc-13.3.0
powerpc                      pasemi_defconfig   gcc-13.3.0
powerpc               randconfig-001-20240819   gcc-13.2.0
powerpc               randconfig-002-20240819   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240819   gcc-13.2.0
powerpc64             randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-003-20240819   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240819   gcc-13.2.0
riscv                 randconfig-002-20240819   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240819   gcc-13.2.0
s390                  randconfig-002-20240819   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-13.3.0
sh                    randconfig-001-20240819   gcc-13.2.0
sh                    randconfig-002-20240819   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.3.0
sh                           se7724_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.3.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240819   gcc-13.2.0
sparc64               randconfig-002-20240819   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240819   gcc-13.2.0
um                    randconfig-002-20240819   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240819   gcc-12
x86_64       buildonly-randconfig-002-20240819   gcc-12
x86_64       buildonly-randconfig-003-20240819   gcc-12
x86_64       buildonly-randconfig-004-20240819   gcc-12
x86_64       buildonly-randconfig-005-20240819   gcc-12
x86_64       buildonly-randconfig-006-20240819   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240819   clang-18
x86_64                randconfig-001-20240819   gcc-12
x86_64                randconfig-002-20240819   clang-18
x86_64                randconfig-002-20240819   gcc-12
x86_64                randconfig-003-20240819   gcc-12
x86_64                randconfig-004-20240819   gcc-12
x86_64                randconfig-005-20240819   clang-18
x86_64                randconfig-005-20240819   gcc-12
x86_64                randconfig-006-20240819   clang-18
x86_64                randconfig-006-20240819   gcc-12
x86_64                randconfig-011-20240819   gcc-12
x86_64                randconfig-012-20240819   clang-18
x86_64                randconfig-012-20240819   gcc-12
x86_64                randconfig-013-20240819   clang-18
x86_64                randconfig-013-20240819   gcc-12
x86_64                randconfig-014-20240819   gcc-12
x86_64                randconfig-015-20240819   gcc-12
x86_64                randconfig-016-20240819   gcc-12
x86_64                randconfig-071-20240819   gcc-12
x86_64                randconfig-072-20240819   gcc-12
x86_64                randconfig-073-20240819   clang-18
x86_64                randconfig-073-20240819   gcc-12
x86_64                randconfig-074-20240819   gcc-12
x86_64                randconfig-075-20240819   gcc-12
x86_64                randconfig-076-20240819   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                  cadence_csp_defconfig   gcc-13.3.0
xtensa                randconfig-001-20240819   gcc-13.2.0
xtensa                randconfig-002-20240819   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.3.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

