Return-Path: <linux-usb+bounces-14071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FEE95E93D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 08:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A8CD1C21016
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 06:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F7982488;
	Mon, 26 Aug 2024 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrThJVzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751A4F215
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 06:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655156; cv=none; b=hAxxW3LmWs16jHP7y0VyTDTanAhFBHcg1VROZhvhyxyStGRFmm3KA9UZzVz3eezgm/GQGgn3p3Y7C7tmuQkp5gEh1lFtRsAwTRcvwVFRB9fFptsWINulSB8muPJVVgfhmsCxqCqcoHaivUoLmMyhthaUd/inj7g9D1ziin/Wrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655156; c=relaxed/simple;
	bh=IXcmLywCKgIrwYiG7OoszFd8C7OIJzvr1wnvrWUyJ7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R3BztAJ1uSMMdbCUNV1jez56L9WC3XpA/mCQXv2Jqd9a5qljgZLxbm6abDBdNSTQGJxu7Ve1H0xTa+iJ+cfQpwebjf8rdMIegUvaRhhEUHggLzhUlGdTnSV39iMYGztGJ4jyMXmXLblWkQn82AbrMDWkyONZcx4TX/839aGHtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrThJVzV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724655154; x=1756191154;
  h=date:from:to:cc:subject:message-id;
  bh=IXcmLywCKgIrwYiG7OoszFd8C7OIJzvr1wnvrWUyJ7g=;
  b=CrThJVzVTKZlG9bJsJr9Mt0rKCYapYMeyuSTAPHTa/k4GUuG+VXZZRGU
   hSIiwtlbb0KS+fXD5zzr8hQNXKi1DV7TbliJnvb/hk0I9MsgRWrdduFyZ
   946zusFbDhayW3RgMP1VSNz3HPDMz9Y7Qta/R/pdauX41uttGxzvz9JX3
   9sBXbfosN0Hcla3Uw0tsblmNOIsRd7395Xhec1Kezj9MYpGT7t2isIfNE
   d7pKBkwQanR4CZo35btUGQfhma9aa2zakJQd9WNiUB1XxVK5MHj5br/NN
   iZU0M+ddxbtXvg6R/PxYcWEDs08HkBqGpTJW5HD18WYSsftNtuA5UUHLH
   A==;
X-CSE-ConnectionGUID: v1gLfxhaSqWKn4sZ7J2gVA==
X-CSE-MsgGUID: pSuTnJdASZyyx3r1oA+4xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23188918"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; 
   d="scan'208";a="23188918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 23:52:34 -0700
X-CSE-ConnectionGUID: RwF7RlByTju2THrLv7Ambw==
X-CSE-MsgGUID: 8XxSMi6sTxChJsaj/i1vcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; 
   d="scan'208";a="67311056"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Aug 2024 23:52:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siTaY-000GMZ-0i;
	Mon, 26 Aug 2024 06:52:30 +0000
Date: Mon, 26 Aug 2024 14:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 fc88bb11617978fb3fcfcc697fd5c9d2dae9c4a3
Message-ID: <202408261415.qUduRsxf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: fc88bb11617978fb3fcfcc697fd5c9d2dae9c4a3  usb: roles: add lockdep class key to struct usb_role_switch

elapsed time: 1107m

configs tested: 212
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-12.3.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                       imx_v6_v7_defconfig   clang-20
arm                          ixp4xx_defconfig   gcc-12.3.0
arm                        neponset_defconfig   gcc-14.1.0
arm                       netwinder_defconfig   gcc-12.3.0
arm                   randconfig-001-20240825   clang-20
arm                   randconfig-002-20240825   gcc-14.1.0
arm                   randconfig-003-20240825   gcc-14.1.0
arm                   randconfig-004-20240825   gcc-14.1.0
arm                           stm32_defconfig   gcc-12.3.0
arm                         wpcm450_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240825   clang-20
arm64                 randconfig-002-20240825   gcc-14.1.0
arm64                 randconfig-003-20240825   clang-20
arm64                 randconfig-004-20240825   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240825   gcc-14.1.0
csky                  randconfig-002-20240825   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240825   clang-20
hexagon               randconfig-002-20240825   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-001-20240826   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-002-20240826   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-003-20240826   clang-18
i386         buildonly-randconfig-004-20240825   gcc-12
i386         buildonly-randconfig-004-20240826   clang-18
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-005-20240826   clang-18
i386         buildonly-randconfig-006-20240825   gcc-12
i386         buildonly-randconfig-006-20240826   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240825   gcc-12
i386                  randconfig-001-20240826   clang-18
i386                  randconfig-002-20240825   gcc-12
i386                  randconfig-002-20240826   clang-18
i386                  randconfig-003-20240825   gcc-12
i386                  randconfig-003-20240826   clang-18
i386                  randconfig-004-20240825   gcc-12
i386                  randconfig-004-20240826   clang-18
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-005-20240826   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-006-20240826   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-011-20240826   clang-18
i386                  randconfig-012-20240825   gcc-11
i386                  randconfig-012-20240826   clang-18
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-013-20240826   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-014-20240826   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-015-20240826   clang-18
i386                  randconfig-016-20240825   clang-18
i386                  randconfig-016-20240826   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240825   gcc-14.1.0
loongarch             randconfig-002-20240825   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   gcc-12.3.0
mips                           ip32_defconfig   clang-20
mips                    maltaup_xpa_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240825   gcc-14.1.0
nios2                 randconfig-002-20240825   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240825   gcc-14.1.0
parisc                randconfig-002-20240825   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                      ep88xc_defconfig   gcc-14.1.0
powerpc                 linkstation_defconfig   gcc-12.3.0
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                  mpc866_ads_defconfig   gcc-12.3.0
powerpc                  mpc885_ads_defconfig   gcc-12.3.0
powerpc                      pcm030_defconfig   gcc-12.3.0
powerpc               randconfig-001-20240825   gcc-14.1.0
powerpc               randconfig-002-20240825   gcc-14.1.0
powerpc64             randconfig-001-20240825   gcc-14.1.0
powerpc64             randconfig-002-20240825   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-14.1.0
riscv                            alldefconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-12.3.0
riscv                 randconfig-001-20240825   gcc-14.1.0
riscv                 randconfig-002-20240825   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240825   clang-20
s390                  randconfig-002-20240825   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                    randconfig-001-20240825   gcc-14.1.0
sh                    randconfig-002-20240825   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                      rts7751r2d1_defconfig   gcc-12.3.0
sh                   rts7751r2dplus_defconfig   gcc-12.3.0
sh                           se7724_defconfig   gcc-12.3.0
sh                           sh2007_defconfig   gcc-12.3.0
sh                             shx3_defconfig   gcc-12.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240825   gcc-14.1.0
sparc64               randconfig-002-20240825   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240825   gcc-12
um                    randconfig-002-20240825   gcc-12
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-12.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240825   clang-18
x86_64       buildonly-randconfig-005-20240825   clang-18
x86_64       buildonly-randconfig-006-20240825   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240825   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240825   clang-18
x86_64                randconfig-004-20240825   clang-18
x86_64                randconfig-005-20240825   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240825   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240825   clang-18
x86_64                randconfig-016-20240825   clang-18
x86_64                randconfig-071-20240825   clang-18
x86_64                randconfig-072-20240825   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240825   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240825   gcc-14.1.0
xtensa                randconfig-002-20240825   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

