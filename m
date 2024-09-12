Return-Path: <linux-usb+bounces-14997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D776976885
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B1D1F23A1F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2BD19F10C;
	Thu, 12 Sep 2024 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHHVBWyU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5118BBB0
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142517; cv=none; b=mOFY8T3JZdQxCXVbCtkNaIfStn+Y3s1QSnUp4V07QcMWFLbPWBsgOriinA1GFi1JrsbPW3YAds/9Il1c5iQhLGbvtC01D71aWiz8fnuYgo8cOKGCUk1CKizOj97GJS2NwU4fvFTXtJkPJDGklWgyqEi7J6QhI+fvX+DsP3Gquzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142517; c=relaxed/simple;
	bh=zN9SgmOjskbkWJ5bdjdgif8fK5/Bbd9cmrzh8BqnrHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GVvmcObNd9oZlnjb/O2TKe/yrxOdJGTnQ6KUvQC0BOGLZKjJGAf2iOGOKdfCptZmQarAK4BvBfcC+ZFGYbJVRxdQ3QiXh3Oxej+z5WQO/ZGpwyP4ZFSro04g8H9vgBvJY36OFldfYj77sOY+JAXhyX4mKsYa5tQo2qWd6gktKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHHVBWyU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142516; x=1757678516;
  h=date:from:to:cc:subject:message-id;
  bh=zN9SgmOjskbkWJ5bdjdgif8fK5/Bbd9cmrzh8BqnrHU=;
  b=FHHVBWyUJxQxSDvfk/C/gJ2HOTfdGn9dlgn+8CuYNH+8n5SUiKf3qlj/
   AakmWATz7mcFehg5+DglAfONAykz1MWMyEzhhfUReFZfwiHtgCyHOFn8a
   QgESTiR3SuGuob0o47cciSNXd4KjZGO6VzPPeBwQ1RkFaTThKXLfgXGSI
   RsoXX/+jYJdqDFfLPJhLmNgcO5vP/uY2OQsvCZ/tu/bufKDKyCLdBqKKy
   MHn3FJVTaqDTJ9KgNLbzr7x7EMgYGUEaCfdXSjj+KXEy/5ffdsVgVT5jl
   H7+h6t9yJsOWE43XjrcTLLfeOJIKtfGkc5Pr1+IPYp8JBEESnXjZZljV1
   Q==;
X-CSE-ConnectionGUID: +Svpa9OWSuupHABzwiK1Rw==
X-CSE-MsgGUID: CIug6/5/TXSiykzty12/fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24523816"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24523816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:01:56 -0700
X-CSE-ConnectionGUID: t4zejR4lTZCniW0H0FpzqA==
X-CSE-MsgGUID: oM6VVkeMTN6H892lSqUehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="98388089"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Sep 2024 05:01:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soiWG-00056w-0Y;
	Thu, 12 Sep 2024 12:01:52 +0000
Date: Thu, 12 Sep 2024 20:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e5fa8db0be3e8757e8641600c518425a4589b85c
Message-ID: <202409122035.aC5edF5b-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e5fa8db0be3e8757e8641600c518425a4589b85c  usb: xhci: fix loss of data on Cadence xHC

elapsed time: 1207m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                   randconfig-001-20240912    gcc-13.2.0
arc                   randconfig-002-20240912    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                          pxa910_defconfig    gcc-14.1.0
arm                   randconfig-001-20240912    gcc-13.2.0
arm                   randconfig-002-20240912    gcc-13.2.0
arm                   randconfig-003-20240912    gcc-13.2.0
arm                   randconfig-004-20240912    gcc-13.2.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240912    gcc-13.2.0
arm64                 randconfig-002-20240912    gcc-13.2.0
arm64                 randconfig-003-20240912    gcc-13.2.0
arm64                 randconfig-004-20240912    gcc-13.2.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240912    gcc-13.2.0
csky                  randconfig-002-20240912    gcc-13.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20240912    gcc-13.2.0
hexagon               randconfig-002-20240912    gcc-13.2.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240912    gcc-12
i386        buildonly-randconfig-002-20240912    gcc-12
i386        buildonly-randconfig-003-20240912    gcc-12
i386        buildonly-randconfig-004-20240912    gcc-12
i386        buildonly-randconfig-005-20240912    gcc-12
i386        buildonly-randconfig-006-20240912    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240912    gcc-12
i386                  randconfig-002-20240912    gcc-12
i386                  randconfig-003-20240912    gcc-12
i386                  randconfig-004-20240912    gcc-12
i386                  randconfig-005-20240912    gcc-12
i386                  randconfig-006-20240912    gcc-12
i386                  randconfig-011-20240912    gcc-12
i386                  randconfig-012-20240912    gcc-12
i386                  randconfig-013-20240912    gcc-12
i386                  randconfig-014-20240912    gcc-12
i386                  randconfig-015-20240912    gcc-12
i386                  randconfig-016-20240912    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240912    gcc-13.2.0
loongarch             randconfig-002-20240912    gcc-13.2.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                       lemote2f_defconfig    gcc-14.1.0
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240912    gcc-13.2.0
nios2                 randconfig-002-20240912    gcc-13.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240912    gcc-13.2.0
parisc                randconfig-002-20240912    gcc-13.2.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240912    gcc-13.2.0
powerpc               randconfig-002-20240912    gcc-13.2.0
powerpc               randconfig-003-20240912    gcc-13.2.0
powerpc                        warp_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240912    gcc-13.2.0
powerpc64             randconfig-002-20240912    gcc-13.2.0
powerpc64             randconfig-003-20240912    gcc-13.2.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240912    gcc-13.2.0
riscv                 randconfig-002-20240912    gcc-13.2.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240912    gcc-13.2.0
s390                  randconfig-002-20240912    gcc-13.2.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20240912    gcc-13.2.0
sh                    randconfig-002-20240912    gcc-13.2.0
sh                           se7619_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240912    gcc-13.2.0
sparc64               randconfig-002-20240912    gcc-13.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240912    gcc-13.2.0
um                    randconfig-002-20240912    gcc-13.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240912    clang-18
x86_64      buildonly-randconfig-002-20240912    clang-18
x86_64      buildonly-randconfig-003-20240912    clang-18
x86_64      buildonly-randconfig-004-20240912    clang-18
x86_64      buildonly-randconfig-005-20240912    clang-18
x86_64      buildonly-randconfig-006-20240912    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240912    clang-18
x86_64                randconfig-002-20240912    clang-18
x86_64                randconfig-003-20240912    clang-18
x86_64                randconfig-004-20240912    clang-18
x86_64                randconfig-005-20240912    clang-18
x86_64                randconfig-006-20240912    clang-18
x86_64                randconfig-011-20240912    clang-18
x86_64                randconfig-012-20240912    clang-18
x86_64                randconfig-013-20240912    clang-18
x86_64                randconfig-014-20240912    clang-18
x86_64                randconfig-015-20240912    clang-18
x86_64                randconfig-016-20240912    clang-18
x86_64                randconfig-071-20240912    clang-18
x86_64                randconfig-072-20240912    clang-18
x86_64                randconfig-073-20240912    clang-18
x86_64                randconfig-074-20240912    clang-18
x86_64                randconfig-075-20240912    clang-18
x86_64                randconfig-076-20240912    clang-18
x86_64                          rhel-8.3-rust    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240912    gcc-13.2.0
xtensa                randconfig-002-20240912    gcc-13.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

