Return-Path: <linux-usb+bounces-4108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A5810F84
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 12:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A62DB20C31
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 11:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90423759;
	Wed, 13 Dec 2023 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHHzPtIB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89762A0
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702465984; x=1734001984;
  h=date:from:to:cc:subject:message-id;
  bh=3NBRWtrtLH5iKSpd///ai7MZHtMoShnItT+F5zgnX7Y=;
  b=cHHzPtIBDq3FRn3FzgVby3f538pJjZHoH6zA5TwL5djdzjmVxTd7EW85
   ivCKIO5ziMGptuMvgpRqSiLYVz/OcPqaMILU2xv84BLvIIl7ib5XP1oCa
   M15CMgQ82dIu99hFuCFhcPDvml4oCRvWXaFDrYN/l7O3xB/hmnYcLF1yM
   /wHiVFagUK/S8zSReWwNpgaex9U9NR+CSsssQMV9eFfJp2BKECR+olwdK
   7q+zrFJWI0klfbcT61L6hL1YwMgxjGIY03CHfbGCg6xUHxDxXZWDetwrx
   zfxZVsEZPgIGsPGZ4glS2Q4QuDsUfPpNwODpDzvJoDvjQTZAsr+4M7uqD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2121194"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2121194"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 03:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773911311"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773911311"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 03:13:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDNAi-000KSb-2b;
	Wed, 13 Dec 2023 11:13:00 +0000
Date: Wed, 13 Dec 2023 19:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 da48708e873312aeba42481f12e2982f8a8ffb80
Message-ID: <202312131955.41cJyasq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: da48708e873312aeba42481f12e2982f8a8ffb80  Merge tag 'thunderbolt-for-v6.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 1465m

configs tested: 205
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231213   gcc  
arc                   randconfig-002-20231213   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231213   clang
arm                   randconfig-002-20231213   clang
arm                   randconfig-003-20231213   clang
arm                   randconfig-004-20231213   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231213   clang
arm64                 randconfig-002-20231213   clang
arm64                 randconfig-003-20231213   clang
arm64                 randconfig-004-20231213   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231213   gcc  
csky                  randconfig-002-20231213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231213   clang
hexagon               randconfig-002-20231213   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231212   gcc  
i386         buildonly-randconfig-002-20231212   gcc  
i386         buildonly-randconfig-003-20231212   gcc  
i386         buildonly-randconfig-004-20231212   gcc  
i386         buildonly-randconfig-005-20231212   gcc  
i386         buildonly-randconfig-006-20231212   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231212   gcc  
i386                  randconfig-002-20231212   gcc  
i386                  randconfig-003-20231212   gcc  
i386                  randconfig-004-20231212   gcc  
i386                  randconfig-005-20231212   gcc  
i386                  randconfig-006-20231212   gcc  
i386                  randconfig-011-20231212   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-012-20231212   clang
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-013-20231212   clang
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-014-20231212   clang
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-015-20231212   clang
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-016-20231212   clang
i386                  randconfig-016-20231213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231213   gcc  
loongarch             randconfig-002-20231213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                            gpr_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231213   gcc  
nios2                 randconfig-002-20231213   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231213   gcc  
parisc                randconfig-002-20231213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20231213   clang
powerpc               randconfig-002-20231213   clang
powerpc               randconfig-003-20231213   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc64             randconfig-001-20231213   clang
powerpc64             randconfig-002-20231213   clang
powerpc64             randconfig-003-20231213   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231213   clang
riscv                 randconfig-002-20231213   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231213   gcc  
s390                  randconfig-002-20231213   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20231213   gcc  
sh                    randconfig-002-20231213   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                 randconfig-001-20231213   gcc  
sparc                 randconfig-002-20231213   gcc  
sparc                       sparc32_defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231213   gcc  
sparc64               randconfig-002-20231213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231213   clang
um                    randconfig-002-20231213   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231213   clang
x86_64       buildonly-randconfig-002-20231213   clang
x86_64       buildonly-randconfig-003-20231213   clang
x86_64       buildonly-randconfig-004-20231213   clang
x86_64       buildonly-randconfig-005-20231213   clang
x86_64       buildonly-randconfig-006-20231213   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231213   clang
x86_64                randconfig-012-20231213   clang
x86_64                randconfig-013-20231213   clang
x86_64                randconfig-014-20231213   clang
x86_64                randconfig-015-20231213   clang
x86_64                randconfig-016-20231213   clang
x86_64                randconfig-071-20231213   clang
x86_64                randconfig-072-20231213   clang
x86_64                randconfig-073-20231213   clang
x86_64                randconfig-074-20231213   clang
x86_64                randconfig-075-20231213   clang
x86_64                randconfig-076-20231213   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231213   gcc  
xtensa                randconfig-002-20231213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

