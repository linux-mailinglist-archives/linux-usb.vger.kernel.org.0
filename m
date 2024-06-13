Return-Path: <linux-usb+bounces-11279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CFA907191
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 14:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1202B1C243B7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 12:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0381514374F;
	Thu, 13 Jun 2024 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYiyAqdi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558A1DDDB
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282281; cv=none; b=XnpxFfeEQjdetRiZduLpmcNnbpPQHOFJkS4lo3rIsBrEM650ab+5ikzO4cb0nMUKwoRlURaOO5U9RS0dvTLUdGLhb5jUySgUNiv9WnnLAeuyTqXt6JSVRrYznR8cjIEz3CahsvfUVDu1x1O5mwkBegT32Z6wnxZjO+3Zjld2kVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282281; c=relaxed/simple;
	bh=qsRYsHJGm/VU+1nA/SzsOi6d58hFHuwrSD9lxsYbCzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rO0NeCdQZa+7mDt3fxw/XauE/JVD9V+zgD9Zeb9Yyxj0Kd3mfpVDzTSwv4iFf+kkfIM9J7SHip/2/52jxtgABYVqaH4YOTMfHJl5flU56L1OMcMDTsN691OifLgN7GGqRSpFDObAry6YuQ67+aoJpus7oispcjhVed6ORI1b0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYiyAqdi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718282280; x=1749818280;
  h=date:from:to:cc:subject:message-id;
  bh=qsRYsHJGm/VU+1nA/SzsOi6d58hFHuwrSD9lxsYbCzs=;
  b=fYiyAqdiBOYnk5HB/kbUo6AYWPPEKw5MF82Z/9A8q02+UzZNtDymKGJ5
   zh0gYISbMZUpbN/nMnp3gfynjclit/WJ8q1SmaX5oZGN3wxLqUTBmKh/R
   HBTAI3SPod4hcTqbr4QmYz96ydvoN5ir+wcLaPwu+wcOH5YrR2lTJB9TW
   zMx+dGRXegVc7a8BTVlHYJ367KFS2Lk571nE5J+rLeHQLLuUjdit7d7QM
   w5Vu/5Vp1ayjKB9/n8u/d72+lBW2msdnfNTv5YcoLg3oMuYLBylpOykI2
   U6ptN23gtc7UUcXenCCPVW9um5eImeRar5NvgzqrE4dJrgbCjDgf27Ehq
   Q==;
X-CSE-ConnectionGUID: lZMhO0OpTyCSKci9OP+hig==
X-CSE-MsgGUID: Sis/HgxHQJamB3V1Ssr9Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15225048"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="15225048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 05:37:59 -0700
X-CSE-ConnectionGUID: UyBQFrQKRV6GuTW2Yru/+w==
X-CSE-MsgGUID: YWKqD1ZQTJO9qxxAccPk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40060859"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2024 05:37:57 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHjiF-00001L-13;
	Thu, 13 Jun 2024 12:37:55 +0000
Date: Thu, 13 Jun 2024 20:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 5ceac4402f5d975e5a01c806438eb4e554771577
Message-ID: <202406132033.CnOOng9e-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 5ceac4402f5d975e5a01c806438eb4e554771577  xhci: Handle TD clearing for multiple streams case

elapsed time: 1721m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
i386         buildonly-randconfig-001-20240613   gcc-9
i386         buildonly-randconfig-002-20240613   clang-18
i386         buildonly-randconfig-003-20240613   clang-18
i386         buildonly-randconfig-004-20240613   clang-18
i386         buildonly-randconfig-005-20240613   gcc-7
i386         buildonly-randconfig-006-20240613   clang-18
i386                  randconfig-001-20240613   gcc-7
i386                  randconfig-002-20240613   gcc-11
i386                  randconfig-003-20240613   gcc-13
i386                  randconfig-004-20240613   clang-18
i386                  randconfig-005-20240613   gcc-13
i386                  randconfig-006-20240613   gcc-13
i386                  randconfig-011-20240613   gcc-13
i386                  randconfig-012-20240613   clang-18
i386                  randconfig-013-20240613   clang-18
i386                  randconfig-014-20240613   gcc-12
i386                  randconfig-015-20240613   gcc-8
i386                  randconfig-016-20240613   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240613   gcc-13
x86_64       buildonly-randconfig-002-20240613   gcc-9
x86_64       buildonly-randconfig-003-20240613   clang-18
x86_64       buildonly-randconfig-004-20240613   clang-18
x86_64       buildonly-randconfig-005-20240613   clang-18
x86_64       buildonly-randconfig-006-20240613   clang-18
x86_64                randconfig-001-20240613   gcc-13
x86_64                randconfig-002-20240613   clang-18
x86_64                randconfig-003-20240613   gcc-13
x86_64                randconfig-004-20240613   clang-18
x86_64                randconfig-005-20240613   clang-18
x86_64                randconfig-006-20240613   clang-18
x86_64                randconfig-011-20240613   gcc-9
x86_64                randconfig-012-20240613   clang-18
x86_64                randconfig-013-20240613   clang-18
x86_64                randconfig-014-20240613   clang-18
x86_64                randconfig-015-20240613   gcc-7
x86_64                randconfig-016-20240613   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

