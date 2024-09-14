Return-Path: <linux-usb+bounces-15113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790E978CF2
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 05:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0F21C22CDC
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 03:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADBD3219F;
	Sat, 14 Sep 2024 03:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZtgB9Cy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F917286A3
	for <linux-usb@vger.kernel.org>; Sat, 14 Sep 2024 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282840; cv=none; b=GIf1ETJztYlBO/UfZV+eVBBtwogNfICOuSCoKSemFXZeO8aS3XYCTCerYkq7BLTdHohL7TbMRatZ/f5fFM+mpYMN/4tBT3PeU8y0OZdFnIbhy3AE/tKwgKSnevDhyaKrzKV9Q03sMYoDCPKaNfzytYlsvX6Cz2U/CHzp+GCXQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282840; c=relaxed/simple;
	bh=d5HvnOJ3neff6ROF8fA8+8t4xFqms1lYw4N2lin8uOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f5kOkHuPx/e+XO+AFmbaGqmq7DthqUH5iO04/wJTdkue4gi7EtK3J2jsFB20OM0lhp+4Z4AGUH/TUTbShF27nbfSx2KRFuQ61v/5ocoTstwmVNEl84amkO2vkMgWlk6BydCSfezP+dNZ+rX9obCW0v8I61wye0VaXPnwBYlpGyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZtgB9Cy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726282839; x=1757818839;
  h=date:from:to:cc:subject:message-id;
  bh=d5HvnOJ3neff6ROF8fA8+8t4xFqms1lYw4N2lin8uOg=;
  b=iZtgB9CywvkzE9noNmBr26K23o7yUYHae/eHzJ0AYt9y+UBvgFtYupgr
   95dk1qaK+P0wnm64vRYo2IpUdGD5WvDIBa0nim+Jbu6oPvK4dmkPktdz8
   XucCG+c9v2SDiXjXcDvcg26FS6rGr9U2v//fJ1ELeVp/2FlPQ3gdrMmmL
   9/TrAL+IVvBny+c+WNH9rVM7CBYBFcNWZ9QL17JhpSpnxQnIPrUnnjgek
   jkFfqBemr9JqR0p4Wpjhd+9vYZv82gWdV6Q78XJW6+nZ+6G7X3anbUA6B
   dK/ZNzURVmDJRNX0YPukgEG6wEsMQhsKgmTL4wkfbyCDdXN+8BRjWE0dg
   w==;
X-CSE-ConnectionGUID: yZj5J6jiT4u6SkCmE/dugA==
X-CSE-MsgGUID: MfHJmXAoShqu4QkcliWZzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28941951"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="28941951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 20:00:38 -0700
X-CSE-ConnectionGUID: SLU4fCY/ROWh8ravlcApgA==
X-CSE-MsgGUID: uh8vcPVfTAK/ZCtyUwYNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68606283"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 20:00:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJ1W-0007I6-1V;
	Sat, 14 Sep 2024 03:00:34 +0000
Date: Sat, 14 Sep 2024 11:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD REGRESSION
 68d4209158f43a558c5553ea95ab0c8975eab18c
Message-ID: <202409141123.5BRBe2yS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 68d4209158f43a558c5553ea95ab0c8975eab18c  sub: cdns3: Use predefined PCI vendor ID constant

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com

    drivers/usb/misc/onboard_usb_dev.c:330:(.text+0xb58): undefined reference to `i2c_smbus_write_word_data'
    drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined reference to `i2c_smbus_write_block_data'
    riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.c:332:(.text+0xb8c): undefined reference to `i2c_smbus_write_word_data'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- riscv-randconfig-001-20240913
    |-- drivers-usb-misc-onboard_usb_dev.c:(.text):undefined-reference-to-i2c_smbus_write_block_data
    |-- drivers-usb-misc-onboard_usb_dev.c:(.text):undefined-reference-to-i2c_smbus_write_word_data
    `-- riscv64-linux-ld:drivers-usb-misc-onboard_usb_dev.c:(.text):undefined-reference-to-i2c_smbus_write_word_data

elapsed time: 744m

configs tested: 106
configs skipped: 5

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      jornada720_defconfig    clang-20
arm                            mmp2_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240914    clang-18
i386        buildonly-randconfig-002-20240914    clang-18
i386        buildonly-randconfig-003-20240914    clang-18
i386        buildonly-randconfig-004-20240914    clang-18
i386        buildonly-randconfig-005-20240914    clang-18
i386        buildonly-randconfig-006-20240914    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240914    clang-18
i386                  randconfig-002-20240914    clang-18
i386                  randconfig-003-20240914    clang-18
i386                  randconfig-004-20240914    clang-18
i386                  randconfig-005-20240914    clang-18
i386                  randconfig-006-20240914    clang-18
i386                  randconfig-011-20240914    clang-18
i386                  randconfig-012-20240914    clang-18
i386                  randconfig-013-20240914    clang-18
i386                  randconfig-014-20240914    clang-18
i386                  randconfig-015-20240914    clang-18
i386                  randconfig-016-20240914    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    clang-20
m68k                        m5307c3_defconfig    clang-20
m68k                          multi_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

