Return-Path: <linux-usb+bounces-35917-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGOFK4z/zmlIsQYAu9opvQ
	(envelope-from <linux-usb+bounces-35917-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 01:45:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A738F4A3
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 01:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A8BC30180B2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 23:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C823932D9;
	Thu,  2 Apr 2026 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrpgU8jW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5E257452
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 23:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775173506; cv=none; b=Q68UP1En/kDxrKcB9sWWCDfWWMGahYlC7jK2qaOwu3EmM5fl2qZ4G7pW4o+DGqiEgGkfo7HxfO/b88D6kwAFk0/wElKPx+2aWNmvFJOPKX8Z1SnJ92SOedlCvjJtcO9LMxQ48qG1TsG031pOK/b56jEoFVcSIYhsTA8FoYal51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775173506; c=relaxed/simple;
	bh=oB4UbV8bx3sb0k8q56O2nLBPcVMIqsLH+rtM7wlTF9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QGP7zEtqrsa/HmHgineF0F+sjdE7AAklHjx04LkYTY9uGlcnMv5s2hM8hT5q9gxZJVJ6IeeuSR39mja5sQ55Mt+0Sqp///u4bA6LwoSDw2asG8B3LHOqq8Q6Xd1IgT24rwOw5SKyo64zAoVl7QS2TYz7g+mo64jb2K003vXra5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrpgU8jW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775173503; x=1806709503;
  h=date:from:to:cc:subject:message-id;
  bh=oB4UbV8bx3sb0k8q56O2nLBPcVMIqsLH+rtM7wlTF9g=;
  b=IrpgU8jWcyYo5SAWy1sX0/SkteQbz+wdBjhftvNrLvlRinm3iCmHzYUs
   tPk5RrnDl8aoZJ+oLAjLUcUlpdMoWs+6QdTZWhKKGPyh64EbIUEf5IcCC
   XSzBi8AzvtwrMD+3pJesa/wbSjZkcGJCcBBkWNqe7LT5qGa6SdltvKMAt
   ZjVohrPo1E5NsVSRsXU7n04m9Jkfna8g/IR1UwPy/jHYuGYuRxPsY45oK
   R6S0gxnKGHRjdVI22XIflW2Z06QLNOpJAD1KYThy7EB2asOrtKfCxgxNX
   X+verWvpqcdvkJOk10UIoa0Fogu07Yx+Z1lfK4rwIBUrUEBahfoWf8AUi
   g==;
X-CSE-ConnectionGUID: 1by2PO2dSoi2CfCwSqCvOQ==
X-CSE-MsgGUID: BlXNrl1HRHuxr79VUbVzGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76210649"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="76210649"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 16:45:02 -0700
X-CSE-ConnectionGUID: zlK7mWPcQESmX2VAN9IpSA==
X-CSE-MsgGUID: DqtV3eFxQ1ilOfUfh5cR/g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2026 16:45:01 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Ric-000000000Y1-2Kh8;
	Thu, 02 Apr 2026 23:44:58 +0000
Date: Fri, 03 Apr 2026 07:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 bf3781a35c27978341c31f59f1460dcaabf2e726
Message-ID: <202604030735.Xw3t0Djk-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-35917-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 230A738F4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: bf3781a35c27978341c31f59f1460dcaabf2e726  Merge tag 'usb-serial-7.0-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 732m

configs tested: 220
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
arc                   randconfig-001-20260402    gcc-11.5.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-002-20260402    gcc-11.5.0
arc                   randconfig-002-20260403    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260402    gcc-11.5.0
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-002-20260402    gcc-11.5.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-003-20260402    gcc-11.5.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-004-20260402    gcc-11.5.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260402    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260402    gcc-15.2.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260402    gcc-15.2.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260402    gcc-15.2.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260402    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260402    gcc-15.2.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260402    clang-18
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260402    clang-18
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260402    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260402    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260402    clang-20
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260402    clang-20
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260402    clang-20
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260402    clang-20
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260402    clang-20
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-002-20260402    clang-20
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-003-20260402    clang-20
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-004-20260402    clang-20
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-005-20260402    clang-20
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-006-20260402    clang-20
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-007-20260402    clang-20
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-011-20260402    clang-20
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-012-20260402    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-013-20260402    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-014-20260402    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-015-20260402    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-016-20260402    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-017-20260402    clang-20
i386                  randconfig-017-20260403    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260402    clang-18
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260402    clang-18
loongarch             randconfig-002-20260403    clang-23
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
nios2                 randconfig-001-20260402    clang-18
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260402    clang-18
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260402    clang-20
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260402    clang-20
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260402    clang-20
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260402    clang-20
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260402    clang-20
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260402    clang-20
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260402    clang-23
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-002-20260402    clang-23
riscv                 randconfig-002-20260403    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260402    clang-23
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-002-20260402    clang-23
s390                  randconfig-002-20260403    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260402    clang-23
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-002-20260402    clang-23
sh                    randconfig-002-20260403    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260402    gcc-14
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260402    gcc-14
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260402    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260402    gcc-14
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260402    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260402    gcc-14
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260402    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260402    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260402    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260402    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260402    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260402    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260402    clang-20
x86_64                randconfig-072-20260402    clang-20
x86_64                randconfig-073-20260402    clang-20
x86_64                randconfig-074-20260402    clang-20
x86_64                randconfig-075-20260402    clang-20
x86_64                randconfig-076-20260402    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260402    gcc-14
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260402    gcc-14
xtensa                randconfig-002-20260403    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

