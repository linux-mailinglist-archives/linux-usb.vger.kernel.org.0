Return-Path: <linux-usb+bounces-26958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D55B29702
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 04:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0959B203CBF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 02:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C8A253358;
	Mon, 18 Aug 2025 02:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHqtOKDl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B9253932
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 02:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483942; cv=none; b=swGKAcmZBmV6IEVjqGTODpRSobkmd0jYBbMZQ0F45/4gykkBt3aHPbjz7s2LyqHkCzZIBimEGhzwNcpTSN9a2XKEILWXIJb6fnGPl9pBZMGTJeHMXTSEY1zsbr8/dGbpkQ3MjdsTvJ39e44TKDfLon0sYtVFVjCGom9DIinG1vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483942; c=relaxed/simple;
	bh=0ozbL3L2zy5byswDMh5GFa6NZ4PKI59osDohwHqHrP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ka9cyaN0WqQKmEP//n5zl4FKCfN6dYrSILZ5H5GTLEqV3BX/jLN8G8tUk4cCFYDkB2ucv7732UQMFXUh95c6+qTT7rhhWqY1wxStVJjvHe7GS2xIuvDTlc6XUnXAy2ZjCEZR3oEwsAAYlmMvaJW6u7/apZ3/jAjR7TCcLRr5GSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHqtOKDl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755483941; x=1787019941;
  h=date:from:to:cc:subject:message-id;
  bh=0ozbL3L2zy5byswDMh5GFa6NZ4PKI59osDohwHqHrP4=;
  b=lHqtOKDldf7mLj1aRLLH0GncZJESvjw4EcO1iiKDioZcqdy1xg30d478
   NSJQNjLcyd4R1fycEa+KvgKaeLkkIPGLNwfTUHPF6MwX6b60fq3xytCGe
   prFKlHZnt1Yhak2B1S+4F9z58nvrWVcaMfL8MI5pxlAu4mcRNIhZQOtf/
   NN6t8r9HwdMmCkwwq1BsWIGwkg7L38VJY8Axft0fs/A5y9UY5ufVo9pgk
   0ZQIc1nSr71mPCjzodc4lURSWgavYTWopdZFOEB7h3vDYRLrHVWBAu1NG
   4uu4CLm0lJXC94bybNy6OGP0IQHW/BSSji16Xzsja7UxCwvEf66Dicd3h
   w==;
X-CSE-ConnectionGUID: 61rjvuWMSiug9tjpe2k63w==
X-CSE-MsgGUID: 8qnozo+6SCOYWBA2PeK2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68791304"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68791304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 19:25:39 -0700
X-CSE-ConnectionGUID: Tano3xxYTJGyD8877ms3hw==
X-CSE-MsgGUID: H3L4Kc3URLqMk5mrMbyQRg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Aug 2025 19:25:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unpZ1-000Dr9-2U;
	Mon, 18 Aug 2025 02:25:35 +0000
Date: Mon, 18 Aug 2025 10:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 956606bafb5fc6e5968aadcda86fc0037e1d7548
Message-ID: <202508181019.gx0OX4d6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 956606bafb5fc6e5968aadcda86fc0037e1d7548  usb: gadget: f_ncm: Fix MAC assignment NCM ethernet

elapsed time: 883m

configs tested: 135
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250817    gcc-15.1.0
arc                   randconfig-002-20250817    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20250817    gcc-14.3.0
arm                   randconfig-002-20250817    clang-22
arm                   randconfig-003-20250817    clang-22
arm                   randconfig-004-20250817    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250817    clang-22
arm64                 randconfig-002-20250817    clang-22
arm64                 randconfig-003-20250817    clang-20
arm64                 randconfig-004-20250817    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250817    gcc-15.1.0
csky                  randconfig-002-20250817    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250817    clang-22
hexagon               randconfig-002-20250817    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250817    gcc-12
i386        buildonly-randconfig-002-20250817    clang-20
i386        buildonly-randconfig-003-20250817    gcc-12
i386        buildonly-randconfig-004-20250817    clang-20
i386        buildonly-randconfig-005-20250817    gcc-12
i386        buildonly-randconfig-006-20250817    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250817    clang-22
loongarch             randconfig-002-20250817    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250817    gcc-8.5.0
nios2                 randconfig-002-20250817    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250817    gcc-8.5.0
parisc                randconfig-002-20250817    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250817    clang-19
powerpc               randconfig-002-20250817    clang-22
powerpc               randconfig-003-20250817    clang-22
powerpc64             randconfig-001-20250817    clang-22
powerpc64             randconfig-002-20250817    clang-19
powerpc64             randconfig-003-20250817    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250817    gcc-12.5.0
riscv                 randconfig-002-20250817    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250817    clang-22
s390                  randconfig-002-20250817    clang-16
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250817    gcc-15.1.0
sh                    randconfig-002-20250817    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250817    gcc-8.5.0
sparc                 randconfig-002-20250817    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250817    clang-22
sparc64               randconfig-002-20250817    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250817    clang-18
um                    randconfig-002-20250817    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250817    clang-20
x86_64      buildonly-randconfig-002-20250817    gcc-12
x86_64      buildonly-randconfig-003-20250817    gcc-12
x86_64      buildonly-randconfig-004-20250817    gcc-12
x86_64      buildonly-randconfig-005-20250817    clang-20
x86_64      buildonly-randconfig-006-20250817    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250817    gcc-8.5.0
xtensa                randconfig-002-20250817    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

