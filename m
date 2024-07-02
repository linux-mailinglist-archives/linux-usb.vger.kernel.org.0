Return-Path: <linux-usb+bounces-11836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBC92499C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 22:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64BE928311A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 20:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A49201251;
	Tue,  2 Jul 2024 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itLbwfSo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B756200134
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719953562; cv=none; b=u+fYgEqWA0Qr0zGC6YNMlFELLhwLgoDmfrshvtHA7yP0QI0b4bCOWEWgzk1hj4fbp1XVNzj6lElLj96qvpk68DaF1JmLlOH1+ibj0mG8i4Kaza7zJcIc7mbcJDIxDqpRxdhSU0pRK0QzoHS+pvKXmv5O/X5zK3FqTEAld0lM+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719953562; c=relaxed/simple;
	bh=xzVbZWECkrgkRebbSm0dfmiDekvBKiAibQSniO0QdI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OhKVwFw+n/0aVyVPkMI+eGDEbHArEfKXukuNp6fKD7dCTk3aUrX7H9JglIT9/zLOFkgVp9bKLrlZ3KNCjjfDnv6L/caUXAusN1MqbO7iWhWs+QzcizRqQ4QaHJ5WbltAo4V+GE97heOkNsoEORloGoD6o6HgQdezu5PBiLnV43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itLbwfSo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719953560; x=1751489560;
  h=date:from:to:cc:subject:message-id;
  bh=xzVbZWECkrgkRebbSm0dfmiDekvBKiAibQSniO0QdI4=;
  b=itLbwfSos+4pfddCHt5iulg491kiC2zbSWXApCN8yTjyfxR4ja2joVSC
   zLJns7Ne+MJ1dQ0v6Z2ttbKG3NAj82/DTRtdaog3aO6fx9Dr0NOrpGlXF
   6E7GOWgNw3qokqqQz2Kb2D9Ri4EVVjIgeUKictotEYoB24lVENzZdpG6Y
   BEhM6OPIqj+U81ccSeNwdklUyh4Fw02oKCe4ZMhS4TeGPJBKmfexGVXzQ
   80fAE7UJbqwqcftFkgHhELeDw7SzTPhmt5Qf4P8RySlTpHLgBcYiGaTxY
   U0DK7VFaCveyUQBMLAx8A32UfCjwJr1oSEM/Zi44IZS+3ONOeH3dlXHbz
   g==;
X-CSE-ConnectionGUID: lgX7GcxeQZCrIShVzvstmw==
X-CSE-MsgGUID: 8/I/Jg4dQ0+9SnFnUOoy5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34691656"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="34691656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 13:52:39 -0700
X-CSE-ConnectionGUID: x0R9nHQ7T4GbaUZC37XQ5w==
X-CSE-MsgGUID: qFp0ZH++RP28K6/s5oGojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="45806241"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2024 13:52:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkUO-000Oeg-2c;
	Tue, 02 Jul 2024 20:52:36 +0000
Date: Wed, 03 Jul 2024 04:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f7697db8b1b3e80d8cd5af071a5af42c8b445fc4
Message-ID: <202407030406.wERj2PW0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f7697db8b1b3e80d8cd5af071a5af42c8b445fc4  Merge 6.10-rc6 into usb-next

elapsed time: 1903m

configs tested: 121
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   gcc-13.2.0
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-006-20240702   gcc-13
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-016-20240702   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   gcc-13.2.0
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   gcc-13.2.0
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240702   gcc-13.2.0
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240702   gcc-13.2.0
um                    randconfig-002-20240702   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   clang-18
x86_64       buildonly-randconfig-002-20240702   gcc-8
x86_64       buildonly-randconfig-003-20240702   clang-18
x86_64       buildonly-randconfig-003-20240702   gcc-8
x86_64       buildonly-randconfig-004-20240702   clang-18
x86_64       buildonly-randconfig-004-20240702   gcc-8
x86_64       buildonly-randconfig-005-20240702   gcc-13
x86_64       buildonly-randconfig-005-20240702   gcc-8
x86_64       buildonly-randconfig-006-20240702   clang-18
x86_64       buildonly-randconfig-006-20240702   gcc-8
x86_64                randconfig-001-20240702   clang-18
x86_64                randconfig-001-20240702   gcc-8
x86_64                randconfig-002-20240702   gcc-11
x86_64                randconfig-002-20240702   gcc-8
x86_64                randconfig-003-20240702   gcc-13
x86_64                randconfig-003-20240702   gcc-8
x86_64                randconfig-004-20240702   gcc-8
x86_64                randconfig-004-20240702   gcc-9
x86_64                randconfig-005-20240702   clang-18
x86_64                randconfig-005-20240702   gcc-8
x86_64                randconfig-006-20240702   gcc-13
x86_64                randconfig-006-20240702   gcc-8
x86_64                randconfig-011-20240702   clang-18
x86_64                randconfig-011-20240702   gcc-8
x86_64                randconfig-012-20240702   gcc-8
x86_64                randconfig-013-20240702   clang-18
x86_64                randconfig-013-20240702   gcc-8
x86_64                randconfig-014-20240702   gcc-13
x86_64                randconfig-014-20240702   gcc-8
x86_64                randconfig-015-20240702   gcc-13
x86_64                randconfig-015-20240702   gcc-8
x86_64                randconfig-016-20240702   clang-18
x86_64                randconfig-016-20240702   gcc-8
x86_64                randconfig-071-20240702   clang-18
x86_64                randconfig-071-20240702   gcc-8
x86_64                randconfig-072-20240702   gcc-13
x86_64                randconfig-072-20240702   gcc-8
x86_64                randconfig-073-20240702   gcc-8
x86_64                randconfig-074-20240702   clang-18
x86_64                randconfig-074-20240702   gcc-8
x86_64                randconfig-075-20240702   gcc-13
x86_64                randconfig-075-20240702   gcc-8
x86_64                randconfig-076-20240702   gcc-8
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

