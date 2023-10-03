Return-Path: <linux-usb+bounces-981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662F7B5F2A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 04:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 1E1E31C2088D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 02:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A75A2C;
	Tue,  3 Oct 2023 02:53:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0F812
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:53:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3801C6
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696301595; x=1727837595;
  h=date:from:to:cc:subject:message-id;
  bh=te8OQWuabKYBjOULQbioxbNQ1DCOHJ5txTOAbuli9uA=;
  b=TJHiGvmbs1ek86E1IoJC/c+08VT/N93rof4Iautt6Ghy77cojqzIFFtZ
   TU7N3OISMx/XXjdRKO4c3wHoZnvGYflt+yDSncDL98j2elOVtKbrGIyxC
   c8v+99RjfxPGKhjeFpTVvY/eHNUvrBq88kwWtELbl2bFFYFNsRGB9kJez
   muFY10TGsxVNc5AUDOKk1mRcX/RTE6OqKX/YN488+yTOvHJ8Opot12zDp
   MB7YFAYnmXqsSBIkyfXvqVK7R0mCG2v+ut2ghRvbdlowkg3+h64k/rPg1
   O10QP37GpiIXV0adw4/xCK8qSt0E8T3BF9ptEFUzcLFlCw4NDs6iuzfDU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4347523"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="4347523"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 19:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894322859"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="894322859"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2023 19:51:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnVX6-0006gr-0U;
	Tue, 03 Oct 2023 02:53:12 +0000
Date: Tue, 03 Oct 2023 10:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 cf97c5e0f7dda2edc15ecd96775fe6c355823784
Message-ID: <202310031056.vZ3PYMmU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: cf97c5e0f7dda2edc15ecd96775fe6c355823784  xhci: Preserve RsvdP bits in ERSTBA register correctly

elapsed time: 726m

configs tested: 125
configs skipped: 2

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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20231003   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20231003   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231003   gcc  
i386         buildonly-randconfig-002-20231003   gcc  
i386         buildonly-randconfig-003-20231003   gcc  
i386         buildonly-randconfig-004-20231003   gcc  
i386         buildonly-randconfig-005-20231003   gcc  
i386         buildonly-randconfig-006-20231003   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231003   gcc  
i386                  randconfig-002-20231003   gcc  
i386                  randconfig-003-20231003   gcc  
i386                  randconfig-004-20231003   gcc  
i386                  randconfig-005-20231003   gcc  
i386                  randconfig-006-20231003   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231002   gcc  
loongarch             randconfig-001-20231003   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231003   gcc  
x86_64                randconfig-002-20231003   gcc  
x86_64                randconfig-003-20231003   gcc  
x86_64                randconfig-004-20231003   gcc  
x86_64                randconfig-005-20231003   gcc  
x86_64                randconfig-006-20231003   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

