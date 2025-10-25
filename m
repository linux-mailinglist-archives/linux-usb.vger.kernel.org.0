Return-Path: <linux-usb+bounces-29649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B786FC090E7
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 15:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9AF8E4E4240
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF182E2EEF;
	Sat, 25 Oct 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLiBQ8nC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB4726290
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761399372; cv=none; b=R08EsIpYMmzGhsA+PUFtOidvBivaZvXCeDWHJdJPl5Qt4KstX5t8cOI40xm3kzvVZPKeipEP7sSbKa3lOG12sIHepy+CLhMAeSr6D5y8H132ddR3wO+2wVbBUCWr5JRvwQkouIeUbh42mjfyn+p5yEh1xwsn0QzcBbqNa/Cg1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761399372; c=relaxed/simple;
	bh=fgUH5dN0k6PIKCelbS2sHzmkgdLQHlHzBQX9cDouOxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XwY+JG0mTPJOlqK4nYgqnQrj2K5PE1+35lJqBL7UGRabPXDrKZNvw9zz2TRe+ovrUUwEudm8dfJAMBIblnH+A724U28WV/Cc7gIsHlsuRdzrIVQ5lOQORkEQxqpEJaxgfkxfiabHCtGPVNQYErtUFl/LjAGo3xd+AzBZ0BqeyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLiBQ8nC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761399371; x=1792935371;
  h=date:from:to:cc:subject:message-id;
  bh=fgUH5dN0k6PIKCelbS2sHzmkgdLQHlHzBQX9cDouOxg=;
  b=mLiBQ8nCB3TOuX3Bme+tY6OULzurK8nGJQg4xj0CGfLJciqeBFcptGAa
   SEBgiOOl/gSJ09aEKxcyHW/RsH4knd4UIZuToW2jF220N+OCWybbvR2X6
   UTvXKJE9ZiqD6XEyl8COYKt4BD/0pXVfvQ8Wmc+gHqNxtVn+i3mXFJBpl
   /v56LqXCkUlgUOgTm7q2tYFfkUJrTgES2tvNjvjKUCkyFMshbkm0Qg2p7
   5dhUFBFdw1us6CSlQmq8fc0ybf83NKmeK+khtF0HOmhYLSDpwpML35rC4
   AM49kNLS/zBz5QebwFvsAPhXM0wRdrHElb9jTgFabZ+JIZTGxe1Y8/TnV
   g==;
X-CSE-ConnectionGUID: JFZ5dHEzR42ecZpB/3Rclw==
X-CSE-MsgGUID: D+G3/i9vQDKhgYIGhjZjMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62761077"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="62761077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 06:36:08 -0700
X-CSE-ConnectionGUID: e4UlFgx9R4SfLlNJnCLoyg==
X-CSE-MsgGUID: ix3XauVuRzaxjh0p6JIHTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="215559669"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2025 06:36:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCeRA-000FKz-2n;
	Sat, 25 Oct 2025 13:36:04 +0000
Date: Sat, 25 Oct 2025 21:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 be83d83664e9f6fa035e96fb9187f9e7898659e4
Message-ID: <202510252125.e1x9LCEr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: be83d83664e9f6fa035e96fb9187f9e7898659e4  Merge patch series "usb: typec: ucsi_glink: Add support UCSI v2"

elapsed time: 1448m

configs tested: 253
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-001-20251025    clang-22
arc                   randconfig-002-20251024    gcc-14.3.0
arc                   randconfig-002-20251025    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            hisi_defconfig    clang-22
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-001-20251025    clang-22
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-002-20251025    clang-22
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-003-20251025    clang-22
arm                   randconfig-004-20251024    clang-22
arm                   randconfig-004-20251025    clang-22
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-001-20251025    clang-22
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-002-20251025    clang-22
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-003-20251025    clang-22
arm64                 randconfig-004-20251024    clang-17
arm64                 randconfig-004-20251025    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-001-20251025    gcc-10.5.0
csky                  randconfig-002-20251024    gcc-11.5.0
csky                  randconfig-002-20251025    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-001-20251025    gcc-10.5.0
hexagon               randconfig-002-20251024    clang-22
hexagon               randconfig-002-20251025    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-001-20251025    clang-20
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-002-20251025    clang-20
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-003-20251025    clang-20
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-004-20251025    clang-20
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-005-20251025    clang-20
i386        buildonly-randconfig-006-20251024    gcc-14
i386        buildonly-randconfig-006-20251025    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251025    clang-20
i386                  randconfig-002-20251025    clang-20
i386                  randconfig-003-20251025    clang-20
i386                  randconfig-004-20251025    clang-20
i386                  randconfig-005-20251025    clang-20
i386                  randconfig-006-20251025    clang-20
i386                  randconfig-007-20251025    clang-20
i386                  randconfig-011-20251025    gcc-14
i386                  randconfig-012-20251025    gcc-14
i386                  randconfig-013-20251025    gcc-14
i386                  randconfig-014-20251025    gcc-14
i386                  randconfig-015-20251025    gcc-14
i386                  randconfig-016-20251025    gcc-14
i386                  randconfig-017-20251025    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-001-20251025    gcc-10.5.0
loongarch             randconfig-002-20251024    gcc-15.1.0
loongarch             randconfig-002-20251025    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-001-20251025    gcc-10.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
nios2                 randconfig-002-20251025    gcc-10.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-001-20251025    gcc-10.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc                randconfig-002-20251025    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-22
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-001-20251025    gcc-10.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-002-20251025    gcc-10.5.0
powerpc               randconfig-003-20251024    clang-16
powerpc               randconfig-003-20251025    gcc-10.5.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-001-20251025    gcc-10.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-002-20251025    gcc-10.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251025    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-001-20251025    clang-22
riscv                 randconfig-002-20251024    clang-22
riscv                 randconfig-002-20251025    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-001-20251025    clang-22
s390                  randconfig-002-20251024    clang-22
s390                  randconfig-002-20251025    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-001-20251025    clang-22
sh                    randconfig-002-20251024    gcc-14.3.0
sh                    randconfig-002-20251025    clang-22
sh                   sh7724_generic_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-001-20251025    clang-22
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc                 randconfig-002-20251025    clang-22
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-001-20251025    clang-22
sparc64               randconfig-002-20251024    clang-22
sparc64               randconfig-002-20251025    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251024    gcc-14
um                    randconfig-001-20251025    clang-22
um                    randconfig-002-20251024    clang-22
um                    randconfig-002-20251025    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-001-20251025    clang-20
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-002-20251025    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-003-20251025    clang-20
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-004-20251025    clang-20
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251025    clang-20
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64      buildonly-randconfig-006-20251025    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251025    clang-20
x86_64                randconfig-002-20251025    clang-20
x86_64                randconfig-003-20251025    clang-20
x86_64                randconfig-004-20251025    clang-20
x86_64                randconfig-005-20251025    clang-20
x86_64                randconfig-006-20251025    clang-20
x86_64                randconfig-007-20251025    clang-20
x86_64                randconfig-008-20251025    clang-20
x86_64                randconfig-071-20251025    clang-20
x86_64                randconfig-072-20251025    clang-20
x86_64                randconfig-073-20251025    clang-20
x86_64                randconfig-074-20251025    clang-20
x86_64                randconfig-075-20251025    clang-20
x86_64                randconfig-076-20251025    clang-20
x86_64                randconfig-077-20251025    clang-20
x86_64                randconfig-078-20251025    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-001-20251025    clang-22
xtensa                randconfig-002-20251024    gcc-13.4.0
xtensa                randconfig-002-20251025    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

