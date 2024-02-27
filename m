Return-Path: <linux-usb+bounces-7123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264F8686EE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 03:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080A42911D4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 02:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379164D112;
	Tue, 27 Feb 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqJPDtjY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43F45035
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 02:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709000622; cv=none; b=kvGS76w5yMmX6tXlbuzL9Xr5+2lZ13g0f5zmGBscK+5KPsXdyFz1txrh9Xh228ywy2mkqjb2togCcuCIUi6eFtG3vkC9uZjnB5ipsrjDb9Z5Vc3+VuDvhnEwAiIyAWAFbXP0XqBu2r5rxU3F4SqEI5dSlJeUZxhyCcVl/BDIHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709000622; c=relaxed/simple;
	bh=BaeGKqgnryyDWdfZuaOG3cz5j2TkmIcWk8NttR4/mDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TlbnrrqSgR5GL5+Nkb/sYTggxr/UYYUw8D8QLQZl58Vw8mFM6MSdHYRjHh46KlZPA0Bav1EHe1S+zumhhH+pKHLJtEsDRhKwGcnPhSnsIt80Yw6WbTKBY61T4gM/gnhBX+V1Yko8xn0Z5YcTTHccb1Skge9ob7dyhUTUMcR+Hes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqJPDtjY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709000621; x=1740536621;
  h=date:from:to:cc:subject:message-id;
  bh=BaeGKqgnryyDWdfZuaOG3cz5j2TkmIcWk8NttR4/mDo=;
  b=GqJPDtjYhGnAp0tNSts3S5XV+dowEQHnlCFiRTdluri0Dm6WbSO5eUhV
   ppWtss3IsX7ErW0q/9ozGvgbylm4mXzb7iPF6IJOL7W5xPwqrmE3vXLyO
   tZxbGq3HryNfxAr61UjHgfVXSCxiJn3T5NfVsGh6DMMjOhDwfXZtorLso
   62ZXFAaDiZq58mSfNtjdOSAtLmnw3iWxFgop04wz4qNw6uVpWPO+8PBg3
   1pGd//1TlDtNjuSW5ex6hnDWZNiHD9LSsFiKqBa5xwe/kgD+VPgzF+Mr2
   gpFbDy1k7niPXuLwrOobPpWx5AC2Lr8B9Ne6avZsRaVhaCGq4NAWmCsNf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3247547"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3247547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 18:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6810970"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Feb 2024 18:23:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ren84-000ArJ-15;
	Tue, 27 Feb 2024 02:23:36 +0000
Date: Tue, 27 Feb 2024 10:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:gadget_char] BUILD SUCCESS
 313cfa3be59873841a26a8caa8dd408515c197d4
Message-ID: <202402271028.EMSfN9NR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git gadget_char
branch HEAD: 313cfa3be59873841a26a8caa8dd408515c197d4  USB: gadget: dummy_hcd: switch char * to u8 *

elapsed time: 1221m

