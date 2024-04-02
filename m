Return-Path: <linux-usb+bounces-8773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3C895F60
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 00:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D7941C2312F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 22:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3CC5BAD7;
	Tue,  2 Apr 2024 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VurtGrSb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7615E802
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712095881; cv=none; b=L1dQITY0mKAlJPD5HvaoL7j2W+HbKz1lO1r2sNkzTRURnfEVv3nFVj+2M3dm/fYMERWX2HN+n9QdzoWwLhLUMGrFCWnw5trNJyMMcMsuuKV6RpERYrzydPKBUZOqJPCvuDA70+pIOpaAZbyRyWRNrz8MTeYSNmSSncMK8SyuxXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712095881; c=relaxed/simple;
	bh=uHEOAGx6p8pA+QyFOw2ARQfP/n05EAVLeTLmxSJUyFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GtEeuJQnQdUIiXQfbH9RJT6xkB5NW3xZbVAlzPwbv/PgZbfQ70My+VJ689UWWIAZQ4pTYd7zRD1CqhfyuYhwsR12rnte+VHhF7sLFIwNm74ykMHDD0HHrPj7v6yl6zlLgwO/7QL67M21OoDLme1Tj00fRf7cCi3j87jyS8satyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VurtGrSb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712095880; x=1743631880;
  h=date:from:to:cc:subject:message-id;
  bh=uHEOAGx6p8pA+QyFOw2ARQfP/n05EAVLeTLmxSJUyFw=;
  b=VurtGrSbP9XPG8Qe0hEN2sMJuDgX5YLa4u0Wkbcm1hJY6Cnxqk88hPsv
   LptJmpoHOLmpjPhsZqdAFq336xn/DCb28Kpy3ZTwh+40lVENL06alCqGH
   ASLw0l8O0opglFx5vMsfe18Q9UbNufcoXxdJJn6QWIicmPP3E4sTq4Aat
   tDjbf7XReCTzXDettMiHNbBAd5Dx1lHGBgHwjnMB8zAnKcVh6qYbphjZV
   6aubeTIPG5frLyQu+1Lv6KivYaGYdNijTmXDSXwQ8tBcAyq5+D2pVLhDC
   hi6+6CM0y9DO8T0nfmDTJIlgFq4YzODa1vftG9xU5hnOVaJ7MWOUrTZEV
   Q==;
X-CSE-ConnectionGUID: 53N5ESJRQ/SIT63xU7buAA==
X-CSE-MsgGUID: GfbMKMs4RteAoGofpFCobg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7154552"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7154552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 15:11:19 -0700
X-CSE-ConnectionGUID: Z2JRu/7XT02mc6S7wyHQEg==
X-CSE-MsgGUID: VTNs7TCEQM2aRce8IVwUSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18805639"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2024 15:11:17 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrmLb-0001aH-1K;
	Tue, 02 Apr 2024 22:11:15 +0000
Date: Wed, 03 Apr 2024 06:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 c032cdd48b29549e8283c2fea99e7d91ddefebf7
Message-ID: <202404030627.sCooe7eR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: c032cdd48b29549e8283c2fea99e7d91ddefebf7  thunderbolt: Do not create DisplayPort tunnels on adapters of the same router

elapsed time: 915m

configs tested: 147
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
arc                   randconfig-001-20240403   gcc  
arc                   randconfig-002-20240403   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240403   gcc  
arm                   randconfig-002-20240403   gcc  
arm                   randconfig-004-20240403   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240403   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240403   gcc  
csky                  randconfig-002-20240403   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240402   gcc  
i386         buildonly-randconfig-002-20240402   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240402   gcc  
i386                  randconfig-011-20240402   gcc  
i386                  randconfig-015-20240402   gcc  
i386                  randconfig-016-20240402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240403   gcc  
loongarch             randconfig-002-20240403   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240403   gcc  
nios2                 randconfig-002-20240403   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240403   gcc  
parisc                randconfig-002-20240403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240403   gcc  
powerpc               randconfig-002-20240403   gcc  
powerpc64             randconfig-001-20240403   gcc  
powerpc64             randconfig-003-20240403   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240403   gcc  
sh                    randconfig-002-20240403   gcc  
sh                           se7721_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240403   gcc  
sparc64               randconfig-002-20240403   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240403   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240402   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240403   gcc  
xtensa                randconfig-002-20240403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

