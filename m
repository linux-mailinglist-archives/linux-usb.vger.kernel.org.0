Return-Path: <linux-usb+bounces-21616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C156FA5B84B
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 06:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A42D3AE4B6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 05:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6C91E47DD;
	Tue, 11 Mar 2025 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIedAL8v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A341C72
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 05:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741670117; cv=none; b=gxyRxMuoJcyQXSpWmvkssxmUgZ75DiYwmdb7IPEdru3MjLR2CqODnUdMEhS9JeCTdhGALa51QGHNMYwxaJeLdzpZjSkaRZPyHvbJR6tCcHocenjqssMtzFD0oSQkedb4gPmNdNTHdVK0FYGTw4baGFb2H4ZjhqtwJ6f9duvrr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741670117; c=relaxed/simple;
	bh=lltfG8LlhreFS0uGqovowJ0vIoTau0RNlnUHO/RT/1Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=izieZC80vcSJcZlErJbii68W2yYVqM0jLLVbqAaDIrPPB/FwhS/LZa5mGlJksYBk80ZZmrz0r+55T+dVfD6Tdmuiz3OqrrOBSIewvEBoCQ6/cIkDqY98FlD9ND0FJt9KlplNEq/Ebq0c9eU6Zl7MPxRK4bkT/wVl2OwMYUVe1qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIedAL8v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741670115; x=1773206115;
  h=date:from:to:cc:subject:message-id;
  bh=lltfG8LlhreFS0uGqovowJ0vIoTau0RNlnUHO/RT/1Q=;
  b=jIedAL8vPdTCM0qTd5Uc/UkrwlAmLtUHPqcrIzBl1ZhW1msPh5Vtwd1P
   sFcxJIQK0MadCu5RRnfpTaybrRyuR15aBjKx3L5uEiMKxSyjMUt/BpimF
   sFEVtfr3iPUm/hDHrHjC5CShs/zXDcNXGgN1SdUVuZsnUy811PZAbn8ZJ
   WJE/t/bflVLe6cmGGRkWWydKBsEW0raiPg6EWs3Wqpklm498SiulDrvR7
   4FvszBuEKYd1SSdnI+OyK/oJexJBl9Fi4lFcWBFWMUiUckrkztZMPxxlo
   XbBmosZycC6kEA6MEmxksIN7mNE5C+W3e/lNZlJj4lMsNvWi5J8ohtIEr
   w==;
X-CSE-ConnectionGUID: ZN3Pr83NQgeAii5PvkC6QQ==
X-CSE-MsgGUID: 4Kn1bL5YRrKf0pnw0oQePg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46602501"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="46602501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 22:15:14 -0700
X-CSE-ConnectionGUID: u8MeYh8ZSAylFUIvYJJCWg==
X-CSE-MsgGUID: +A4VfoIoQM2G/GLVKDi4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120683876"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2025 22:15:13 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trrxJ-0006N2-00;
	Tue, 11 Mar 2025 05:15:08 +0000
Date: Tue, 11 Mar 2025 13:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 2901c0006d14180a833f3586c79fddd871f2d773
Message-ID: <202503111340.ph4AzYYB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 2901c0006d14180a833f3586c79fddd871f2d773  USB: disable all RNDIS protocol drivers

elapsed time: 1270m

