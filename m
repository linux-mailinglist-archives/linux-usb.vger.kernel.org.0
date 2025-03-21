Return-Path: <linux-usb+bounces-21995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEAA6BCB8
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 15:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1E3A3AE349
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C3419938D;
	Fri, 21 Mar 2025 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXy5VLEJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871B191F77
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566562; cv=none; b=KGSBkPh9w4O0XLooowVMnKPiunBb7Qq9nUrJKE/w9C0VgtZiR9gDfP011AD4+DJMQh/JLj4ayWdvnqgymqjnJXI4zKN9jHeunQ6YZQRRzhUPqov3MBAQYVFYCGIg1gQL45c8c77ntPGJq9ag12jbzHscL96TwL4oMioVUQqJHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566562; c=relaxed/simple;
	bh=xDw6J3qBISrCbhJMbEcTavGZ99WnukIqo2N+OqvG+Bs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QQqVeLOjh98Sbm7DHIqUx3Iw5gazwnhnRwhQ1Egy6QqMK96O/OIXkUdYoTLq9vGP0QlsgwPDT7Dytx7xyG5HT5BvTW4d2RkE9INkmIC3r53H12V8EWBjU9tKz1m5TA+PwphSzUvKiFG5pT1eLxIYcTf5NR3SH6FUw+X0oovpoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXy5VLEJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742566561; x=1774102561;
  h=date:from:to:cc:subject:message-id;
  bh=xDw6J3qBISrCbhJMbEcTavGZ99WnukIqo2N+OqvG+Bs=;
  b=CXy5VLEJymqbgW43zb7hOGuLup7RKoEC1uVvPo2a86rndVeUC4U9XSSP
   tsCP22uMrlTjo/tpTIyTUVGGgn1RAU5jHM9JC31F1nYxpx+wCsmbjGt9+
   voJFgVAGoTsfsHU/zziaDjhiI2L6JiirN/jFrEXWyMuPDfo4C8HTv9Jge
   RctYKdnUypb6srANzphq0hliEjYcmGJAF6Ayp2fPaqaNXKbIqZXllxb4/
   gdVma8LNmq9cmBnlAni/XOJFUCeJjHXjzkhIcYVuIyqTY6p/eOTqXk9VB
   giUqxGoIK95VbPUyAfpngSh+u3CdgDd3H0W/lpD0ZjD4+l6UpC84kylsA
   g==;
X-CSE-ConnectionGUID: GPpXmRjZQQ6p9OwKIUePaw==
X-CSE-MsgGUID: +qZCMh7VTeuL4yZCYgFyig==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43075789"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43075789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 07:15:50 -0700
X-CSE-ConnectionGUID: Cxhmb5xnSGyoDhq8vT8ueQ==
X-CSE-MsgGUID: H0sHdJtpRtKaNoh4FYu0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123212335"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 07:15:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvd9l-0001NJ-2d;
	Fri, 21 Mar 2025 14:15:42 +0000
Date: Fri, 21 Mar 2025 22:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 434da42d7173bf097e9fab78ff97d51e8b74170d
Message-ID: <202503212211.Pj77roY1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 434da42d7173bf097e9fab78ff97d51e8b74170d  Merge tag 'thunderbolt-for-v6.15-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 1449m

configs tested: 155
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250321    gcc-13.3.0
arc                   randconfig-002-20250321    gcc-11.5.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                          collie_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                        multi_v7_defconfig    gcc-14.2.0
arm                   randconfig-001-20250321    clang-19
arm                   randconfig-002-20250321    gcc-9.3.0
arm                   randconfig-003-20250321    gcc-5.5.0
arm                   randconfig-004-20250321    clang-21
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250321    gcc-5.5.0
arm64                 randconfig-002-20250321    gcc-5.5.0
arm64                 randconfig-003-20250321    clang-20
arm64                 randconfig-004-20250321    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250321    gcc-13.3.0
csky                  randconfig-002-20250321    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250321    clang-21
hexagon               randconfig-002-20250321    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-001-20250321    clang-20
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-002-20250321    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-003-20250321    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-004-20250321    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-005-20250321    clang-20
i386        buildonly-randconfig-006-20250320    clang-20
i386        buildonly-randconfig-006-20250321    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250321    gcc-14.2.0
loongarch             randconfig-002-20250321    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
mips                            gpr_defconfig    clang-18
mips                           ip30_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250321    gcc-13.3.0
nios2                 randconfig-002-20250321    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250321    gcc-8.5.0
parisc                randconfig-002-20250321    gcc-6.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250321    clang-21
powerpc               randconfig-002-20250321    gcc-7.5.0
powerpc               randconfig-003-20250321    gcc-7.5.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250321    gcc-5.5.0
powerpc64             randconfig-002-20250321    clang-16
powerpc64             randconfig-003-20250321    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250321    clang-21
riscv                 randconfig-002-20250321    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250321    clang-16
s390                  randconfig-002-20250321    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250321    gcc-7.5.0
sh                    randconfig-002-20250321    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250321    gcc-12.4.0
sparc                 randconfig-002-20250321    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250321    gcc-10.5.0
sparc64               randconfig-002-20250321    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250321    gcc-12
um                    randconfig-002-20250321    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-001-20250321    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-002-20250321    clang-20
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-003-20250321    gcc-12
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-004-20250321    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-005-20250321    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64      buildonly-randconfig-006-20250321    clang-20
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250321    gcc-6.5.0
xtensa                randconfig-002-20250321    gcc-10.5.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

