Return-Path: <linux-usb+bounces-11799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC591CCF4
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 15:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48D11B222BA
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 13:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F17D7D09D;
	Sat, 29 Jun 2024 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRcSHHO+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162077107
	for <linux-usb@vger.kernel.org>; Sat, 29 Jun 2024 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666400; cv=none; b=K5vggexhthCKcg8vSL0kOS3tW26WYpyiQnJAZb0E3YA2FDtmvvwshB+YNdExwQymOBLoc3pfXGHVePe7JA0XymObSMDUwiMigsohvOqPV+JGe8ghS3KxiYSOR+Ea1qAbdNvCgO60YvCzLOg2xsTtFGQUMZGDUEiDqLYBBhAlUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666400; c=relaxed/simple;
	bh=jVSzmdHpfbTJ5vk2IN/PL87UXuxPOSFA8DZVdJ58y/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZapW79oH8ktkykc5zlUoXnjD1bItkgbjo426uRzAkXNS3EIFOD1S0o5NxT0/HyRNTwHoDWDGqbr8MJQc1zDZ6UqRvgvydgecnD/YO2OlPoL4rayO2OinMYki86J5rAQvJhWHyfw/D7DAS8xBooer6jGduXRALw44PTzqAH0RylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRcSHHO+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719666398; x=1751202398;
  h=date:from:to:cc:subject:message-id;
  bh=jVSzmdHpfbTJ5vk2IN/PL87UXuxPOSFA8DZVdJ58y/g=;
  b=XRcSHHO+gOocJOldY6lH6WP0rnoQlG7OMJM7pn5rE5GUaUtFhCNCn/bh
   KskcsGoRHaw3GegKEgXvwMfU50s5nTy5O6CwxCsp/A9/buyRoKfgLfI8r
   9eufjzXMDDN7GdyxjMjFcylyySaHxY+edhNYnjEGgDAsJdVwChi8/1Z2X
   tfFMM+99jCVfhUAaSZra15Nh03qo1nxqAbc/oYjDugfH8nonSRH5ytWzT
   BpaHxcWi7u9DGCwTPAW7zNI3g9XSEdOznVg+KPv0tfmjMGrpx3SdE0ZiY
   m95cyfITwv0SYm0G5fCIl82nWaZJGmCnPmlmkSE93zNwAHPtqGyhgPhGV
   w==;
X-CSE-ConnectionGUID: 3SawgEfuRliyWH2HwDOhog==
X-CSE-MsgGUID: HGEuUH3HRjC1uM5FDPOWCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="20658327"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="20658327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 06:06:38 -0700
X-CSE-ConnectionGUID: FUg4/JC+QSipWXvbMuNwlQ==
X-CSE-MsgGUID: IfcLaIjwSLW76jg1zn5J/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="68223742"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2024 06:06:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNXml-000JLT-0M;
	Sat, 29 Jun 2024 13:06:35 +0000
Date: Sat, 29 Jun 2024 21:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 49056c95df448c1fa870c8688f34e5d1abffb154
Message-ID: <202406292116.bancxGDE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 49056c95df448c1fa870c8688f34e5d1abffb154  thunderbolt: debugfs: Use FIELD_GET()

elapsed time: 14902m

configs tested: 49
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

