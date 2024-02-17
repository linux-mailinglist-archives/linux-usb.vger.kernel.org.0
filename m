Return-Path: <linux-usb+bounces-6636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19072858EE7
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 12:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD961C21634
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F7260BB8;
	Sat, 17 Feb 2024 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IedpSTgl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7305EE78
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708167710; cv=none; b=Lb2TOBi6qAWamibtP9u8BPHMjxaNh4d15Pe6iSnryN7FT+ZvWFe7UmbhxCLDQqPkehVzW0VfXIDdqkhULCchKBjaAL1edR95RZTFQmvtvTnN2B4KUXV63oZloKGeMB5cqv5InUoVkxFC5YpCpIx3VByUyk+ala2Q3AYSW+ld2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708167710; c=relaxed/simple;
	bh=pRnMaBdkHPXgHMhgumKQzrOOatCC6SLZok2pMWWIZ9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=blvA6Xl1IobBhGOECT0JQfkKRfx9cHaG2o6KWD7NJMll1P2dxLTZUapvgbn8Ayw/vPIxQOt+eUCcpvh5vpqVwte920+LxvmmBSVuj2rqRsbcusjjBE6nmtRn64wVLgaPZXRqWRIk0muvpmehdAa86t8vFkJbc5ZHJtfw+MoSf4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IedpSTgl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708167708; x=1739703708;
  h=date:from:to:cc:subject:message-id;
  bh=pRnMaBdkHPXgHMhgumKQzrOOatCC6SLZok2pMWWIZ9M=;
  b=IedpSTgl0Cp9hUmUUdLm4WT3Yd+AT2uZ5eKapXetXam8ilAJM+VrdZiq
   HQbhyCowZcy+HB3lN7kaVpsUWSr1WOglgVWkZUVekc7q3ab9UkaLnKpvL
   eqH/D7HRq7w1Smn45NEY6ya0z/zJlpugUOEH6xyYZHErMH6H3nc2tnVZO
   M9lwbbAHo2oqaR9jZQh9ZNnrpirSD9CeeWuApzarqQx0M0R1LnLJzFtDO
   JhoeJ8PwU0jKeZjp/1CsiE227KiFh+RgDpExoV4UVFRVgOYo6xMQy9vLU
   21wGKYMZpac3OAl7gx4tVg4sXaStvJtEquP8JZeNrR+0tikP0qG9OXHMD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27746876"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="27746876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 03:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4448456"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2024 03:01:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbIRv-000240-0X;
	Sat, 17 Feb 2024 11:01:43 +0000
Date: Sat, 17 Feb 2024 19:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 b4734507ac55cc7ea1380e20e83f60fcd7031955
Message-ID: <202402171917.DZkiGhXd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: b4734507ac55cc7ea1380e20e83f60fcd7031955  thunderbolt: Improve DisplayPort tunnel setup process to be more robust

elapsed time: 1451m

configs tested: 195
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240217   gcc  
arc                   randconfig-002-20240217   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-002-20240217   gcc  
arm                   randconfig-003-20240217   gcc  
arm                   randconfig-004-20240217   gcc  
arm                         s5pv210_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240217   gcc  
arm64                 randconfig-003-20240217   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240217   gcc  
csky                  randconfig-002-20240217   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240216   gcc  
i386         buildonly-randconfig-001-20240217   gcc  
i386         buildonly-randconfig-002-20240216   clang
i386         buildonly-randconfig-002-20240217   clang
i386         buildonly-randconfig-003-20240216   clang
i386         buildonly-randconfig-003-20240217   gcc  
i386         buildonly-randconfig-004-20240216   gcc  
i386         buildonly-randconfig-004-20240217   gcc  
i386         buildonly-randconfig-005-20240216   gcc  
i386         buildonly-randconfig-005-20240217   gcc  
i386         buildonly-randconfig-006-20240216   clang
i386         buildonly-randconfig-006-20240217   clang
i386                                defconfig   clang
i386                  randconfig-001-20240216   clang
i386                  randconfig-001-20240217   gcc  
i386                  randconfig-002-20240216   clang
i386                  randconfig-002-20240217   gcc  
i386                  randconfig-003-20240216   gcc  
i386                  randconfig-003-20240217   clang
i386                  randconfig-004-20240216   clang
i386                  randconfig-004-20240217   gcc  
i386                  randconfig-005-20240216   gcc  
i386                  randconfig-005-20240217   gcc  
i386                  randconfig-006-20240216   clang
i386                  randconfig-006-20240217   clang
i386                  randconfig-011-20240216   gcc  
i386                  randconfig-011-20240217   gcc  
i386                  randconfig-012-20240216   gcc  
i386                  randconfig-012-20240217   gcc  
i386                  randconfig-013-20240216   gcc  
i386                  randconfig-013-20240217   clang
i386                  randconfig-014-20240216   clang
i386                  randconfig-014-20240217   clang
i386                  randconfig-015-20240216   gcc  
i386                  randconfig-015-20240217   clang
i386                  randconfig-016-20240216   gcc  
i386                  randconfig-016-20240217   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240217   gcc  
loongarch             randconfig-002-20240217   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240217   gcc  
nios2                 randconfig-002-20240217   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240217   gcc  
parisc                randconfig-002-20240217   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc                     kmeter1_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240217   gcc  
powerpc               randconfig-002-20240217   gcc  
powerpc               randconfig-003-20240217   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-002-20240217   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240217   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240217   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240217   gcc  
sh                    randconfig-002-20240217   gcc  
sh                          sdk7780_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240217   gcc  
sparc64               randconfig-002-20240217   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240217   gcc  
x86_64       buildonly-randconfig-003-20240217   gcc  
x86_64       buildonly-randconfig-004-20240217   gcc  
x86_64       buildonly-randconfig-006-20240217   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240217   gcc  
x86_64                randconfig-011-20240217   gcc  
x86_64                randconfig-012-20240217   gcc  
x86_64                randconfig-014-20240217   gcc  
x86_64                randconfig-015-20240217   gcc  
x86_64                randconfig-071-20240217   gcc  
x86_64                randconfig-072-20240217   gcc  
x86_64                randconfig-073-20240217   gcc  
x86_64                randconfig-075-20240217   gcc  
x86_64                randconfig-076-20240217   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240217   gcc  
xtensa                randconfig-002-20240217   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

