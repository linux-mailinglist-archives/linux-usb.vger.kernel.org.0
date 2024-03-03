Return-Path: <linux-usb+bounces-7443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C586F676
	for <lists+linux-usb@lfdr.de>; Sun,  3 Mar 2024 18:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05F4C2814C5
	for <lists+linux-usb@lfdr.de>; Sun,  3 Mar 2024 17:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049747640B;
	Sun,  3 Mar 2024 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0HdXmsB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDC41A80
	for <linux-usb@vger.kernel.org>; Sun,  3 Mar 2024 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709487361; cv=none; b=T0qo2vqGBmrMoF3AlC8DfZqLBnCEvS0t6TzNijhjxnkiFM/1G3pNX6JnBFc7WxIjGATz3SxflI4rwvi+GeDTz7QjOcdrtehlArGx7A5xC6/z3ALjY5dWnLOIZVz0Dz3PVXxGT/f1N9xu31UIRG9m6WvFbew9mL/lJL2hNJmKWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709487361; c=relaxed/simple;
	bh=hFFGyMLFx6kwN78WCYQKXMrQWAB/Sr5D7jz65CQmqJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8rhFZ2nrnj3XNiwpJ6Rdk5MeB0wj7uxpFCldwbFi9hDp58OQVQ2dvtaNLPPqW3Saw2lWZYraWTCSffJP9gjK9fr4cJtUduG/sL5XCe9IDKb2cD79UlvA97DKibZLhI6Ny3xJc9w5Bt8wGVP4dNFXKyEdcvqXHUwKqrhVGVMV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0HdXmsB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709487359; x=1741023359;
  h=date:from:to:cc:subject:message-id;
  bh=hFFGyMLFx6kwN78WCYQKXMrQWAB/Sr5D7jz65CQmqJA=;
  b=O0HdXmsBab1zH10xCqTPdm8Fj+pyfC9jnYjx8B6er2DVVpYo8zF96z/b
   vWJTgcfX/ItAACZPJxXxv+wjWJbH5G8DN1229S7yuOnHULSdRtc815Q/l
   O9e7jnoN6U5e8SnLEhbgG4uScYxSMggKf33GegnTRt9Iv6Z07AGRfPqkQ
   lrBILJgT2s8Bxn7lO9xDNEbknCOrwxSd1uMKVOtW054KqSmzDauafNY+z
   rwJs6FGPwWaWxewiO4zOaXo/KamfP4I6MA7GeIfsGYqRg1TEcU/QIajie
   Y1q2DZ5eAP4JXpuG7fBotk/7f75UpNV1yUMv3sRRQD1GO+KeSFXRIm9tb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14686141"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14686141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:35:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13441239"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2024 09:35:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgpkg-0001z4-1O;
	Sun, 03 Mar 2024 17:35:54 +0000
Date: Mon, 04 Mar 2024 01:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 014bcf41d946b36a8f0b8e9b5d9529efbb822f49
Message-ID: <202403040142.9q3Gz6T2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 014bcf41d946b36a8f0b8e9b5d9529efbb822f49  USB: usb-storage: Prevent divide-by-0 error in isd200_ata_command

elapsed time: 1310m

configs tested: 190
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240303   gcc  
arc                   randconfig-002-20240303   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                   randconfig-001-20240303   gcc  
arm                   randconfig-002-20240303   clang
arm                   randconfig-003-20240303   clang
arm                   randconfig-004-20240303   clang
arm                           sama5_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240303   clang
arm64                 randconfig-002-20240303   gcc  
arm64                 randconfig-003-20240303   gcc  
arm64                 randconfig-004-20240303   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240303   gcc  
csky                  randconfig-002-20240303   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240303   clang
hexagon               randconfig-002-20240303   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240303   clang
i386         buildonly-randconfig-002-20240303   clang
i386         buildonly-randconfig-003-20240303   gcc  
i386         buildonly-randconfig-004-20240303   clang
i386         buildonly-randconfig-005-20240303   clang
i386         buildonly-randconfig-006-20240303   clang
i386                                defconfig   clang
i386                  randconfig-001-20240303   gcc  
i386                  randconfig-002-20240303   gcc  
i386                  randconfig-003-20240303   gcc  
i386                  randconfig-004-20240303   clang
i386                  randconfig-005-20240303   gcc  
i386                  randconfig-006-20240303   gcc  
i386                  randconfig-011-20240303   clang
i386                  randconfig-012-20240303   gcc  
i386                  randconfig-013-20240303   gcc  
i386                  randconfig-014-20240303   gcc  
i386                  randconfig-015-20240303   gcc  
i386                  randconfig-016-20240303   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240303   gcc  
loongarch             randconfig-002-20240303   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240303   gcc  
nios2                 randconfig-002-20240303   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240303   gcc  
parisc                randconfig-002-20240303   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc               randconfig-001-20240303   clang
powerpc               randconfig-002-20240303   gcc  
powerpc               randconfig-003-20240303   gcc  
powerpc                     stx_gp3_defconfig   clang
powerpc                     taishan_defconfig   clang
powerpc                     tqm5200_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240303   gcc  
powerpc64             randconfig-002-20240303   clang
powerpc64             randconfig-003-20240303   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240303   gcc  
riscv                 randconfig-002-20240303   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240303   clang
s390                  randconfig-002-20240303   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240303   gcc  
sh                    randconfig-002-20240303   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240303   gcc  
sparc64               randconfig-002-20240303   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240303   clang
um                    randconfig-002-20240303   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240303   clang
x86_64       buildonly-randconfig-002-20240303   clang
x86_64       buildonly-randconfig-003-20240303   clang
x86_64       buildonly-randconfig-004-20240303   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240303   clang
x86_64                randconfig-003-20240303   clang
x86_64                randconfig-004-20240303   clang
x86_64                randconfig-005-20240303   clang
x86_64                randconfig-013-20240303   clang
x86_64                randconfig-015-20240303   clang
x86_64                randconfig-071-20240303   clang
x86_64                randconfig-075-20240303   clang
x86_64                randconfig-076-20240303   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240303   gcc  
xtensa                randconfig-002-20240303   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

