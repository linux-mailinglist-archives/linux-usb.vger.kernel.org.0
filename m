Return-Path: <linux-usb+bounces-27679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F3B47AF9
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 13:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80CF3B7A98
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6860225CC75;
	Sun,  7 Sep 2025 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wrmnl4uX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BC1DF26A
	for <linux-usb@vger.kernel.org>; Sun,  7 Sep 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244772; cv=none; b=AezlXTFU1QsY2HyIYt4V0taKNU9gBYI8WTI+1m9heUCx5uy40DsO/OfkLVgRIFIeVsq3CIEY7bc02igemO9qfEZkHpXfyKKujhCDlVeb1Av/LbDyYSP3dTTqA+WnXAh9C2NQWPDyErj7LZv0rTfbWpzedbleF/Ov/SIqrNAVReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244772; c=relaxed/simple;
	bh=f/8XF486+OL/kjTYhX0Sf8gTSsNzfIi/J4o54kLt4ec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJih5ohu4LoHFRaQayIr4icFrE5B3GAMR50yBct26qqADvtXNO6PXO1tMFSLLK2FEIdDK9MVGCLxeImBPSPsghiLzbn8TR++pEgfljQyURQLl6hh0uqg2NVjU+gd0fwTg5ghfsruo2L5GAHFDknj/S+BkZx3kmS4intx7XHlhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wrmnl4uX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757244771; x=1788780771;
  h=date:from:to:cc:subject:message-id;
  bh=f/8XF486+OL/kjTYhX0Sf8gTSsNzfIi/J4o54kLt4ec=;
  b=Wrmnl4uXB6wPme6O8cStOLjCin19bhPNdxhELJpwIUU4IJ6ZgtivRcoU
   cmiJbpJ32rhSG9TY2kSbVuI4ZJHIwtbyhFMSf4EvqSPngjiLxARo4QlrD
   qhkFm45rfT80GccYy41vHdbMkPsQD3+zWcTXcsLrSXrQjM2TwzdSbWJGQ
   3RRnskK9WQEf5pHT7+IjEJ2Ah2gH/iRWYkKVfmah+oCbDEwk2zdhmHYJY
   Vgaw1dOW8t9Gtn2QBQIBMI9QFyC8NtWCpaffpaklRe/B61ldO7tGgAfEv
   LMSPoCxsyFfBXvAw5P5t7Nykp6jiS7gp70QIn3Qfk6M0e03VmbZIesRPS
   g==;
X-CSE-ConnectionGUID: 7cxdl8fAQqewKQ/z6X8pNQ==
X-CSE-MsgGUID: tH+lxGK2QymCiWS2d505tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="59669515"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="59669515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 04:32:51 -0700
X-CSE-ConnectionGUID: Y0+aIpIQQQKr33hCKXqf1w==
X-CSE-MsgGUID: 8UvoVo4xTzOG71sLyJ2JbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="172665896"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2025 04:32:49 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvDdW-0002Dr-2f;
	Sun, 07 Sep 2025 11:32:46 +0000
Date: Sun, 07 Sep 2025 19:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 116e79c679a1530cf833d0ff3007061d7a716bd9
Message-ID: <202509071906.uyEzyFx1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 116e79c679a1530cf833d0ff3007061d7a716bd9  usb: gadget: midi2: Fix MIDI2 IN EP max packet size

elapsed time: 1282m

