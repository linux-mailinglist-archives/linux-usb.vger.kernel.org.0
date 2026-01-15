Return-Path: <linux-usb+bounces-32365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00CD224AE
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 04:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE8F308CDD6
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 03:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AE12877FA;
	Thu, 15 Jan 2026 03:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlQE+zof"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12233993
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 03:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447428; cv=none; b=SeNFKf65vhuzMchpTCKXViXoiXcCIAjrASkUP9XkhmEkSUM28Fpv9rSq8wEXJibxPy6s7ZFOrYX1XARgnOG7XGqsQsWPH94PqTSFlAuozQh7nC6Ap19L5Vzjkj2LxDy2OySJS0qvGrCRR1qRklQY8scO3f+DFaeOMO8fC6Jlh80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447428; c=relaxed/simple;
	bh=PBeCliAufBes5hWB16FWEtdrd4rlr0zJ6gmKOJ71jGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gju6lZBuGN7P4ypxG/8xXzbPinUwjXTk1+DW6qOGXaCZfDnGGyBCrSSPkYOjeSXYZU+zRUNi7ovWrlWjimwkc/Sf5mm72xJCuVPbEKA6JyBbuQ5jFB2INT/0XBucV6k0rLBCdCPf4cqpiPEi0MOLNlrc6PZcSwfO5c70tzON9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlQE+zof; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768447426; x=1799983426;
  h=date:from:to:cc:subject:message-id;
  bh=PBeCliAufBes5hWB16FWEtdrd4rlr0zJ6gmKOJ71jGA=;
  b=BlQE+zofWFq3cvRmZKvm/7TH1d3xnfMnVlrkvo7bxBy53Xek5dkG5jIe
   gXTSArDurLW8XbD4DvHC24y9Y6WcK5qEUCNZ/bAfVbgRlarrxlt/sD9Cn
   B/W9BZiEGvi6wXBTfIqAB+a2BFde9zu4p4878x4C84Q83piON2BTrDZJO
   3PYIvEnG2KjgRmFOZkxgnBVd/voj5nFyf+bkId19JwrY9r+bKuUPgKevw
   9qbE9FtCow15iLE1RkQojNPicNlJj1w/3gImglpPupB2CtCOlXRdWYMfe
   zP+x/H8YYVQ6Rk+ZNIyTGaIBONuuX6Dw0eiCtcnkgaZYy5l43yEkN7epo
   Q==;
X-CSE-ConnectionGUID: A7c5GFqqTWWL1WVer6aI6w==
X-CSE-MsgGUID: zyhF52bNTrKGk0/BDU/+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73596359"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73596359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:23:44 -0800
X-CSE-ConnectionGUID: W2i2BQywRJ+DIbU4mHPWPQ==
X-CSE-MsgGUID: Q+6c53fZSeuWGbKvbZyvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209319457"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 19:23:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgDxT-00000000HTQ-2ZKN;
	Thu, 15 Jan 2026 03:23:39 +0000
Date: Thu, 15 Jan 2026 11:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 cea2a1257a3b5ea3e769a445b34af13e6aa5a123
Message-ID: <202601151142.LJyAKbln-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: cea2a1257a3b5ea3e769a445b34af13e6aa5a123  usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()

elapsed time: 735m

configs tested: 199
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260115    clang-22
arc                   randconfig-002-20260115    clang-22
arc                    vdk_hs38_smp_defconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260115    clang-22
arm                   randconfig-002-20260115    clang-22
arm                   randconfig-003-20260115    clang-22
arm                   randconfig-004-20260115    clang-22
arm                        shmobile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260115    clang-22
arm64                 randconfig-002-20260115    clang-22
arm64                 randconfig-003-20260115    clang-22
arm64                 randconfig-004-20260115    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260115    clang-22
csky                  randconfig-002-20260115    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260115    clang-22
hexagon               randconfig-002-20260115    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260115    gcc-14
i386        buildonly-randconfig-002-20260115    gcc-14
i386        buildonly-randconfig-003-20260115    gcc-14
i386        buildonly-randconfig-004-20260115    gcc-14
i386        buildonly-randconfig-005-20260115    gcc-14
i386        buildonly-randconfig-006-20260115    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260115    clang-20
i386                  randconfig-002-20260115    clang-20
i386                  randconfig-003-20260115    clang-20
i386                  randconfig-004-20260115    clang-20
i386                  randconfig-005-20260115    clang-20
i386                  randconfig-006-20260115    clang-20
i386                  randconfig-007-20260115    clang-20
i386                  randconfig-011-20260115    gcc-14
i386                  randconfig-012-20260115    gcc-14
i386                  randconfig-013-20260115    gcc-14
i386                  randconfig-014-20260115    gcc-14
i386                  randconfig-015-20260115    gcc-14
i386                  randconfig-016-20260115    gcc-14
i386                  randconfig-017-20260115    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260115    clang-22
loongarch             randconfig-002-20260115    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-22
mips                       rbtx49xx_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260115    clang-22
nios2                 randconfig-002-20260115    clang-22
openrisc                         alldefconfig    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    clang-22
parisc                generic-64bit_defconfig    clang-22
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260115    clang-22
parisc                randconfig-002-20260115    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    clang-22
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc                     rainier_defconfig    clang-22
powerpc               randconfig-001-20260115    clang-22
powerpc               randconfig-002-20260115    clang-22
powerpc                      tqm8xx_defconfig    clang-22
powerpc                         wii_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260115    clang-22
powerpc64             randconfig-002-20260115    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260115    gcc-10.5.0
riscv                 randconfig-002-20260115    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260115    gcc-10.5.0
s390                  randconfig-002-20260115    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          r7785rp_defconfig    clang-22
sh                          r7785rp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260115    gcc-10.5.0
sh                    randconfig-002-20260115    gcc-10.5.0
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7722_defconfig    clang-22
sh                              ul2_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260115    clang-22
sparc                 randconfig-002-20260115    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260115    clang-22
sparc64               randconfig-002-20260115    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260115    clang-22
um                    randconfig-002-20260115    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260115    clang-20
x86_64      buildonly-randconfig-002-20260115    clang-20
x86_64      buildonly-randconfig-003-20260115    clang-20
x86_64      buildonly-randconfig-004-20260115    clang-20
x86_64      buildonly-randconfig-005-20260115    clang-20
x86_64      buildonly-randconfig-006-20260115    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260115    clang-20
x86_64                randconfig-002-20260115    clang-20
x86_64                randconfig-002-20260115    gcc-14
x86_64                randconfig-003-20260115    clang-20
x86_64                randconfig-004-20260115    clang-20
x86_64                randconfig-005-20260115    clang-20
x86_64                randconfig-005-20260115    gcc-14
x86_64                randconfig-006-20260115    clang-20
x86_64                randconfig-006-20260115    gcc-12
x86_64                randconfig-011-20260115    clang-20
x86_64                randconfig-012-20260115    clang-20
x86_64                randconfig-013-20260115    clang-20
x86_64                randconfig-014-20260115    clang-20
x86_64                randconfig-015-20260115    clang-20
x86_64                randconfig-016-20260115    clang-20
x86_64                randconfig-071-20260115    gcc-14
x86_64                randconfig-072-20260115    gcc-14
x86_64                randconfig-073-20260115    gcc-14
x86_64                randconfig-074-20260115    gcc-14
x86_64                randconfig-075-20260115    gcc-14
x86_64                randconfig-076-20260115    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260115    clang-22
xtensa                randconfig-002-20260115    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

