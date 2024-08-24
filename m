Return-Path: <linux-usb+bounces-14036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9195DE60
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 16:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F66728313A
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B07D177992;
	Sat, 24 Aug 2024 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzWFgsqD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03317837F
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509871; cv=none; b=jm7R91eX9hqzfFnIHWk6UXFiligpU8tvzIXuKldnZhwrBG3ijFjLe7dWv08v9p+xNC3a9FYi8MAtvsYaa0xtY5XF5vFLi47iMOegblXbrigRqDtXHktmAXmxeXfUidSFztP8NrqRhq/du61+K7Y8EMUDP1GRQE+LTIQBUO4oSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509871; c=relaxed/simple;
	bh=b6N8JCHKUNSlOZemsoissd/BzdF+bI9HFUC2ZRP1BAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enf1VlsWi1r3CYjxp+Y0Qp77kikYI7YPQgWFoKsn8lurYZ+D0+0q4N9a+KJLcT5bEiwOXvzRmV/sz9dtV74T2N37GTyLX7KTwO7FR2ju7QWwJrAMaKQM8cs9m5YwHsqV3rNX3R1RQ7iomzaDFQw1CRzTyx4Ib2/JLTsuHM0IinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzWFgsqD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724509869; x=1756045869;
  h=date:from:to:cc:subject:message-id;
  bh=b6N8JCHKUNSlOZemsoissd/BzdF+bI9HFUC2ZRP1BAc=;
  b=MzWFgsqDRGb9r6/cpeY9x8RLTuQZbOn6sMtxnYFOl+Lc6EnzoHrZV63E
   zEE3Yody3OoVkJXyHaoygUcmRlDGqXQNYViG/xxl5iu+TElPehHnP1+sC
   bjrft51KQdGJ7DVS0rmvZ++W9FwYn+kOIDOM62rCEzegd5GF7cBl6urUS
   zSrfgSAY217XBwutKmJtLdsvUMBe7rDjL3dbzRBCsQu9E/Jtc+sjFA3eW
   Q58o8s2v7BIcCHMWKMb7pw4z+R/TZVDpO3fwd9TjmU/T4nPmLxhI/cET/
   qhaFhcs3erKpz6kzkkcmXKcsRqakRSDVsaE/RH4NID3dxFSFPMXsi739H
   Q==;
X-CSE-ConnectionGUID: y0NUMAujSXG7fgAcmH2QNQ==
X-CSE-MsgGUID: QvEQH5XyT1GsSeW336tpZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26852808"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="26852808"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 07:31:06 -0700
X-CSE-ConnectionGUID: gifCgr0nR0a85Zt7kDck7Q==
X-CSE-MsgGUID: //vrn0BoQhC4czCe1h2AhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="62379883"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2024 07:31:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shrnD-000EXA-0f;
	Sat, 24 Aug 2024 14:31:03 +0000
Date: Sat, 24 Aug 2024 22:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 fb9804096bb3508e33ade5a72f2332080cf1324b
Message-ID: <202408242223.5rxMMuLJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: fb9804096bb3508e33ade5a72f2332080cf1324b  usb: typec: ucsi: Remove useless error check from ucsi_read_error()

elapsed time: 1596m

configs tested: 108
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240824   gcc-13.2.0
arc                   randconfig-002-20240824   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240824   clang-20
arm                   randconfig-002-20240824   gcc-14.1.0
arm                   randconfig-003-20240824   clang-20
arm                   randconfig-004-20240824   clang-15
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240824   clang-20
arm64                 randconfig-002-20240824   clang-20
arm64                 randconfig-003-20240824   clang-20
arm64                 randconfig-004-20240824   clang-20
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240824   gcc-14.1.0
csky                  randconfig-002-20240824   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-005-20240824   gcc-12
i386         buildonly-randconfig-006-20240824   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-003-20240824   gcc-12
i386                  randconfig-004-20240824   gcc-11
i386                  randconfig-005-20240824   gcc-12
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-012-20240824   gcc-12
i386                  randconfig-013-20240824   gcc-12
i386                  randconfig-014-20240824   gcc-12
i386                  randconfig-015-20240824   gcc-12
i386                  randconfig-016-20240824   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240824   clang-18
x86_64       buildonly-randconfig-002-20240824   clang-18
x86_64       buildonly-randconfig-003-20240824   clang-18
x86_64       buildonly-randconfig-004-20240824   clang-18
x86_64       buildonly-randconfig-005-20240824   gcc-12
x86_64       buildonly-randconfig-006-20240824   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240824   gcc-12
x86_64                randconfig-002-20240824   clang-18
x86_64                randconfig-003-20240824   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

