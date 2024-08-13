Return-Path: <linux-usb+bounces-13343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4E95001A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 10:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486D41F238B5
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD5517BB2F;
	Tue, 13 Aug 2024 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpE+4zG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B733176FA4
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538479; cv=none; b=IikscxW011IfKtxV3XjRFpz7G5wBOVIIItAptBNfWbdim/8fOfAVV8KWgHRxKED/GHYwXJ9oIfJ9ymjzVXmCugtFlDVq/2Bax+RVEwam42hTR+wLJgQJP6L+1zbk2x6W5MbbALb8veUJw9T1463+Z4aMIHLPakAILcOhyPCB8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538479; c=relaxed/simple;
	bh=z/bYv2/FWhM2tBc71KqX9xNZ+TNodDiRNb+hwrotuKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O5pO/s1/BrZpHj6yig9+bKUalicN52duMnBkcqkgCgy594cfdCsSa1y7aew0CLDBLNGBKYwFAR0ZoBCE9qSFVXYTocdEbQuaIQMP1Ul8/+CPtXmAGOfKWfNcR4Gwb1unMqPknmDXHvsTAXRzMRtFH6QEszSpTNsgvnimI46E2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpE+4zG+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723538477; x=1755074477;
  h=date:from:to:cc:subject:message-id;
  bh=z/bYv2/FWhM2tBc71KqX9xNZ+TNodDiRNb+hwrotuKg=;
  b=dpE+4zG+ezlAPJz9U4gfzwLd1wbXDSIqVi2qat3jhj2tD7ZClr5GldkH
   p0Eslr0RMQO3/bWofZcKmxmsw6U59vQ4g3zLPLMvfgWVhxoCoa82cbEns
   SEg7Wn90uMf8/kdo7G7St1rjo41GK+3DaWs7gdQZqIgYYHa5kflQPCZ2X
   dA0lIomhLalCgH3KZSEbWgETkK651D4bnzIz70msGQRQv+sD4OM3+76vq
   AWay+XDngqFjYAVhrI8evpBbmt7BxPLV0x/fmbmwRAsuh29iaJYu9yEat
   dCwdYdee9ADfQ+nn5UhC0rUasALIn6oiLmvXqdCa7eEIRgT47JbM8eL44
   g==;
X-CSE-ConnectionGUID: 6E2we6c0TLWdT1qSdKRzxw==
X-CSE-MsgGUID: L+JsfU3pSlCGGzBys2dFNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33069283"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="33069283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 01:41:16 -0700
X-CSE-ConnectionGUID: f/igeTBgR56cf7I9VmGmhw==
X-CSE-MsgGUID: l5AKzKfQT0GxsrHn/eurZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="59164171"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2024 01:41:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdn5d-0000IU-1q;
	Tue, 13 Aug 2024 08:41:13 +0000
Date: Tue, 13 Aug 2024 16:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 38343be0bf9a7d7ef0d160da5f2db887a0e29b62
Message-ID: <202408131655.XVvQxWEN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 38343be0bf9a7d7ef0d160da5f2db887a0e29b62  Merge 6.11-rc3 into usb-next

elapsed time: 884m

configs tested: 156
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                       aspeed_g4_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      integrator_defconfig   clang-20
arm                        neponset_defconfig   clang-20
arm                           sama5_defconfig   gcc-14.1.0
arm                        shmobile_defconfig   clang-20
arm                         socfpga_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          alldefconfig   clang-20
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240813   gcc-12
i386         buildonly-randconfig-002-20240813   gcc-12
i386         buildonly-randconfig-003-20240813   gcc-12
i386         buildonly-randconfig-004-20240813   gcc-12
i386         buildonly-randconfig-005-20240813   gcc-12
i386         buildonly-randconfig-006-20240813   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240813   gcc-12
i386                  randconfig-002-20240813   gcc-12
i386                  randconfig-003-20240813   gcc-12
i386                  randconfig-004-20240813   gcc-12
i386                  randconfig-005-20240813   gcc-12
i386                  randconfig-006-20240813   gcc-12
i386                  randconfig-011-20240813   gcc-12
i386                  randconfig-012-20240813   gcc-12
i386                  randconfig-013-20240813   gcc-12
i386                  randconfig-014-20240813   gcc-12
i386                  randconfig-015-20240813   gcc-12
i386                  randconfig-016-20240813   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                           gcw0_defconfig   clang-20
mips                           gcw0_defconfig   gcc-14.1.0
mips                        qi_lb60_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      cm5200_defconfig   clang-20
powerpc                   currituck_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                     ksi8560_defconfig   gcc-14.1.0
powerpc                     powernv_defconfig   clang-20
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          rsk7203_defconfig   gcc-14.1.0
sh                           se7724_defconfig   gcc-14.1.0
sh                   secureedge5410_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240813   clang-18
x86_64       buildonly-randconfig-002-20240813   clang-18
x86_64       buildonly-randconfig-003-20240813   clang-18
x86_64       buildonly-randconfig-004-20240813   clang-18
x86_64       buildonly-randconfig-005-20240813   clang-18
x86_64       buildonly-randconfig-006-20240813   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240813   clang-18
x86_64                randconfig-002-20240813   clang-18
x86_64                randconfig-003-20240813   clang-18
x86_64                randconfig-004-20240813   clang-18
x86_64                randconfig-005-20240813   clang-18
x86_64                randconfig-006-20240813   clang-18
x86_64                randconfig-011-20240813   clang-18
x86_64                randconfig-012-20240813   clang-18
x86_64                randconfig-013-20240813   clang-18
x86_64                randconfig-014-20240813   clang-18
x86_64                randconfig-015-20240813   clang-18
x86_64                randconfig-016-20240813   clang-18
x86_64                randconfig-071-20240813   clang-18
x86_64                randconfig-072-20240813   clang-18
x86_64                randconfig-073-20240813   clang-18
x86_64                randconfig-074-20240813   clang-18
x86_64                randconfig-075-20240813   clang-18
x86_64                randconfig-076-20240813   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                           alldefconfig   gcc-14.1.0
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

