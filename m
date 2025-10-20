Return-Path: <linux-usb+bounces-29471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688FBF32DD
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 21:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDA6B4F9B2D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 19:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468D22D6E6E;
	Mon, 20 Oct 2025 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxKZzs3u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73402D4B40
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987989; cv=none; b=tOBiA1R67QnxoyxJ1ifMZdav7ureThFqIL6H4KwP+HDDt4/4oyhW2198DE+PJZnvZsq0wPZaGcY9crC9U2qTDQ/9R2Lyea7F6bhdaaR9StExWmEjVw5IDJV9aJQUMaGCYbaUY6KGjvSZOgbtge5y3oH9dtwAVNLY/tKJflCoUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987989; c=relaxed/simple;
	bh=TJc05Or24XK4oVc1GKUj+H24at6HdRT15hZsE4PO+hM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=haqJ79C4IzXqkaYMnL+3buUcyBYJk5LBaToW7W58hhl/WCgqB3SKB0sDuu7mQQX7Dv3A/cFfrc5innubUJNSHOb4mKNMYPW9Pu+PTOU0qISyranjmkv1JkOBB4UZCIcNrax0X9H/94U7PmOa7wcd+6R724tAJ72G7GJ04VAMCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxKZzs3u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760987988; x=1792523988;
  h=date:from:to:cc:subject:message-id;
  bh=TJc05Or24XK4oVc1GKUj+H24at6HdRT15hZsE4PO+hM=;
  b=KxKZzs3urAu6EFvc74mAE2X7l9jPJkiq18yTx3NFTBbPDmGmsQYgO6tf
   CZjdu6HNxC8JQPfU9g4uGt0PK8w2y0GSlqyz03+RfK1hoWFLDAC4DvyQL
   7gHM2++d6MmCAIqqH9SAmJ/PPpuU8vne5K0zemmy8yLniHLa9JW6qmgDg
   kjNntjFtGe7515hvsfdFn2zmZZ6Nu5WHMpAYPqauTCYJmcqPgGsWdvuM3
   INWTkUYbGjMkUwYR5MGNPhjXjS7XxHIs1iYuE5avzJ26R6bjojDk58LA7
   Ev8KSu9qObKmAG7FwepwkUCQSdi0YOC+wdV4Du3Ia2fYo89o38ykDpmkm
   w==;
X-CSE-ConnectionGUID: NupJnqwqTECI+1ThU4FTPw==
X-CSE-MsgGUID: QwLtHk7ARjielsZcwIqKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50682534"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="50682534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:19:47 -0700
X-CSE-ConnectionGUID: bdUSZ+abSneH5uI9XXcQJw==
X-CSE-MsgGUID: WVUvbVTNS5SiafL1JxVo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183813498"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2025 12:19:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAvQ0-000A6X-0E;
	Mon, 20 Oct 2025 19:19:44 +0000
Date: Tue, 21 Oct 2025 03:19:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 3575254546a27210a4b661ea37fbbfb836c0815d
Message-ID: <202510210323.a9i0ZJCK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 3575254546a27210a4b661ea37fbbfb836c0815d  thunderbolt: Add support for Intel Wildcat Lake

elapsed time: 729m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251020    clang-22
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-002-20251020    clang-22
arc                   randconfig-002-20251020    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251020    clang-22
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-004-20251020    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-002-20251020    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-003-20251020    clang-22
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-004-20251020    clang-22
arm64                 randconfig-004-20251020    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-002-20251020    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-002-20251020    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-002-20251020    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-002-20251020    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-002-20251020    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-002-20251020    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-002-20251020    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-002-20251020    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-002-20251020    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251020    clang-20
x86_64                randconfig-002-20251020    clang-20
x86_64                randconfig-003-20251020    clang-20
x86_64                randconfig-004-20251020    clang-20
x86_64                randconfig-005-20251020    clang-20
x86_64                randconfig-006-20251020    clang-20
x86_64                randconfig-007-20251020    clang-20
x86_64                randconfig-008-20251020    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

