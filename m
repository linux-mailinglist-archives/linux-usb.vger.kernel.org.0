Return-Path: <linux-usb+bounces-18558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 901739F45A2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B3A188C339
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1968A16A956;
	Tue, 17 Dec 2024 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3tZDBSV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353CD132132
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734422598; cv=none; b=CegHZ8N7iToJUlnggzaJoeOagyjbR+SvoX0SXmAq5QbT5y2qPvF/KtV98+LsJ+6lyUGexpWytKnG3gbdzysS5REsbTX+AjH3PIzmgQJlyT1j4BQL5slDazYN81uJEruyGaMtzWqov3amTJH/74AP+VOzRuJwMKu6eXbqEEyXzqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734422598; c=relaxed/simple;
	bh=PMDCZpWyMgmIKATMdNowV24dmhMCgFXROJ8e88xHTYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jURqrdnoG3aCjnAWAIieIbZfPfCBqUpyPQlDVgtoOWB0hq74sSsFcDxMcYoqGYvAuTBRQza3SxhoaCKhBx/30L1kOPmuOOFHGIYkV9IQa3uRqeDPlFMBFbuhcyiWRm82H1pksgCbZ7GEzjbQPG21smykR3Sog62A3eXnxGjKf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3tZDBSV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734422596; x=1765958596;
  h=date:from:to:cc:subject:message-id;
  bh=PMDCZpWyMgmIKATMdNowV24dmhMCgFXROJ8e88xHTYA=;
  b=Y3tZDBSVFqgNNjpxjiHFz6u42S2WkHJaE0SX89ze9V8T+NaEuwC+Q0Pw
   lLBBEZ5X6+JpOZ6vz7Uq2mgsDz3SiQNakRR89Yw6vycvpbsdVwa6f37mN
   3vSW5Z7Kf/fAg/zCthti0JuQSrDxIGGzBLCEIZuMgNYk3PARYGrGibv3l
   izZVp+dO4XwKNr9ALcKAeILAFc/oNlovlmUY4aq8+Pyt1bkluK3LvWLGE
   MKE+7udQdqX7v80ypNLyN3jTThsRy9no6RGCs7Oz9NWk+rabTde2ftukp
   Ek+ucb0nbKA3b78bBnOfqEqxgyzLVQ0tzIpuhLvbXaJEtWnvQfQGQ8gd5
   Q==;
X-CSE-ConnectionGUID: 5NAGUL6fSIOn1eJL/EMe2w==
X-CSE-MsgGUID: eXe49HPoRoGC6cnX8nEuNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34127292"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34127292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:03:15 -0800
X-CSE-ConnectionGUID: Dw1qQwmiR3qbBiwvL8k8hA==
X-CSE-MsgGUID: ybuTn/5YReu075nZMhxOCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="102305489"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Dec 2024 00:03:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSXw-000EoZ-0P;
	Tue, 17 Dec 2024 08:03:12 +0000
Date: Tue, 17 Dec 2024 16:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 362a7993ed0173e70859d0a624d8ffa968b2cea0
Message-ID: <202412171635.wg0c40uc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 362a7993ed0173e70859d0a624d8ffa968b2cea0  Merge 6.13-rc3 into usb-next

elapsed time: 950m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241217    gcc-13.2.0
arc                   randconfig-002-20241217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241217    clang-16
arm                   randconfig-002-20241217    gcc-14.2.0
arm                   randconfig-003-20241217    gcc-14.2.0
arm                   randconfig-004-20241217    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241217    clang-20
arm64                 randconfig-002-20241217    clang-16
arm64                 randconfig-003-20241217    clang-18
arm64                 randconfig-004-20241217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241217    clang-19
i386        buildonly-randconfig-002-20241217    gcc-12
i386        buildonly-randconfig-003-20241217    gcc-12
i386        buildonly-randconfig-004-20241217    clang-19
i386        buildonly-randconfig-005-20241217    clang-19
i386        buildonly-randconfig-006-20241217    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241217    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc64             randconfig-001-20241217    gcc-14.2.0
powerpc64             randconfig-002-20241217    gcc-14.2.0
powerpc64             randconfig-003-20241217    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241217    gcc-14.2.0
riscv                 randconfig-002-20241217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241217    gcc-14.2.0
s390                  randconfig-002-20241217    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241217    gcc-14.2.0
sh                    randconfig-002-20241217    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241217    gcc-14.2.0
sparc                 randconfig-002-20241217    gcc-14.2.0
sparc64               randconfig-001-20241217    gcc-14.2.0
sparc64               randconfig-002-20241217    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241217    clang-20
um                    randconfig-002-20241217    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241217    clang-19
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-004-20241217    clang-19
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64      buildonly-randconfig-006-20241217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241217    gcc-14.2.0
xtensa                randconfig-002-20241217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

