Return-Path: <linux-usb+bounces-7005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E45CE86221C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 02:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C9D28662F
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 01:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5C4DDD9;
	Sat, 24 Feb 2024 01:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk5dvkny"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB77C13B
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708739927; cv=none; b=L/oxxXieegilXFnpYURY9RQ7AtHJ9H4Yf1urErTQXkF1pkt3liK8Q/ZqXYH7DsKgu5zhyoKQqxkZF+miDh/bk89KZxgmUvLR4PQ0DMq4BAi/AnZDXpX1v0FTBoslH+aLl6XYWPmF340tFT5/I37UWkHDuoX/pZmA9fg7+ZK5hdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708739927; c=relaxed/simple;
	bh=nkcj/VVDvMxzRNZIM5dHI7edcB1OTSOkyEvsNW5K0zQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bnCMDxNe4YcpFBJMbXo/lX1VrOlZ3AftahH3g9ukCtrZA5uAhZvvXJXwtOME3Mfsgh55QlN+UFaQeaRc5FELZMFihmd35YW/HQf51v6uyT27pizJybTum7Mn9n5m2oGLOOkbmJHHuB0AlUudLuIm54O9aXc+BCNII6UU+T8RSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk5dvkny; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708739925; x=1740275925;
  h=date:from:to:cc:subject:message-id;
  bh=nkcj/VVDvMxzRNZIM5dHI7edcB1OTSOkyEvsNW5K0zQ=;
  b=Mk5dvknyjbYraNUowxp1oq7Mz0phHnlV+pJxpNx6BbUCuCQBKF1Pf4GP
   G5EyMZMsGEcpdQ1b5COG5W2edpVH2OYSDWG+LRSRzJg3CWr1OYxoRgmtp
   +27a6NAPMsQOLrrNvQVtnXUUuZoiiFa8BpJukHHMs2t675fNSL0YL54lj
   2hZBtmyqCmqQuhn5sZm/kblgeO5EIBdpImoq3YpUCjWmT8wXQ3AFAQh1R
   /GwWybs05jWH+VuBoWeHQxlLcbpcj3XcwzjynLZFZ3nfqavPYN1/ljHiT
   SeYkOEUMOi4Zn5LtsBRUT/P54Wv0TKY4sLtZhdTlwBHt9RWgZP9ffGxyr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25558451"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="25558451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 17:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6242791"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 17:55:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdhFi-00086M-0P;
	Sat, 24 Feb 2024 01:54:58 +0000
Date: Sat, 24 Feb 2024 09:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e89fbb5bc21a10a0de2bb878d4df09f538dc523b
Message-ID: <202402240943.hHfwvgMv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e89fbb5bc21a10a0de2bb878d4df09f538dc523b  ASoC: Revert "ASoC: dt-bindings: Update example for enabling USB offload on SM8250"

elapsed time: 1175m

configs tested: 163
configs skipped: 3

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
arc                   randconfig-001-20240224   gcc  
arc                   randconfig-002-20240224   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240224   gcc  
arm                   randconfig-002-20240224   gcc  
arm                   randconfig-003-20240224   gcc  
arm                   randconfig-004-20240224   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240224   gcc  
arm64                 randconfig-002-20240224   gcc  
arm64                 randconfig-003-20240224   clang
arm64                 randconfig-004-20240224   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240224   gcc  
csky                  randconfig-002-20240224   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240224   clang
hexagon               randconfig-002-20240224   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240224   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-003-20240224   gcc  
i386         buildonly-randconfig-004-20240224   gcc  
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-001-20240224   gcc  
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240224   clang
i386                  randconfig-004-20240224   gcc  
i386                  randconfig-005-20240224   gcc  
i386                  randconfig-006-20240224   gcc  
i386                  randconfig-011-20240224   gcc  
i386                  randconfig-012-20240224   gcc  
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240224   gcc  
loongarch             randconfig-002-20240224   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240224   gcc  
nios2                 randconfig-002-20240224   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240224   gcc  
parisc                randconfig-002-20240224   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240224   clang
powerpc               randconfig-002-20240224   clang
powerpc               randconfig-003-20240224   clang
powerpc64             randconfig-001-20240224   gcc  
powerpc64             randconfig-002-20240224   clang
powerpc64             randconfig-003-20240224   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240224   gcc  
riscv                 randconfig-002-20240224   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240224   gcc  
s390                  randconfig-002-20240224   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240224   gcc  
sh                    randconfig-002-20240224   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240224   gcc  
sparc64               randconfig-002-20240224   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240224   gcc  
um                    randconfig-002-20240224   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240224   clang
x86_64       buildonly-randconfig-002-20240224   clang
x86_64       buildonly-randconfig-003-20240224   clang
x86_64       buildonly-randconfig-004-20240224   clang
x86_64       buildonly-randconfig-005-20240224   clang
x86_64       buildonly-randconfig-006-20240224   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240224   clang
x86_64                randconfig-002-20240224   gcc  
x86_64                randconfig-003-20240224   clang
x86_64                randconfig-004-20240224   gcc  
x86_64                randconfig-005-20240224   gcc  
x86_64                randconfig-006-20240224   clang
x86_64                randconfig-011-20240224   gcc  
x86_64                randconfig-012-20240224   gcc  
x86_64                randconfig-013-20240224   gcc  
x86_64                randconfig-014-20240224   clang
x86_64                randconfig-015-20240224   clang
x86_64                randconfig-016-20240224   clang
x86_64                randconfig-071-20240224   gcc  
x86_64                randconfig-072-20240224   clang
x86_64                randconfig-073-20240224   clang
x86_64                randconfig-074-20240224   gcc  
x86_64                randconfig-075-20240224   gcc  
x86_64                randconfig-076-20240224   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240224   gcc  
xtensa                randconfig-002-20240224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

