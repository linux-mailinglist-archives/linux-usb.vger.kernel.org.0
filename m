Return-Path: <linux-usb+bounces-3281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0287F7264
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25856B21226
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FD21A733;
	Fri, 24 Nov 2023 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ4Drx0o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4978D67
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700823976; x=1732359976;
  h=date:from:to:cc:subject:message-id;
  bh=IKs+isjP74Sj4EwewcZBVGpDfcINW1blwAl6Lxl6srk=;
  b=UJ4Drx0o9EqFfel6BYGhzztnGFOOJvRGmbnQsfU8wTOhaxr/v9TK2+3W
   8ypGt7uBS9INq8WOK+4cfpzZfdhhgX6aX9src6ni283myH8ObXBlrQsW0
   m09sd/3F/OyaTUXW5p/JiCWLcyVk9Lcn7iedkyON+BQHW9h18stBYJIC7
   QOE2rDpAEMeilQLM/MMt2PXt2wPnNp4A0updbtfEPDUUsdws5Mo0CuOUJ
   WrqK2IMyDvZ24IPOh8CIMRfdL6o8x+JIcbZu3ydnqVMfBXGk8+rnrH3Oh
   6pA40KcllSWm2ty//wEIirhADRaS+8tKtvvnhMA+Trjg6DG87wDia+CiR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423542514"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423542514"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885245612"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="885245612"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 03:06:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6U0f-0002cv-2i;
	Fri, 24 Nov 2023 11:06:09 +0000
Date: Fri, 24 Nov 2023 19:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 9cf87666fc6e08572341fe08ecd909935998fbbd
Message-ID: <202311241952.mqRbf3w5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 9cf87666fc6e08572341fe08ecd909935998fbbd  USB: dwc3: qcom: fix ACPI platform device leak

elapsed time: 2788m

configs tested: 142
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                          axs103_defconfig   gcc  
arc                   randconfig-001-20231123   gcc  
arc                   randconfig-002-20231123   gcc  
arm                     am200epdkit_defconfig   clang
arm                          collie_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20231123   gcc  
arm                   randconfig-002-20231123   gcc  
arm                   randconfig-003-20231123   gcc  
arm                   randconfig-004-20231123   gcc  
arm64                 randconfig-001-20231123   gcc  
arm64                 randconfig-002-20231123   gcc  
arm64                 randconfig-003-20231123   gcc  
arm64                 randconfig-004-20231123   gcc  
csky                  randconfig-001-20231123   gcc  
csky                  randconfig-002-20231123   gcc  
hexagon               randconfig-001-20231123   clang
hexagon               randconfig-002-20231123   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231122   clang
i386         buildonly-randconfig-002-20231122   clang
i386         buildonly-randconfig-003-20231122   clang
i386         buildonly-randconfig-004-20231122   clang
i386         buildonly-randconfig-005-20231122   clang
i386         buildonly-randconfig-006-20231122   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231122   clang
i386                  randconfig-002-20231122   clang
i386                  randconfig-003-20231122   clang
i386                  randconfig-004-20231122   clang
i386                  randconfig-005-20231122   clang
i386                  randconfig-006-20231122   clang
i386                  randconfig-011-20231122   gcc  
i386                  randconfig-012-20231122   gcc  
i386                  randconfig-013-20231122   gcc  
i386                  randconfig-014-20231122   gcc  
i386                  randconfig-015-20231122   gcc  
i386                  randconfig-016-20231122   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231123   gcc  
loongarch             randconfig-002-20231123   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231123   gcc  
nios2                 randconfig-002-20231123   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231123   gcc  
parisc                randconfig-002-20231123   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc               randconfig-001-20231123   gcc  
powerpc               randconfig-002-20231123   gcc  
powerpc               randconfig-003-20231123   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc64             randconfig-001-20231123   gcc  
powerpc64             randconfig-002-20231123   gcc  
powerpc64             randconfig-003-20231123   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231123   gcc  
riscv                 randconfig-002-20231123   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231123   clang
s390                  randconfig-002-20231123   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231123   gcc  
sh                    randconfig-002-20231123   gcc  
sh                           se7705_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231123   gcc  
sparc64               randconfig-002-20231123   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20231123   gcc  
um                    randconfig-002-20231123   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231122   clang
x86_64       buildonly-randconfig-002-20231122   clang
x86_64       buildonly-randconfig-003-20231122   clang
x86_64       buildonly-randconfig-004-20231122   clang
x86_64       buildonly-randconfig-005-20231122   clang
x86_64       buildonly-randconfig-006-20231122   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231122   gcc  
x86_64                randconfig-002-20231122   gcc  
x86_64                randconfig-003-20231122   gcc  
x86_64                randconfig-004-20231122   gcc  
x86_64                randconfig-005-20231122   gcc  
x86_64                randconfig-006-20231122   gcc  
x86_64                randconfig-011-20231122   clang
x86_64                randconfig-012-20231122   clang
x86_64                randconfig-013-20231122   clang
x86_64                randconfig-014-20231122   clang
x86_64                randconfig-015-20231122   clang
x86_64                randconfig-016-20231122   clang
x86_64                randconfig-071-20231122   clang
x86_64                randconfig-072-20231122   clang
x86_64                randconfig-073-20231122   clang
x86_64                randconfig-074-20231122   clang
x86_64                randconfig-075-20231122   clang
x86_64                randconfig-076-20231122   clang
x86_64                          rhel-8.3-rust   clang
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231123   gcc  
xtensa                randconfig-002-20231123   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

