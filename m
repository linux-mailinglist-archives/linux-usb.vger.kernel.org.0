Return-Path: <linux-usb+bounces-17275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B89BFB27
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 02:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A33DA1C219E9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 01:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7898379D0;
	Thu,  7 Nov 2024 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmhAJxCI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FAA28F4
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941728; cv=none; b=NLe34TiRzDbuw9uzwiL3UPXeqlibU2jSgb87hLsmsLY3+JlGmXNbxdawvXQvk486qiaC/W3CdaiA2uJwpSLRZ81owO4/gZPS+sK2kq8AL5Ml2PwbUUJBTYPK6tR0am1PwIbv59uFnXewJEH1a7pgvJzGa4rcvqTY52OoGMbzPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941728; c=relaxed/simple;
	bh=hHQQp5q9xR59WvNc+11mU3N6O0c3hRbKqI50ByB4J2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZyZ7gMK1CoZm4hxyykiJeycNgr0D8U3uziPduTPvUr3n480PP2Nek/m6zcEo7ycpVZerZTfguhjnlAVP9JYWQ30wKJmBY7crcP4C6P8OVCEzhQzaYKPayEaYFTOKjo4hGadYUXSkbUUG+Aha4TCNFVhiGKNuXlBgtgKx0+q2Y+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmhAJxCI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941726; x=1762477726;
  h=date:from:to:cc:subject:message-id;
  bh=hHQQp5q9xR59WvNc+11mU3N6O0c3hRbKqI50ByB4J2Y=;
  b=QmhAJxCIBmOIu6tsqQd/ERhnDfHq0zhwZ/cp1HfKFCP4O0ref4Fq9LrW
   vG1u/dFaaa5F3k1cre9ywkGgbMYlx69guvy5JmDwmfOqRIK1vRxbTDRWk
   IYw7rC1xnV0Hv6TrMzA905koRLAmhuHQ3z3YD+vNRmxDWlNCaInc9Xm+H
   vmsCfexyHwr4KiWsV1fcFrNKtkd56+dyrXL6TTo7lAYcGGPyGauLF+kSs
   sMwVRwYitDI+1dusCG6AE11H5rO+hiynSKZ5Ijb1hhhbS2L4RZyPAD2nb
   +S82EyYb6vwrjdfsYtM9ZiNejbB70J8DnjDJ/9Vs3m0RqmiVJBshTM09X
   g==;
X-CSE-ConnectionGUID: 5dqIoauxTCiy5a/GYCSdrA==
X-CSE-MsgGUID: L26kHOtpTRaOjuR7sLieFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48229390"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48229390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:08:46 -0800
X-CSE-ConnectionGUID: vVsx5xHaTLugrEqUI+lnww==
X-CSE-MsgGUID: KYEq7Qm9T96AFyxLaTggIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="85270179"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2024 17:08:45 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8r0s-000pbS-1l;
	Thu, 07 Nov 2024 01:08:42 +0000
Date: Thu, 07 Nov 2024 09:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 474538b8dd1cd9c666e56cfe8ef60fbb0fb513f4
Message-ID: <202411070915.59N3F8Cl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 474538b8dd1cd9c666e56cfe8ef60fbb0fb513f4  usb: xhci: Avoid queuing redundant Stop Endpoint commands

elapsed time: 722m

configs tested: 285
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241106    gcc-14.2.0
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-14.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            hisi_defconfig    clang-20
arm                           imxrt_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-002-20241106    gcc-14.2.0
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241106    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241106    gcc-14.2.0
arm                   randconfig-004-20241107    gcc-14.2.0
arm                             rpc_defconfig    clang-20
arm                             rpc_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241106    gcc-14.2.0
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-004-20241106    gcc-14.2.0
arm64                 randconfig-004-20241107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    gcc-14.2.0
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-002-20241106    gcc-14.2.0
hexagon               randconfig-002-20241107    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386        buildonly-randconfig-006-20241107    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241106    gcc-12
i386                  randconfig-016-20241107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                          amiga_defconfig    clang-20
m68k                          atari_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    clang-20
mips                            gpr_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    clang-20
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                     tqm8555_defconfig    clang-20
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    gcc-14.2.0
powerpc64             randconfig-002-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241106    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-002-20241106    gcc-14.2.0
s390                  randconfig-002-20241107    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-20
sh                        edosk7760_defconfig    clang-20
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-20
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7721_defconfig    clang-20
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.2.0
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-002-20241106    gcc-14.2.0
um                    randconfig-002-20241107    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241106    gcc-11
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

