Return-Path: <linux-usb+bounces-29698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BFC1148D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 20:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EC484FC9A7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Oct 2025 19:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5D92DF121;
	Mon, 27 Oct 2025 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csT9zEV9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4702DC34B
	for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594748; cv=none; b=UfJWf6pjihN26MvTYgkt4V9HFXQ+PozG7dIta6PXio/vkeIhjb4QEIIO1R1zSvLOdtwlsavryRUSPauLC4wdVOo0qQe5e3NboqT6w5OfFA8H5+td45J+YeKg4rbEpxtaS3HjIGYTbW3PKLemntKP7I48uvT+tVDrhMPSH9zOEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594748; c=relaxed/simple;
	bh=z6K/L2VIcheseez3gR4iAtIFF0Y0o9eavLxPdyHLQcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TUjvZxSNvjdavlDfBDx72+zBZDWA1zLpo2S71qMCDbZE+Fgg11xHp6YLLq3/p8Bq9C6H94G2xzc08FGeBq1rTmowdD+6QAfMmrxUFxLBC9T7T96Mwfzn5IXtxH6zBOefN184GoqdyzLW0YK0yAmv6Z3o7RAeYL2IgCHaFZ5PW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csT9zEV9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761594747; x=1793130747;
  h=date:from:to:cc:subject:message-id;
  bh=z6K/L2VIcheseez3gR4iAtIFF0Y0o9eavLxPdyHLQcI=;
  b=csT9zEV98NMMqd9nv5zGJb5oEBEMRA/TghJerOgPCWMeGaY083IpglD9
   kibULXZg+N6jK5PwJG/67a1exmQiy1YhxlGVMajR+jUdEPd3kwKgZSSLk
   Qll6Ick9SwIwlv9G0iLyOC2d6SJX1kUB/bjA6C9+JG+VP8uUJx5iD7Xxe
   uAgmVjnyD1eFXwGNTQHUXbUC/uONHKXtNU2Xn80cT4iTJivaGdX4hLfiG
   WrFfW6ZP6trotzgCe7tfyTT1qXYl86kCUMElEnqmxaQjijpmqvGdDPfIQ
   8ER1G6jBuUcfTau5yckml8WrTjwOT5llMmFqHKg5pQ4a/H1kCM4awzFv2
   Q==;
X-CSE-ConnectionGUID: qoj7EeIpQreOYWPIn6oxjw==
X-CSE-MsgGUID: fOoKpmC1Tx+CloOAa47xYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63592927"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63592927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:52:26 -0700
X-CSE-ConnectionGUID: lYh8lMmiSNi7XL3epU+THw==
X-CSE-MsgGUID: ZPWKijptS6WZxXfEkQBhQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185225014"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2025 12:52:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDTGR-000IQ3-0H;
	Mon, 27 Oct 2025 19:52:23 +0000
Date: Tue, 28 Oct 2025 03:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d518ec2cbcac1c1175563a115f5024eeb6b4cd8d
Message-ID: <202510280300.T1HOvtWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d518ec2cbcac1c1175563a115f5024eeb6b4cd8d  Merge 6.18-rc3 into usb-next

elapsed time: 727m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251027    gcc-8.5.0
arc                   randconfig-002-20251027    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-22
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20251027    clang-22
arm                   randconfig-002-20251027    clang-22
arm                   randconfig-003-20251027    gcc-8.5.0
arm                   randconfig-004-20251027    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251027    clang-22
arm64                 randconfig-002-20251027    gcc-12.5.0
arm64                 randconfig-003-20251027    gcc-9.5.0
arm64                 randconfig-004-20251027    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251027    gcc-14.3.0
csky                  randconfig-002-20251027    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251027    clang-22
hexagon               randconfig-002-20251027    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251027    gcc-15.1.0
loongarch             randconfig-002-20251027    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251027    gcc-8.5.0
nios2                 randconfig-002-20251027    gcc-8.5.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251027    gcc-8.5.0
parisc                randconfig-002-20251027    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                   currituck_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251027    clang-22
powerpc               randconfig-002-20251027    clang-22
powerpc               randconfig-003-20251027    gcc-8.5.0
powerpc64             randconfig-001-20251027    gcc-8.5.0
powerpc64             randconfig-002-20251027    gcc-10.5.0
powerpc64             randconfig-003-20251027    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251027    gcc-13.4.0
riscv                 randconfig-002-20251027    clang-22
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251027    clang-22
s390                  randconfig-002-20251027    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251027    gcc-12.5.0
sh                    randconfig-002-20251027    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251027    gcc-12.5.0
sparc                 randconfig-002-20251027    gcc-8.5.0
sparc64               randconfig-001-20251027    gcc-14.3.0
sparc64               randconfig-002-20251027    gcc-15.1.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                    randconfig-001-20251027    clang-22
um                    randconfig-002-20251027    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251027    gcc-14
x86_64      buildonly-randconfig-002-20251027    gcc-14
x86_64      buildonly-randconfig-003-20251027    gcc-14
x86_64      buildonly-randconfig-004-20251027    gcc-14
x86_64      buildonly-randconfig-005-20251027    gcc-14
x86_64      buildonly-randconfig-006-20251027    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251027    gcc-12.5.0
xtensa                randconfig-002-20251027    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

