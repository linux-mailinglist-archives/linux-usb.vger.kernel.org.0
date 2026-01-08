Return-Path: <linux-usb+bounces-32081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A163FD055A2
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 19:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A83D30E1167
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 18:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E075C2FD69F;
	Thu,  8 Jan 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsP4h4Kg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CA2ECD39
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 18:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895268; cv=none; b=EAIIk5tNViATlKUQL0a2v1JQJaQFtGVe00smQ44NfmYqPOUO5ZskPkXrhiOSA0NbME4kHKOM48lhRgFOTovGj4b3QSd9hiC7i7B+Da11yq8O4nkA93/L1BuGciYpmbv6Tz/6WLW1afgUdocdaPFiH2QRGSNSld1i2D1SxxpD2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895268; c=relaxed/simple;
	bh=/2uKl6r0yKYfeAq9kRoTaTWcmJ+lELhTarzQj1cMZ00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WeinlSbs4ws9d0yJSqlo65lp5JlUBGnbyprUawgCtiH/ySFP2dXR0JZWKBq4mA5XJmVopJV3PMSrG8xw++F11k6xlORfQxnaOcUe4ys3Mko96TN142g5LyZ71/2lgbOxlVlyeJplzqsmuVbK1TfLTLsxvZjPLbPRuvdcXtTpwCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsP4h4Kg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767895265; x=1799431265;
  h=date:from:to:cc:subject:message-id;
  bh=/2uKl6r0yKYfeAq9kRoTaTWcmJ+lELhTarzQj1cMZ00=;
  b=XsP4h4KggjLrAr8G1/G9mpQgad8UKoAMPC9en5j7/t60ORvE6XmAUoFF
   fX/2yASxznsqEFc7exoCglFuMcqc0HUOvcQX1XhVdix3DBQGPmrCFMOig
   e8YkyPgLJsrzFPy71O87m/Quhc8TZ7ndVEscayzMPWTSIHWBVoQfp8iSr
   v8Osb8MM2TBqayV4IjRHujibuAL5EDlMFwDEKMttqVBR4SlhGoOt9ADEY
   vZa76FBSXowVKiryu+y3Lbr4kJW57wBR3QI+mv/AlCTyHGNav6tT67Djb
   vg46MKFbqSulztNF3X+vTNguDzCLuMRSHaWsgRsp125/24mrzfs2qzEWk
   Q==;
X-CSE-ConnectionGUID: LBKPWtIRQBmlStyoZqX6IA==
X-CSE-MsgGUID: OWLJT7V1QR2C0tetGk+/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79919300"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79919300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 10:01:03 -0800
X-CSE-ConnectionGUID: 0rRM3TOxQ0Gyz/UqXqw4qA==
X-CSE-MsgGUID: O6AJ9ZjTTte4aROl5jvnIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="240756074"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2026 10:01:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vduJf-0000000052N-2f96;
	Thu, 08 Jan 2026 18:00:59 +0000
Date: Fri, 09 Jan 2026 02:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2740ac33c87b3d0dfa022efd6ba04c6261b1abbd
Message-ID: <202601090238.TwKJ0dMh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 2740ac33c87b3d0dfa022efd6ba04c6261b1abbd  usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor

elapsed time: 1525m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-9.5.0
arm                               allnoconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20260108    gcc-9.5.0
arm                   randconfig-002-20260108    gcc-9.5.0
arm                   randconfig-003-20260108    gcc-9.5.0
arm                   randconfig-004-20260108    gcc-9.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-10.5.0
arm64                 randconfig-002-20260108    gcc-10.5.0
arm64                 randconfig-003-20260108    gcc-10.5.0
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-10.5.0
csky                  randconfig-002-20260108    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20260108    gcc-8.5.0
hexagon               randconfig-002-20260108    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    clang-20
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    clang-20
i386                  randconfig-001-20260108    gcc-14
i386                  randconfig-002-20260108    gcc-14
i386                  randconfig-003-20260108    gcc-14
i386                  randconfig-004-20260108    gcc-14
i386                  randconfig-005-20260108    gcc-14
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260108    gcc-14
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-14
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260108    gcc-8.5.0
loongarch             randconfig-002-20260108    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                      loongson3_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260108    gcc-8.5.0
nios2                 randconfig-002-20260108    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    clang-22
parisc                randconfig-002-20260108    clang-22
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260108    clang-22
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260108    gcc-13.4.0
riscv                 randconfig-002-20260108    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260108    gcc-13.4.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260108    gcc-13.4.0
sh                    randconfig-002-20260108    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    gcc-8.5.0
um                    randconfig-002-20260108    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    gcc-14
x86_64      buildonly-randconfig-002-20260108    gcc-14
x86_64      buildonly-randconfig-003-20260108    gcc-14
x86_64      buildonly-randconfig-004-20260108    gcc-14
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260108    gcc-12
x86_64                randconfig-002-20260108    gcc-12
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-12
x86_64                randconfig-005-20260108    gcc-12
x86_64                randconfig-006-20260108    gcc-12
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    clang-20
x86_64                randconfig-015-20260108    clang-20
x86_64                randconfig-016-20260108    clang-20
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    gcc-14
x86_64                randconfig-076-20260108    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260108    gcc-8.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