configs tested: 232
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240226   gcc  
arc                   randconfig-001-20240227   gcc  
arc                   randconfig-002-20240226   gcc  
arc                   randconfig-002-20240227   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240227   gcc  
arm                   randconfig-002-20240227   gcc  
arm                   randconfig-003-20240227   gcc  
arm                   randconfig-004-20240226   gcc  
arm                   randconfig-004-20240227   gcc  
arm                         socfpga_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240226   gcc  
arm64                 randconfig-002-20240226   gcc  
arm64                 randconfig-002-20240227   gcc  
arm64                 randconfig-003-20240226   gcc  
arm64                 randconfig-003-20240227   gcc  
arm64                 randconfig-004-20240227   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240226   gcc  
csky                  randconfig-001-20240227   gcc  
csky                  randconfig-002-20240226   gcc  
csky                  randconfig-002-20240227   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240226   clang
i386         buildonly-randconfig-001-20240227   gcc  
i386         buildonly-randconfig-002-20240227   gcc  
i386         buildonly-randconfig-003-20240226   clang
i386         buildonly-randconfig-004-20240226   clang
i386         buildonly-randconfig-004-20240227   gcc  
i386         buildonly-randconfig-005-20240226   clang
i386         buildonly-randconfig-005-20240227   gcc  
i386         buildonly-randconfig-006-20240226   clang
i386         buildonly-randconfig-006-20240227   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240226   clang
i386                  randconfig-001-20240227   gcc  
i386                  randconfig-002-20240227   gcc  
i386                  randconfig-003-20240226   clang
i386                  randconfig-005-20240226   clang
i386                  randconfig-006-20240226   clang
i386                  randconfig-006-20240227   gcc  
i386                  randconfig-016-20240226   clang
i386                  randconfig-016-20240227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240226   gcc  
loongarch             randconfig-001-20240227   gcc  
loongarch             randconfig-002-20240226   gcc  
loongarch             randconfig-002-20240227   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240226   gcc  
nios2                 randconfig-001-20240227   gcc  
nios2                 randconfig-002-20240226   gcc  
nios2                 randconfig-002-20240227   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240226   gcc  
parisc                randconfig-001-20240227   gcc  
parisc                randconfig-002-20240226   gcc  
parisc                randconfig-002-20240227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc               randconfig-002-20240226   gcc  
powerpc               randconfig-002-20240227   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-002-20240226   gcc  
powerpc64             randconfig-002-20240227   gcc  
powerpc64             randconfig-003-20240227   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240227   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240227   gcc  
s390                  randconfig-002-20240226   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240226   gcc  
sh                    randconfig-001-20240227   gcc  
sh                    randconfig-002-20240226   gcc  
sh                    randconfig-002-20240227   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240226   gcc  
sparc64               randconfig-001-20240227   gcc  
sparc64               randconfig-002-20240226   gcc  
sparc64               randconfig-002-20240227   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240226   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240226   clang
x86_64       buildonly-randconfig-001-20240227   clang
x86_64       buildonly-randconfig-002-20240226   gcc  
x86_64       buildonly-randconfig-003-20240226   gcc  
x86_64       buildonly-randconfig-003-20240227   clang
x86_64       buildonly-randconfig-004-20240226   clang
x86_64       buildonly-randconfig-004-20240227   clang
x86_64       buildonly-randconfig-005-20240226   gcc  
x86_64       buildonly-randconfig-005-20240227   clang
x86_64       buildonly-randconfig-006-20240226   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240226   gcc  
x86_64                randconfig-001-20240227   clang
x86_64                randconfig-002-20240226   gcc  
x86_64                randconfig-002-20240227   clang
x86_64                randconfig-003-20240226   clang
x86_64                randconfig-004-20240226   clang
x86_64                randconfig-005-20240226   clang
x86_64                randconfig-006-20240226   gcc  
x86_64                randconfig-011-20240226   clang
x86_64                randconfig-012-20240226   clang
x86_64                randconfig-013-20240226   clang
x86_64                randconfig-013-20240227   clang
x86_64                randconfig-014-20240226   clang
x86_64                randconfig-015-20240226   clang
x86_64                randconfig-016-20240226   clang
x86_64                randconfig-071-20240226   clang
x86_64                randconfig-072-20240226   gcc  
x86_64                randconfig-072-20240227   clang
x86_64                randconfig-073-20240226   gcc  
x86_64                randconfig-074-20240226   clang
x86_64                randconfig-074-20240227   clang
x86_64                randconfig-075-20240226   gcc  
x86_64                randconfig-075-20240227   clang
x86_64                randconfig-076-20240226   clang
x86_64                randconfig-076-20240227   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240226   gcc  
xtensa                randconfig-001-20240227   gcc  
xtensa                randconfig-002-20240226   gcc  
xtensa                randconfig-002-20240227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

