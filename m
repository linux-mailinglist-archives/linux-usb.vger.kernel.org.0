Return-Path: <linux-usb+bounces-10036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14F8BC055
	for <lists+linux-usb@lfdr.de>; Sun,  5 May 2024 14:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA47D281840
	for <lists+linux-usb@lfdr.de>; Sun,  5 May 2024 12:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A4B18643;
	Sun,  5 May 2024 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9lDkKbb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250072CA2
	for <linux-usb@vger.kernel.org>; Sun,  5 May 2024 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714911301; cv=none; b=KTEGpzGhtoADE6+IJrd9PH1rHzaWRbyt9XUR6X01M3dIxmcx6gzVIm0LrwSjrwpg7nlHG9/KAats876S9COxby3c+sj+EQ4qifykLo2bV0LaAE+np3dT9K0HhamEj3g62qSw1bwR7+JTeiJZUyGTdwWAHyolPhGf18ebgpnYWMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714911301; c=relaxed/simple;
	bh=wtPFxJjqZfzkaieJGy0pleJHcAJZFGq3zcyPGbF68Ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJqiHHl0tgmtivoIeXRgV+ri6YNC3TRnF2dzdlK7CcA1gMsoa0oW9Pr9q4IhnlDO0EhfAiAfBQLO3F2gdONNzeI9hkStGVRGB+hIglnzLBC+XAndKX97+D6PHi7n73JmUcGV6DIONCnUAp43bYctLNBbRs3/lli1zfkOYsKarYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9lDkKbb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714911300; x=1746447300;
  h=date:from:to:cc:subject:message-id;
  bh=wtPFxJjqZfzkaieJGy0pleJHcAJZFGq3zcyPGbF68Ok=;
  b=E9lDkKbbPSEpezsea9HlW1dyhOyw5rdOKjVUGa1+Nu1jVRVTXAr9kg8t
   +K84qI4q6a6lnMMaoN509nUlDzSJRCE2+sUn0z0KpQ8i55+94H4Pb3fow
   60Lm7Vzyf80HgGmo3d7RNV/AeueJsfAiTNv/RJlTEqM3h/nNY+0GKFnyI
   /42nxvn7h2g8vOwbtKyk1d4mbSlQMd+uXYq6fg7x31K0mSD+pjq/hGtAs
   uv4gkMRKNXvF7hBUck1EOhjFH/ZfqvcouybKK+pjjim+3GAHzRQl2HnEJ
   Q1QpZWqBBeIx+gYeqaiKOM6JEgZezokwEBgQPss5zykWZ7OJ5h3JPqQNj
   w==;
X-CSE-ConnectionGUID: pRpV4fUcRwCWobCcMEPEkA==
X-CSE-MsgGUID: t5/NmyuxTiqiKvzeX+BCAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11198373"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="11198373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 05:14:59 -0700
X-CSE-ConnectionGUID: 4hPU9KUbQk6ZtTehP+lYUg==
X-CSE-MsgGUID: ww3IqZHLRCOtxS4porsXYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="28480776"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 May 2024 05:14:58 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3alb-0000Cb-2P;
	Sun, 05 May 2024 12:14:55 +0000
Date: Sun, 05 May 2024 20:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a2cf936ebef291ef7395172b9e2f624779fb6dc0
Message-ID: <202405052023.zwbpBOLA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a2cf936ebef291ef7395172b9e2f624779fb6dc0  usb: gadget: u_audio: Clear uac pointer when freed.

elapsed time: 1174m

configs tested: 177
configs skipped: 4

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
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240505   gcc  
arc                   randconfig-002-20240505   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                         assabet_defconfig   clang
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   clang
arm                   randconfig-001-20240505   clang
arm                   randconfig-002-20240505   gcc  
arm                   randconfig-003-20240505   gcc  
arm                   randconfig-004-20240505   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240505   clang
arm64                 randconfig-002-20240505   clang
arm64                 randconfig-003-20240505   clang
arm64                 randconfig-004-20240505   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240505   gcc  
csky                  randconfig-002-20240505   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240505   clang
hexagon               randconfig-002-20240505   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240505   clang
i386         buildonly-randconfig-002-20240505   clang
i386         buildonly-randconfig-003-20240505   clang
i386         buildonly-randconfig-004-20240505   gcc  
i386         buildonly-randconfig-005-20240505   clang
i386         buildonly-randconfig-006-20240505   clang
i386                                defconfig   clang
i386                  randconfig-001-20240505   clang
i386                  randconfig-002-20240505   clang
i386                  randconfig-003-20240505   gcc  
i386                  randconfig-004-20240505   clang
i386                  randconfig-005-20240505   gcc  
i386                  randconfig-006-20240505   gcc  
i386                  randconfig-011-20240505   gcc  
i386                  randconfig-012-20240505   gcc  
i386                  randconfig-013-20240505   clang
i386                  randconfig-014-20240505   gcc  
i386                  randconfig-015-20240505   gcc  
i386                  randconfig-016-20240505   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240505   gcc  
loongarch             randconfig-002-20240505   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         bigsur_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240505   gcc  
nios2                 randconfig-002-20240505   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240505   gcc  
parisc                randconfig-002-20240505   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc               randconfig-001-20240505   gcc  
powerpc               randconfig-002-20240505   clang
powerpc               randconfig-003-20240505   clang
powerpc64             randconfig-001-20240505   gcc  
powerpc64             randconfig-002-20240505   clang
powerpc64             randconfig-003-20240505   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240505   clang
riscv                 randconfig-002-20240505   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240505   gcc  
s390                  randconfig-002-20240505   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240505   gcc  
sh                    randconfig-002-20240505   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240505   gcc  
sparc64               randconfig-002-20240505   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240505   gcc  
um                    randconfig-002-20240505   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240505   gcc  
x86_64       buildonly-randconfig-002-20240505   clang
x86_64       buildonly-randconfig-003-20240505   clang
x86_64       buildonly-randconfig-004-20240505   clang
x86_64       buildonly-randconfig-005-20240505   gcc  
x86_64       buildonly-randconfig-006-20240505   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240505   clang
x86_64                randconfig-002-20240505   gcc  
x86_64                randconfig-003-20240505   clang
x86_64                randconfig-004-20240505   gcc  
x86_64                randconfig-005-20240505   gcc  
x86_64                randconfig-006-20240505   gcc  
x86_64                randconfig-011-20240505   clang
x86_64                randconfig-012-20240505   clang
x86_64                randconfig-013-20240505   clang
x86_64                randconfig-014-20240505   clang
x86_64                randconfig-015-20240505   clang
x86_64                randconfig-016-20240505   clang
x86_64                randconfig-071-20240505   clang
x86_64                randconfig-072-20240505   gcc  
x86_64                randconfig-073-20240505   gcc  
x86_64                randconfig-074-20240505   gcc  
x86_64                randconfig-075-20240505   clang
x86_64                randconfig-076-20240505   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240505   gcc  
xtensa                randconfig-002-20240505   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

