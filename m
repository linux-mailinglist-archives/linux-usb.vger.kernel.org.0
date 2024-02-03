Return-Path: <linux-usb+bounces-5836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F28487D8
	for <lists+linux-usb@lfdr.de>; Sat,  3 Feb 2024 18:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A7A61C22707
	for <lists+linux-usb@lfdr.de>; Sat,  3 Feb 2024 17:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F7D62169;
	Sat,  3 Feb 2024 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5E1HbTZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973461674
	for <linux-usb@vger.kernel.org>; Sat,  3 Feb 2024 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706979995; cv=none; b=rIJr7jHhAtRxeaiTNMzU8Xiv3Do+Ck7K0+glu+CohEBJhUl4Rb71zQNcpCII74wAdqec7T6SQgNgSrLM2/EtO4++Ko6Luxn2/FsCjY626m7UZGtghO0iaFPdZjjUUAhJ1BONPxS8tIDLQn2dwEqOkpgJqv7EpqVSWRpotA/Om+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706979995; c=relaxed/simple;
	bh=r1kpAm05agiLpFg3rTEbHum1WWO4STHbAxa7fN79zH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s69eVmaEmsObLkPhtDiSJ283dU2x0Ut+4pJOX71h+zPvdBnCLC+bZyoyx/PnkD5Bq5OJq+AyogElLVkmcydGZYvJH9tCpPhc9EsfvI1t+ReXDa8+Iwz5HK5yMSI3nt6K8RwzJhHN/u+wVZ0OiRVux+f1mLF/4v7I8SzEGbvvCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5E1HbTZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706979994; x=1738515994;
  h=date:from:to:cc:subject:message-id;
  bh=r1kpAm05agiLpFg3rTEbHum1WWO4STHbAxa7fN79zH4=;
  b=S5E1HbTZieoilE34jQktRoCR5DCf6P2TuxXgltvJVLBIzujEspZFcvvt
   5xqNCVu/tmPZ/DsxAv1YF4CHXSp0FdIWRrmkWxGYsAkctAlKcAil8y6+q
   8Wce7BpZFRBWb9Q7w1caBsWouJPivLyDMPkNosFi3c85cftfIqGrurxbY
   32u+kjsVC2iTLMYcTs6LiYiC3sD7cxWJv6FQkmCS3pl5+mX8WMTsynYEQ
   G/9XZCYtA1VwEMgSRuFJ81X/RoQmh9Bj3kOd/JU33toEi9nzH/+56+RP1
   iw+2IBdCVEClVXIlH2HK6UtKdFdkNiwcCsrBi6bZCipyTfKmpgPe3TlnV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="247325"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="247325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 09:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="37778173"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2024 09:06:32 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWJTJ-0005Mi-0g;
	Sat, 03 Feb 2024 17:06:29 +0000
Date: Sun, 04 Feb 2024 01:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ad834c7c8e4a74dd6cd4397848aa255e473d4a63
Message-ID: <202402040100.jhKQNaJu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ad834c7c8e4a74dd6cd4397848aa255e473d4a63  Merge tag 'usb-serial-6.8-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1459m

configs tested: 160
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240203   gcc  
arc                   randconfig-002-20240203   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-003-20240203   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240203   gcc  
arm64                 randconfig-004-20240203   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240203   gcc  
csky                  randconfig-002-20240203   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240203   gcc  
i386         buildonly-randconfig-006-20240203   gcc  
i386                                defconfig   clang
i386                  randconfig-002-20240203   gcc  
i386                  randconfig-004-20240203   gcc  
i386                  randconfig-006-20240203   gcc  
i386                  randconfig-012-20240203   gcc  
i386                  randconfig-013-20240203   gcc  
i386                  randconfig-014-20240203   gcc  
i386                  randconfig-015-20240203   gcc  
i386                  randconfig-016-20240203   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240203   gcc  
loongarch             randconfig-002-20240203   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240203   gcc  
nios2                 randconfig-002-20240203   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240203   gcc  
parisc                randconfig-002-20240203   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc64             randconfig-002-20240203   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240203   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240203   gcc  
sh                    randconfig-002-20240203   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240203   gcc  
sparc64               randconfig-002-20240203   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240203   clang
x86_64                randconfig-013-20240203   clang
x86_64                randconfig-014-20240203   clang
x86_64                randconfig-015-20240203   clang
x86_64                randconfig-016-20240203   clang
x86_64                randconfig-071-20240203   clang
x86_64                randconfig-073-20240203   clang
x86_64                randconfig-074-20240203   clang
x86_64                randconfig-075-20240203   clang
x86_64                randconfig-076-20240203   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240203   gcc  
xtensa                randconfig-002-20240203   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

