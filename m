Return-Path: <linux-usb+bounces-38111-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMrYCyhaF2oPBQgAu9opvQ
	(envelope-from <linux-usb+bounces-38111-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 22:55:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81A5EA403
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 22:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4883085528
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 20:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5484221723;
	Wed, 27 May 2026 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHcosJLS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57B32F8EA8
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779914931; cv=none; b=VWJ9FvdOMExxSqJS7VwH6TYbJJQKUqgZhSzClOc5AoUpGEODlAaewxcBwci7QUT9pvggnXvhgOhJC+jwtFgtstvanbY9qPnIwFYRNT3LzdqwFxhEcbIgEtXKx39oV363vtcTrMuRbLSJLLhlBQFmZnhrv0LDJEZ1beOP+7fVZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779914931; c=relaxed/simple;
	bh=QJ7giHTY7Q/sW8y0H5TwjkrQtRRzVQpm5GXbaVXEhrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dCbX6Loc2/Yyv2sVWkh3smvplvukoVelW836eLrAM+2ZSyO9MH26YOcAhbc4/6zZ0X8QSe319xA1URFS1wpYJnnQURPSW7IRWROi2aJDwsCGfeEiRvfmfsCwX7KdPgUs1G2tXWG6USftygL8TXSdUjZpdjfKmYVsgw26FQnTsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHcosJLS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779914930; x=1811450930;
  h=date:from:to:cc:subject:message-id;
  bh=QJ7giHTY7Q/sW8y0H5TwjkrQtRRzVQpm5GXbaVXEhrM=;
  b=SHcosJLSR1rWJ14IUxK+yzpb30BBWfUY6Rrm/6PCdyMFgVn7qTvuNDyb
   wGWSJ3WbQpqmjooOzbwC9k3qRoW/qnA3F40v8BJRKulh61g63tjMbnFm8
   /D3PYhHIfAX5duJC3B9N+2os/HSKW2kI5r8yAeLgqf/6lFoobbiw1ebDz
   6yUrwRMRpWXXHhXrMKa8CYvTsrK8nXPswi1Mxi7eofUlSsNGKfb/mjQM6
   0FL7np8Au+YvL+Ut8X7BlGAD84DuI8D/Ck8vI+IZvmcAWDEYcFuO4LKV7
   k9yIP6peRbXhiWZSkBvvYkzyM/SEDYAv7FBQUXCwE7JV454AoNxtPhD+b
   w==;
X-CSE-ConnectionGUID: PYSMTtMuSxamItckrltI4A==
X-CSE-MsgGUID: 1lpQcgmoSceAJuKdFTN5jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84616010"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="84616010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 13:48:49 -0700
X-CSE-ConnectionGUID: gqrQBeedQMu3T3+mJOqxAQ==
X-CSE-MsgGUID: m0DgGE20QgW4TJPpf7Kk3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="266227451"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2026 13:48:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSLBF-000000004RW-1rrg;
	Wed, 27 May 2026 20:48:45 +0000
Date: Thu, 28 May 2026 04:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 d73a08958e66849ea713d2f458b2fcf7b183f987
Message-ID: <202605280428.eepmMAwX-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38111-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9A81A5EA403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: d73a08958e66849ea713d2f458b2fcf7b183f987  thunderbolt: test: Add KUnit tests for property parser bounds checks

elapsed time: 1723m

configs tested: 144
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    clang-23
arc                    allyesconfig    gcc-15.2.0
arc         randconfig-001-20260528    clang-23
arc         randconfig-002-20260528    clang-23
arc          vdk_hs38_smp_defconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                     allnoconfig    gcc-15.2.0
arm                    allyesconfig    gcc-15.2.0
arm         randconfig-001-20260528    clang-23
arm         randconfig-002-20260528    clang-23
arm         randconfig-003-20260528    clang-23
arm         randconfig-004-20260528    clang-23
arm                 stm32_defconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                  allmodconfig    clang-23
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-001-20260528    gcc-15.2.0
arm64       randconfig-002-20260528    gcc-15.2.0
arm64       randconfig-003-20260528    gcc-15.2.0
arm64       randconfig-004-20260528    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260528    gcc-15.2.0
csky        randconfig-002-20260528    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                allmodconfig    gcc-15.2.0
hexagon                 allnoconfig    clang-23
hexagon                 allnoconfig    gcc-15.2.0
hexagon     randconfig-001-20260528    clang-20
hexagon     randconfig-001-20260528    gcc-11.5.0
hexagon     randconfig-002-20260528    clang-19
i386                    allnoconfig    gcc-14
i386                    allnoconfig    gcc-15.2.0
i386        randconfig-011-20260528    clang-20
i386        randconfig-012-20260528    clang-20
i386        randconfig-013-20260528    clang-20
i386        randconfig-014-20260528    clang-20
i386        randconfig-015-20260528    clang-20
i386        randconfig-016-20260528    clang-20
i386        randconfig-017-20260528    clang-20
loongarch              allmodconfig    clang-19
loongarch              allmodconfig    clang-23
loongarch               allnoconfig    clang-23
loongarch               allnoconfig    gcc-15.2.0
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20260528    clang-18
loongarch   randconfig-002-20260528    clang-23
loongarch   randconfig-002-20260528    gcc-11.5.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
m68k                      defconfig    clang-19
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
microblaze                defconfig    clang-19
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    clang-23
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    clang-19
nios2       randconfig-001-20260528    gcc-11.5.0
nios2       randconfig-002-20260528    gcc-11.5.0
nios2       randconfig-002-20260528    gcc-8.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    clang-23
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    clang-23
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc                    defconfig    gcc-15.2.0
parisc64                  defconfig    clang-19
powerpc                 allnoconfig    clang-23
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    clang-23
riscv                     defconfig    gcc-15.2.0
riscv       randconfig-001-20260528    gcc-13.4.0
riscv       randconfig-002-20260528    gcc-13.4.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                      defconfig    clang-23
s390                      defconfig    gcc-15.2.0
s390        randconfig-001-20260528    gcc-13.4.0
s390        randconfig-002-20260528    gcc-13.4.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-23
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-14
sh                        defconfig    gcc-15.2.0
sh          randconfig-001-20260528    gcc-13.4.0
sh          randconfig-002-20260528    gcc-13.4.0
sparc                   allnoconfig    clang-23
sparc                   allnoconfig    gcc-15.2.0
sparc                     defconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64                   defconfig    gcc-14
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                     allyesconfig    gcc-15.2.0
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    clang-23
um                 x86_64_defconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                  allnoconfig    clang-23
x86_64                    defconfig    gcc-14
x86_64      randconfig-001-20260527    gcc-14
x86_64      randconfig-002-20260527    clang-20
x86_64      randconfig-003-20260527    clang-20
x86_64      randconfig-004-20260527    clang-20
x86_64      randconfig-005-20260527    clang-20
x86_64      randconfig-006-20260527    gcc-14
x86_64               randconfig-011    gcc-14
x86_64      randconfig-011-20260527    gcc-14
x86_64               randconfig-012    gcc-14
x86_64      randconfig-012-20260527    gcc-14
x86_64               randconfig-013    clang-20
x86_64      randconfig-013-20260527    gcc-14
x86_64               randconfig-014    gcc-14
x86_64      randconfig-014-20260527    clang-20
x86_64               randconfig-015    gcc-14
x86_64      randconfig-015-20260527    gcc-14
x86_64               randconfig-016    clang-20
x86_64      randconfig-016-20260527    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    clang-23
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

