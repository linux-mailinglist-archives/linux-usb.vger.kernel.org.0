Return-Path: <linux-usb+bounces-14045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AE95E236
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 08:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1BC4281FF1
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 06:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BCA374D1;
	Sun, 25 Aug 2024 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTxxWVRO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39972AD22
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 06:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724566708; cv=none; b=R1P1clWsxQoeYKpcIw5wsDRF1OdvM1/YzyhjF5IMxE2eGRj0/L5vf3lspCVJjQn1jJIlFQepLwJxrEOsfghEnT69B8UpBqyG+4WtUhYlkK885WnXRO9rYFnOVB6jPJkD5q4g/UkGQGUbvAAHekotaiKLv9Uz47LJHlbxF9qe6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724566708; c=relaxed/simple;
	bh=R03nmN1vQn6Q75xMmjT0qZqeIrED2xCPKMjjABCdJIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BHGcuNZ1QoyDrClBtRPvFTu2fqZvQG1k5Xez7bfal854OOiYPGhcaX+V+sNluCZmKp7PWaXmLe3OVxhBRehKQTOfXbK9VwQmefzVLq4tb8EiOKnqwmkMBXfWhZMla7BOrcJEYxo0e9xMmOrIZScGzfHXjZzpjzkUsRJVm6RVrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTxxWVRO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724566706; x=1756102706;
  h=date:from:to:cc:subject:message-id;
  bh=R03nmN1vQn6Q75xMmjT0qZqeIrED2xCPKMjjABCdJIE=;
  b=DTxxWVROl3pC2AGpWMYWZhmvqJgjS2p0V/VlJUwellohL/YjFnbjNJ7O
   vSRPsCmy73L/ELdE+tgug0VrrOFqGNrqt3q/7DGyIZmJH+Pj0LU0KGxlx
   OFAVlf1glCrolf7ifTgmBDk6s+bO0Vu4Cfng3Ja3n8F9DMyzsNy5HGYvw
   mHjq8hYt3vRAnf+tFBMsPEzAFCFZvXQE+ZtmoRpUoQOZm9OdJnFm6WnLm
   42rE6HKhWBfdfyUL5FKX2/6YHzmma2Hj+Ha2CZDeRkh7vaV0MMKjxsZiv
   JH/XtEIGUbdw+TWvw1onvIICKcvkD4FDA4fwch1aFuodxvGa/VSxm/nyZ
   g==;
X-CSE-ConnectionGUID: KretRs36Srq5slf86BFMzA==
X-CSE-MsgGUID: DdSVxGjOQdqOWLLQsvZkmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25896285"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="25896285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 23:18:26 -0700
X-CSE-ConnectionGUID: s11CgpogQhaz9egwyXnq5w==
X-CSE-MsgGUID: mTXVjPTvTEKophgb3FulrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; 
   d="scan'208";a="62033037"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2024 23:18:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si6Zy-000Ezm-25;
	Sun, 25 Aug 2024 06:18:22 +0000
Date: Sun, 25 Aug 2024 14:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 9a03b9a88e4a44e358e3638736286442ae262497
Message-ID: <202408251433.bJWPyckq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9a03b9a88e4a44e358e3638736286442ae262497  usb: roles: add lockdep class key to struct usb_role_switch

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202408242231.WOLALxi9-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202408250737.xpHij5TD-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/usb/misc/onboard_usb_dev.c:329:15: error: implicit declaration of function 'i2c_smbus_write_block_data' [-Werror=implicit-function-declaration]
drivers/usb/misc/onboard_usb_dev.c:333:15: error: implicit declaration of function 'i2c_smbus_write_word_data' [-Werror=implicit-function-declaration]
onboard_usb_dev.c:(.text+0x1164): undefined reference to `i2c_find_device_by_fwnode'
s390-linux-ld: onboard_usb_dev.c:(.text+0x1206): undefined reference to `i2c_smbus_write_block_data'
s390-linux-ld: onboard_usb_dev.c:(.text+0x121e): undefined reference to `i2c_smbus_write_word_data'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-randconfig-001-20240824
|   |-- drivers-usb-misc-onboard_usb_dev.c:error:implicit-declaration-of-function-i2c_smbus_write_block_data
|   `-- drivers-usb-misc-onboard_usb_dev.c:error:implicit-declaration-of-function-i2c_smbus_write_word_data
`-- s390-randconfig-001-20240824
    |-- onboard_usb_dev.c:(.text):undefined-reference-to-i2c_find_device_by_fwnode
    |-- s390-linux-ld:onboard_usb_dev.c:(.text):undefined-reference-to-i2c_smbus_write_block_data
    `-- s390-linux-ld:onboard_usb_dev.c:(.text):undefined-reference-to-i2c_smbus_write_word_data

elapsed time: 1447m

