Return-Path: <linux-usb+bounces-7441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851C86F422
	for <lists+linux-usb@lfdr.de>; Sun,  3 Mar 2024 10:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBE442829E3
	for <lists+linux-usb@lfdr.de>; Sun,  3 Mar 2024 09:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1BAAD4B;
	Sun,  3 Mar 2024 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kmb0t/Fm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EE8F40
	for <linux-usb@vger.kernel.org>; Sun,  3 Mar 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709457647; cv=none; b=O0TvLz4DGFyEB63NPlE1/ViwjJ1XCfOXo/MILv5V/p3JO067RAfFS/jHM+Q7RigAx2H4qDpedANM/BW/MDi184vVxNZuK4I2avp/heiEEwbODKsW9B4t//fV/fJ/o25MdK06xRJ5R7AotVw1jcKLUIGSXvGoZgk8fXzDaTkRMv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709457647; c=relaxed/simple;
	bh=Yjuny0FcMpkxqcGOXe6e1m+ZYPr5cxI9mzSd4L7QMf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lwLMuQC+LK+c33ISppqdaJ2ibturDN6D++YZ1ddL+sSIEzodNDHgNLMTRF68jiE62T2wxkf7QIY2h9P3HdFkbKZkHxbC6qh9Lvx3uXzUz60nKwJ/G1dONnDOoMmb+ioMQT6nrXbDJ+ruA7yP/k0eoKVb4+gafGu5RRrARzenedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kmb0t/Fm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709457646; x=1740993646;
  h=date:from:to:cc:subject:message-id;
  bh=Yjuny0FcMpkxqcGOXe6e1m+ZYPr5cxI9mzSd4L7QMf8=;
  b=Kmb0t/FmXe1JcgoygV7Rw2EXgDxypUiC2mvz9lhGizqBBmTVE27laGTX
   7NryKkK6lK/EMq07kZGDHtSkCkiQCCJK9V4AOyRF+lU+zdgC4o5iShuYI
   aAx8OlUhxlavayvSO3fXl/uE5TZ5JMeBsSyka3pnzQLVDfDhO16dgDjdh
   TC3qpNIBdxupLRxxTXO4wUD4JBBbF+Mm9LkRuuSgloy+/Uq2kuoL8KYXf
   2Y8iWEFWCzG8Pmppz1FyAhqvjne1zO/iYNCtbcbm/raDNg38ho6VGuiIv
   WtFBiUCFQPyCYS9weEGNkePZ9MbJcCI22LtgVJWSOjuyFSdZ6FUXaBAx7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3812945"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3812945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 01:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8603824"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2024 01:20:44 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgi1R-0001eA-25;
	Sun, 03 Mar 2024 09:20:41 +0000
Date: Sun, 03 Mar 2024 17:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 19e7b35d8a71d0f2dd0f97acbdbb40c2459cff9e
Message-ID: <202403031711.u3XG1mck-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 19e7b35d8a71d0f2dd0f97acbdbb40c2459cff9e  powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name

elapsed time: 815m

configs tested: 180
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
arc                   randconfig-001-20240303   gcc  
arc                   randconfig-002-20240303   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                   randconfig-001-20240303   gcc  
arm                   randconfig-002-20240303   clang
arm                   randconfig-003-20240303   clang
arm                   randconfig-004-20240303   clang
arm                           sama5_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
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
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240303   gcc  
loongarch             randconfig-002-20240303   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240303   gcc  
nios2                 randconfig-002-20240303   gcc  
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
powerpc                       eiger_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc               randconfig-001-20240303   clang
powerpc               randconfig-002-20240303   gcc  
powerpc               randconfig-003-20240303   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
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
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
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
x86_64       buildonly-randconfig-005-20240303   gcc  
x86_64       buildonly-randconfig-006-20240303   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240303   clang
x86_64                randconfig-002-20240303   gcc  
x86_64                randconfig-003-20240303   clang
x86_64                randconfig-004-20240303   clang
x86_64                randconfig-005-20240303   clang
x86_64                randconfig-006-20240303   gcc  
x86_64                randconfig-011-20240303   gcc  
x86_64                randconfig-012-20240303   gcc  
x86_64                randconfig-013-20240303   clang
x86_64                randconfig-014-20240303   gcc  
x86_64                randconfig-015-20240303   clang
x86_64                randconfig-016-20240303   gcc  
x86_64                randconfig-071-20240303   clang
x86_64                randconfig-072-20240303   gcc  
x86_64                randconfig-073-20240303   gcc  
x86_64                randconfig-074-20240303   gcc  
x86_64                randconfig-075-20240303   clang
x86_64                randconfig-076-20240303   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240303   gcc  
xtensa                randconfig-002-20240303   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

