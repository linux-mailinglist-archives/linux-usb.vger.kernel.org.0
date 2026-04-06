Return-Path: <linux-usb+bounces-36017-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI6AAA8P1GkbqgcAu9opvQ
	(envelope-from <linux-usb+bounces-36017-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 21:52:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B693A6C93
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 21:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6590730432C5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 19:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18C1396D22;
	Mon,  6 Apr 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtYQVnsy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126C9391515
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505101; cv=none; b=nbpbmzkFyztZtrr4dmP7pj+SrV4Nt3mY15zBKBRPvTzle47I7yIJTkT9/jQA+A17UCxHWYGbZxpzZDLZMSDT+T5zRI5cvU0URrJ2UBFO5QkMyYTCrdju3GUSVPUZJd/67EZL25iyYbd2gXnRpyrvCY3tUdwM18E3ZJYQQndm4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505101; c=relaxed/simple;
	bh=clEnt9qTsjEAC5Tt0UK9uzS0O1/mvYK/dT5/bttTAmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOASEbw1CSYIkTUn65miaRqQk/N89KOKozOH4O8liu1hiv71hgN5d6hx99lZsdokVfT7Y8475ynIKTgK/99bjiEzIhgtHDY1GUdDti90uaIIGincjKOKS9pGtKOzNEP++KZ0acsqsh67sJnyg9kbgkazSWTAh5IPCViFPJhZZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtYQVnsy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775505100; x=1807041100;
  h=date:from:to:cc:subject:message-id;
  bh=clEnt9qTsjEAC5Tt0UK9uzS0O1/mvYK/dT5/bttTAmw=;
  b=HtYQVnsyZWOdR/47i72/XKUgEl+tWsPm4OTGuig8bLYZkrZXBXmhxzLT
   cNTXOsLk4kf+ZszDl9pWou3IByMhDECFn4+cLAViwabc07E4/M5H0I/oE
   uk+mMCG5ZFqP4BmqjvUasmNH/wAgCLP2vgRcPFLOZcvJGIBC3N+GNB73i
   E0C/zJgjFWh3sC8hYmrZybdAm7VkoxBIUQinY00GIklC6/m86wYMpV6U2
   mcxZ+I06BXVozThiD4X4zmHaWQ4nrU0B5a9QhDPdEbm/6Tuo8w6WhIvdp
   4fFrWEy0qFfFgc2FQISflzgPE+S921fpkEmBLrNAjX0qIVb+E2h9tBOhg
   g==;
X-CSE-ConnectionGUID: zEXbEtFTQy2HoPrx68ugcg==
X-CSE-MsgGUID: 3gu0NL/rS1GJ7sK32B0NeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75500444"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="75500444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:51:39 -0700
X-CSE-ConnectionGUID: FO4wNee4SFepxH0quHAdaA==
X-CSE-MsgGUID: xg/XdqxXT2O6R2EDwolpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251090624"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 12:51:38 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9pyy-000000003Dc-0F9f;
	Mon, 06 Apr 2026 19:51:36 +0000
Date: Tue, 07 Apr 2026 03:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 3723393cc284e09107c0f55c47458b75b29be2c3
Message-ID: <202604070304.lApmj8pP-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-36017-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52B693A6C93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 3723393cc284e09107c0f55c47458b75b29be2c3  Merge tag 'v7.0-rc7' into usb-next

elapsed time: 736m

configs tested: 187
configs skipped: 25

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260406    gcc-10.5.0
arc                   randconfig-002-20260406    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260406    clang-17
arm                   randconfig-002-20260406    clang-23
arm                   randconfig-003-20260406    clang-23
arm                   randconfig-004-20260406    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260406    gcc-10.5.0
arm64                 randconfig-002-20260406    gcc-10.5.0
arm64                 randconfig-003-20260406    gcc-10.5.0
arm64                 randconfig-004-20260406    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260406    gcc-10.5.0
csky                  randconfig-002-20260406    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260406    clang-23
hexagon               randconfig-002-20260406    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260406    clang-20
i386        buildonly-randconfig-001-20260406    gcc-14
i386        buildonly-randconfig-002-20260406    clang-20
i386        buildonly-randconfig-002-20260406    gcc-14
i386        buildonly-randconfig-003-20260406    clang-20
i386        buildonly-randconfig-003-20260406    gcc-14
i386        buildonly-randconfig-004-20260406    gcc-14
i386        buildonly-randconfig-005-20260406    clang-20
i386        buildonly-randconfig-005-20260406    gcc-14
i386        buildonly-randconfig-006-20260406    gcc-13
i386        buildonly-randconfig-006-20260406    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260406    clang-20
i386                  randconfig-001-20260406    gcc-13
i386                  randconfig-002-20260406    clang-20
i386                  randconfig-002-20260406    gcc-13
i386                  randconfig-003-20260406    clang-20
i386                  randconfig-003-20260406    gcc-13
i386                  randconfig-004-20260406    clang-20
i386                  randconfig-004-20260406    gcc-13
i386                  randconfig-005-20260406    clang-20
i386                  randconfig-005-20260406    gcc-13
i386                  randconfig-006-20260406    clang-20
i386                  randconfig-007-20260406    clang-20
i386                  randconfig-007-20260406    gcc-13
i386                  randconfig-011-20260406    gcc-14
i386                  randconfig-012-20260406    gcc-14
i386                  randconfig-013-20260406    gcc-14
i386                  randconfig-014-20260406    gcc-14
i386                  randconfig-015-20260406    gcc-14
i386                  randconfig-016-20260406    gcc-14
i386                  randconfig-017-20260406    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260406    clang-23
loongarch             randconfig-002-20260406    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                 randconfig-001-20260406    clang-23
nios2                 randconfig-002-20260406    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260406    clang-23
parisc                randconfig-002-20260406    clang-23
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260406    clang-23
powerpc               randconfig-002-20260406    clang-23
powerpc64             randconfig-001-20260406    clang-23
powerpc64             randconfig-002-20260406    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260406    gcc-8.5.0
riscv                 randconfig-002-20260406    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260406    gcc-8.5.0
s390                  randconfig-002-20260406    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260406    gcc-8.5.0
sh                    randconfig-002-20260406    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260406    gcc-11.5.0
sparc                 randconfig-002-20260406    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260406    clang-23
sparc64               randconfig-002-20260406    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260406    clang-17
um                    randconfig-002-20260406    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260406    gcc-14
x86_64      buildonly-randconfig-002-20260406    gcc-14
x86_64      buildonly-randconfig-003-20260406    gcc-14
x86_64      buildonly-randconfig-004-20260406    gcc-14
x86_64      buildonly-randconfig-005-20260406    gcc-14
x86_64      buildonly-randconfig-006-20260406    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260406    gcc-14
x86_64                randconfig-002-20260406    gcc-14
x86_64                randconfig-003-20260406    gcc-14
x86_64                randconfig-004-20260406    gcc-14
x86_64                randconfig-005-20260406    gcc-14
x86_64                randconfig-006-20260406    gcc-14
x86_64                randconfig-011-20260406    gcc-14
x86_64                randconfig-012-20260406    clang-20
x86_64                randconfig-013-20260406    clang-20
x86_64                randconfig-014-20260406    gcc-14
x86_64                randconfig-015-20260406    clang-20
x86_64                randconfig-016-20260406    gcc-14
x86_64                randconfig-071-20260406    clang-20
x86_64                randconfig-072-20260406    clang-20
x86_64                randconfig-073-20260406    clang-20
x86_64                randconfig-074-20260406    clang-20
x86_64                randconfig-075-20260406    clang-20
x86_64                randconfig-075-20260406    gcc-13
x86_64                randconfig-076-20260406    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260406    gcc-12.5.0
xtensa                randconfig-002-20260406    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

