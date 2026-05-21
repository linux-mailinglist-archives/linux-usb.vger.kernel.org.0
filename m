Return-Path: <linux-usb+bounces-37854-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI7REK7QDmrOCQYAu9opvQ
	(envelope-from <linux-usb+bounces-37854-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 11:30:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0CC5A25CA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 11:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECF613147456
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18C835B137;
	Thu, 21 May 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1DwQOQL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895034572F
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354031; cv=none; b=Epz7Sc/lE6bmUBlfaIOSnc2nNwbuKxJxDAXlnf0uJfku7/0ades4peKH/6GjL02ab/HYuRGAscSY+nAYQrySWCwetbI/3+JbHuc8NVKGaRpSo7fpbXe860dOAMU2YjmcFcjXmS/+dtlFAgb/+GPuBHsLmulKIiPuoWs8Z5plEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354031; c=relaxed/simple;
	bh=B/yZYFkNXprXZNP84e844N69gY/pQ7yoWLj5WJcDSKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EySE8DlFRasHVj8H/ApzF2ROdp2dbTYIFPLbaF7kJLJ6pdlk/TuQ2Dkvl2oCszpS/OcctuRdyFZKjNSggoe4Q5fCvPLxw4hKyuvHpklayJugoL0szCV7WUZan/8lCMcm34DcALJiw359N/WANrZ7qFtZbvMrDbTVocagF8tohiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1DwQOQL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779354030; x=1810890030;
  h=date:from:to:cc:subject:message-id;
  bh=B/yZYFkNXprXZNP84e844N69gY/pQ7yoWLj5WJcDSKI=;
  b=i1DwQOQLmmP5b26J05WdAhb2rtcx4LsyQAyVWOZoLwdoiLWj5pNKRdq2
   RqKWbtDb5q2P2/6O2OAOuu3f94UCIXijZ7tkILw8bCxDOVnZlE84Ze0qS
   SGeHPlnS8W7VOxcBM9qAxCWmGYc+Ln0JrcI3yg1fMWUq9W30l8t9DffjI
   D50t3Y5wYH4SSDhFbGaAAqhpSK5HNBGchjJP0DSubBflkBq4qrM7ZGZN4
   cD6fvaA225rEE2OpW6cyqmaOCwL8h72EvH2uTVW6HYws/Qg4PCACgbDQE
   6PMVZFPuJtgaimSrGccn94hv8xSvdtg/FJY7qUiNYFbbIY9Cd1IhWrphN
   w==;
X-CSE-ConnectionGUID: kj4EhFg3RQW0VS2L6qxUhA==
X-CSE-MsgGUID: BMyETyKbTQGpaQkhqxyZmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80302267"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80302267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:00:27 -0700
X-CSE-ConnectionGUID: RJCOMskxSQCATnPKQTHZ3Q==
X-CSE-MsgGUID: dbr4dpGlQxGKo68dr7w4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="270823532"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2026 02:00:24 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzGP-000000004iJ-3UJy;
	Thu, 21 May 2026 09:00:21 +0000
Date: Thu, 21 May 2026 16:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 e24f3c0df48378214d9a67c5048d0faca144b163
Message-ID: <202605211659.EBEdANhL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-37854-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CA0CC5A25CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: e24f3c0df48378214d9a67c5048d0faca144b163  thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers

elapsed time: 1092m

configs tested: 250
configs skipped: 9

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
arc                   randconfig-001-20260520    gcc-11.5.0
arc                   randconfig-001-20260521    gcc-8.5.0
arc                   randconfig-002-20260520    gcc-10.5.0
arc                   randconfig-002-20260521    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    clang-17
arm                   randconfig-001-20260520    clang-23
arm                   randconfig-001-20260521    gcc-8.5.0
arm                   randconfig-002-20260520    clang-23
arm                   randconfig-002-20260521    gcc-8.5.0
arm                   randconfig-003-20260520    gcc-14.3.0
arm                   randconfig-003-20260521    gcc-8.5.0
arm                   randconfig-004-20260520    gcc-8.5.0
arm                   randconfig-004-20260521    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260520    gcc-13.4.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-002-20260520    gcc-10.5.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                 randconfig-003-20260520    clang-20
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-004-20260520    clang-16
arm64                 randconfig-004-20260521    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260520    gcc-13.4.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                  randconfig-002-20260520    gcc-15.2.0
csky                  randconfig-002-20260521    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-002-20260521    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260521    clang-20
i386        buildonly-randconfig-002-20260521    clang-20
i386        buildonly-randconfig-003-20260521    clang-20
i386        buildonly-randconfig-004-20260521    clang-20
i386        buildonly-randconfig-005-20260521    clang-20
i386        buildonly-randconfig-006-20260521    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-002-20260521    clang-20
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-004-20260521    clang-20
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-007-20260521    clang-20
i386                  randconfig-011-20260520    gcc-14
i386                  randconfig-011-20260521    gcc-14
i386                  randconfig-012-20260520    gcc-14
i386                  randconfig-012-20260521    gcc-14
i386                  randconfig-013-20260520    gcc-14
i386                  randconfig-013-20260521    gcc-14
i386                  randconfig-014-20260520    clang-20
i386                  randconfig-014-20260521    gcc-14
i386                  randconfig-015-20260520    gcc-14
i386                  randconfig-015-20260521    gcc-14
i386                  randconfig-016-20260520    gcc-14
i386                  randconfig-016-20260521    gcc-14
i386                  randconfig-017-20260520    gcc-14
i386                  randconfig-017-20260521    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260520    gcc-13.4.0
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         rt305x_defconfig    clang-23
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260520    gcc-11.5.0
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-002-20260520    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260520    gcc-10.5.0
parisc                randconfig-001-20260521    gcc-12.5.0
parisc                randconfig-002-20260520    gcc-11.5.0
parisc                randconfig-002-20260521    gcc-12.5.0
parisc                randconfig-002-20260521    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      mgcoge_defconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260521    clang-23
powerpc               randconfig-001-20260521    gcc-12.5.0
powerpc               randconfig-002-20260521    clang-17
powerpc               randconfig-002-20260521    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260521    clang-23
powerpc64             randconfig-001-20260521    gcc-12.5.0
powerpc64             randconfig-002-20260521    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                 randconfig-002-20260521    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260520    clang-23
s390                  randconfig-001-20260521    gcc-15.2.0
s390                  randconfig-002-20260520    clang-23
s390                  randconfig-002-20260521    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260520    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                    randconfig-002-20260520    gcc-13.4.0
sh                    randconfig-002-20260521    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260520    gcc-12.5.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-002-20260520    gcc-14.3.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260520    gcc-13.4.0
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-002-20260520    gcc-13.4.0
sparc64               randconfig-002-20260521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260520    clang-23
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-002-20260520    gcc-14
um                    randconfig-002-20260521    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64      buildonly-randconfig-003-20260520    gcc-14
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64      buildonly-randconfig-004-20260520    gcc-14
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64      buildonly-randconfig-005-20260520    gcc-14
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64      buildonly-randconfig-006-20260520    gcc-14
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260520    gcc-14
x86_64                randconfig-001-20260521    clang-20
x86_64                randconfig-002-20260520    clang-20
x86_64                randconfig-002-20260521    clang-20
x86_64                randconfig-003-20260520    gcc-14
x86_64                randconfig-003-20260521    clang-20
x86_64                randconfig-004-20260520    gcc-14
x86_64                randconfig-004-20260521    clang-20
x86_64                randconfig-005-20260520    gcc-12
x86_64                randconfig-005-20260521    clang-20
x86_64                randconfig-006-20260520    clang-20
x86_64                randconfig-006-20260521    clang-20
x86_64                randconfig-011-20260521    gcc-14
x86_64                randconfig-012-20260521    gcc-14
x86_64                randconfig-013-20260521    gcc-14
x86_64                randconfig-014-20260521    gcc-14
x86_64                randconfig-015-20260521    gcc-14
x86_64                randconfig-016-20260521    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260521    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260521    clang-20
x86_64                randconfig-074-20260521    gcc-14
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260521    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260520    gcc-8.5.0
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-002-20260520    gcc-11.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

