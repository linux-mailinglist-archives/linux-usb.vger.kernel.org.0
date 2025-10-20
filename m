Return-Path: <linux-usb+bounces-29472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0389BF32F5
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 21:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A31424E56FE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 19:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C0472628;
	Mon, 20 Oct 2025 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMdyY9i6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7B202961
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 19:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988091; cv=none; b=gOG5S3hqHmkhs1XF3V6Oj+JzaZN6IcBFHssVy530ufcJuJcHnE+KEEuCDEJNl8zkfLP4Ziz7qcX20tVD9Upi4ytWlrU8qBfksIquOCj8qiKY63oZK4eVPrgPkBUL9SvXlBAWcHxO8s0/LuZ1H7yFjJ2XjAidBiXpi92Zl7hcSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988091; c=relaxed/simple;
	bh=v885JAV669WrF8DwkUq8i/L7pjaQdlHISm0bKp/aKDg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O3BMqa+evIS2Ril2+UbYPvEymxNgazPc84ZDBHXw24/x6jqPwNxuH9U847Ruj1wms6BDY8XOKdkCVpdJVkUBVNY+XXpMbQHNETQZpY/DTY13wBjZ9QklvctOU6GRBktdU6flGJvLLN1bA4VFKTFKW7Gt7J2/7Ec55nEBQZNou/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMdyY9i6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760988090; x=1792524090;
  h=date:from:to:cc:subject:message-id;
  bh=v885JAV669WrF8DwkUq8i/L7pjaQdlHISm0bKp/aKDg=;
  b=YMdyY9i6bDrhQ76fWCw6m9y1inTJ22ml7jNl9H6IXooIDELOWVr2HHZ+
   1P5d+urAJcKhFm+JClb6b4WPsI1QYQ82hGxYBPpmOPCc6Jz8812Hfhsgh
   d5tZ/w9MkyPsxqalglyQaFRscaGxVu3PeLo8oBXJIk93j+w2HbrNhjVAb
   Uw+JPx9gwGfO40rpTeZcGwilyLfNVIigJumjLCz7WSBRAr9OHrcMcsk2J
   6Rc8tmKN81BMWPiikDTYK3snsTAFAE5UyyZCtqC9yxj5dfpaYjXdd0Ukh
   pJ3UohmZ8BaZNgOqjyFYncqgoL3Cqn2fAb7/GS6dVQF1VXMBnlcynlnhA
   Q==;
X-CSE-ConnectionGUID: 9j+Pc0xKQyeC1A8ziPl1Ng==
X-CSE-MsgGUID: UyweRUtPTkevABiU7YXqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80550111"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="80550111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:21:30 -0700
X-CSE-ConnectionGUID: TnM5woW5RBSaFwkt94mTvg==
X-CSE-MsgGUID: HonCIUdfRKGJQMettE/IGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="207085525"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2025 12:21:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAvRe-000A6i-0r;
	Mon, 20 Oct 2025 19:21:26 +0000
Date: Tue, 21 Oct 2025 03:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 56bcf64b613127cbccae91d55becf5e5da235cbd
Message-ID: <202510210348.nPEz5dlG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 56bcf64b613127cbccae91d55becf5e5da235cbd  thunderbolt: Fix typo in tb_eeprom_ctl_read documentation

elapsed time: 729m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251020    clang-22
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-002-20251020    clang-22
arc                   randconfig-002-20251020    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251020    clang-22
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-004-20251020    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-002-20251020    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-003-20251020    clang-22
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-004-20251020    clang-22
arm64                 randconfig-004-20251020    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-002-20251020    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-002-20251020    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-002-20251020    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-002-20251020    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-002-20251020    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-002-20251020    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-002-20251020    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-002-20251020    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-002-20251020    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251020    clang-20
x86_64                randconfig-002-20251020    clang-20
x86_64                randconfig-003-20251020    clang-20
x86_64                randconfig-004-20251020    clang-20
x86_64                randconfig-005-20251020    clang-20
x86_64                randconfig-006-20251020    clang-20
x86_64                randconfig-007-20251020    clang-20
x86_64                randconfig-008-20251020    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

