Return-Path: <linux-usb+bounces-33722-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AgxNRX0n2kyfAQAu9opvQ
	(envelope-from <linux-usb+bounces-33722-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 08:19:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B651A1C3A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 08:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 616993085A57
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 07:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948CF38F251;
	Thu, 26 Feb 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9DKM6Jf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2F38F22D
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090341; cv=none; b=hyDvKUmt7PLv/YwwFigoZozlotxOrIuEC8zP8WwSCQBcKI8LI6y/ATx7vhjMCeZ/Eug9yVAaUndkV0gVtpVv1JrBm589Fr6PI0i9E0WfynzEGqFbcYVFtUV48tgGEN09Q6Swt9aPC0Ys0Ohkt4h/LudcmYJIzbL2gkYhaJ16Zog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090341; c=relaxed/simple;
	bh=A4oo47KOlNbFKMHqjkgCCD3WWO0ht9dpNcUoEecRtso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYge0/KHAj1mA/X7b71TU+AHTxEJA3Yk0QogIzP/G9yTxAHdrwSJo1qdW6sQuZ9odTaYxOUMlaDn4j7+Uxnd4FNDBbAP229PKp4mMGRToZF/NfpCf9/RbEnKM+7wg2n+EEee2xGlf08e35TZLAq0QO9Rk1sqnf+0tpFxCUUvxdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9DKM6Jf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090339; x=1803626339;
  h=date:from:to:cc:subject:message-id;
  bh=A4oo47KOlNbFKMHqjkgCCD3WWO0ht9dpNcUoEecRtso=;
  b=H9DKM6Jf/o3YdjES9J5gX3fl/ShQqeK2lo7+oDXQ0Px4TnyoPQwYT68k
   pGRQ/C2eBx+NB5GDHswg+MibStjcjv+fAtBF1Imd8Evj1/7QL2IDb3fr0
   Vd1DViLxDoXDyl+rN+l6CpYCmqMRQgVaMSZFpPKo2IkrHgK8tSS5bv1Ef
   FB/mJVrJP6VcvBp0KcnwR85x+wEEhzmygnPMxXMDwRn4xL8ma/hL7fh0I
   5mtBhqTOZH0BZzv0RmN602rhjhJkPHzNs7SIMBcd84Olf92pUqRK33djW
   dWaIx97eJXivUCrEqcpVJFtZLiCxBObf6dgz/ReqpxElojdDtZuiC0N8V
   g==;
X-CSE-ConnectionGUID: T0Ribqr9SxGrTS8Z3hwF5g==
X-CSE-MsgGUID: 8vSyLQ4ERSezJ6dHZVng2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73053614"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73053614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:18:59 -0800
X-CSE-ConnectionGUID: NP6lYnaoQZ6f8RwtkHV4Gg==
X-CSE-MsgGUID: +ehFxUAfT0a+L+4Q23B86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="215710972"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Feb 2026 23:18:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvVdZ-000000008Oz-4AY6;
	Thu, 26 Feb 2026 07:18:23 +0000
Date: Thu, 26 Feb 2026 15:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bb375c251ab40bdbc5272008fcf2bc6cd5266610
Message-ID: <202602261522.gWyYkQDu-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33722-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 52B651A1C3A
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bb375c251ab40bdbc5272008fcf2bc6cd5266610  dt-bindings: usb: st,st-ohci-300x: convert to DT schema

elapsed time: 739m

configs tested: 198
configs skipped: 3

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
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260226    clang-23
hexagon               randconfig-002-20260226    clang-23
i386                             allmodconfig    clang-20
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
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260226    clang-23
nios2                 randconfig-002-20260226    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260226    clang-16
parisc                randconfig-002-20260226    clang-16
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    clang-23
powerpc               randconfig-001-20260226    clang-16
powerpc               randconfig-002-20260226    clang-16
powerpc64             randconfig-001-20260226    clang-16
powerpc64             randconfig-002-20260226    clang-16
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.2.0
sh                          landisk_defconfig    clang-23
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
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
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260226    gcc-8.5.0
um                    randconfig-002-20260226    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260226    gcc-14
x86_64      buildonly-randconfig-002-20260226    gcc-14
x86_64      buildonly-randconfig-003-20260226    gcc-14
x86_64      buildonly-randconfig-004-20260226    gcc-14
x86_64      buildonly-randconfig-005-20260226    gcc-14
x86_64      buildonly-randconfig-006-20260226    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260226    gcc-14
x86_64                randconfig-002-20260226    gcc-14
x86_64                randconfig-003-20260226    gcc-14
x86_64                randconfig-004-20260226    gcc-14
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
xtensa                           allyesconfig    clang-23
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260226    gcc-8.5.0
xtensa                randconfig-002-20260226    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

