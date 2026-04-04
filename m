Return-Path: <linux-usb+bounces-35961-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s1swJUhn0Gla7QYAu9opvQ
	(envelope-from <linux-usb+bounces-35961-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:20:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0563996E7
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A4D9303E4BD
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 01:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EC725A357;
	Sat,  4 Apr 2026 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5z/1Ufh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1886341
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775265601; cv=none; b=LlKfWtnvWEDU7adpgNW18v/yUPWEsZ+Gmhdp3TaWyZ6bur/UgmNsDGLgDgWAAi1xrdXtG01w3MoMWLBJGZrjF7rNYL3zQ/hNcWvOHfA/Onsc8foKoMEc+5lNwi72jsz3sRGcEj32yybrYiC+2o+X70FWLLsmatRzIsW5cpAQzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775265601; c=relaxed/simple;
	bh=+pS+RmIDgZ1YCX3k35yMjcwuE97tnAxTxoVE0+pDuGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gj2+F8vY6F9MWx9+2qC2OAhXua8wPNcwQEx9qnO6IexbwHDPu4U0EWj/OuJwtFYrZBNEwF4ylSPnE1EEFNBN9awvxrV2HgqnqN6Az0TUZP06CQu0LwgbqR/7jgDqtA9IiN4BTxnZKN1ktmzpuf1ZNlgS6hCezsUqDt6DHRPyRWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5z/1Ufh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775265599; x=1806801599;
  h=date:from:to:cc:subject:message-id;
  bh=+pS+RmIDgZ1YCX3k35yMjcwuE97tnAxTxoVE0+pDuGI=;
  b=E5z/1Ufh03cVQONw7JNb3bAqtLO06zjdDeB8CoV9lDTRGtpY53aM6Kjb
   rkbCKCsKWyJpWFoknvkdTOeR+jM6h5zsLTeBL2CMl8QpTqmnsKNB++qSB
   orUB4ZfRPqi+IUvQvb9EYZ32CitdD+pgv7JZu7kqm2au8IJxrLmNboWQT
   mJ/Oegr+JnTES31FTMcBqNIRn3l9JoD8Z7EIWlAdxfgEhgn74xTVe2m/E
   +k+F6WQtXGM/Un7NAyYECJKjHiqu2t65AYEQy1NIdrSaxB80kOlI3h1/0
   oA7GoDalM1VPeRo+NOGIUiKwfKWuRKobtIWG7V9xt62oIaobv+r33FTOi
   w==;
X-CSE-ConnectionGUID: 6H1UzAHwRLuSoeiNWw9qIw==
X-CSE-MsgGUID: JTl8XLBgRj2LPcZ3lvOoFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76389767"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76389767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:19:58 -0700
X-CSE-ConnectionGUID: pjL7JuUHRxS6oTUpZaaSzw==
X-CSE-MsgGUID: Phf46lEWTumFtdXEKsE/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="224571045"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 18:19:57 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8pg3-000000000PC-1aUb;
	Sat, 04 Apr 2026 01:19:55 +0000
Date: Sat, 04 Apr 2026 09:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 1df7a7652f032cf1abe1c102a031c2128e24c31d
Message-ID: <202604040934.tXnI2dBh-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-35961-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: CE0563996E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 1df7a7652f032cf1abe1c102a031c2128e24c31d  Revert "dt-bindings: usb: cdns,usb3: document USBSSP controller support"

elapsed time: 730m

configs tested: 242
configs skipped: 2

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
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-001-20260404    gcc-15.2.0
arc                   randconfig-002-20260403    gcc-10.5.0
arc                   randconfig-002-20260404    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-001-20260404    gcc-15.2.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-002-20260404    gcc-15.2.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-003-20260404    gcc-15.2.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                   randconfig-004-20260404    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-001-20260404    gcc-15.2.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-002-20260404    gcc-15.2.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-003-20260404    gcc-15.2.0
arm64                 randconfig-004-20260403    gcc-13.4.0
arm64                 randconfig-004-20260404    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-001-20260404    gcc-15.2.0
csky                  randconfig-002-20260403    gcc-13.4.0
csky                  randconfig-002-20260404    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-001-20260404    gcc-15.2.0
hexagon               randconfig-002-20260403    clang-23
hexagon               randconfig-002-20260404    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-001-20260404    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-002-20260404    clang-20
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-003-20260404    clang-20
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-004-20260404    clang-20
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-005-20260404    clang-20
i386        buildonly-randconfig-006-20260403    gcc-14
i386        buildonly-randconfig-006-20260404    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260404    clang-20
i386                  randconfig-002-20260404    clang-20
i386                  randconfig-003-20260404    clang-20
i386                  randconfig-004-20260404    clang-20
i386                  randconfig-005-20260404    clang-20
i386                  randconfig-006-20260404    clang-20
i386                  randconfig-007-20260404    clang-20
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-011-20260404    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-012-20260404    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-013-20260404    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-014-20260404    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-015-20260404    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-016-20260404    clang-20
i386                  randconfig-017-20260403    clang-20
i386                  randconfig-017-20260404    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-001-20260404    gcc-15.2.0
loongarch             randconfig-002-20260403    clang-23
loongarch             randconfig-002-20260404    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-001-20260404    gcc-15.2.0
nios2                 randconfig-002-20260403    clang-23
nios2                 randconfig-002-20260404    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-001-20260404    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc                randconfig-002-20260404    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-001-20260404    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc               randconfig-002-20260404    gcc-10.5.0
powerpc                  storcenter_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260404    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260404    gcc-10.5.0
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-001-20260404    clang-20
riscv                 randconfig-002-20260403    clang-23
riscv                 randconfig-002-20260404    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-001-20260404    clang-20
s390                  randconfig-002-20260403    clang-23
s390                  randconfig-002-20260404    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-001-20260404    clang-20
sh                    randconfig-002-20260403    clang-23
sh                    randconfig-002-20260404    clang-20
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-001-20260404    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc                 randconfig-002-20260404    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-001-20260404    clang-20
sparc64               randconfig-002-20260403    clang-20
sparc64               randconfig-002-20260404    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-001-20260404    clang-20
um                    randconfig-002-20260403    clang-20
um                    randconfig-002-20260404    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-001-20260404    gcc-13
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-002-20260404    gcc-13
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-003-20260404    gcc-13
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-004-20260404    gcc-13
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-005-20260404    gcc-13
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64      buildonly-randconfig-006-20260404    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260404    gcc-14
x86_64                randconfig-002-20260404    gcc-14
x86_64                randconfig-003-20260404    gcc-14
x86_64                randconfig-004-20260404    gcc-14
x86_64                randconfig-005-20260404    gcc-14
x86_64                randconfig-006-20260404    gcc-14
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-011-20260404    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-012-20260404    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-013-20260404    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-014-20260404    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-015-20260404    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-016-20260404    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-071-20260404    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-072-20260404    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-073-20260404    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-074-20260404    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-075-20260404    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                randconfig-076-20260404    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-001-20260404    clang-20
xtensa                randconfig-002-20260403    clang-20
xtensa                randconfig-002-20260404    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

