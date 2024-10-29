Return-Path: <linux-usb+bounces-16835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F59B5238
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 19:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B271F2399D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 18:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF0F205E01;
	Tue, 29 Oct 2024 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQYwahRp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC3205ADF
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730228190; cv=none; b=b3ihnM2i0/iuozF5mqbz+Cvj658b1VYQWPXvMkmY0N6iZVnvc/5u4bxFju04EKmlCTBKXx5W3k1hNdXCFh/4VPBvSqLc8X0T5kgQvLQ6h60C5mvD0UKzuG6jOJVdJjgUjeY2BhQGsdpeE8cyHsNO/8z26X2b9iZPLk8YjRl+D0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730228190; c=relaxed/simple;
	bh=giS0lD2NsaJ/9ASkTPyVjhxXZlWoGL/oyi84Wt08LZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KfEwsrEVS3t44EHCVQkgyp9xL8sAFiBDNs00DjLz8BE/w44OxkJ+3CVW5NYBEZhA7V9pHcAwWQnZ46ILPinAPshPnFR88Sa9ge458+WqP+6pLFtJffjrJkbFA73QTB98rDCnres7bUgSFmAR0N6DCpQDTA4TzykEubMAmQrZWNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQYwahRp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730228188; x=1761764188;
  h=date:from:to:cc:subject:message-id;
  bh=giS0lD2NsaJ/9ASkTPyVjhxXZlWoGL/oyi84Wt08LZs=;
  b=LQYwahRp0xl3BEHledapiY8zcvjqOmFfyhj10/bqKubwTQkKOwdImdue
   /Swe0if72VheuV2XtZxMTbar1qe39tNt7VvehRAdM0qjQPDA8VErZRgu4
   IEjaKYboNVj/RTbXW4zi9hBKLeTcdIXc/g2DOV+Ro/l+nFsU/hen8m5Wg
   Fo/LUIU3pIYIiqdB5Ab2AFhWxFbpaQl3+Uw7Wy7fYS627R8024BQYBPYD
   IGfpYqWF583I30HtZdXiPbo/ci3gDKIQVToGUKlkP8es34vE0U/FbkQKF
   qF7DV/OqnaY15UdwC5P5DA/0Q8+7vNVNW9JE2PIFZ/OPFF1GnFtL5gY1Y
   w==;
X-CSE-ConnectionGUID: D61hfTI+Q0W9etFn4jnIEQ==
X-CSE-MsgGUID: aghEFfawTDe+6h50EDIn1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41294201"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="41294201"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:56:24 -0700
X-CSE-ConnectionGUID: QJ/2oATJRDaM2uXeCLCJRQ==
X-CSE-MsgGUID: cS2uAY72QACIF4nMCVMbkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86011113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2024 11:56:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rO7-000e1I-2p;
	Tue, 29 Oct 2024 18:56:19 +0000
Date: Wed, 30 Oct 2024 02:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 bf791751162ac875a9439426d13f8d4d18151549
Message-ID: <202410300226.l3sZzKa6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: bf791751162ac875a9439426d13f8d4d18151549  thunderbolt: Add only on-board retimers when !CONFIG_USB4_DEBUGFS_MARGINING

elapsed time: 735m

