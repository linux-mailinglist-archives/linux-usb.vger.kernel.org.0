Return-Path: <linux-usb+bounces-8519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D988F44B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 02:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6896D2A5A13
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 01:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E64D29E;
	Thu, 28 Mar 2024 01:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CezBkfCm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856720DC8
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 01:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711587901; cv=none; b=dMNfUsToKuDBollnqxZ7rsaJ52iNcFjoKBB7hXWpHKVXvZ8G9QuqgGaX8R06mVf4U2MtqKgiGGYBpZJWXFJ1LswmJiWg0yBlISD2DrpC/g/13SCzmV5iZMm0eSVFFDcBt5NnjKLZWmxJ2+AIPQIvv//w0javBH+QJXDqhwyID88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711587901; c=relaxed/simple;
	bh=zys3NylnIXYzokPuYs3avw8jFcF9Gx+A9dr+FxadixI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ikAfGnMbmfTdnFtPvbLkTCPtHT/+SNJKzK8jnk2tObhnVBlzVr/lZ9UN70DlaVK1dKslbjWolHO7nzWhgOUVQB5qNQVa0NRQkpjT0vuZJDYu+3x3atV4X8vOMGfjsPY7kuOKGsZ0ftZSRFrG06KIoe7zQIBNcgG/cy6j6iB5CcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CezBkfCm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711587899; x=1743123899;
  h=date:from:to:cc:subject:message-id;
  bh=zys3NylnIXYzokPuYs3avw8jFcF9Gx+A9dr+FxadixI=;
  b=CezBkfCmM2mfEay+bxJCgRM/J314Ln1fwPa46gO9H/aGagJpioMbyVLX
   yOoP3+x7cD7goSSyaoGG3K1AWroPlN3bIx6x1ueA1LL2aNtIVsaCBVaXa
   XzCzyxMu/7H9ZXXVrqCSW7IcXQ1jnGzyqL8z6owTCg9w6B9i0hSsD6xXl
   zq/meWlWMAsXpUyzsHGKJ3FNw296iniv69xZjRatlGMWMt7YYG1MYQ8ck
   sbHWWwFHMExofdp2nCw7GtB3D73P39AkftGpnR0j3xQLDS5ftX4FF5msS
   +vailvZyvVwZNIyaamRU5J/+wwNpCwjhXqNpF7+2e8X/ITIR3ODfwNPa7
   A==;
X-CSE-ConnectionGUID: LZ6FP6j8SSG095wwAyz8Ew==
X-CSE-MsgGUID: 5+ieVeD+T96i+jq/l322Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6835866"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6835866"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 18:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="20951437"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2024 18:04:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpeCC-0001ey-1V;
	Thu, 28 Mar 2024 01:04:44 +0000
Date: Thu, 28 Mar 2024 09:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ef83531c8e4a5f2fc9c602be7e2a300de1575ee4
Message-ID: <202403280914.bLdf0OTc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ef83531c8e4a5f2fc9c602be7e2a300de1575ee4  usb: misc: onboard_dev: add support for XMOS XVF3500

elapsed time: 1080m

configs tested: 194
configs skipped: 4

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
arc                                 defconfig   gcc  
arc                   randconfig-001-20240328   gcc  
arc                   randconfig-002-20240328   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                      jornada720_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240328   gcc  
arm                   randconfig-002-20240328   gcc  
arm                   randconfig-003-20240328   gcc  
arm                   randconfig-004-20240328   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240328   gcc  
arm64                 randconfig-002-20240328   gcc  
arm64                 randconfig-003-20240328   gcc  
arm64                 randconfig-004-20240328   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240328   gcc  
csky                  randconfig-002-20240328   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240328   clang
hexagon               randconfig-002-20240328   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240328   gcc  
i386         buildonly-randconfig-002-20240328   gcc  
i386         buildonly-randconfig-003-20240328   clang
i386         buildonly-randconfig-004-20240328   gcc  
i386         buildonly-randconfig-005-20240328   gcc  
i386         buildonly-randconfig-006-20240328   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240328   clang
i386                  randconfig-002-20240328   clang
i386                  randconfig-003-20240328   clang
i386                  randconfig-004-20240328   clang
i386                  randconfig-005-20240328   gcc  
i386                  randconfig-006-20240328   gcc  
i386                  randconfig-011-20240328   clang
i386                  randconfig-012-20240328   clang
i386                  randconfig-013-20240328   clang
i386                  randconfig-014-20240328   clang
i386                  randconfig-015-20240328   clang
i386                  randconfig-016-20240328   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240328   gcc  
loongarch             randconfig-002-20240328   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                           mtx1_defconfig   clang
mips                          rm200_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240328   gcc  
nios2                 randconfig-002-20240328   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240328   gcc  
parisc                randconfig-002-20240328   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       eiger_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                      pcm030_defconfig   clang
powerpc               randconfig-001-20240328   clang
powerpc               randconfig-002-20240328   clang
powerpc               randconfig-003-20240328   clang
powerpc                     sequoia_defconfig   clang
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                     tqm8548_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240328   clang
powerpc64             randconfig-002-20240328   gcc  
powerpc64             randconfig-003-20240328   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240328   gcc  
riscv                 randconfig-002-20240328   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240328   clang
s390                  randconfig-002-20240328   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240328   gcc  
sh                    randconfig-002-20240328   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240328   gcc  
sparc64               randconfig-002-20240328   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240328   gcc  
um                    randconfig-002-20240328   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240328   gcc  
x86_64       buildonly-randconfig-002-20240328   clang
x86_64       buildonly-randconfig-003-20240328   gcc  
x86_64       buildonly-randconfig-004-20240328   gcc  
x86_64       buildonly-randconfig-005-20240328   gcc  
x86_64       buildonly-randconfig-006-20240328   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240328   clang
x86_64                randconfig-002-20240328   gcc  
x86_64                randconfig-003-20240328   clang
x86_64                randconfig-004-20240328   gcc  
x86_64                randconfig-005-20240328   clang
x86_64                randconfig-006-20240328   clang
x86_64                randconfig-011-20240328   clang
x86_64                randconfig-012-20240328   clang
x86_64                randconfig-013-20240328   gcc  
x86_64                randconfig-014-20240328   gcc  
x86_64                randconfig-015-20240328   clang
x86_64                randconfig-016-20240328   clang
x86_64                randconfig-071-20240328   gcc  
x86_64                randconfig-072-20240328   clang
x86_64                randconfig-073-20240328   gcc  
x86_64                randconfig-074-20240328   gcc  
x86_64                randconfig-075-20240328   gcc  
x86_64                randconfig-076-20240328   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240328   gcc  
xtensa                randconfig-002-20240328   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

