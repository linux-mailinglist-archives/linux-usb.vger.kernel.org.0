Return-Path: <linux-usb+bounces-16202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1399DAAE
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 02:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828EA282A77
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 00:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BCDF9E4;
	Tue, 15 Oct 2024 00:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9lNuW8Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A08F77
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 00:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728952160; cv=none; b=c28i3+s6hgsBzDcAo+e41lWtYagy/voSk6POHnq8RaLzhJi2/rsvmZkAn7sTt9q4l9Mn7a6ppVh3PvqE3Hek4NrA8YZki+Upk2w6GlhJevyZmReXOWYFjEfzDLLmZbDjhv6hCkQb3dnEbDokeuQ8pthIHtStp0WXtdxj/wDrL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728952160; c=relaxed/simple;
	bh=+wiY0+2xW72mHuVqlAkisJiTEfXT910aj9No9aKtL9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8uHCSUbrROT7TcmGP9RfcqWIM3y5clrJUHAjBtOyqfIvx5emcn8/Jv4J68e8FBDOgvd6obBG7CdbQczMHiMzmqOByj0ZnnKeeIkRnIqJCGoxkGmaDlbDsGCJjS2Yb21fdrkS5bXeDIio29aqmFBKt0j9cVyjdBMlIzc3vUz9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9lNuW8Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728952158; x=1760488158;
  h=date:from:to:cc:subject:message-id;
  bh=+wiY0+2xW72mHuVqlAkisJiTEfXT910aj9No9aKtL9U=;
  b=J9lNuW8YhVXyZtbdpA/cqPSO1EZhfciPvvjUSM5v2rFoIFNGZFSUTu9U
   zPFrBDhAT+u3aC9iivNlzTOTjg5FdbajM+dGqqcUtn/I7/PvpYPgaa2l5
   7KX3szihCX+oTEf7XgBM9v2CxKywxZe57gzGZWCXUbwk5x5jFDlmHr7U7
   4l6wH641Mj32lC+JXr3IrMhud7eTXhaezHaqRWq1oCzwOP2LM6dEHFVhP
   VpE8io+xWT6XcJpY9cOYwtPyW84YnnxWaB9hTJT3pUgHSm9NGAKXyfTYv
   asOC6Eylj77179+lLZ0KsDXxS1kgEwyyYXPWTX9qdiXANTddvwjZ/9l/I
   w==;
X-CSE-ConnectionGUID: hEQKkZO5QqOJCzWdN03W9A==
X-CSE-MsgGUID: ioH4J3zZT3SUk3xQMuu8EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32242817"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32242817"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:29:17 -0700
X-CSE-ConnectionGUID: hrpB+FhESVGkmOYOcwwOhw==
X-CSE-MsgGUID: bB3n3UiTRw6sAgSCDG8oUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82757054"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Oct 2024 17:29:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0VR4-000HNF-0Z;
	Tue, 15 Oct 2024 00:29:14 +0000
Date: Tue, 15 Oct 2024 08:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 64f3b5a6bc49adf77d58eddd72a4bfccd492fa24
Message-ID: <202410150815.Jw8XUqf5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 64f3b5a6bc49adf77d58eddd72a4bfccd492fa24  Merge 6.12-rc3 into usb-next

elapsed time: 1096m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241015    clang-18
i386        buildonly-randconfig-002-20241015    clang-18
i386        buildonly-randconfig-003-20241015    clang-18
i386        buildonly-randconfig-004-20241015    clang-18
i386        buildonly-randconfig-005-20241015    clang-18
i386        buildonly-randconfig-006-20241015    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241015    clang-18
i386                  randconfig-002-20241015    clang-18
i386                  randconfig-003-20241015    clang-18
i386                  randconfig-004-20241015    clang-18
i386                  randconfig-005-20241015    clang-18
i386                  randconfig-006-20241015    clang-18
i386                  randconfig-011-20241015    clang-18
i386                  randconfig-012-20241015    clang-18
i386                  randconfig-013-20241015    clang-18
i386                  randconfig-014-20241015    clang-18
i386                  randconfig-015-20241015    clang-18
i386                  randconfig-016-20241015    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          sdk7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

