Return-Path: <linux-usb+bounces-19225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C2A0AB12
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 18:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783B8163ECC
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 17:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919A11BEF98;
	Sun, 12 Jan 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyPHqEQY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB638DC0
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736701240; cv=none; b=Nind5GJhBh3SKzL99VUFXFT8f2KoTqaalrIWkCoYrpBstPXK0/u3vg9KwFCUmnjFMxbn7/H4RMhwXUIXS6NPx+VxYagp+OxJqMvXKQIlJ++4lvB7mQxPCGAw2uypuvrAsrq6p7LpyViKw6baYVewAWFUkcuBGkRdF9+u4c0yR8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736701240; c=relaxed/simple;
	bh=Jnq6dlDSy6I3tQ54QGT5wtbmwF7x/47lM2JV3/JGp5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1GFZBZ4LXhwWYtwO4A3PcPPpBaclFHJQs6WpS2HJoHVajz4EBsm/uwjksDEKcPAOBJ4q6spCMw7eEbBKy4Vzjqy9Fyx//VFCUcyvP2iEXGHn/uXfiurHQVBaS/4nbQOir+0HD1Xd5y1PYp+xieHDqxKaszKce7BK6T07CTzA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyPHqEQY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736701239; x=1768237239;
  h=date:from:to:cc:subject:message-id;
  bh=Jnq6dlDSy6I3tQ54QGT5wtbmwF7x/47lM2JV3/JGp5o=;
  b=eyPHqEQYtUYJxDwjhjfOTqF0TWpKWkBpL3axZKf64AZ/Fh2jGnfdN8VK
   7CROzV9J9cZZeR71VapmX3HegK3Oq328vCMESTcIcOGN6+7Iy5dBwrJS2
   hZdFHWcqs3gQFqd/5u+hbpFYqD2XhlW9eBoOdchtbhtA+W34fwdpAk61U
   Ed+87y5zysk3B3FQ1vrFAmBljvzeWWoo9Wp8J3yOIWtJF9TpO+lT0ZrV1
   jymeQVZdgWlF8FUsD/e8Ll5ZX0/wMhNNXsphBDy3wFo1H3u491On5JqkO
   r9FrwWO/I8m+Xg8uzO0vcyQlJsN2lyUGN49aPsAhmkgZFf0KzlM7gYx0H
   Q==;
X-CSE-ConnectionGUID: +20EJ2srTleXqDHT+6buFg==
X-CSE-MsgGUID: 4dfAu2sUTsa3YzHagpO8Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36949754"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36949754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 09:00:36 -0800
X-CSE-ConnectionGUID: pwhiNu3WSPe91981AmBNEg==
X-CSE-MsgGUID: wC0/Wiu6QWOuTdwfcmC+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104097701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2025 09:00:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX1KB-000MDE-2o;
	Sun, 12 Jan 2025 17:00:31 +0000
Date: Mon, 13 Jan 2025 01:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 594c82329eef335ad90f5276ae0d2dff4d6d2668
Message-ID: <202501130104.OFl9C0ho-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 594c82329eef335ad90f5276ae0d2dff4d6d2668  usb: host: xhci-plat: Assign shared_hcd->rsrc_start

elapsed time: 1442m

configs tested: 153
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                   randconfig-001-20250112    gcc-13.2.0
arc                   randconfig-002-20250112    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                         bcm2835_defconfig    clang-16
arm                          collie_defconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                          gemini_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20250112    clang-20
arm                   randconfig-002-20250112    gcc-14.2.0
arm                   randconfig-003-20250112    clang-20
arm                   randconfig-004-20250112    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250112    gcc-14.2.0
arm64                 randconfig-002-20250112    clang-17
arm64                 randconfig-003-20250112    clang-19
arm64                 randconfig-004-20250112    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250112    gcc-14.2.0
csky                  randconfig-002-20250112    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20250112    clang-20
hexagon               randconfig-002-20250112    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250112    gcc-12
i386        buildonly-randconfig-002-20250112    clang-19
i386        buildonly-randconfig-003-20250112    clang-19
i386        buildonly-randconfig-004-20250112    gcc-12
i386        buildonly-randconfig-005-20250112    gcc-12
i386        buildonly-randconfig-006-20250112    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250112    gcc-14.2.0
loongarch             randconfig-002-20250112    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
mips                          eyeq6_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250112    gcc-14.2.0
nios2                 randconfig-002-20250112    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250112    gcc-14.2.0
parisc                randconfig-002-20250112    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-20
powerpc                 linkstation_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc               randconfig-001-20250112    clang-20
powerpc               randconfig-002-20250112    clang-19
powerpc               randconfig-003-20250112    clang-20
powerpc                     sequoia_defconfig    clang-17
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250112    gcc-14.2.0
powerpc64             randconfig-002-20250112    gcc-14.2.0
powerpc64             randconfig-003-20250112    clang-19
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250112    clang-20
riscv                 randconfig-002-20250112    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250112    clang-16
s390                  randconfig-002-20250112    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250112    gcc-14.2.0
sh                    randconfig-002-20250112    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250112    gcc-14.2.0
sparc                 randconfig-002-20250112    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250112    gcc-14.2.0
sparc64               randconfig-002-20250112    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250112    clang-20
um                    randconfig-002-20250112    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250112    gcc-12
x86_64      buildonly-randconfig-002-20250112    clang-19
x86_64      buildonly-randconfig-003-20250112    clang-19
x86_64      buildonly-randconfig-004-20250112    clang-19
x86_64      buildonly-randconfig-005-20250112    clang-19
x86_64      buildonly-randconfig-006-20250112    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250112    gcc-14.2.0
xtensa                randconfig-002-20250112    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

