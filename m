Return-Path: <linux-usb+bounces-1171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D037BAE34
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 23:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A4D5228245B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 21:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E0242C0E;
	Thu,  5 Oct 2023 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X800UsZI"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2041E37
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 21:55:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915E59E
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 14:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696542911; x=1728078911;
  h=date:from:to:cc:subject:message-id;
  bh=aFRZc5JCdSgkmGMWciwsKOFLreqNKpeP7ercxrBPKXI=;
  b=X800UsZIDRMIH8yUqwIAl88dwQLoJfcCu/i7MVIixqRf+glvAWb8CPQV
   QNz+DqK/p4YWZkN+VqVgkcfLh8ORTDlH0Nh12XBccQYYV812kWrpa84Cf
   S46XK7M4HF0ExTMj97UviRLrvC/TrGDtz0aLRW69E5LBl7E3hpP/2GCAN
   ug8cjvtt75GaU+WGHb8L0x/6yDraMXYQ0RWvOzapDLpzx7wgE1rroEAT0
   ojr4qxak7tTeUGTmgkbXjy1jyOWXfT7lKI5aVrEHpW5cc3e7UTOp/uGoD
   rgdt4pmREduIFT16RuubiaMOzmpDAoJx+3MTfY7PN+uuZnvlhVjf3QXeG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2233895"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2233895"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 14:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895628018"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895628018"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2023 14:53:39 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoWJG-000Lvz-2Z;
	Thu, 05 Oct 2023 21:55:06 +0000
Date: Fri, 06 Oct 2023 05:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 ec4405ed92036f5bb487b5c2f9a28f9e36a3e3d5
Message-ID: <202310060551.wwxtbYud-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: ec4405ed92036f5bb487b5c2f9a28f9e36a3e3d5  thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished

elapsed time: 731m

configs tested: 133
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231005   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20231005   gcc  
arm                   randconfig-001-20231006   gcc  
arm                         vf610m4_defconfig   gcc  
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
i386         buildonly-randconfig-001-20231005   gcc  
i386         buildonly-randconfig-001-20231006   gcc  
i386         buildonly-randconfig-002-20231005   gcc  
i386         buildonly-randconfig-002-20231006   gcc  
i386         buildonly-randconfig-003-20231005   gcc  
i386         buildonly-randconfig-003-20231006   gcc  
i386         buildonly-randconfig-004-20231005   gcc  
i386         buildonly-randconfig-004-20231006   gcc  
i386         buildonly-randconfig-005-20231005   gcc  
i386         buildonly-randconfig-005-20231006   gcc  
i386         buildonly-randconfig-006-20231005   gcc  
i386         buildonly-randconfig-006-20231006   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231005   gcc  
i386                  randconfig-001-20231006   gcc  
i386                  randconfig-002-20231005   gcc  
i386                  randconfig-002-20231006   gcc  
i386                  randconfig-003-20231005   gcc  
i386                  randconfig-003-20231006   gcc  
i386                  randconfig-004-20231005   gcc  
i386                  randconfig-004-20231006   gcc  
i386                  randconfig-005-20231005   gcc  
i386                  randconfig-005-20231006   gcc  
i386                  randconfig-006-20231005   gcc  
i386                  randconfig-006-20231006   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231005   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
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
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
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
x86_64                randconfig-001-20231005   gcc  
x86_64                randconfig-002-20231005   gcc  
x86_64                randconfig-003-20231005   gcc  
x86_64                randconfig-004-20231005   gcc  
x86_64                randconfig-005-20231005   gcc  
x86_64                randconfig-006-20231005   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

