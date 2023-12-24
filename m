Return-Path: <linux-usb+bounces-4556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39481D838
	for <lists+linux-usb@lfdr.de>; Sun, 24 Dec 2023 09:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B05B1F21911
	for <lists+linux-usb@lfdr.de>; Sun, 24 Dec 2023 08:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A17139F;
	Sun, 24 Dec 2023 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpt2xz/w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5315A1
	for <linux-usb@vger.kernel.org>; Sun, 24 Dec 2023 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703406066; x=1734942066;
  h=date:from:to:cc:subject:message-id;
  bh=Qex4s8EreQ64AaULpgJL4ywlDW4NBJzmbPTxWBgsmQg=;
  b=Gpt2xz/wY1k4s/50C68qvsF0RvpfuC2RV3Kzb7O4UwRZxrADyfg22Ln2
   5MQ4hM8J30VesU7nKG20HdXB2ktdkJHzPDUwl4FaPg69nsLSvixGJwAww
   10FtsrXyYWKkO1aSO8ShfnJA2pSTbVP94QJGrPeUg4CvVtizodu3pRj5z
   YwztSGVGIxURf7I1BFIu7HctWg2BKLPhOWvI+zh3uBYRRPbSHz4EPawGd
   qLrnx9duCXr5Pq2VuYFUfXQeLZKfyx2LOBjYRVPoNaNuzkwVJVcpP5SPh
   4rwHF1fIEHtHYZmhloTdxmpZsdRaFI1Wd2B0wfm6iHJIhla8PaBJlYO8+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="3499718"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="3499718"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 00:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="806417414"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="806417414"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Dec 2023 00:21:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHJjJ-000C0p-2r;
	Sun, 24 Dec 2023 08:21:01 +0000
Date: Sun, 24 Dec 2023 16:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ab241a0ab5abd70036c3d959146e534a02447d17
Message-ID: <202312241604.tzelmZM3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ab241a0ab5abd70036c3d959146e534a02447d17  Merge tag 'usb-serial-6.7-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 2818m

configs tested: 123
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                   randconfig-001-20231224   gcc  
arc                   randconfig-002-20231224   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                   randconfig-001-20231224   gcc  
arm                   randconfig-002-20231224   gcc  
arm                   randconfig-003-20231224   gcc  
arm                   randconfig-004-20231224   gcc  
arm64                 randconfig-001-20231224   gcc  
arm64                 randconfig-002-20231224   gcc  
arm64                 randconfig-003-20231224   gcc  
arm64                 randconfig-004-20231224   gcc  
csky                  randconfig-001-20231224   gcc  
csky                  randconfig-002-20231224   gcc  
hexagon               randconfig-001-20231224   clang
hexagon               randconfig-002-20231224   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231223   clang
i386         buildonly-randconfig-002-20231223   clang
i386         buildonly-randconfig-003-20231223   clang
i386         buildonly-randconfig-004-20231223   clang
i386         buildonly-randconfig-005-20231223   clang
i386         buildonly-randconfig-006-20231223   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231223   clang
i386                  randconfig-002-20231223   clang
i386                  randconfig-003-20231223   clang
i386                  randconfig-004-20231223   clang
i386                  randconfig-005-20231223   clang
i386                  randconfig-006-20231223   clang
i386                  randconfig-011-20231223   gcc  
i386                  randconfig-012-20231223   gcc  
i386                  randconfig-013-20231223   gcc  
i386                  randconfig-014-20231223   gcc  
i386                  randconfig-015-20231223   gcc  
i386                  randconfig-016-20231223   gcc  
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20231224   gcc  
loongarch             randconfig-002-20231224   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltaaprp_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231224   gcc  
nios2                 randconfig-002-20231224   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231224   gcc  
parisc                randconfig-002-20231224   gcc  
parisc64                         alldefconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                     powernv_defconfig   clang
powerpc               randconfig-001-20231224   gcc  
powerpc               randconfig-002-20231224   gcc  
powerpc               randconfig-003-20231224   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231224   gcc  
powerpc64             randconfig-002-20231224   gcc  
powerpc64             randconfig-003-20231224   gcc  
riscv                 randconfig-001-20231224   gcc  
riscv                 randconfig-002-20231224   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231224   clang
s390                  randconfig-002-20231224   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20231224   gcc  
sh                    randconfig-002-20231224   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
um                               allmodconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231224   gcc  
x86_64       buildonly-randconfig-002-20231224   gcc  
x86_64       buildonly-randconfig-003-20231224   gcc  
x86_64       buildonly-randconfig-004-20231224   gcc  
x86_64       buildonly-randconfig-005-20231224   gcc  
x86_64       buildonly-randconfig-006-20231224   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231224   clang
x86_64                randconfig-002-20231224   clang
x86_64                randconfig-003-20231224   clang
x86_64                randconfig-004-20231224   clang
x86_64                randconfig-005-20231224   clang
x86_64                randconfig-006-20231224   clang
x86_64                randconfig-011-20231224   gcc  
x86_64                randconfig-012-20231224   gcc  
x86_64                randconfig-013-20231224   gcc  
x86_64                randconfig-014-20231224   gcc  
x86_64                randconfig-015-20231224   gcc  
x86_64                randconfig-016-20231224   gcc  
x86_64                randconfig-071-20231224   gcc  
x86_64                randconfig-072-20231224   gcc  
x86_64                randconfig-073-20231224   gcc  
x86_64                randconfig-074-20231224   gcc  
x86_64                randconfig-075-20231224   gcc  
x86_64                randconfig-076-20231224   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

