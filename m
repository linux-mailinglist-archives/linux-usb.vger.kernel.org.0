Return-Path: <linux-usb+bounces-35127-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJyECgnNu2mXogIAu9opvQ
	(envelope-from <linux-usb+bounces-35127-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:16:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 221172C9554
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 832FF3079469
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36B7375AC0;
	Thu, 19 Mar 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUoJxMsb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B02378D6E
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913767; cv=none; b=rlgktXJz3rABmWZvfgPLJb3Ced5Dq+mrEmXY1DkBzUcj0V9nW81K+ThIk2UQ0cGXE5MOP4IJovOXmWLjbLfZEXB/ByjzsYJ8eNJ2s7J+FddfR5Hgx56Wt6uI1dK125EZ9wuZqGFjokbQDps7pejPo9poaNSKXOkBf0cfivuVU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913767; c=relaxed/simple;
	bh=ZQWjxFvJ59I6eJGjgW26ZkA2VKkgxKtmeVotGyVxHho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nz1B35k0+Q+Dg1P344NHrEwDhhoXM2hmg+gb2/QE7/da3Wiqr4FhG7JwDAKcmibOPClmQigz/PyzzJSXlDghSJs7QmdJz/h6oWRcH0pn8KpwsKcATcVPDzOO1PUK5aGm2UI290VzhBqf3yT4jFWrMM+atWtk5NL3UsWkQoLsomE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUoJxMsb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773913766; x=1805449766;
  h=date:from:to:cc:subject:message-id;
  bh=ZQWjxFvJ59I6eJGjgW26ZkA2VKkgxKtmeVotGyVxHho=;
  b=jUoJxMsbW3K3UkCzeZI3L0rt3r+S1FUsty4mS82WpWTUXR0P+BHfdyp1
   rMCMdpfbaPKKZr5HeIPAtwPm4I2k9ZjBlDFF7PrFaNgD7EmOoRNVOZkyi
   atBF+6fCAL2vj1tvg7swnaWfpL1QEfyhbuWHZXBk+9aiact/fbevEXq2c
   eGlqAJHF3zBguP5AnlJHrFv/PON9iQuQhEHkGgi3j1x3swR25grAaomaP
   TCch6Vruxomx9v1W1Db+NlOmAgfIxuyqzEM8Yxo9jYlD8YNdiE7e9SjcY
   4F9o+JItoWK2nnins3yJiLJ626zYLsf9VkgqQc+Cdp9sBpUJOSTzvUI6c
   Q==;
X-CSE-ConnectionGUID: bMPkd1bgTTuh+JaKHnem0Q==
X-CSE-MsgGUID: hVB4HaKkSNq2C84FdSTrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86342135"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86342135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:49:25 -0700
X-CSE-ConnectionGUID: UXUPnU5EQCqi0s+34ifdrQ==
X-CSE-MsgGUID: xwToxGxwRFesFBV47UPOlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222952069"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2026 02:49:22 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39zt-000000000hx-2fyg;
	Thu, 19 Mar 2026 09:49:00 +0000
Date: Thu, 19 Mar 2026 17:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 500e54d449f60e9692e2622ad2ba4f1e79590e87
Message-ID: <202603191709.actwmgTb-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35127-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 221172C9554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 500e54d449f60e9692e2622ad2ba4f1e79590e87  thunderbolt: dma_port: kmalloc_array + kzalloc to flex

elapsed time: 1061m

configs tested: 168
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260319    gcc-11.5.0
arc                   randconfig-002-20260319    gcc-11.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260319    gcc-11.5.0
arm                   randconfig-002-20260319    gcc-11.5.0
arm                   randconfig-003-20260319    gcc-11.5.0
arm                   randconfig-004-20260319    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260319    gcc-15.2.0
arm64                 randconfig-002-20260319    gcc-15.2.0
arm64                 randconfig-003-20260319    gcc-15.2.0
arm64                 randconfig-004-20260319    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260319    gcc-15.2.0
csky                  randconfig-002-20260319    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260319    gcc-11.5.0
hexagon               randconfig-002-20260319    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260319    gcc-14
i386        buildonly-randconfig-002-20260319    gcc-14
i386        buildonly-randconfig-003-20260319    gcc-14
i386        buildonly-randconfig-004-20260319    gcc-14
i386        buildonly-randconfig-005-20260319    gcc-14
i386        buildonly-randconfig-006-20260319    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260319    gcc-14
i386                  randconfig-002-20260319    gcc-14
i386                  randconfig-003-20260319    gcc-14
i386                  randconfig-004-20260319    gcc-14
i386                  randconfig-005-20260319    gcc-14
i386                  randconfig-006-20260319    gcc-14
i386                  randconfig-007-20260319    gcc-14
i386                  randconfig-011-20260319    clang-20
i386                  randconfig-012-20260319    clang-20
i386                  randconfig-013-20260319    clang-20
i386                  randconfig-014-20260319    clang-20
i386                  randconfig-015-20260319    clang-20
i386                  randconfig-016-20260319    clang-20
i386                  randconfig-017-20260319    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260319    gcc-11.5.0
loongarch             randconfig-002-20260319    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          sun3x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260319    gcc-11.5.0
nios2                 randconfig-002-20260319    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260319    clang-19
parisc                randconfig-002-20260319    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      chrp32_defconfig    clang-19
powerpc               randconfig-001-20260319    clang-19
powerpc               randconfig-002-20260319    clang-19
powerpc64             randconfig-001-20260319    clang-19
powerpc64             randconfig-002-20260319    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260319    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260319    gcc-10.5.0
s390                  randconfig-002-20260319    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260319    gcc-10.5.0
sh                    randconfig-002-20260319    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260319    gcc-8.5.0
sparc                 randconfig-002-20260319    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260319    gcc-8.5.0
sparc64               randconfig-002-20260319    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260319    gcc-8.5.0
um                    randconfig-002-20260319    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260319    clang-20
x86_64      buildonly-randconfig-002-20260319    clang-20
x86_64      buildonly-randconfig-003-20260319    clang-20
x86_64      buildonly-randconfig-004-20260319    clang-20
x86_64      buildonly-randconfig-005-20260319    clang-20
x86_64      buildonly-randconfig-006-20260319    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260319    gcc-14
x86_64                randconfig-002-20260319    gcc-14
x86_64                randconfig-003-20260319    gcc-14
x86_64                randconfig-004-20260319    gcc-14
x86_64                randconfig-005-20260319    gcc-14
x86_64                randconfig-006-20260319    gcc-14
x86_64                randconfig-011-20260319    gcc-13
x86_64                randconfig-012-20260319    gcc-13
x86_64                randconfig-013-20260319    gcc-13
x86_64                randconfig-014-20260319    gcc-13
x86_64                randconfig-015-20260319    gcc-13
x86_64                randconfig-016-20260319    gcc-13
x86_64                randconfig-071-20260319    clang-20
x86_64                randconfig-072-20260319    clang-20
x86_64                randconfig-073-20260319    clang-20
x86_64                randconfig-074-20260319    clang-20
x86_64                randconfig-075-20260319    clang-20
x86_64                randconfig-076-20260319    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260319    gcc-8.5.0
xtensa                randconfig-002-20260319    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

