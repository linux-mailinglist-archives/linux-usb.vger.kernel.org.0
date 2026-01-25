Return-Path: <linux-usb+bounces-32683-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HaQC1l1dWlfFQEAu9opvQ
	(envelope-from <linux-usb+bounces-32683-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 02:43:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0E7F70B
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 02:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB1A6300B13D
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 01:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E441C5F1B;
	Sun, 25 Jan 2026 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE03zXRo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530EE3EBF2D
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 01:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769305427; cv=none; b=DyfiC34SG4Oit+PXGbVxprzDsteiHqGnzBWPDBVb9zKOUNq1Vty+1vMncaL/tzs7yATcPpKNGcDldvcBzU7zN71sI26cFjGT/MsVLYK0PCruEcKxpq2Hcyfj5njRMLVQGCgbRDgZRPXWsx+4B+aiW/1KJgCJ3fK6pe3zIDu0JMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769305427; c=relaxed/simple;
	bh=D1zFGO0Ft8+1gwJ+teNX3/gjwQ0umS2bI6K0e621f74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NTujbi51uoz1KEWMGCXlA/IfUpdUK80+4P9uLD3SnoD3F8wbdKcvUHWVnzMPkiLy6p/KOhRSwuHR2vhuMrvpVKTc2JtUVqSdUPjR4+WkV2av+wnsm5SiUxehtTP/huz9+PSMYO60ucZ8ZA7sLZZFO+6SbSiQL0FO/i6exx4cgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE03zXRo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769305424; x=1800841424;
  h=date:from:to:cc:subject:message-id;
  bh=D1zFGO0Ft8+1gwJ+teNX3/gjwQ0umS2bI6K0e621f74=;
  b=BE03zXRorX6GMp05KLrN5e4+gQiYLpiyiT7o8eBLaEkWgPyJIbr5qhLX
   kWlqdgeN1sPj/q3I1cOl6r8u9Q1c3w9XUXaxZdykM0QWCBAZwOL1NydDI
   0kJ/HGjwnlrytaNOnnrUbwDzj81QLJFm64233tmeh92ASpj8vjlTiHOIf
   /OAnXKhwkoZ6k2e2/lQlLUI472+b8lXbTCtkYOTthE8OrllN+fYAtx+zS
   EI675PdUICtrZk2flWOezpnnORlW9qc7MRxFmfYGik79xj80fv3/R+Q+o
   keDfKuLXU9z87jQzHv95xWjJigMXFB7l+dxemsKLDvfibOQmoAk4kyett
   A==;
X-CSE-ConnectionGUID: zHpdaDFnSDOflMK1ok5ZWg==
X-CSE-MsgGUID: tYk4pnmdSn6dyyoQDALQyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70565718"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70565718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 17:43:44 -0800
X-CSE-ConnectionGUID: BnAzT+ewSaCnsH7OdNidXA==
X-CSE-MsgGUID: DPiW99iXTraFKr3rJLKZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211862478"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jan 2026 17:43:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjpAC-00000000VfM-0j2J;
	Sun, 25 Jan 2026 01:43:40 +0000
Date: Sun, 25 Jan 2026 09:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 8acc379b664ec987dcc7eca25a5f5c4a9a4eb9c4
Message-ID: <202601250939.IP6Dtt1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32683-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DC0E7F70B
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 8acc379b664ec987dcc7eca25a5f5c4a9a4eb9c4  usb: phy: tegra: add HSIC support

elapsed time: 816m

configs tested: 193
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260124    gcc-14.3.0
arc                   randconfig-001-20260125    gcc-10.5.0
arc                   randconfig-002-20260124    gcc-13.4.0
arc                   randconfig-002-20260125    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20260124    gcc-8.5.0
arm                   randconfig-001-20260125    gcc-10.5.0
arm                   randconfig-002-20260124    clang-22
arm                   randconfig-002-20260125    gcc-10.5.0
arm                   randconfig-003-20260124    clang-18
arm                   randconfig-003-20260125    gcc-10.5.0
arm                   randconfig-004-20260124    gcc-15.2.0
arm                   randconfig-004-20260125    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260125    gcc-11.5.0
arm64                 randconfig-002-20260125    gcc-11.5.0
arm64                 randconfig-003-20260125    gcc-11.5.0
arm64                 randconfig-004-20260125    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260125    gcc-11.5.0
csky                  randconfig-002-20260125    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260125    gcc-14
i386        buildonly-randconfig-002-20260125    gcc-14
i386        buildonly-randconfig-003-20260125    gcc-14
i386        buildonly-randconfig-004-20260125    gcc-14
i386        buildonly-randconfig-005-20260125    gcc-14
i386        buildonly-randconfig-006-20260125    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260125    clang-20
i386                  randconfig-002-20260125    clang-20
i386                  randconfig-003-20260125    clang-20
i386                  randconfig-004-20260125    clang-20
i386                  randconfig-005-20260125    clang-20
i386                  randconfig-006-20260125    clang-20
i386                  randconfig-007-20260125    clang-20
i386                  randconfig-011-20260125    gcc-14
i386                  randconfig-012-20260125    gcc-14
i386                  randconfig-013-20260125    gcc-14
i386                  randconfig-014-20260125    gcc-14
i386                  randconfig-015-20260125    gcc-14
i386                  randconfig-016-20260125    gcc-14
i386                  randconfig-017-20260125    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    clang-22
mips                           gcw0_defconfig    clang-22
mips                           rs90_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260125    gcc-8.5.0
parisc                randconfig-002-20260125    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260125    clang-22
powerpc               randconfig-001-20260125    gcc-8.5.0
powerpc               randconfig-002-20260125    clang-22
powerpc               randconfig-002-20260125    gcc-8.5.0
powerpc64             randconfig-001-20260125    gcc-12.5.0
powerpc64             randconfig-001-20260125    gcc-8.5.0
powerpc64             randconfig-002-20260125    clang-17
powerpc64             randconfig-002-20260125    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260125    clang-22
riscv                 randconfig-002-20260125    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260125    clang-22
s390                  randconfig-002-20260125    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                         apsh4a3a_defconfig    clang-22
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260125    clang-22
sh                    randconfig-002-20260125    clang-22
sh                           se7751_defconfig    clang-22
sh                   sh7724_generic_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260125    clang-20
x86_64      buildonly-randconfig-002-20260125    clang-20
x86_64      buildonly-randconfig-003-20260125    clang-20
x86_64      buildonly-randconfig-004-20260125    clang-20
x86_64      buildonly-randconfig-005-20260125    clang-20
x86_64      buildonly-randconfig-006-20260125    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260125    gcc-14
x86_64                randconfig-002-20260125    gcc-14
x86_64                randconfig-003-20260125    gcc-14
x86_64                randconfig-004-20260125    gcc-14
x86_64                randconfig-005-20260125    gcc-14
x86_64                randconfig-006-20260125    gcc-14
x86_64                randconfig-071-20260125    clang-20
x86_64                randconfig-072-20260125    clang-20
x86_64                randconfig-073-20260125    clang-20
x86_64                randconfig-074-20260125    clang-20
x86_64                randconfig-075-20260125    clang-20
x86_64                randconfig-076-20260125    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

