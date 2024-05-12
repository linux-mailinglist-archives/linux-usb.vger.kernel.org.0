Return-Path: <linux-usb+bounces-10240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FB8C3581
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9207F281A00
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 08:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB861BF58;
	Sun, 12 May 2024 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HE/c6aaY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F22417583
	for <linux-usb@vger.kernel.org>; Sun, 12 May 2024 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715502051; cv=none; b=idwFhqFjjQsWQBE46tfMAqW6BrwM4/XbWth6LmsAxMiDJMUw3gHLDp6rQwNCqZbvA1PZV/wScTGVvQl67KvhzA1vOm7Q+HHHIhj0WQ5jq0YGX9Qc0BuDSDbwSTSZi3gnNXxnDXFRAeY8nscgtDdemIps3rZnFJUPvYoY3ZSGACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715502051; c=relaxed/simple;
	bh=CggpzT+DBQ5SDpwMs7xnnF59kA4dc4HeDfS4R9mfMJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NsaPwTaaxG9rd8WxHBMGH5xfDsNYUXHDPUI0JiBg/dQNqpAJnT0solrblcpEhYfSLtpd/GsVLY7NCVc+lU5DJJzdHzFAOKd8V9oCad8oY+gfc4MB8lFng26hFQJYLooYhze3KWfn59qwJTb2xFl04YI8kBLSBZj+gRxar9fFGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HE/c6aaY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715502049; x=1747038049;
  h=date:from:to:cc:subject:message-id;
  bh=CggpzT+DBQ5SDpwMs7xnnF59kA4dc4HeDfS4R9mfMJQ=;
  b=HE/c6aaYLJCE/Q4yFqz1ONVNCpWiq7Oeag6a8jI+xVsxD0FVbt97BBXb
   83lexxwBGO6zThcglozcViP5VV1XwDjHUEXY50bVGoJeUvLgSO6UtaWNB
   gJNaSdGOl+fYJwbgwRsRqHCLGQVEJ51tmy763z1K34xeKixNWuil2fZh6
   FYy9VeTFSv6x53CMUfExmik9Bcwoy02xc7PvY9AH/XAVjCdk+NDOFe20J
   BXHPEYWr0tjEoo49LB+8MgmyOIGOfV5Gezdzja3SrHYqrSHcCATarB8ul
   ewFme7UMt3JdjuKp1lhjWAY22ee6pOxQnbPkW85NKH7GYBqoz46H5QMkX
   g==;
X-CSE-ConnectionGUID: qxVoQ5StQb+vuqlEG+16Pw==
X-CSE-MsgGUID: 52d6/+PeRAyTLAGC3sciUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11390063"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11390063"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 01:20:48 -0700
X-CSE-ConnectionGUID: RQIsLreuTGihQhxSD7mISw==
X-CSE-MsgGUID: LfBRDAPLT2iZ8irAIASvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34814660"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2024 01:20:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s64Rp-0008Pz-0x;
	Sun, 12 May 2024 08:20:45 +0000
Date: Sun, 12 May 2024 16:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 01be965ce5ab028c15fa64bbfdd59aac87a374ca
Message-ID: <202405121615.EFQ0DX8P-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 01be965ce5ab028c15fa64bbfdd59aac87a374ca  usb: dwc3: core: Fix unused variable warning in core driver

elapsed time: 1456m

configs tested: 159
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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240512   gcc  
arc                   randconfig-002-20240512   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                             mxs_defconfig   clang
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240512   gcc  
arm                   randconfig-004-20240512   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-004-20240512   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240512   gcc  
csky                  randconfig-002-20240512   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240512   gcc  
i386         buildonly-randconfig-003-20240512   gcc  
i386         buildonly-randconfig-004-20240512   gcc  
i386         buildonly-randconfig-005-20240512   gcc  
i386                                defconfig   clang
i386                  randconfig-004-20240512   gcc  
i386                  randconfig-011-20240512   gcc  
i386                  randconfig-013-20240512   gcc  
i386                  randconfig-015-20240512   gcc  
i386                  randconfig-016-20240512   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240512   gcc  
loongarch             randconfig-002-20240512   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                          rb532_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240512   gcc  
nios2                 randconfig-002-20240512   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240512   gcc  
parisc                randconfig-002-20240512   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc                     sequoia_defconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240512   gcc  
s390                  randconfig-002-20240512   gcc  
s390                       zfcpdump_defconfig   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240512   gcc  
sh                    randconfig-002-20240512   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240512   gcc  
sparc64               randconfig-002-20240512   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240512   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240512   clang
x86_64       buildonly-randconfig-002-20240512   clang
x86_64       buildonly-randconfig-003-20240512   clang
x86_64       buildonly-randconfig-005-20240512   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240512   clang
x86_64                randconfig-013-20240512   clang
x86_64                randconfig-015-20240512   clang
x86_64                randconfig-016-20240512   clang
x86_64                randconfig-071-20240512   clang
x86_64                randconfig-074-20240512   clang
x86_64                randconfig-075-20240512   clang
x86_64                randconfig-076-20240512   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240512   gcc  
xtensa                randconfig-002-20240512   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

