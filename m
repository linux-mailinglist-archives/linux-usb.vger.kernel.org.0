Return-Path: <linux-usb+bounces-6765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500485B5AD
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 09:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA43A1C22A2F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 08:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E405F473;
	Tue, 20 Feb 2024 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIXoqdCp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8CA5D8E0
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708418613; cv=none; b=DO2RfGJ3l+WfOEgrVNkm9B20tnvpZspXGNSliinGdiEIxRTCtTeYfwmGs/XqQPiUZDTF0izbKxI0Gz3SghY5GN/YIg4bJWQw0axmGlL/9VosmGHBfi+EdAJR8kJFN396NNHCyDZGA7AA2Tb9BSnlCvdXs/rjXFm9zR5vFQz5CEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708418613; c=relaxed/simple;
	bh=TKY9N6UAVLINJer0TXPQo4Qm4Y+N8a3qcak23JVrTwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dXQaRpEwLh/c3fYwgom9jSAq1yExuO1UAuNW60KxfSnDAVWfnLrgPepanfCF+m71OgOT9ROCzZ+Kw7fnVhzb2BrYDs5E+MFd77IKpOJzKngBGOMQE0JPOnS14H6sNmvUCSN+py792WfxnnhC/zSvorz8Rtr+mYZcE/SwudNt2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIXoqdCp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708418612; x=1739954612;
  h=date:from:to:cc:subject:message-id;
  bh=TKY9N6UAVLINJer0TXPQo4Qm4Y+N8a3qcak23JVrTwY=;
  b=OIXoqdCpnXMvAc1gj9nIf04MsADvMpXyQ9CzWEN7jdUJdXYpMKz1npG3
   XHKRpOnXuUPGC4YVCbfLaJ4mmX3SF+JQd1lbLLMcDJ2ZEWfm7eWSqp+sT
   eCVpOFK83RO8zFk32yzZ+iK55fFtHm/MrvZ9pEJBH3PPiRW8X8/V3t9FS
   oiT0oLpLOC2BDEn8AcUq6yABX7loaT/kw8MVOxg5jvvXNDveypL+pu0Gp
   6NK4CMtIMXmRsCw7tpT43wC20p6bNH1HxzaubiTN0U1D/n5HwkAdg22ou
   gDQMj6XbfoizYKY4mZg/Mi13Rq/SfNFww3lmScCNBMZxDd2Be8/g8j0RI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13912335"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13912335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 00:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4700156"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 00:43:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcLiU-0004Lq-1F;
	Tue, 20 Feb 2024 08:43:07 +0000
Date: Tue, 20 Feb 2024 16:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:gadget_char] BUILD SUCCESS
 2480893246ae0a78ae0d7f0eebba749ccaf4cc0d
Message-ID: <202402201646.Ps5OpdIw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git gadget_char
branch HEAD: 2480893246ae0a78ae0d7f0eebba749ccaf4cc0d  USB: gadget: dummy_hcd: switch char * to u8 *

elapsed time: 1454m

configs tested: 244
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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240219   gcc  
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-002-20240219   gcc  
arc                   randconfig-002-20240220   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240219   gcc  
arm                   randconfig-002-20240219   gcc  
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240219   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-004-20240219   gcc  
arm                   randconfig-004-20240220   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240219   gcc  
arm64                 randconfig-002-20240219   gcc  
arm64                 randconfig-003-20240219   clang
arm64                 randconfig-004-20240219   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240219   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-002-20240219   gcc  
csky                  randconfig-002-20240220   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240219   clang
hexagon               randconfig-002-20240219   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240219   gcc  
i386         buildonly-randconfig-002-20240219   gcc  
i386         buildonly-randconfig-003-20240219   clang
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-004-20240219   gcc  
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-005-20240219   clang
i386         buildonly-randconfig-006-20240219   clang
i386                                defconfig   clang
i386                  randconfig-001-20240219   clang
i386                  randconfig-002-20240219   clang
i386                  randconfig-003-20240219   clang
i386                  randconfig-003-20240220   clang
i386                  randconfig-004-20240219   gcc  
i386                  randconfig-004-20240220   clang
i386                  randconfig-005-20240219   clang
i386                  randconfig-006-20240219   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-011-20240219   gcc  
i386                  randconfig-011-20240220   clang
i386                  randconfig-012-20240219   clang
i386                  randconfig-013-20240219   gcc  
i386                  randconfig-014-20240219   clang
i386                  randconfig-014-20240220   clang
i386                  randconfig-015-20240219   gcc  
i386                  randconfig-015-20240220   clang
i386                  randconfig-016-20240219   clang
i386                  randconfig-016-20240220   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240219   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-002-20240219   gcc  
loongarch             randconfig-002-20240220   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240219   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-002-20240219   gcc  
nios2                 randconfig-002-20240220   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240219   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-002-20240219   gcc  
parisc                randconfig-002-20240220   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240219   gcc  
powerpc               randconfig-001-20240220   gcc  
powerpc               randconfig-002-20240219   clang
powerpc               randconfig-003-20240219   clang
powerpc64             randconfig-001-20240219   clang
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-002-20240219   gcc  
powerpc64             randconfig-002-20240220   gcc  
powerpc64             randconfig-003-20240219   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240219   gcc  
riscv                 randconfig-002-20240219   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240219   gcc  
s390                  randconfig-001-20240220   gcc  
s390                  randconfig-002-20240219   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240219   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-002-20240219   gcc  
sh                    randconfig-002-20240220   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240219   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-002-20240219   gcc  
sparc64               randconfig-002-20240220   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240219   clang
um                    randconfig-001-20240220   gcc  
um                    randconfig-002-20240219   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240219   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240219   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-003-20240219   gcc  
x86_64       buildonly-randconfig-004-20240219   clang
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240219   clang
x86_64       buildonly-randconfig-006-20240219   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240219   clang
x86_64                randconfig-002-20240219   clang
x86_64                randconfig-003-20240219   gcc  
x86_64                randconfig-004-20240219   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-005-20240219   clang
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-006-20240219   clang
x86_64                randconfig-011-20240219   clang
x86_64                randconfig-012-20240219   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-013-20240219   clang
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240219   gcc  
x86_64                randconfig-015-20240219   clang
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-016-20240219   gcc  
x86_64                randconfig-071-20240219   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-072-20240219   clang
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-073-20240219   gcc  
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-074-20240219   gcc  
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-075-20240219   clang
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240219   clang
x86_64                randconfig-076-20240220   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240219   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-002-20240219   gcc  
xtensa                randconfig-002-20240220   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

