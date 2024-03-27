Return-Path: <linux-usb+bounces-8449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D488D565
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 05:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801D629BED9
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 04:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6D123768;
	Wed, 27 Mar 2024 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgHjPuUT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0E1D52B
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711512977; cv=none; b=IHS5YqfF+QiO3mtD+gtXfl3V7pKpp1CiEHa7InMMb82jLOp8Y1ZgtAAvB1cv42x+f9sbWDdfJ7NYwxao8Uldt8fbcGLZ/rPXLJhI/mhFKkQ04aE5CA1OOz57xEa7sz9c0qG8BxGzPTKGJavKb1dcJVvqeACXSpXqrdE6eWmvaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711512977; c=relaxed/simple;
	bh=1mpfd2wnFrXtn5cnBcOOTEAHqg5N+t7l9vXCV1S4whI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hzskf6Yc2xUze3hVwwd2Z2b78tvjLBG/PQaA5tbskG4dpNntUPdaXd2MwRqoSBvm7k/hvXm3XpnxV6dNOQRW9Yu3oL2m9fB1U6LAXJlrmZ992/KcPJ2LYoaVy+EadgfbPgyJ1FqBAopOKhnIc8OwAU7GPfrJvQAMIS3mlfjj6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgHjPuUT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711512976; x=1743048976;
  h=date:from:to:cc:subject:message-id;
  bh=1mpfd2wnFrXtn5cnBcOOTEAHqg5N+t7l9vXCV1S4whI=;
  b=ZgHjPuUTCvKdX5EU1vFBfFyNElxzLXacPhyX+SZvPca+FgdGa64bEUnA
   sNZ7g7lCjJjXOQTwWHwZj31oxC1dr3JmwUCeC5cwuAiCVzB6d/VMmxF/Z
   7Vy/NQxIvh7s3/1d1zpNcVxIjdT/mP3FnrqmgSNoMNcGawcg6L3+HzEKD
   /ZKYNPePq7jpZtsZ7hMpyW+tLW/+d2u64yxvc+jrCqzzRUTPDNAIZloWF
   saqaz2RMKK0dLoRoGdefwIus6tia2ecomrRFH+l7q6g8fTklU7tyJ+mhI
   X3DsF1RtAqQx7JFuSmsk37hd3UFU5ldBGenlmljJqRKQkZ2hxsumgpx5c
   Q==;
X-CSE-ConnectionGUID: ZWte2zfVQZWsCDnvotS7Sg==
X-CSE-MsgGUID: 3thF8BntQoyyXsT080lCoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9558442"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="9558442"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 21:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20817728"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2024 21:16:13 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpKhu-0000k2-2z;
	Wed, 27 Mar 2024 04:16:10 +0000
Date: Wed, 27 Mar 2024 12:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:gadget_char] BUILD SUCCESS
 0243ef83005fc837ac0b127a949e4dfd2f80622b
Message-ID: <202403271205.xbdeCamu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git gadget_char
branch HEAD: 0243ef83005fc837ac0b127a949e4dfd2f80622b  USB: gadget: dummy_hcd: switch char * to u8 *

elapsed time: 723m

configs tested: 151
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
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-004-20240327   gcc  
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240327   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240327   gcc  
i386         buildonly-randconfig-002-20240327   gcc  
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-001-20240327   gcc  
i386                  randconfig-002-20240327   gcc  
i386                  randconfig-003-20240327   clang
i386                  randconfig-004-20240327   gcc  
i386                  randconfig-005-20240327   clang
i386                  randconfig-006-20240327   gcc  
i386                  randconfig-011-20240327   gcc  
i386                  randconfig-012-20240327   clang
i386                  randconfig-013-20240327   gcc  
i386                  randconfig-014-20240327   clang
i386                  randconfig-015-20240327   gcc  
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
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
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-002-20240327   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240327   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sh                          rsk7269_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240327   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240327   gcc  
xtensa                randconfig-002-20240327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

