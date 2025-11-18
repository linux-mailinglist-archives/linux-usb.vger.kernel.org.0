Return-Path: <linux-usb+bounces-30659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403FC68C30
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 11:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 328742DCAF
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 10:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177AC32D0E9;
	Tue, 18 Nov 2025 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3ki3lyF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65A032824A
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460434; cv=none; b=FIshNo2nQrVeMD8xIxzwpFvuCIJ7ocqQDXgXOsWfCxGPNvH7wP9WHbPnocLS2IJ3DeCUPb7MQWvROvwr3fDktFboK16409OMEDP7c3gUGEp0nYiR/uJLCxQ58ipl8eq3jUUYunSR24aeQvwgy1C+Pw3Br+o3wpxDmC2s/+lPyTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460434; c=relaxed/simple;
	bh=7thQOLSZi1YLCYzyY4J0kgV/suXDJ0xgFBLsvOMbbFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WlynV8Fo6L8oGBHgjr7xpod9GLynUpTkDvUvd1HtVmfYZWokXDyRU50JUrkjS2VEVvKUJVjTKtBp4lEQqzTZrzDaEPhjfI+MCIrHJl0M9SuYd7v7q+QwbxSJ8yt51RbmD/aeg6BaNS7SltIhtl5NMc1xkQuta0kg4Qd6g+TWvKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3ki3lyF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763460433; x=1794996433;
  h=date:from:to:cc:subject:message-id;
  bh=7thQOLSZi1YLCYzyY4J0kgV/suXDJ0xgFBLsvOMbbFw=;
  b=F3ki3lyFUyflNoodeORZKPK8Xo2qJtIukJe6KNp9KDud5L2JdTiMdQaw
   FpLUk+lZxr84Rg+E1UE4Xe0dtICUWSQcPg3jjR6WJrCKLlHHg5dNrZLpH
   VB3KSHA9tXW42S7nBgQYVrtLn9mh2HUZ53DgvqEllCc0SlEwBWfWY4bsQ
   xQPEN6I+ESVo/cEBTredUxBY8z/8ql2biSWZvFhi22M9VL5V8QgGOcOJR
   2884UYh2Q4HlDjipLtqObQi7+FLPu+u8gj+jy0vFfbCwIfsXTeil6rNUA
   VOhy9xvOowkkIDkSG2HG6gMwMddkGjQI2zibAA3cuJQRNDTdRfl2RZ+3h
   w==;
X-CSE-ConnectionGUID: m/FIMfFuR1aWkRh2PEOOGg==
X-CSE-MsgGUID: QxIveAh6TU+A5BrhLFMVxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83103367"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="83103367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:07:12 -0800
X-CSE-ConnectionGUID: 4+UVA6FmSXmN5+qsVCmIIw==
X-CSE-MsgGUID: YI4OP9lKS6CM056Ny4vh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190512960"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 02:07:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIc8-0001aY-2Z;
	Tue, 18 Nov 2025 10:07:08 +0000
Date: Tue, 18 Nov 2025 18:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 479d186fc946b16c440f57995d5cb2151bfe61c0
Message-ID: <202511181846.3EYwe9eN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 479d186fc946b16c440f57995d5cb2151bfe61c0  thunderbolt: Fix typos in xdomain.c

elapsed time: 1531m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251117    gcc-14.3.0
arc                   randconfig-002-20251117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251117    clang-22
arm                   randconfig-002-20251117    gcc-14.3.0
arm                   randconfig-003-20251117    gcc-12.5.0
arm                   randconfig-004-20251117    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251117    clang-22
arm64                 randconfig-002-20251117    gcc-15.1.0
arm64                 randconfig-003-20251117    gcc-8.5.0
arm64                 randconfig-004-20251117    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251117    gcc-12.5.0
csky                  randconfig-002-20251117    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251118    clang-16
hexagon               randconfig-002-20251118    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251118    clang-20
i386        buildonly-randconfig-002-20251118    clang-20
i386        buildonly-randconfig-003-20251118    clang-20
i386        buildonly-randconfig-004-20251118    clang-20
i386        buildonly-randconfig-005-20251118    gcc-13
i386        buildonly-randconfig-006-20251118    clang-20
i386                                defconfig    clang-20
i386                  randconfig-003-20251118    gcc-14
i386                  randconfig-004-20251118    gcc-14
i386                  randconfig-011-20251118    gcc-14
i386                  randconfig-012-20251118    gcc-12
i386                  randconfig-013-20251118    clang-20
i386                  randconfig-014-20251118    gcc-14
i386                  randconfig-015-20251118    gcc-14
i386                  randconfig-016-20251118    gcc-14
i386                  randconfig-017-20251118    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251118    gcc-15.1.0
loongarch             randconfig-002-20251118    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251118    gcc-11.5.0
nios2                 randconfig-002-20251118    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251118    gcc-14.3.0
parisc                randconfig-002-20251118    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251118    clang-22
powerpc               randconfig-002-20251118    clang-22
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251118    gcc-13.4.0
powerpc64             randconfig-002-20251118    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251117    gcc-12.5.0
riscv                 randconfig-002-20251117    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251117    gcc-14.3.0
s390                  randconfig-002-20251117    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251117    gcc-15.1.0
sh                    randconfig-002-20251117    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251118    gcc-8.5.0
sparc                 randconfig-002-20251118    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251118    clang-22
sparc64               randconfig-002-20251118    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251118    clang-22
um                    randconfig-002-20251118    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251118    clang-20
x86_64      buildonly-randconfig-002-20251118    gcc-14
x86_64      buildonly-randconfig-003-20251118    clang-20
x86_64      buildonly-randconfig-004-20251118    clang-20
x86_64      buildonly-randconfig-005-20251118    clang-20
x86_64      buildonly-randconfig-006-20251118    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251118    clang-20
x86_64                randconfig-002-20251118    gcc-12
x86_64                randconfig-003-20251118    gcc-14
x86_64                randconfig-004-20251118    gcc-14
x86_64                randconfig-005-20251118    clang-20
x86_64                randconfig-006-20251118    clang-20
x86_64                randconfig-071-20251118    gcc-13
x86_64                randconfig-072-20251118    clang-20
x86_64                randconfig-073-20251118    gcc-14
x86_64                randconfig-074-20251118    gcc-13
x86_64                randconfig-075-20251118    gcc-14
x86_64                randconfig-076-20251118    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251118    gcc-9.5.0
xtensa                randconfig-002-20251118    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