configs tested: 182
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250310    gcc-13.2.0
arc                   randconfig-002-20250310    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-19
arm                            hisi_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250310    clang-21
arm                   randconfig-002-20250310    gcc-14.2.0
arm                   randconfig-003-20250310    gcc-14.2.0
arm                   randconfig-004-20250310    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250310    clang-19
arm64                 randconfig-002-20250310    clang-17
arm64                 randconfig-003-20250310    clang-15
arm64                 randconfig-004-20250310    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250310    gcc-14.2.0
csky                  randconfig-002-20250310    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250310    clang-21
hexagon               randconfig-002-20250310    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250310    clang-19
i386        buildonly-randconfig-001-20250311    clang-19
i386        buildonly-randconfig-002-20250310    clang-19
i386        buildonly-randconfig-002-20250311    clang-19
i386        buildonly-randconfig-003-20250310    clang-19
i386        buildonly-randconfig-003-20250311    clang-19
i386        buildonly-randconfig-004-20250310    clang-19
i386        buildonly-randconfig-004-20250311    clang-19
i386        buildonly-randconfig-005-20250310    clang-19
i386        buildonly-randconfig-005-20250311    clang-19
i386        buildonly-randconfig-006-20250310    clang-19
i386        buildonly-randconfig-006-20250311    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250311    gcc-12
i386                  randconfig-002-20250311    gcc-12
i386                  randconfig-003-20250311    gcc-12
i386                  randconfig-004-20250311    gcc-12
i386                  randconfig-005-20250311    gcc-12
i386                  randconfig-006-20250311    gcc-12
i386                  randconfig-007-20250311    gcc-12
i386                  randconfig-011-20250311    clang-19
i386                  randconfig-012-20250311    clang-19
i386                  randconfig-013-20250311    clang-19
i386                  randconfig-014-20250311    clang-19
i386                  randconfig-015-20250311    clang-19
i386                  randconfig-016-20250311    clang-19
i386                  randconfig-017-20250311    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250310    gcc-14.2.0
loongarch             randconfig-002-20250310    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-18
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250310    gcc-14.2.0
nios2                 randconfig-002-20250310    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250310    gcc-14.2.0
parisc                randconfig-002-20250310    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250310    clang-17
powerpc               randconfig-002-20250310    clang-21
powerpc               randconfig-003-20250310    clang-17
powerpc64             randconfig-001-20250310    gcc-14.2.0
powerpc64             randconfig-002-20250310    gcc-14.2.0
powerpc64             randconfig-003-20250310    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250310    clang-19
riscv                 randconfig-001-20250311    gcc-14.2.0
riscv                 randconfig-002-20250310    gcc-14.2.0
riscv                 randconfig-002-20250311    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250310    gcc-14.2.0
s390                  randconfig-001-20250311    gcc-14.2.0
s390                  randconfig-002-20250310    clang-18
s390                  randconfig-002-20250311    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250310    gcc-14.2.0
sh                    randconfig-001-20250311    gcc-14.2.0
sh                    randconfig-002-20250310    gcc-14.2.0
sh                    randconfig-002-20250311    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250310    gcc-14.2.0
sparc                 randconfig-001-20250311    gcc-14.2.0
sparc                 randconfig-002-20250310    gcc-14.2.0
sparc                 randconfig-002-20250311    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250310    gcc-14.2.0
sparc64               randconfig-001-20250311    gcc-14.2.0
sparc64               randconfig-002-20250310    gcc-14.2.0
sparc64               randconfig-002-20250311    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250310    gcc-12
um                    randconfig-001-20250311    gcc-14.2.0
um                    randconfig-002-20250310    clang-17
um                    randconfig-002-20250311    gcc-14.2.0
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250310    gcc-12
x86_64      buildonly-randconfig-001-20250311    clang-19
x86_64      buildonly-randconfig-002-20250310    clang-19
x86_64      buildonly-randconfig-002-20250311    clang-19
x86_64      buildonly-randconfig-003-20250310    clang-19
x86_64      buildonly-randconfig-003-20250311    clang-19
x86_64      buildonly-randconfig-004-20250310    clang-19
x86_64      buildonly-randconfig-004-20250311    clang-19
x86_64      buildonly-randconfig-005-20250310    clang-19
x86_64      buildonly-randconfig-005-20250311    clang-19
x86_64      buildonly-randconfig-006-20250310    gcc-12
x86_64      buildonly-randconfig-006-20250311    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250310    gcc-14.2.0
xtensa                randconfig-001-20250311    gcc-14.2.0
xtensa                randconfig-002-20250310    gcc-14.2.0
xtensa                randconfig-002-20250311    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

