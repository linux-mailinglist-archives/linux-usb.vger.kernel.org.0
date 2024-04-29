Return-Path: <linux-usb+bounces-9920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04068B6327
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A81A4281AE9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 20:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F83D140383;
	Mon, 29 Apr 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GC7M8bI0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C013F432
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421164; cv=none; b=FQiXif1eFWKpTuZq0kQoYCLSyXtmdGHtdPclXFeah9A9u3Kxp0UpgfVI6D0bLCZsr5wvzXH3mcmCBVhNqviX9wX8Ug6PqjQNMnHTQE2huSN/5u0Rp0QmtpwDMFk2XpbfcRzmp3L2Jvonzg467aAKqEn2l3Jusv9++BlUd/uaA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421164; c=relaxed/simple;
	bh=9q7Vt+AtaSfA+O0Dnb6LprgFBNPddEuj3wXjXobMPFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VMbY3Xhvyc2Mu3W1bdGyuPc7bT6x60xg7IuVj0AeJVAhQoq4skLk4oO8pA62AqdmgXb8PsichgcPgUD9UVxHiMWj4/ov4/kcqQNueYaguxPn4pjVsn8IBsPf1VnXVYzIP+dZlx449sZ3KY3rfrwGdNLGLW1s3/etf1nZFoFBnVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GC7M8bI0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714421161; x=1745957161;
  h=date:from:to:cc:subject:message-id;
  bh=9q7Vt+AtaSfA+O0Dnb6LprgFBNPddEuj3wXjXobMPFA=;
  b=GC7M8bI0ZeQsmIxmHfBr3RlGly6jA+jL8oIm6w00KFpWYyTSJICoAJlJ
   fPsiT5spVQ+zalwjvXixCnn9d7qlR5jnm/2Y6dZ3vxuTs7GS/mNE5BBUC
   8TkZouprIvW60mcfpY64zUKn+1jfd8T/ntk4Es1Qt2zzyZkb9nYX52o+o
   Pn5pTZt0kkDM4gDdRkIvWu9Zu40EYk0DoT3hW9HT1WJGfY3F64198DpwI
   bpB5g44uTpG/Y+Nl3U7NSKvZ+hrF0vhZPGD1j2pr+r3fR39AgVCS5Fe0o
   WfeXBClD26CiMJ57JqKPk3pASD7Lqe4fvn1S2Jg6GMupggFrawZZ5ztPC
   w==;
X-CSE-ConnectionGUID: 6ISmVDrgRIyiGJ3Q6O45Rw==
X-CSE-MsgGUID: 8pOzoQgAQaihEMDPoZm1BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="32605294"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="32605294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 13:06:01 -0700
X-CSE-ConnectionGUID: G6oi/6vtSqqGcvsUtZ7+ng==
X-CSE-MsgGUID: ACN13M7eSAaES0+sqBI0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26202392"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2024 13:05:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1XG8-0007PD-0j;
	Mon, 29 Apr 2024 20:05:56 +0000
Date: Tue, 30 Apr 2024 04:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 a3dc6d82de9bd88871dbc4ac511409e69ecacbfb
Message-ID: <202404300451.2tLUddhS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: a3dc6d82de9bd88871dbc4ac511409e69ecacbfb  thunderbolt: Correct trace output of firmware connection manager packets

elapsed time: 873m

configs tested: 189
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240429   gcc  
arc                   randconfig-002-20240429   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240429   clang
arm                   randconfig-002-20240429   clang
arm                   randconfig-003-20240429   clang
arm                   randconfig-004-20240429   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240429   clang
arm64                 randconfig-002-20240429   gcc  
arm64                 randconfig-003-20240429   clang
arm64                 randconfig-004-20240429   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240429   gcc  
csky                  randconfig-002-20240429   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240429   clang
hexagon               randconfig-002-20240429   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240429   clang
i386         buildonly-randconfig-002-20240429   clang
i386         buildonly-randconfig-003-20240429   gcc  
i386         buildonly-randconfig-004-20240429   clang
i386         buildonly-randconfig-005-20240429   gcc  
i386         buildonly-randconfig-006-20240429   clang
i386                                defconfig   clang
i386                  randconfig-001-20240429   clang
i386                  randconfig-002-20240429   clang
i386                  randconfig-003-20240429   clang
i386                  randconfig-004-20240429   clang
i386                  randconfig-005-20240429   gcc  
i386                  randconfig-006-20240429   clang
i386                  randconfig-011-20240429   gcc  
i386                  randconfig-012-20240429   gcc  
i386                  randconfig-013-20240429   clang
i386                  randconfig-014-20240429   gcc  
i386                  randconfig-015-20240429   clang
i386                  randconfig-016-20240429   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240429   gcc  
loongarch             randconfig-002-20240429   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240429   gcc  
nios2                 randconfig-002-20240429   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240429   gcc  
parisc                randconfig-002-20240429   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240429   gcc  
powerpc               randconfig-002-20240429   gcc  
powerpc               randconfig-003-20240429   gcc  
powerpc                      tqm8xx_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240429   clang
powerpc64             randconfig-002-20240429   clang
powerpc64             randconfig-003-20240429   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240429   gcc  
riscv                 randconfig-002-20240429   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240429   gcc  
s390                  randconfig-002-20240429   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240429   gcc  
sh                    randconfig-002-20240429   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240429   gcc  
sparc64               randconfig-002-20240429   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240429   gcc  
um                    randconfig-002-20240429   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240429   clang
x86_64       buildonly-randconfig-002-20240429   gcc  
x86_64       buildonly-randconfig-003-20240429   clang
x86_64       buildonly-randconfig-004-20240429   gcc  
x86_64       buildonly-randconfig-005-20240429   clang
x86_64       buildonly-randconfig-006-20240429   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240429   clang
x86_64                randconfig-002-20240429   gcc  
x86_64                randconfig-003-20240429   clang
x86_64                randconfig-004-20240429   gcc  
x86_64                randconfig-005-20240429   clang
x86_64                randconfig-006-20240429   gcc  
x86_64                randconfig-011-20240429   gcc  
x86_64                randconfig-012-20240429   gcc  
x86_64                randconfig-013-20240429   gcc  
x86_64                randconfig-014-20240429   clang
x86_64                randconfig-015-20240429   clang
x86_64                randconfig-016-20240429   gcc  
x86_64                randconfig-071-20240429   clang
x86_64                randconfig-072-20240429   clang
x86_64                randconfig-073-20240429   gcc  
x86_64                randconfig-074-20240429   gcc  
x86_64                randconfig-075-20240429   clang
x86_64                randconfig-076-20240429   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240429   gcc  
xtensa                randconfig-002-20240429   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

