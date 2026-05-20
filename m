Return-Path: <linux-usb+bounces-37761-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOYJEwOHDWp4ygUAu9opvQ
	(envelope-from <linux-usb+bounces-37761-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:03:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038958B4C0
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE730300FEF5
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549163D3322;
	Wed, 20 May 2026 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db7k6iRz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4D3B38AA
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271170; cv=none; b=HVef9UC5MkWq5V+Di/77yCK8aj1CVYClWRDEwVmJPmHtf/GVor9YGbk5bMM9Q3aQF0Wd7Z5z5Iot22/uVbSLt99YvJeatV8ovh77f8Bbu+aT1Zgzs3WxVnLrwAzix534k99K7jSAvZAc5lfBJPoBk8vABFZvpyi4r0RR8w9rs/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271170; c=relaxed/simple;
	bh=e1rflzCavb3nBlEVeU+Pi3afhNyX9L+rvTK27LfegEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=neAsEKJyldPLr5NPt3dFQjjVeP1e6KaXLqlY2ReTKK2WKej+WxGwunbZnvJrpQj8NJ5GBU1UQWx9sJwkaQ4fJrplhaBfbnZthbH3Wu99+sqlE5xXUT+OiA7WBsqWXFzox1rpasO16cqYky77qxwa3PxQyrx4Lb26hmZZgSij7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db7k6iRz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779271170; x=1810807170;
  h=date:from:to:cc:subject:message-id;
  bh=e1rflzCavb3nBlEVeU+Pi3afhNyX9L+rvTK27LfegEk=;
  b=db7k6iRz0Otn1eWdRt9f3TjjctCgrClOWF7M47Yzgp1wj1CPj0+deF3Y
   O7DA3wWmDMFOAJ+H4STKvRDHmrVyW4Fh5GTSXWaGPNY6GGM8F/LPQNVeE
   TnS9+8/kq999Jd0pA2FIuE4GMjru3bNYz5ROtFC88FfeyV3gnmqifovwo
   ddq270vvXIrTGRTaPkW6oMq2SeKWxtrUYeCaYvQT6qQbviE88T45g5lwn
   rJ9m0RcwPeTpgEBJCIqPx6Li5eeEFvwNEB0E8szkHFbqc9dDVvfgpqgCm
   aZAhqo7RPlqrOUEOkYS0MCI7Q+yF5utJQGSQFeSx+32Eusb+XcR4QBuLB
   A==;
X-CSE-ConnectionGUID: Zl2HJb6lTV+ajhnavfeewA==
X-CSE-MsgGUID: jvxN0SP+TLejmW5m+VV5OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102841848"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102841848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:59:29 -0700
X-CSE-ConnectionGUID: Qq8djPU2Qd+y+6WLWzZhaw==
X-CSE-MsgGUID: bSCQcCQDREGWV6GAdDSCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244410190"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2026 02:59:27 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPdi0-000000002xF-3Jt8;
	Wed, 20 May 2026 09:59:24 +0000
Date: Wed, 20 May 2026 17:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 af8922ffb322c4650dc536a236c4b42a1cf2829e
Message-ID: <202605201756.RnZ8LPBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37761-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 5038958B4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: af8922ffb322c4650dc536a236c4b42a1cf2829e  docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM

elapsed time: 1000m

configs tested: 117
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260520    clang-20
i386        buildonly-randconfig-002-20260520    gcc-14
i386        buildonly-randconfig-003-20260520    clang-20
i386        buildonly-randconfig-004-20260520    clang-20
i386        buildonly-randconfig-005-20260520    gcc-13
i386        buildonly-randconfig-006-20260520    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260520    gcc-13.4.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260520    gcc-11.5.0
nios2                 randconfig-002-20260520    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260520    gcc-10.5.0
parisc                randconfig-002-20260520    gcc-11.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260520    clang-23
powerpc               randconfig-002-20260520    clang-17
powerpc64             randconfig-001-20260520    clang-23
powerpc64             randconfig-002-20260520    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260520    clang-23
riscv                 randconfig-002-20260520    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260520    clang-23
s390                  randconfig-002-20260520    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260520    gcc-15.2.0
sh                    randconfig-002-20260520    gcc-13.4.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260520    gcc-12.5.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260520    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260520    gcc-13.4.0
sparc64                        randconfig-002    clang-23
sparc64               randconfig-002-20260520    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260520    clang-23
um                             randconfig-002    clang-23
um                    randconfig-002-20260520    gcc-14
x86_64                           alldefconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260520    clang-20
x86_64      buildonly-randconfig-002-20260520    clang-20
x86_64      buildonly-randconfig-003-20260520    gcc-14
x86_64      buildonly-randconfig-004-20260520    gcc-14
x86_64      buildonly-randconfig-005-20260520    gcc-14
x86_64      buildonly-randconfig-006-20260520    gcc-14
x86_64                randconfig-001-20260520    gcc-14
x86_64                randconfig-002-20260520    clang-20
x86_64                randconfig-003-20260520    gcc-14
x86_64                randconfig-004-20260520    gcc-14
x86_64                randconfig-005-20260520    gcc-12
x86_64                randconfig-006-20260520    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260520    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260520    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

