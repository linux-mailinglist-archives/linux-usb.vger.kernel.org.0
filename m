Return-Path: <linux-usb+bounces-26060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED957B0CC98
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 23:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B41171A8A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 21:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E128F23F40A;
	Mon, 21 Jul 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+kXihsA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B632236FD
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753133364; cv=none; b=SLfyOOGEoIuykruOdC38Lvo7xMZW3XUgYHwutUvsn0qfuCee78CSyEne+r533WqwA4+rzw5lATNvvCfwa1s0MDm8QVG3N2Ymfx1YfZcTLOb25YUkw5oJamMN/opNNmiF+20QG3ejo3mQ/doq7WbcQNI1o9AugaziLj1SVAgg0pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753133364; c=relaxed/simple;
	bh=Gw2KW9qdoIR9bvQeY9m7wFT+4MAZeN55+xAOJta4dnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DM/abnWTfa1bl7xdLuJ+nzd+9fyDrk4BkDbWBngMXz//z7loMVoOyl0jqIYrPV18khT9KTtphMiOA2tRI8JUsUGew8ZslWJuYq1OPyobV6VkpEKBeI6f+r0i6O5karV7F6hWbjYmRfqirS0SNSw5ywFwjRy8Haodxg4bal7IWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+kXihsA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753133362; x=1784669362;
  h=date:from:to:cc:subject:message-id;
  bh=Gw2KW9qdoIR9bvQeY9m7wFT+4MAZeN55+xAOJta4dnA=;
  b=O+kXihsAloOZDIa4spHniaNoufdRavSPFGCEdmKe+o0j6bLi8/eW4//n
   MjGUQyot5NHxXD5x2n8PEIfXVUX/gt2Mf1XvgODhf4CizxIIvLMQeG+Hb
   9PpAv1ujY9HXTUnxJE/gfvKQZnbiH4LSIrAkJ2YKUZjuyWouVjqebCJ+J
   DdlItFwCLXUeEQOGaPodfwkizkhvkROw9CbB+QB2cVevmH2SxiJSu1aoX
   U1AVBiuOzCBpXmjc9TKlTnL8R/OqUhsIhx8T0GJQ/nd5PxtExAngsYv/X
   rvg6oxfbEVbok6OHjbbgUcVs69Jru6KJp+3/+kiuW97OKjRgxvSc+RZ48
   w==;
X-CSE-ConnectionGUID: ufYU8RcgSruSC7Xl9PJZZA==
X-CSE-MsgGUID: K+OAxwwUTcqxZHpbMSIcQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65629760"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="65629760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 14:29:22 -0700
X-CSE-ConnectionGUID: e3Xm3GfLTWintMaO3suDRA==
X-CSE-MsgGUID: KGWNJ4d1Th6LQ3UsSsOIVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159279759"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jul 2025 14:29:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udy4V-000HAn-0D;
	Mon, 21 Jul 2025 21:29:19 +0000
Date: Tue, 22 Jul 2025 05:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 a83c371c4b6c9e5cc11391ee6e56543a0fef59b9
Message-ID: <202507220541.Bl9QHcw4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: a83c371c4b6c9e5cc11391ee6e56543a0fef59b9  Merge tag 'v6.16-rc7' into usb-next

elapsed time: 722m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250721    gcc-11.5.0
arc                   randconfig-002-20250721    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                            dove_defconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-16
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250721    clang-22
arm                   randconfig-002-20250721    gcc-13.4.0
arm                   randconfig-003-20250721    gcc-15.1.0
arm                   randconfig-004-20250721    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250721    clang-22
arm64                 randconfig-002-20250721    clang-20
arm64                 randconfig-003-20250721    gcc-13.4.0
arm64                 randconfig-004-20250721    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250721    gcc-15.1.0
csky                  randconfig-002-20250721    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250721    clang-22
hexagon               randconfig-002-20250721    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250721    clang-20
i386        buildonly-randconfig-002-20250721    clang-20
i386        buildonly-randconfig-003-20250721    gcc-12
i386        buildonly-randconfig-004-20250721    gcc-12
i386        buildonly-randconfig-005-20250721    clang-20
i386        buildonly-randconfig-006-20250721    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250721    clang-18
loongarch             randconfig-002-20250721    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250721    gcc-8.5.0
nios2                 randconfig-002-20250721    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250721    gcc-15.1.0
parisc                randconfig-002-20250721    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc               randconfig-001-20250721    gcc-12.5.0
powerpc               randconfig-002-20250721    gcc-10.5.0
powerpc               randconfig-003-20250721    gcc-11.5.0
powerpc64             randconfig-001-20250721    clang-22
powerpc64             randconfig-002-20250721    clang-22
powerpc64             randconfig-003-20250721    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250721    clang-22
riscv                 randconfig-002-20250721    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                  randconfig-001-20250721    clang-22
s390                  randconfig-002-20250721    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250721    gcc-15.1.0
sh                    randconfig-002-20250721    gcc-14.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250721    gcc-15.1.0
sparc                 randconfig-002-20250721    gcc-13.4.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250721    clang-20
sparc64               randconfig-002-20250721    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250721    gcc-12
um                    randconfig-002-20250721    clang-17
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250721    clang-20
x86_64      buildonly-randconfig-002-20250721    gcc-12
x86_64      buildonly-randconfig-003-20250721    gcc-12
x86_64      buildonly-randconfig-004-20250721    gcc-12
x86_64      buildonly-randconfig-005-20250721    clang-20
x86_64      buildonly-randconfig-006-20250721    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250721    gcc-11.5.0
xtensa                randconfig-002-20250721    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

