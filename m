Return-Path: <linux-usb+bounces-7112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEED8685A3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 02:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E392C1C234D0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 01:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7166E4A33;
	Tue, 27 Feb 2024 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkVmsHpr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8711723D0
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708996504; cv=none; b=IIq2pmmRBwHH3G0TKcTYsZlBIpsx+gIBSJWqfom87DZVD0xEGpGo/DGkX3eO5/jm9lEY2GW55vDMLYPzYdzgFSM4YO8M3Dn+mLDFoIuHkYfVrbKePazr8qtjKt+G8N45CAft0nhcEWSE6rnYgvfyTEerHc24PlkOv0tgJ1C+0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708996504; c=relaxed/simple;
	bh=5YFstHwtRusXMZTkD1at8ynKee4dQZmzJwKgiSclfVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jyxAOqrJWlB/B7E1f+eIi4Q1EsYxnqIA88iGJNIuRGDJlYmfR/yckUUgDTvdrE/wAwG0ZaYM3hgHV7cTONredx4+5nVFJ8/g3KvpOhspYbHvFNFAIWUyA+2x4fGuhwrK38zBlUyOWYDVCTcygRmkBTrafXlv2P3TaGTA8Eo/eQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkVmsHpr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708996503; x=1740532503;
  h=date:from:to:cc:subject:message-id;
  bh=5YFstHwtRusXMZTkD1at8ynKee4dQZmzJwKgiSclfVY=;
  b=BkVmsHpr2jV867ev4aXZ+BeUepRYY8zkOT8wSCne+HS0HAmvEW5tUQKN
   MzVW6fWg5F+Y/Pzoo/3lkJQtRnBP+DMnrKYlZ7K8Rqt/oiHGQuLxokdU6
   370K/OM5SHtnNqrBvb1uaYTsfeElX0WFn3E/oQGiAqIzLOh1ZWrv2rYlj
   NhP6pnnLqgsQuAuW9cWI67ygDzfsE0XAR/UMGUVsgSCP3qICfWjGsBQo3
   UywMqiLz0g32iMsgm8WnLeIVyvckOxEmbeBINk3zVqJGgOuPDKDBhSre4
   R6umemgIbhGN4fcQpCJFO9m6+RcmenaRqVTH1ImDaSmifKgUV0qfV15qY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3193831"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3193831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 17:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11527748"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Feb 2024 17:15:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rem3d-000ApN-2n;
	Tue, 27 Feb 2024 01:14:57 +0000
Date: Tue, 27 Feb 2024 09:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 a560a5672826fc1e057068bda93b3d4c98d037a2
Message-ID: <202402270907.1Y37FDfB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: a560a5672826fc1e057068bda93b3d4c98d037a2  Merge v6.8-rc6 into usb-next

elapsed time: 1151m

configs tested: 177
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
arc                   randconfig-001-20240226   gcc  
arc                   randconfig-002-20240226   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                          gemini_defconfig   clang
arm                         nhk8815_defconfig   clang
arm                   randconfig-001-20240226   clang
arm                   randconfig-002-20240226   clang
arm                   randconfig-003-20240226   clang
arm                   randconfig-004-20240226   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240226   gcc  
arm64                 randconfig-002-20240226   gcc  
arm64                 randconfig-003-20240226   gcc  
arm64                 randconfig-004-20240226   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240226   gcc  
csky                  randconfig-002-20240226   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240226   clang
hexagon               randconfig-002-20240226   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240226   clang
i386         buildonly-randconfig-002-20240226   gcc  
i386         buildonly-randconfig-003-20240226   clang
i386         buildonly-randconfig-004-20240226   clang
i386         buildonly-randconfig-005-20240226   clang
i386         buildonly-randconfig-006-20240226   clang
i386                                defconfig   clang
i386                  randconfig-001-20240226   clang
i386                  randconfig-002-20240226   gcc  
i386                  randconfig-003-20240226   clang
i386                  randconfig-004-20240226   gcc  
i386                  randconfig-005-20240226   clang
i386                  randconfig-006-20240226   clang
i386                  randconfig-011-20240226   gcc  
i386                  randconfig-012-20240226   gcc  
i386                  randconfig-013-20240226   gcc  
i386                  randconfig-014-20240226   gcc  
i386                  randconfig-015-20240226   gcc  
i386                  randconfig-016-20240226   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240226   gcc  
loongarch             randconfig-002-20240226   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   clang
mips                     loongson2k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240226   gcc  
nios2                 randconfig-002-20240226   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240226   gcc  
parisc                randconfig-002-20240226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc               randconfig-001-20240226   clang
powerpc               randconfig-002-20240226   gcc  
powerpc               randconfig-003-20240226   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240226   clang
powerpc64             randconfig-002-20240226   gcc  
powerpc64             randconfig-003-20240226   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240226   clang
riscv                 randconfig-002-20240226   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240226   clang
s390                  randconfig-002-20240226   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240226   gcc  
sh                    randconfig-002-20240226   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240226   gcc  
sparc64               randconfig-002-20240226   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240226   clang
um                    randconfig-002-20240226   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240226   clang
x86_64       buildonly-randconfig-002-20240226   gcc  
x86_64       buildonly-randconfig-003-20240226   gcc  
x86_64       buildonly-randconfig-004-20240226   clang
x86_64       buildonly-randconfig-005-20240226   gcc  
x86_64       buildonly-randconfig-006-20240226   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240226   gcc  
x86_64                randconfig-002-20240226   gcc  
x86_64                randconfig-003-20240226   clang
x86_64                randconfig-004-20240226   clang
x86_64                randconfig-005-20240226   clang
x86_64                randconfig-006-20240226   gcc  
x86_64                randconfig-011-20240226   clang
x86_64                randconfig-012-20240226   clang
x86_64                randconfig-013-20240226   clang
x86_64                randconfig-014-20240226   clang
x86_64                randconfig-015-20240226   clang
x86_64                randconfig-016-20240226   clang
x86_64                randconfig-071-20240226   clang
x86_64                randconfig-072-20240226   gcc  
x86_64                randconfig-073-20240226   gcc  
x86_64                randconfig-074-20240226   clang
x86_64                randconfig-075-20240226   gcc  
x86_64                randconfig-076-20240226   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240226   gcc  
xtensa                randconfig-002-20240226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

