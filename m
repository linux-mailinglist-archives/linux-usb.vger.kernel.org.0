Return-Path: <linux-usb+bounces-19829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C4A21692
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 03:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248391886BDC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 02:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83701187FFA;
	Wed, 29 Jan 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrU3DLMq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7795733987
	for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738119369; cv=none; b=msl4/DHgYAKMLUkMFiXRwpjXa3ldWSi7vuWtR3IGj7pgmH0N8yOlSdDE3OtGhf2ZRraHf5vULythOWnU3pnc1KUjFuq+ORIaqAmF6rz0eb4Zm4cCN6QTRZNQ+APnf9HGV1Ipqzz5VGXSzyKl0sRe8w35IpDPWW0Se5GHFJU4CZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738119369; c=relaxed/simple;
	bh=0mos7fQLG434fUGf1L2S/PXcraaJY22C9O7M3sh2o7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gQN55VWRnlln15I8CH1PqmlOW21pxLUKm1uEinx2oE5B++Lv8xp6TJ+ksvQr/QBv84SvKaRcUMFWPXBM7QL9oLk7i7rvlinM9Ey9m8FXOZJbjyq5wLpbtD13nojo8jP2s/82v3trbLjMeQgKnOt5jeZISvlUCatqno1zZQYZbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrU3DLMq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738119366; x=1769655366;
  h=date:from:to:cc:subject:message-id;
  bh=0mos7fQLG434fUGf1L2S/PXcraaJY22C9O7M3sh2o7A=;
  b=FrU3DLMqHDXLBAnkbJaGR1Cp3vfPFqZ9dc5nV4LHwco8UUUwRzjYCh2P
   oy4bhEhk7SIbOrzU0h3QP4bZcUADJOCLTdGbV/juH/kpPUnerb9BFoX1R
   YR/i3SVmi36D2ZEd7JEb7Z4auXV45usxGu2KJIDAaN0HnkPwlaOIW+rMT
   kTuBAD8C5tf032hCdS9mLVArmGnO1gLXY3+Ss2rkNwkAh5/nQrSve8rez
   cGYcu0cNQ0BAq+REvo15I1teykMXVRX67Sqeq9LPDTDVuPVCP63CKbp/g
   yyjSPH5k6dlxCSiK7Vazj/FDR8aGS9u1Emhh8hsp5TQjk8zg368eO1rhR
   g==;
X-CSE-ConnectionGUID: o4mfPcxBSp2vSfigTpxuiA==
X-CSE-MsgGUID: gtwL3oBcTKaJa7//qS9OPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="41463045"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="41463045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 18:56:05 -0800
X-CSE-ConnectionGUID: qT35ki1TThWyMSitCYWj5Q==
X-CSE-MsgGUID: RchCiiL+T6WC0lmE5XUlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114037857"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2025 18:56:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcyFF-000iVv-0V;
	Wed, 29 Jan 2025 02:56:01 +0000
Date: Wed, 29 Jan 2025 10:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 c4a050c5c09ef30feac95a438aca7a8fbf6b47b6
Message-ID: <202501291005.GEwa4aPr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: c4a050c5c09ef30feac95a438aca7a8fbf6b47b6  USB: disable all RNDIS protocol drivers

elapsed time: 1175m

configs tested: 161
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250128    gcc-13.2.0
arc                   randconfig-002-20250128    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-18
arm                   randconfig-001-20250128    gcc-14.2.0
arm                   randconfig-002-20250128    clang-20
arm                   randconfig-003-20250128    clang-20
arm                   randconfig-004-20250128    clang-15
arm                        vexpress_defconfig    clang-18
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250128    gcc-14.2.0
arm64                 randconfig-002-20250128    clang-17
arm64                 randconfig-003-20250128    gcc-14.2.0
arm64                 randconfig-004-20250128    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250128    gcc-14.2.0
csky                  randconfig-002-20250128    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250128    clang-20
hexagon               randconfig-002-20250128    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250128    clang-19
i386        buildonly-randconfig-001-20250129    gcc-12
i386        buildonly-randconfig-002-20250128    clang-19
i386        buildonly-randconfig-002-20250129    gcc-12
i386        buildonly-randconfig-003-20250128    gcc-12
i386        buildonly-randconfig-003-20250129    gcc-12
i386        buildonly-randconfig-004-20250128    clang-19
i386        buildonly-randconfig-004-20250129    gcc-12
i386        buildonly-randconfig-005-20250128    clang-19
i386        buildonly-randconfig-005-20250129    gcc-12
i386        buildonly-randconfig-006-20250128    clang-19
i386        buildonly-randconfig-006-20250129    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250129    gcc-12
i386                  randconfig-012-20250129    gcc-12
i386                  randconfig-013-20250129    gcc-12
i386                  randconfig-014-20250129    gcc-12
i386                  randconfig-015-20250129    gcc-12
i386                  randconfig-016-20250129    gcc-12
i386                  randconfig-017-20250129    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250128    gcc-14.2.0
loongarch             randconfig-002-20250128    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    clang-18
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                      maltaaprp_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250128    gcc-14.2.0
nios2                 randconfig-002-20250128    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250128    gcc-14.2.0
parisc                randconfig-002-20250128    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ep8248e_defconfig    clang-18
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-18
powerpc                       ppc64_defconfig    clang-19
powerpc               randconfig-001-20250128    clang-17
powerpc               randconfig-002-20250128    gcc-14.2.0
powerpc               randconfig-003-20250128    clang-20
powerpc                     redwood_defconfig    clang-20
powerpc                     tqm8541_defconfig    clang-18
powerpc64             randconfig-001-20250128    clang-15
powerpc64             randconfig-002-20250128    gcc-14.2.0
powerpc64             randconfig-003-20250128    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-18
riscv                 randconfig-001-20250128    gcc-14.2.0
riscv                 randconfig-002-20250128    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250128    gcc-14.2.0
s390                  randconfig-002-20250128    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250128    gcc-14.2.0
sh                    randconfig-002-20250128    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250128    gcc-14.2.0
sparc                 randconfig-002-20250128    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250128    gcc-14.2.0
sparc64               randconfig-002-20250128    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250128    gcc-12
um                    randconfig-002-20250128    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250128    clang-19
x86_64      buildonly-randconfig-001-20250129    clang-19
x86_64      buildonly-randconfig-002-20250128    clang-19
x86_64      buildonly-randconfig-002-20250129    clang-19
x86_64      buildonly-randconfig-003-20250128    gcc-12
x86_64      buildonly-randconfig-003-20250129    clang-19
x86_64      buildonly-randconfig-004-20250128    clang-19
x86_64      buildonly-randconfig-004-20250129    clang-19
x86_64      buildonly-randconfig-005-20250128    clang-19
x86_64      buildonly-randconfig-005-20250129    clang-19
x86_64      buildonly-randconfig-006-20250128    gcc-12
x86_64      buildonly-randconfig-006-20250129    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250128    gcc-14.2.0
xtensa                randconfig-002-20250128    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