configs tested: 239
configs skipped: 9

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240824   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240824   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   clang-20
arm                         mv78xx0_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240824   gcc-13.2.0
arm                   randconfig-001-20240825   gcc-13.2.0
arm                   randconfig-002-20240824   gcc-13.2.0
arm                   randconfig-002-20240825   gcc-13.2.0
arm                   randconfig-003-20240824   gcc-13.2.0
arm                   randconfig-003-20240825   gcc-13.2.0
arm                   randconfig-004-20240824   gcc-13.2.0
arm                   randconfig-004-20240825   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                           sunxi_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240824   gcc-13.2.0
arm64                 randconfig-001-20240825   gcc-13.2.0
arm64                 randconfig-002-20240824   gcc-13.2.0
arm64                 randconfig-002-20240825   gcc-13.2.0
arm64                 randconfig-003-20240824   gcc-13.2.0
arm64                 randconfig-003-20240825   gcc-13.2.0
arm64                 randconfig-004-20240824   gcc-13.2.0
arm64                 randconfig-004-20240825   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240824   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-13.2.0
csky                  randconfig-002-20240824   gcc-13.2.0
csky                  randconfig-002-20240825   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-004-20240825   clang-18
i386         buildonly-randconfig-005-20240824   clang-18
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240824   clang-18
i386         buildonly-randconfig-006-20240825   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-001-20240825   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-002-20240825   clang-18
i386                  randconfig-003-20240824   clang-18
i386                  randconfig-003-20240825   clang-18
i386                  randconfig-004-20240824   clang-18
i386                  randconfig-004-20240825   clang-18
i386                  randconfig-005-20240824   clang-18
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240824   clang-18
i386                  randconfig-012-20240825   clang-18
i386                  randconfig-013-20240824   clang-18
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240824   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240824   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240824   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240824   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-13.2.0
loongarch             randconfig-002-20240824   gcc-13.2.0
loongarch             randconfig-002-20240825   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240824   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-13.2.0
nios2                 randconfig-002-20240824   gcc-13.2.0
nios2                 randconfig-002-20240825   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240824   gcc-13.2.0
parisc                randconfig-001-20240825   gcc-13.2.0
parisc                randconfig-002-20240824   gcc-13.2.0
parisc                randconfig-002-20240825   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      pasemi_defconfig   clang-20
powerpc                     powernv_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      ppc64e_defconfig   clang-20
powerpc               randconfig-001-20240824   gcc-13.2.0
powerpc               randconfig-001-20240825   gcc-13.2.0
powerpc               randconfig-002-20240825   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-20
powerpc64             randconfig-001-20240824   gcc-13.2.0
powerpc64             randconfig-001-20240825   gcc-13.2.0
powerpc64             randconfig-002-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240824   gcc-13.2.0
riscv                 randconfig-001-20240825   gcc-13.2.0
riscv                 randconfig-002-20240824   gcc-13.2.0
riscv                 randconfig-002-20240825   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                          debug_defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240824   gcc-13.2.0
s390                  randconfig-001-20240825   gcc-13.2.0
s390                  randconfig-002-20240824   gcc-13.2.0
s390                  randconfig-002-20240825   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240824   gcc-13.2.0
sh                    randconfig-001-20240825   gcc-13.2.0
sh                    randconfig-002-20240824   gcc-13.2.0
sh                    randconfig-002-20240825   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240824   gcc-13.2.0
sparc64               randconfig-001-20240825   gcc-13.2.0
sparc64               randconfig-002-20240824   gcc-13.2.0
sparc64               randconfig-002-20240825   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240824   gcc-13.2.0
um                    randconfig-001-20240825   gcc-13.2.0
um                    randconfig-002-20240824   gcc-13.2.0
um                    randconfig-002-20240825   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240824   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240824   clang-18
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240824   clang-18
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240824   clang-18
x86_64       buildonly-randconfig-004-20240825   gcc-12
x86_64       buildonly-randconfig-005-20240824   clang-18
x86_64       buildonly-randconfig-005-20240825   gcc-12
x86_64       buildonly-randconfig-006-20240824   clang-18
x86_64       buildonly-randconfig-006-20240825   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240824   clang-18
x86_64                randconfig-001-20240825   gcc-12
x86_64                randconfig-002-20240824   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240824   clang-18
x86_64                randconfig-003-20240825   gcc-12
x86_64                randconfig-004-20240824   clang-18
x86_64                randconfig-004-20240825   gcc-12
x86_64                randconfig-005-20240824   clang-18
x86_64                randconfig-005-20240825   gcc-12
x86_64                randconfig-006-20240824   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240824   clang-18
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240824   clang-18
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240824   clang-18
x86_64                randconfig-013-20240825   gcc-12
x86_64                randconfig-014-20240824   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240824   clang-18
x86_64                randconfig-015-20240825   gcc-12
x86_64                randconfig-016-20240824   clang-18
x86_64                randconfig-016-20240825   gcc-12
x86_64                randconfig-071-20240824   clang-18
x86_64                randconfig-071-20240825   gcc-12
x86_64                randconfig-072-20240824   clang-18
x86_64                randconfig-072-20240825   gcc-12
x86_64                randconfig-073-20240824   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240824   clang-18
x86_64                randconfig-074-20240825   gcc-12
x86_64                randconfig-075-20240824   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240824   clang-18
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240824   gcc-13.2.0
xtensa                randconfig-001-20240825   gcc-13.2.0
xtensa                randconfig-002-20240824   gcc-13.2.0
xtensa                randconfig-002-20240825   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

