Return-Path: <linux-usb+bounces-33721-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id S6xnKNHon2l7ewQAu9opvQ
	(envelope-from <linux-usb+bounces-33721-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 07:31:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA171A1515
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 07:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DF53046035
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 06:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B57311973;
	Thu, 26 Feb 2026 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCMEl7xo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7A2DC783
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772087500; cv=none; b=gezT3uP26scMW1XoAbiCS8GO1DFlB/8jW6/SdKo3i2OCYeHBwLLznYHUDbANRV4vjbf4xFq+Y2W1J2DPT3Ubb/tiSRmt7TBMT572RWjzCOvH7n4yOuFmjgAlM3balXvNf7fNjHkn6mivH63mULHBsCSCaSHyxz3LV2w/AVqJG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772087500; c=relaxed/simple;
	bh=1qmnoaDsSOxSal9oi318PD86hUsSieXsquTWhwTN7Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C60UVZDOSvbmD+nT2tfBwaTywGd7rkYP/CnO3OGmIPIylFeNaPmzfE6kd0ZVgHL06XIOsNbddf6bPADncu89nGIp8qtHRfAaTYFUeb3YLZFv2pbfyIq7qYMRttLCNx9b1s9ueza4TdEvE4qvSP6HgkisqjhTl03RdVnXqOj8Fdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCMEl7xo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772087499; x=1803623499;
  h=date:from:to:cc:subject:message-id;
  bh=1qmnoaDsSOxSal9oi318PD86hUsSieXsquTWhwTN7Gs=;
  b=XCMEl7xo+5rO3NyFU34sjPpzkcyTYqPDdAMSfwpevzJl0/fenQEFQFbd
   67pm3J6uGSpPtk1wPZ7QIE5rZ2fVZd1+wr+W488o11PwwtjGR5q4qER+A
   gmv3OqVIVUoUQGWNBVj6hiGaWKetSj4JSr9sSIFVai7kFkwptmTSagGiU
   0LXm1AG6qpFoQTPm9c2M3tqwYtUddzEKG8IBI0u3RJMCnncwk4w+YmdLq
   yZ49HYIrTB1NtX0p8f36mNLYZnoni55rHwPWU3mr63+lYyacpU+8yxciN
   CdN0M9Ho1pOwjQbBfg/q3mR/2hb+XirQpBwq+/fTZuAhFWNDuarIaiOTv
   g==;
X-CSE-ConnectionGUID: qu3ii7PKTde1TAx0pWgWuw==
X-CSE-MsgGUID: Q2ttZNrKRG+kD2drigcRiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73049670"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73049670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 22:31:38 -0800
X-CSE-ConnectionGUID: MuXkDqF/S6yAKj8N+0Ozug==
X-CSE-MsgGUID: 6DzP5Fp0TCGU3hJDj3huLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220606423"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 22:31:37 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvUuK-000000008KB-0ejw;
	Thu, 26 Feb 2026 06:31:32 +0000
Date: Thu, 26 Feb 2026 14:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1be3b77de4eb89af8ae2fd6610546be778e25589
Message-ID: <202602261424.U9qv67EZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33721-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBA171A1515
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1be3b77de4eb89af8ae2fd6610546be778e25589  usb: image: mdc800: kill download URB on timeout

elapsed time: 721m

configs tested: 214
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260226    gcc-15.2.0
arc                   randconfig-002-20260226    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260226    gcc-15.2.0
arm                   randconfig-002-20260226    gcc-15.2.0
arm                   randconfig-003-20260226    gcc-15.2.0
arm                   randconfig-004-20260226    gcc-15.2.0
arm                        shmobile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260226    gcc-14.3.0
arm64                 randconfig-002-20260226    gcc-14.3.0
arm64                 randconfig-003-20260226    gcc-14.3.0
arm64                 randconfig-004-20260226    gcc-14.3.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260226    gcc-14.3.0
csky                  randconfig-002-20260226    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260226    clang-23
hexagon               randconfig-002-20260226    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260226    gcc-14
i386        buildonly-randconfig-002-20260226    gcc-14
i386        buildonly-randconfig-003-20260226    gcc-14
i386        buildonly-randconfig-004-20260226    gcc-14
i386        buildonly-randconfig-005-20260226    gcc-14
i386        buildonly-randconfig-006-20260226    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260226    clang-20
i386                  randconfig-002-20260226    clang-20
i386                  randconfig-003-20260226    clang-20
i386                  randconfig-004-20260226    clang-20
i386                  randconfig-005-20260226    clang-20
i386                  randconfig-006-20260226    clang-20
i386                  randconfig-007-20260226    clang-20
i386                  randconfig-011-20260226    gcc-14
i386                  randconfig-012-20260226    gcc-14
i386                  randconfig-013-20260226    gcc-14
i386                  randconfig-014-20260226    gcc-14
i386                  randconfig-015-20260226    gcc-14
i386                  randconfig-016-20260226    gcc-14
i386                  randconfig-017-20260226    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    clang-23
loongarch             randconfig-001-20260226    clang-23
loongarch             randconfig-002-20260226    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    clang-23
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                            mac_defconfig    clang-23
m68k                          multi_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-23
mips                      maltasmvp_defconfig    clang-23
mips                        maltaup_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260226    clang-23
nios2                 randconfig-002-20260226    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260226    clang-16
parisc                randconfig-002-20260226    clang-16
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    clang-23
powerpc               randconfig-001-20260226    clang-16
powerpc               randconfig-002-20260226    clang-16
powerpc64             randconfig-001-20260226    clang-16
powerpc64             randconfig-002-20260226    clang-16
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.2.0
sh                          landisk_defconfig    clang-23
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260226    gcc-8.5.0
sparc                 randconfig-002-20260226    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260226    gcc-8.5.0
sparc64               randconfig-002-20260226    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260226    gcc-8.5.0
um                    randconfig-002-20260226    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260226    gcc-14
x86_64      buildonly-randconfig-002-20260226    clang-20
x86_64      buildonly-randconfig-002-20260226    gcc-14
x86_64      buildonly-randconfig-003-20260226    gcc-14
x86_64      buildonly-randconfig-004-20260226    clang-20
x86_64      buildonly-randconfig-004-20260226    gcc-14
x86_64      buildonly-randconfig-005-20260226    gcc-14
x86_64      buildonly-randconfig-006-20260226    gcc-13
x86_64      buildonly-randconfig-006-20260226    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260226    gcc-14
x86_64                randconfig-002-20260226    gcc-14
x86_64                randconfig-003-20260226    gcc-14
x86_64                randconfig-004-20260226    gcc-14
x86_64                randconfig-005-20260226    clang-20
x86_64                randconfig-005-20260226    gcc-14
x86_64                randconfig-006-20260226    gcc-14
x86_64                randconfig-011-20260226    gcc-14
x86_64                randconfig-012-20260226    gcc-14
x86_64                randconfig-013-20260226    gcc-14
x86_64                randconfig-014-20260226    gcc-14
x86_64                randconfig-015-20260226    gcc-14
x86_64                randconfig-016-20260226    gcc-14
x86_64                randconfig-071-20260226    gcc-14
x86_64                randconfig-072-20260226    gcc-14
x86_64                randconfig-073-20260226    gcc-14
x86_64                randconfig-074-20260226    gcc-14
x86_64                randconfig-075-20260226    gcc-14
x86_64                randconfig-076-20260226    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260226    gcc-8.5.0
xtensa                randconfig-002-20260226    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

