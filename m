Return-Path: <linux-usb+bounces-17660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C291B9D0499
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 16:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23C4CB21E28
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499A21D9A6F;
	Sun, 17 Nov 2024 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvIYtrhi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E11A937
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731859070; cv=none; b=W/QMwNVT3ej2d5vqntDJYrSimn8msc8f3HXcF3eCh7ZQKOjSjVpN9dY452d1cpYIwWUDW5ST1cJ8IbUdg7ow0tNLkY3v3UUz0InRinEs7KLCRfmkgW/IgE0dougmTVMALx+fgMLTw+fINo4VYnw/U+xmchBsRZE0aXnka2jjDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731859070; c=relaxed/simple;
	bh=J5Knl3ZZZNLhj/ELt3ehFzFFXUud5cyw8wjHBnCqKfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ggaXDxVaTKyknOZznSXWCxO7sc25jjylLhj310S2bceXXKFms87X4/eufAEYYXp1gN6pQzsV5qZgeLePoXkyBOqBxBeOoy/Z+CJ3bywRHP7PkVi8m3tZi4Wgt4lFsovuh4fZ7TYeUKELr4g6ienAtBfr+/ZtVWbVmiaV7Tb9Vas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvIYtrhi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731859069; x=1763395069;
  h=date:from:to:cc:subject:message-id;
  bh=J5Knl3ZZZNLhj/ELt3ehFzFFXUud5cyw8wjHBnCqKfU=;
  b=bvIYtrhiw6G8NoVctvlwVoJDou2UgkudWcuNYkegfDHvkMzjYcICkIm+
   kf1P55sQbh9WLJTqDOEcJ06QBoTGIEHp3Lq91rVijhjtwKkDPfE3y0Qox
   Zo/V1eTrFu0CxZbJc961+3wvCmgdTDdMTeAU51lVtF24+skv4qT/b/2Fo
   S3+xznoBSB8WLut2ob5R8/zHpt3lt+0yMeQ9KMuzIeYPs6UvXyn+7Saw6
   6mJGPVn1hJN0QQHF75Uq9FqEqN8B5RugFNUrtBz7roFGeMFhiqoluHNuc
   vTR6Jm4Qsw9HtL1JjT+/K3KMJeOKf8sPWydYVSXTo7nzIRPo2JLWZ80aL
   A==;
X-CSE-ConnectionGUID: QeD/A7/7QS6RZ0VDJjJ/LA==
X-CSE-MsgGUID: mxEAOefSSIOsJXPTFj9n1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="34673453"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="34673453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 07:57:49 -0800
X-CSE-ConnectionGUID: C+aT3cgpTmuGiZYDeTjRtg==
X-CSE-MsgGUID: OGnnuX2ESiq/BSrGjyQ3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93843419"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2024 07:57:47 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tChej-0001rJ-0t;
	Sun, 17 Nov 2024 15:57:45 +0000
Date: Sun, 17 Nov 2024 23:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 237d4e0f41130a5ff0e1c7dc1cb41ee2fe21cd2a
Message-ID: <202411172305.x22EZBKQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 237d4e0f41130a5ff0e1c7dc1cb41ee2fe21cd2a  usb: typec: tcpm: Add support for sink-bc12-completion-time-ms DT property

elapsed time: 1455m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241117    clang-20
arc                   randconfig-002-20241117    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                          collie_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                   randconfig-001-20241117    clang-20
arm                   randconfig-002-20241117    clang-20
arm                   randconfig-003-20241117    clang-20
arm                   randconfig-004-20241117    clang-20
arm                         s5pv210_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                           sunxi_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm                       versatile_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241117    clang-20
arm64                 randconfig-002-20241117    clang-20
arm64                 randconfig-003-20241117    clang-20
arm64                 randconfig-004-20241117    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241117    clang-20
csky                  randconfig-002-20241117    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241117    clang-20
hexagon               randconfig-002-20241117    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241117    clang-19
i386        buildonly-randconfig-002-20241117    clang-19
i386        buildonly-randconfig-003-20241117    clang-19
i386        buildonly-randconfig-004-20241117    clang-19
i386        buildonly-randconfig-005-20241117    clang-19
i386        buildonly-randconfig-006-20241117    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241117    clang-19
i386                  randconfig-002-20241117    clang-19
i386                  randconfig-003-20241117    clang-19
i386                  randconfig-004-20241117    clang-19
i386                  randconfig-005-20241117    clang-19
i386                  randconfig-006-20241117    clang-19
i386                  randconfig-011-20241117    clang-19
i386                  randconfig-012-20241117    clang-19
i386                  randconfig-013-20241117    clang-19
i386                  randconfig-014-20241117    clang-19
i386                  randconfig-015-20241117    clang-19
i386                  randconfig-016-20241117    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241117    clang-20
loongarch             randconfig-002-20241117    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           mtx1_defconfig    gcc-13.2.0
mips                   sb1250_swarm_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241117    clang-20
nios2                 randconfig-002-20241117    clang-20
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-13.2.0
parisc                randconfig-001-20241117    clang-20
parisc                randconfig-002-20241117    clang-20
parisc64                            defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                     rainier_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241117    clang-20
powerpc               randconfig-002-20241117    clang-20
powerpc               randconfig-003-20241117    clang-20
powerpc                     sequoia_defconfig    gcc-13.2.0
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20241117    clang-20
powerpc64             randconfig-002-20241117    clang-20
powerpc64             randconfig-003-20241117    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241117    clang-20
riscv                 randconfig-002-20241117    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241117    clang-20
s390                  randconfig-002-20241117    clang-20
s390                       zfcpdump_defconfig    gcc-13.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-13.2.0
sh                    randconfig-001-20241117    clang-20
sh                    randconfig-002-20241117    clang-20
sh                           se7206_defconfig    gcc-13.2.0
sh                           se7750_defconfig    gcc-13.2.0
sh                        sh7785lcr_defconfig    gcc-13.2.0
sh                            shmin_defconfig    clang-20
sh                          urquell_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241117    clang-20
sparc64               randconfig-002-20241117    clang-20
um                                allnoconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241117    clang-20
um                    randconfig-002-20241117    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-20
xtensa                randconfig-001-20241117    clang-20
xtensa                randconfig-002-20241117    clang-20
xtensa                    xip_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

