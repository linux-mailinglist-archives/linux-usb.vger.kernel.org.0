Return-Path: <linux-usb+bounces-17145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98B9BDBAC
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 02:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61283284CA0
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 01:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF8A18C903;
	Wed,  6 Nov 2024 01:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nISC2O+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0468165F11
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 01:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858220; cv=none; b=CAyAE3deZgoTBb5q5w7vbe5/tkDYvFS1PKlXPvxKtIKuGu6tNNNCWVYUZMLqP0OCfqY+/z33YQJu0AVGGHLfAnXXFZk/VX5nv7L8tASBDTfkcrloTUteMeyduDxofKkJbIYBNcO4dPzQvuIwkT7wVLapn9UMD1HadI6VoPAoR5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858220; c=relaxed/simple;
	bh=jDzgBC76u0fkUYAn9aadKgLDIjeNI1QTxknHNhBTIl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HGAKTmdX2I8YHgnE8tKoOYwRsogsopfS0Jt1+Iy+T89K6+gCwiRSwKp02sjVTcZYnoNtB7W1ADp3JQr+w2tBA/5ubIr064rI4hpwoAHCnoCV9n2ypK3NFdOgqUIU8S2A/C6Pl+WJXbLmGz+ipEuKwcYlJ+/6Ymx+TL6trhHcbLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nISC2O+Z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730858219; x=1762394219;
  h=date:from:to:cc:subject:message-id;
  bh=jDzgBC76u0fkUYAn9aadKgLDIjeNI1QTxknHNhBTIl8=;
  b=nISC2O+ZF9XqAJE2LHc0BpXcpJRRmk/aAJSxGFSlDlJYQBZUs5rRR/0S
   jLSilRV9GDjs4+9qNcvOLpOT+EcFxAd+S+47DsPqD4E93mw7+v8GyXkgM
   ywWHoebrOIKaJgWNDZhcLDs93Ia/MMSvgWUGBrCI7Yz09juPzkhyX4ENv
   RJD12fnyfCy9B53k8yoqf5tQknw8+eTbFwpI/vl7AppDXgvMGn/P3oGqF
   5US/CkEczdDQ4sdouUzGymdFDZN9HkCpEH142NMQkikcoSafyaawDXlIo
   JI3VrztZQZExA0y7sgUgj6BfgaWC7ItWPd1kdYWf9HSf9Uoje88Hk7W+/
   w==;
X-CSE-ConnectionGUID: TuZWY12fTrSe1V/UH4gU6A==
X-CSE-MsgGUID: R35b0UpqQm+izn8cDOcPJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30857651"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30857651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 17:56:58 -0800
X-CSE-ConnectionGUID: Wam/9dqgRnamdC43rtoygw==
X-CSE-MsgGUID: 05+42b7TTBiLnSZb+s5SMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="83915596"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 17:56:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8VHy-000miz-39;
	Wed, 06 Nov 2024 01:56:54 +0000
Date: Wed, 06 Nov 2024 09:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 6ff78df5b3d0bbc640c5c0ee12800c26dc251c5c
Message-ID: <202411060925.jZ8LhSzJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 6ff78df5b3d0bbc640c5c0ee12800c26dc251c5c  usb: Use (of|device)_property_present() for non-boolean properties

elapsed time: 727m

configs tested: 215
configs skipped: 13

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
arc                            hsdk_defconfig    gcc-14.1.0
arc                        nsim_700_defconfig    gcc-14.1.0
arc                   randconfig-001-20241106    gcc-14.1.0
arc                   randconfig-002-20241106    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.1.0
arm                        clps711x_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                           imxrt_defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    clang-20
arm                             mxs_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                   randconfig-001-20241106    gcc-14.1.0
arm                   randconfig-002-20241106    gcc-14.1.0
arm                   randconfig-003-20241106    gcc-14.1.0
arm                   randconfig-004-20241106    gcc-14.1.0
arm                           sama5_defconfig    gcc-14.1.0
arm                        shmobile_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                        spear6xx_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241106    gcc-14.1.0
arm64                 randconfig-002-20241106    gcc-14.1.0
arm64                 randconfig-003-20241106    gcc-14.1.0
arm64                 randconfig-004-20241106    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241106    gcc-14.1.0
csky                  randconfig-002-20241106    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241106    gcc-14.1.0
hexagon               randconfig-002-20241106    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-016-20241106    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241106    gcc-14.1.0
loongarch             randconfig-002-20241106    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    clang-20
m68k                        mvme147_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    clang-20
mips                        vocore2_defconfig    gcc-14.1.0
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241106    gcc-14.1.0
nios2                 randconfig-002-20241106    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241106    gcc-14.1.0
parisc                randconfig-002-20241106    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                   motionpro_defconfig    gcc-14.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.1.0
powerpc                      ppc44x_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241106    gcc-14.1.0
powerpc               randconfig-002-20241106    gcc-14.1.0
powerpc               randconfig-003-20241106    gcc-14.1.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241106    gcc-14.1.0
powerpc64             randconfig-002-20241106    gcc-14.1.0
powerpc64             randconfig-003-20241106    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
riscv                 randconfig-001-20241106    gcc-14.1.0
riscv                 randconfig-002-20241106    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.1.0
s390                  randconfig-002-20241106    gcc-14.1.0
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                        edosk7705_defconfig    gcc-14.1.0
sh                    randconfig-001-20241106    gcc-14.1.0
sh                    randconfig-002-20241106    gcc-14.1.0
sh                           se7724_defconfig    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                           sh2007_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                        sh7763rdp_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.1.0
sparc64               randconfig-002-20241106    gcc-14.1.0
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.1.0
um                    randconfig-002-20241106    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-076-20241106    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241106    gcc-14.1.0
xtensa                randconfig-002-20241106    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