configs tested: 232
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250906    gcc-14.3.0
arc                   randconfig-001-20250907    clang-22
arc                   randconfig-002-20250906    gcc-10.5.0
arc                   randconfig-002-20250907    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250906    clang-22
arm                   randconfig-001-20250907    clang-22
arm                   randconfig-002-20250906    clang-22
arm                   randconfig-002-20250907    clang-22
arm                   randconfig-003-20250906    gcc-13.4.0
arm                   randconfig-003-20250907    clang-22
arm                   randconfig-004-20250906    gcc-10.5.0
arm                   randconfig-004-20250907    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250906    gcc-8.5.0
arm64                 randconfig-001-20250907    clang-22
arm64                 randconfig-002-20250906    gcc-12.5.0
arm64                 randconfig-002-20250907    clang-22
arm64                 randconfig-003-20250906    clang-22
arm64                 randconfig-003-20250907    clang-22
arm64                 randconfig-004-20250906    gcc-9.5.0
arm64                 randconfig-004-20250907    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250907    gcc-11.5.0
csky                  randconfig-001-20250907    gcc-15.1.0
csky                  randconfig-002-20250907    gcc-11.5.0
csky                  randconfig-002-20250907    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250907    clang-17
hexagon               randconfig-001-20250907    gcc-11.5.0
hexagon               randconfig-002-20250907    clang-22
hexagon               randconfig-002-20250907    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250906    clang-20
i386        buildonly-randconfig-001-20250907    clang-20
i386        buildonly-randconfig-002-20250906    gcc-11
i386        buildonly-randconfig-002-20250907    clang-20
i386        buildonly-randconfig-003-20250906    gcc-13
i386        buildonly-randconfig-003-20250907    clang-20
i386        buildonly-randconfig-004-20250906    gcc-13
i386        buildonly-randconfig-004-20250907    clang-20
i386        buildonly-randconfig-005-20250906    clang-20
i386        buildonly-randconfig-005-20250907    clang-20
i386        buildonly-randconfig-006-20250906    clang-20
i386        buildonly-randconfig-006-20250907    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250907    gcc-13
i386                  randconfig-002-20250907    gcc-13
i386                  randconfig-003-20250907    gcc-13
i386                  randconfig-004-20250907    gcc-13
i386                  randconfig-005-20250907    gcc-13
i386                  randconfig-006-20250907    gcc-13
i386                  randconfig-007-20250907    gcc-13
i386                  randconfig-011-20250907    gcc-13
i386                  randconfig-012-20250907    gcc-13
i386                  randconfig-013-20250907    gcc-13
i386                  randconfig-014-20250907    gcc-13
i386                  randconfig-015-20250907    gcc-13
i386                  randconfig-016-20250907    gcc-13
i386                  randconfig-017-20250907    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250907    clang-22
loongarch             randconfig-001-20250907    gcc-11.5.0
loongarch             randconfig-002-20250907    clang-22
loongarch             randconfig-002-20250907    gcc-11.5.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250907    gcc-11.5.0
nios2                 randconfig-002-20250907    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-13
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250907    gcc-11.5.0
parisc                randconfig-001-20250907    gcc-9.5.0
parisc                randconfig-002-20250907    gcc-11.5.0
parisc                randconfig-002-20250907    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250907    gcc-11.5.0
powerpc               randconfig-001-20250907    gcc-9.5.0
powerpc               randconfig-002-20250907    clang-22
powerpc               randconfig-002-20250907    gcc-11.5.0
powerpc               randconfig-003-20250907    gcc-11.5.0
powerpc               randconfig-003-20250907    gcc-15.1.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250907    gcc-11.5.0
powerpc64             randconfig-001-20250907    gcc-13.4.0
powerpc64             randconfig-002-20250907    clang-22
powerpc64             randconfig-002-20250907    gcc-11.5.0
powerpc64             randconfig-003-20250907    clang-22
powerpc64             randconfig-003-20250907    gcc-11.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-13
riscv                 randconfig-001-20250906    gcc-13.4.0
riscv                 randconfig-001-20250907    gcc-12.5.0
riscv                 randconfig-002-20250906    gcc-8.5.0
riscv                 randconfig-002-20250907    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-13
s390                  randconfig-001-20250906    gcc-10.5.0
s390                  randconfig-001-20250907    gcc-12.5.0
s390                  randconfig-002-20250906    clang-22
s390                  randconfig-002-20250907    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-13
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250906    gcc-15.1.0
sh                    randconfig-001-20250907    gcc-12.5.0
sh                    randconfig-002-20250906    gcc-12.5.0
sh                    randconfig-002-20250907    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250906    gcc-8.5.0
sparc                 randconfig-001-20250907    gcc-12.5.0
sparc                 randconfig-002-20250906    gcc-13.4.0
sparc                 randconfig-002-20250907    gcc-12.5.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-13
sparc64               randconfig-001-20250906    clang-22
sparc64               randconfig-001-20250907    gcc-12.5.0
sparc64               randconfig-002-20250906    gcc-14.3.0
sparc64               randconfig-002-20250907    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-13
um                                  defconfig    gcc-13
um                             i386_defconfig    gcc-13
um                    randconfig-001-20250906    gcc-12
um                    randconfig-001-20250907    gcc-12.5.0
um                    randconfig-002-20250906    clang-22
um                    randconfig-002-20250907    gcc-12.5.0
um                           x86_64_defconfig    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250907    gcc-13
x86_64      buildonly-randconfig-002-20250907    clang-20
x86_64      buildonly-randconfig-002-20250907    gcc-13
x86_64      buildonly-randconfig-003-20250907    gcc-13
x86_64      buildonly-randconfig-004-20250907    gcc-13
x86_64      buildonly-randconfig-005-20250907    gcc-13
x86_64      buildonly-randconfig-006-20250907    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250907    clang-20
x86_64                randconfig-002-20250907    clang-20
x86_64                randconfig-003-20250907    clang-20
x86_64                randconfig-004-20250907    clang-20
x86_64                randconfig-005-20250907    clang-20
x86_64                randconfig-006-20250907    clang-20
x86_64                randconfig-007-20250907    clang-20
x86_64                randconfig-008-20250907    clang-20
x86_64                randconfig-071-20250907    gcc-13
x86_64                randconfig-072-20250907    gcc-13
x86_64                randconfig-073-20250907    gcc-13
x86_64                randconfig-074-20250907    gcc-13
x86_64                randconfig-075-20250907    gcc-13
x86_64                randconfig-076-20250907    gcc-13
x86_64                randconfig-077-20250907    gcc-13
x86_64                randconfig-078-20250907    gcc-13
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-13
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-13
x86_64                           rhel-9.4-ltp    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250906    gcc-12.5.0
xtensa                randconfig-001-20250907    gcc-12.5.0
xtensa                randconfig-002-20250906    gcc-10.5.0
xtensa                randconfig-002-20250907    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

