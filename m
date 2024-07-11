Return-Path: <linux-usb+bounces-12154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7392EA6B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 16:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02F02817ED
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 14:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543EB161900;
	Thu, 11 Jul 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4doxX1G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966415218A
	for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707183; cv=none; b=ot85o479er5+KBH5amkXUqQfpOLouLwGh8fYyDa8Z8Xed0FBHI4DZhj9zde2kSk2gFAdSsyBw9SZVaEiBQ7wccK+/nMBtUA1+qdHLFnNrC3PY74EOA61jcqH+EIcIsc3QI65tDvDsRcIrpXw6rNm4w1KhCaJm0WSolpYTH7zunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707183; c=relaxed/simple;
	bh=hUxpquDcVcp9IYK67BitK/KJ9BvLyUvcoSJgIATiN+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tIRwqIDUDVCcH5NAdSteB+yUumqqgB9QCEIS8RIZZLu9ggc1tgK2/S2EbV4DP/xzXugayjIzvD/igKY7ax+n7EE2cXUlXyy7v/jVFBAUNrhywd/Wi35GCfxZKryNBYCNKq1yLw1pbXp5TduU+0UL5UIzxA0KlXrLyZkQWSFTqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4doxX1G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720707182; x=1752243182;
  h=date:from:to:cc:subject:message-id;
  bh=hUxpquDcVcp9IYK67BitK/KJ9BvLyUvcoSJgIATiN+s=;
  b=l4doxX1GC8vv9eBnDkWyZByidWtH5H822h3XA8IRTy3pSxB1QdoeFfDS
   /mZDDL8PAR88ZxoEWLDGXyOYcTbdjLiKoUnULXIUBNw64SdJ2UvMNUNh2
   cn++yFBVFqFdbM8ph2CpXMF0kvZrgFDHVk86CxjHgh/yDCeIqJxmlasE4
   RrQOKbDR/ZjlsQxEnv4d1cpoc3DBxj+TyNlCijmC9P5LQN7lpOGvgwMy8
   YO4ykAvnRB3R04vwuRrk2D+iuO5EZ7bFsfO+r3CNoTpnqbBsaJMT6i/Gt
   vLg5eAmEDPPNydK1gPJf2DSpvkAuW+loBSlKey/EfBwcO56v/xGaMm4zz
   w==;
X-CSE-ConnectionGUID: ieNs0Q5pQ0eULKqB5/aBLA==
X-CSE-MsgGUID: p4E78rrkQ+qTQOOFeeD1TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17959668"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17959668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:12:28 -0700
X-CSE-ConnectionGUID: pKg/GQZaT4ezXZiLV0m9nA==
X-CSE-MsgGUID: vQIpiYoWQjW6dpX+SMexew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48553547"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jul 2024 07:12:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRuX3-000ZMQ-0F;
	Thu, 11 Jul 2024 14:12:25 +0000
Date: Thu, 11 Jul 2024 22:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 70c8e3944063a83b7fae1996db7971e9b858c635
Message-ID: <202407112247.Po4wR6jV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 70c8e3944063a83b7fae1996db7971e9b858c635  Merge tag 'usb-serial-6.10-rc8' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1144m

configs tested: 146
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240711   gcc-13.2.0
arc                   randconfig-002-20240711   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            mps2_defconfig   clang-19
arm                            qcom_defconfig   clang-19
arm                   randconfig-001-20240711   gcc-13.2.0
arm                   randconfig-002-20240711   gcc-13.2.0
arm                   randconfig-003-20240711   gcc-13.2.0
arm                   randconfig-004-20240711   gcc-13.2.0
arm                          sp7021_defconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   clang-19
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240711   gcc-13.2.0
arm64                 randconfig-002-20240711   gcc-13.2.0
arm64                 randconfig-003-20240711   gcc-13.2.0
arm64                 randconfig-004-20240711   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240711   gcc-13.2.0
csky                  randconfig-002-20240711   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240711   gcc-13
i386         buildonly-randconfig-002-20240711   gcc-13
i386         buildonly-randconfig-003-20240711   gcc-13
i386         buildonly-randconfig-004-20240711   gcc-13
i386         buildonly-randconfig-005-20240711   gcc-13
i386         buildonly-randconfig-006-20240711   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240711   gcc-13
i386                  randconfig-002-20240711   gcc-13
i386                  randconfig-003-20240711   gcc-13
i386                  randconfig-004-20240711   gcc-13
i386                  randconfig-005-20240711   gcc-13
i386                  randconfig-006-20240711   gcc-13
i386                  randconfig-011-20240711   gcc-13
i386                  randconfig-012-20240711   gcc-13
i386                  randconfig-013-20240711   gcc-13
i386                  randconfig-014-20240711   gcc-13
i386                  randconfig-015-20240711   gcc-13
i386                  randconfig-016-20240711   gcc-13
loongarch                        allmodconfig   gcc-13.3.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240711   gcc-13.2.0
loongarch             randconfig-002-20240711   gcc-13.2.0
m68k                             allmodconfig   gcc-13.3.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.3.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.3.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.3.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         db1xxx_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240711   gcc-13.2.0
nios2                 randconfig-002-20240711   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.3.0
openrisc                         allyesconfig   gcc-13.3.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.3.0
parisc                            allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.3.0
parisc                           allyesconfig   gcc-13.3.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240711   gcc-13.2.0
parisc                randconfig-002-20240711   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.3.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.3.0
powerpc                          allyesconfig   gcc-13.3.0
powerpc                       ebony_defconfig   clang-19
powerpc                         ps3_defconfig   clang-19
powerpc               randconfig-001-20240711   gcc-13.2.0
powerpc               randconfig-002-20240711   gcc-13.2.0
powerpc               randconfig-003-20240711   gcc-13.2.0
powerpc                     stx_gp3_defconfig   clang-19
powerpc                         wii_defconfig   clang-19
powerpc64             randconfig-001-20240711   gcc-13.2.0
powerpc64             randconfig-002-20240711   gcc-13.2.0
powerpc64             randconfig-003-20240711   gcc-13.2.0
riscv                            allmodconfig   gcc-13.3.0
riscv                             allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.3.0
riscv                            allyesconfig   gcc-13.3.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240711   gcc-13.2.0
riscv                 randconfig-002-20240711   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240711   gcc-13.2.0
s390                  randconfig-002-20240711   gcc-13.2.0
sh                               allmodconfig   gcc-13.3.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.3.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240711   gcc-13.2.0
sh                    randconfig-002-20240711   gcc-13.2.0
sparc                            allmodconfig   gcc-13.3.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240711   gcc-13.2.0
sparc64               randconfig-002-20240711   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240711   gcc-13.2.0
um                    randconfig-002-20240711   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240711   gcc-13.2.0
xtensa                randconfig-002-20240711   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