configs tested: 96
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                       allnoconfig    gcc-14.1.0
alpha                      allyesconfig    clang-20
alpha                         defconfig    gcc-14.1.0
arc                        allmodconfig    clang-20
arc                         allnoconfig    gcc-14.1.0
arc                        allyesconfig    clang-20
arc                           defconfig    gcc-14.1.0
arm                        allmodconfig    clang-20
arm                         allnoconfig    gcc-14.1.0
arm                        allyesconfig    clang-20
arm                           defconfig    gcc-14.1.0
arm                footbridge_defconfig    gcc-14.1.0
arm                integrator_defconfig    gcc-14.1.0
arm                  multi_v7_defconfig    gcc-14.1.0
arm                     sama7_defconfig    gcc-14.1.0
arm                 versatile_defconfig    gcc-14.1.0
arm64                      allmodconfig    clang-20
arm64                       allnoconfig    gcc-14.1.0
arm64                         defconfig    gcc-14.1.0
csky                        allnoconfig    gcc-14.1.0
csky                          defconfig    gcc-14.1.0
hexagon                    allmodconfig    clang-20
hexagon                     allnoconfig    gcc-14.1.0
hexagon                    allyesconfig    clang-20
hexagon                       defconfig    gcc-14.1.0
i386                       allmodconfig    clang-19
i386                        allnoconfig    clang-19
i386                       allyesconfig    clang-19
i386                          defconfig    clang-19
loongarch                  allmodconfig    gcc-14.1.0
loongarch                   allnoconfig    gcc-14.1.0
loongarch                     defconfig    gcc-14.1.0
m68k                       allmodconfig    gcc-14.1.0
m68k                        allnoconfig    gcc-14.1.0
m68k                       allyesconfig    gcc-14.1.0
m68k                          defconfig    gcc-14.1.0
microblaze                 allmodconfig    gcc-14.1.0
microblaze                  allnoconfig    gcc-14.1.0
microblaze                 allyesconfig    gcc-14.1.0
microblaze                    defconfig    gcc-14.1.0
mips                        allnoconfig    gcc-14.1.0
mips                  bcm47xx_defconfig    gcc-14.1.0
nios2                   10m50_defconfig    gcc-14.1.0
nios2                       allnoconfig    gcc-14.1.0
nios2                         defconfig    gcc-14.1.0
openrisc                    allnoconfig    clang-20
openrisc                   allyesconfig    gcc-14.1.0
openrisc                      defconfig    gcc-12
openrisc              or1ksim_defconfig    gcc-14.1.0
parisc                     allmodconfig    gcc-14.1.0
parisc                      allnoconfig    clang-20
parisc                     allyesconfig    gcc-14.1.0
parisc                        defconfig    gcc-12
parisc64                      defconfig    gcc-14.1.0
powerpc                    allmodconfig    gcc-14.1.0
powerpc                     allnoconfig    clang-20
powerpc                    allyesconfig    gcc-14.1.0
powerpc             lite5200b_defconfig    gcc-14.1.0
powerpc               mpc5200_defconfig    gcc-14.1.0
powerpc           mpc834x_itx_defconfig    gcc-14.1.0
riscv                      alldefconfig    gcc-14.1.0
riscv                      allmodconfig    gcc-14.1.0
riscv                       allnoconfig    clang-20
riscv                      allyesconfig    gcc-14.1.0
riscv                         defconfig    gcc-12
s390                       allmodconfig    gcc-14.1.0
s390                        allnoconfig    clang-20
s390                       allyesconfig    gcc-14.1.0
s390                          defconfig    gcc-12
sh                         allmodconfig    gcc-14.1.0
sh                          allnoconfig    gcc-14.1.0
sh                         allyesconfig    gcc-14.1.0
sh                            defconfig    gcc-12
sh          ecovec24-romimage_defconfig    gcc-14.1.0
sh             rts7751r2dplus_defconfig    gcc-14.1.0
sh                  sh7785lcr_defconfig    gcc-14.1.0
sparc                      allmodconfig    gcc-14.1.0
sparc64                       defconfig    gcc-12
um                         allmodconfig    clang-20
um                          allnoconfig    clang-20
um                         allyesconfig    clang-20
um                            defconfig    gcc-12
um                       i386_defconfig    gcc-12
um                     x86_64_defconfig    gcc-12
um                     x86_64_defconfig    gcc-14.1.0
x86_64                      allnoconfig    clang-19
x86_64                     allyesconfig    clang-19
x86_64                        defconfig    clang-19
x86_64                            kexec    clang-19
x86_64                            kexec    gcc-12
x86_64                         rhel-8.3    gcc-12
x86_64                     rhel-8.3-bpf    clang-19
x86_64                   rhel-8.3-kunit    clang-19
x86_64                     rhel-8.3-ltp    clang-19
x86_64                    rhel-8.3-rust    clang-19
xtensa                      allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

