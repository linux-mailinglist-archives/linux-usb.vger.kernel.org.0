Return-Path: <linux-usb+bounces-36056-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPpQBRBb1WkH5QcAu9opvQ
	(envelope-from <linux-usb+bounces-36056-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:29:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E83B3997
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9767130A963D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 19:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27C5344DA4;
	Tue,  7 Apr 2026 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8mfTtY2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4437359FAA
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589854; cv=none; b=ofVfvWX/UwxSYGTypfEHQy03+Ja+iJipX71EjPBE5YNdi2L1/I7BXXIpGH35BxY0lTi4V3DqJ84xspMuAbsOotKYzjQhqZssTGKrt/DsoLTWRLkRNzK0BDKCIDX6EvINe8vsdtqvD9pZ41jTnBkedYVhxBnfRi7APzGJ36d/CRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589854; c=relaxed/simple;
	bh=j2M2H6MGlEr0kwOOHa3sDk8gcttTB01IyxTTNupfsa0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KbhU3SXpXmkP9eApP1DREJidGrlxf5f4J8Y0i1FaPhezmzfbnBHfuDtvbmGaC7Xm/TKcagfuPCqRFpQRTfDWxgxWA3FsOls+/fHTqOtPOK8LazXvPc6mMZLXP7ODSkwbZfmb4/wQE3RlO+xBmCkAHln3wPG14qHNfsHyePLl3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8mfTtY2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775589853; x=1807125853;
  h=date:from:to:cc:subject:message-id;
  bh=j2M2H6MGlEr0kwOOHa3sDk8gcttTB01IyxTTNupfsa0=;
  b=D8mfTtY2jfyM0gmFLTROhQarP2iFd5vSTjGP5ET8TIRg1ZcgPQvgbjZ3
   HoBflFWCz0mrVdBHVCCnzrme/q5/+3PXAfq8E9LSI8HQW1BnmRGv5J84x
   8/VaThIXN3cRE2U6VbkxPyxpLd10qnzvKqjRayoBmMxUbUpNMfmO9hSHM
   49LbtN1hyNSYkeBGIUUpfJSELuDaM8FhhOHdQIFZ1+m+f15e1kItNPcQw
   38P8CIpCoy65srvzzERXS+tnnMIutlD+/Hg773zU9AuN0+NDBaT5eWfNV
   rEjIKqYBeheKo6TN8gbVUiE7UKtvdTKLFQWEA7a5LbH8nyVf52ycmMhDA
   w==;
X-CSE-ConnectionGUID: Om9WzT9lTgiGQy2JaMzF/w==
X-CSE-MsgGUID: DbQVCUBTQbibbIzp0vZdKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76752089"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76752089"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:24:12 -0700
X-CSE-ConnectionGUID: RQdLFq+/TZOj2/GLQh54hA==
X-CSE-MsgGUID: flGihPJRT5mu5xIBptbcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="233224302"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 12:24:10 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAC1v-000000000xW-268M;
	Tue, 07 Apr 2026 19:24:07 +0000
Date: Wed, 08 Apr 2026 03:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 498c05821bb42f70e9bf6512c3dec4aa821815d0
Message-ID: <202604080336.VEu4aHEC-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-36056-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 699E83B3997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 498c05821bb42f70e9bf6512c3dec4aa821815d0  thunderbolt: tunnel: Simplify allocation

elapsed time: 731m

configs tested: 202
configs skipped: 8

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
arc                   randconfig-001-20260407    clang-23
arc                   randconfig-002-20260407    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260407    clang-23
arm                   randconfig-002-20260407    clang-23
arm                   randconfig-003-20260407    clang-23
arm                   randconfig-004-20260407    clang-23
arm                           sama5_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260407    gcc-9.5.0
arm64                 randconfig-002-20260407    gcc-13.4.0
arm64                 randconfig-002-20260407    gcc-9.5.0
arm64                 randconfig-003-20260407    gcc-8.5.0
arm64                 randconfig-003-20260407    gcc-9.5.0
arm64                 randconfig-004-20260407    clang-23
arm64                 randconfig-004-20260407    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260407    gcc-13.4.0
csky                  randconfig-001-20260407    gcc-9.5.0
csky                  randconfig-002-20260407    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260407    clang-23
hexagon               randconfig-002-20260407    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260407    clang-20
i386        buildonly-randconfig-002-20260407    clang-20
i386        buildonly-randconfig-003-20260407    clang-20
i386        buildonly-randconfig-004-20260407    clang-20
i386        buildonly-randconfig-005-20260407    clang-20
i386        buildonly-randconfig-006-20260407    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260407    clang-20
i386                  randconfig-001-20260407    gcc-14
i386                  randconfig-002-20260407    gcc-14
i386                  randconfig-003-20260407    clang-20
i386                  randconfig-003-20260407    gcc-14
i386                  randconfig-004-20260407    gcc-14
i386                  randconfig-005-20260407    clang-20
i386                  randconfig-005-20260407    gcc-14
i386                  randconfig-006-20260407    gcc-14
i386                  randconfig-007-20260407    gcc-14
i386                  randconfig-011-20260407    clang-20
i386                  randconfig-011-20260407    gcc-14
i386                  randconfig-012-20260407    clang-20
i386                  randconfig-013-20260407    clang-20
i386                  randconfig-014-20260407    clang-20
i386                  randconfig-015-20260407    clang-20
i386                  randconfig-015-20260407    gcc-14
i386                  randconfig-016-20260407    clang-20
i386                  randconfig-017-20260407    clang-20
i386                  randconfig-017-20260407    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260407    clang-23
loongarch             randconfig-002-20260407    clang-23
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260407    clang-23
nios2                 randconfig-002-20260407    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260407    gcc-10.5.0
parisc                randconfig-001-20260407    gcc-8.5.0
parisc                randconfig-002-20260407    gcc-10.5.0
parisc                randconfig-002-20260407    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      chrp32_defconfig    clang-19
powerpc                     mpc512x_defconfig    clang-23
powerpc               randconfig-001-20260407    gcc-10.5.0
powerpc               randconfig-001-20260407    gcc-13.4.0
powerpc               randconfig-002-20260407    gcc-10.5.0
powerpc               randconfig-002-20260407    gcc-8.5.0
powerpc64             randconfig-001-20260407    gcc-10.5.0
powerpc64             randconfig-001-20260407    gcc-12.5.0
powerpc64             randconfig-002-20260407    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260407    clang-23
riscv                 randconfig-001-20260407    gcc-14.3.0
riscv                 randconfig-002-20260407    gcc-12.5.0
riscv                 randconfig-002-20260407    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260407    gcc-14.3.0
s390                  randconfig-002-20260407    clang-20
s390                  randconfig-002-20260407    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260407    gcc-13.4.0
sh                    randconfig-001-20260407    gcc-14.3.0
sh                    randconfig-002-20260407    gcc-14.3.0
sh                    randconfig-002-20260407    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260407    gcc-12
sparc                 randconfig-001-20260407    gcc-15.2.0
sparc                 randconfig-002-20260407    gcc-12
sparc                 randconfig-002-20260407    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260407    clang-23
sparc64               randconfig-001-20260407    gcc-12
sparc64               randconfig-002-20260407    clang-20
sparc64               randconfig-002-20260407    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260407    gcc-12
um                    randconfig-002-20260407    gcc-12
um                    randconfig-002-20260407    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260407    gcc-14
x86_64      buildonly-randconfig-002-20260407    gcc-14
x86_64      buildonly-randconfig-003-20260407    gcc-14
x86_64      buildonly-randconfig-004-20260407    clang-20
x86_64      buildonly-randconfig-004-20260407    gcc-14
x86_64      buildonly-randconfig-005-20260407    gcc-14
x86_64      buildonly-randconfig-006-20260407    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260407    gcc-14
x86_64                randconfig-002-20260407    gcc-14
x86_64                randconfig-003-20260407    gcc-14
x86_64                randconfig-004-20260407    gcc-14
x86_64                randconfig-005-20260407    gcc-14
x86_64                randconfig-006-20260407    gcc-14
x86_64                randconfig-011-20260407    clang-20
x86_64                randconfig-011-20260407    gcc-14
x86_64                randconfig-012-20260407    clang-20
x86_64                randconfig-013-20260407    clang-20
x86_64                randconfig-014-20260407    clang-20
x86_64                randconfig-015-20260407    clang-20
x86_64                randconfig-015-20260407    gcc-14
x86_64                randconfig-016-20260407    clang-20
x86_64                randconfig-016-20260407    gcc-14
x86_64                randconfig-071-20260407    clang-20
x86_64                randconfig-072-20260407    clang-20
x86_64                randconfig-073-20260407    clang-20
x86_64                randconfig-074-20260407    clang-20
x86_64                randconfig-075-20260407    clang-20
x86_64                randconfig-076-20260407    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260407    gcc-12
xtensa                randconfig-001-20260407    gcc-12.5.0
xtensa                randconfig-002-20260407    gcc-12
xtensa                randconfig-002-20260407    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

