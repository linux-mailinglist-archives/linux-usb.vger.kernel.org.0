Return-Path: <linux-usb+bounces-25891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DCB07D69
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 21:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD003AC3B0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 19:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC3328F518;
	Wed, 16 Jul 2025 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivIt6O1/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648924A07A
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752693137; cv=none; b=NvvDx2T1Tq4pcPP/YETOskvnJMfizNfL07BYDteIeMw2rHrsnkbkoH+1St1oZRwBmB9UW4f+y+b7VDi/YmOK7X4SnxF5LbcJZ+s4Pnc4gQITswn7j1ZaqHVbfIc4XhVbU+r03C8mmMVP1pqtgmkTuD8esdXdqHnw+nw8mMYXeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752693137; c=relaxed/simple;
	bh=nNVqCLRpOx1y+llVdnS0cA/JUF1aXyVzc+h6z1x7je8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uqriCfzRvRxhBI9jzBH4ksV3MJBbqIc+3MEPYkbnUAV0CeJT6Eq/a6bYLk890Xnux70EEqMU2XBMXfeeN6AH7E3yo45cMB12hwGIUv3uB9gkNrREez0v3Azj0hblbmvt6l/cvjLrNWtuAZ6TpJ+EO0cOSW+vaypIF5HoFF5+bqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivIt6O1/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752693136; x=1784229136;
  h=date:from:to:cc:subject:message-id;
  bh=nNVqCLRpOx1y+llVdnS0cA/JUF1aXyVzc+h6z1x7je8=;
  b=ivIt6O1/DLJkicyQM3FGXZQgX46Za2azL14msFypONKrTiQnnnFQoUzc
   FApICHLXv0Ow1fWBFneJvcWoqe3fo9o6FsVG4nFR8hGwSlub+q3UCWcrx
   5/9p1Q9SXAT4KSfy0h8Z7gpz4hiw7Ut1HSrS+a63wiaYn5dVswsDPfOkT
   JUw3jhdw/6ubhcSvV/Qe0hbijlN91oxvN/41OBAPFsOFWhEWXM3iCJyvp
   B2TwkiZBD5AzF89x2CfqVF5ec8Nyaxan3sUE79NzWWHWBOmAMPe/ZvywL
   FSzIQmiMsAcimUK6ir1eoJxWH787xIa423ik3v7LBzvzv741xlNKNHnfR
   w==;
X-CSE-ConnectionGUID: X194PrTKQLyM2JsptlWvvA==
X-CSE-MsgGUID: ZizcGlLDTt2NxFSP2URM1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57563377"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="57563377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 12:12:15 -0700
X-CSE-ConnectionGUID: 6ova7SYtRACiTYMme2M3hQ==
X-CSE-MsgGUID: zLjvMW/XQu22NFRZD/4xrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="157938353"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jul 2025 12:12:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc7Y4-000ClG-1A;
	Wed, 16 Jul 2025 19:12:12 +0000
Date: Thu, 17 Jul 2025 03:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 300386d117a98961fc1d612d1f1a61997d731b8a
Message-ID: <202507170330.APCmKJnU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 300386d117a98961fc1d612d1f1a61997d731b8a  usb: typec: ucsi: Add poll_cci operation to cros_ec_ucsi

elapsed time: 1454m

configs tested: 97
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250716    gcc-13.4.0
arc                   randconfig-002-20250716    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250716    clang-20
arm                   randconfig-002-20250716    gcc-12.4.0
arm                   randconfig-003-20250716    gcc-8.5.0
arm                   randconfig-004-20250716    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250716    gcc-9.5.0
arm64                 randconfig-002-20250716    gcc-8.5.0
arm64                 randconfig-003-20250716    gcc-8.5.0
arm64                 randconfig-004-20250716    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250716    gcc-14.3.0
csky                  randconfig-002-20250716    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250716    clang-21
hexagon               randconfig-002-20250716    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250716    gcc-12
i386        buildonly-randconfig-002-20250716    clang-20
i386        buildonly-randconfig-003-20250716    gcc-12
i386        buildonly-randconfig-004-20250716    gcc-11
i386        buildonly-randconfig-005-20250716    gcc-12
i386        buildonly-randconfig-006-20250716    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250716    clang-18
loongarch             randconfig-002-20250716    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250716    gcc-14.2.0
nios2                 randconfig-002-20250716    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250716    gcc-8.5.0
parisc                randconfig-002-20250716    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250716    gcc-8.5.0
powerpc               randconfig-002-20250716    clang-21
powerpc               randconfig-003-20250716    gcc-14.3.0
powerpc64             randconfig-001-20250716    gcc-10.5.0
powerpc64             randconfig-003-20250716    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250716    gcc-8.5.0
riscv                 randconfig-002-20250716    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250716    gcc-11.5.0
s390                  randconfig-002-20250716    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250716    gcc-15.1.0
sh                    randconfig-002-20250716    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250716    gcc-8.5.0
sparc                 randconfig-002-20250716    gcc-14.3.0
sparc64               randconfig-001-20250716    clang-20
sparc64               randconfig-002-20250716    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250716    gcc-11
um                    randconfig-002-20250716    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250716    gcc-12
x86_64      buildonly-randconfig-002-20250716    clang-20
x86_64      buildonly-randconfig-003-20250716    clang-20
x86_64      buildonly-randconfig-004-20250716    clang-20
x86_64      buildonly-randconfig-005-20250716    clang-20
x86_64      buildonly-randconfig-006-20250716    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20250716    gcc-9.3.0
xtensa                randconfig-002-20250716    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

