Return-Path: <linux-usb+bounces-37911-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIvYDDr9D2qCSAYAu9opvQ
	(envelope-from <linux-usb+bounces-37911-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 08:52:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A22875AFB20
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 08:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 576A6302ACC9
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 06:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39463783AE;
	Fri, 22 May 2026 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqJOh+BR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891A3537FE
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432756; cv=none; b=aIieCZ+MMl2ZvbAuow+8Zc4+9ra8FfVA62OLbFYNQiV6pZnKNWO9otKkKABkEqj5YzNx5HKHfHzDZHEVn1apzSE6POnsnpTcE0c6NjW7zit2c1Nq3+Y/4b1nRqfZKZr+vzy1q+RPDmlqQwKTPJpzhD+zklRYhAiBbrRePXI1E5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432756; c=relaxed/simple;
	bh=rVqK5On6LX6pQc1goEzDAdLy88wkwfSeDq0WFWn98WY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LHCuBoFuocmGUnV1zYHL+1R592qd8F/pgOtxsyOiyxMQnG2f+/DMJ/WlohSkFVSkKxbpTnvO7NF7LxQYZUFymbDTUZY203/u0H1fxxOZ5034QGfwlxF2RU4hZfNSSzvScnBLcEcsgj7X5GmRz9t8jxzkCvA0ZuJsyXVUWueLdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqJOh+BR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779432755; x=1810968755;
  h=date:from:to:cc:subject:message-id;
  bh=rVqK5On6LX6pQc1goEzDAdLy88wkwfSeDq0WFWn98WY=;
  b=EqJOh+BRjQKHKs7ZIwFfdofFg0/EI0cI/f7EANBB2ZlB6vfdDUc7RHjq
   Lp0y5Vzl6QQWkfwGIOjr8KzB1EPV2vShYjiWmV+jkh6qhHLO40Ccj8yQa
   EU/EOG3ArGNpGFgfWdbqpPvq8Qo21K3VijmJCwaoQvgedgRf9sSJn8xLd
   dTzB1S735sgVagZwgh3HCIOf/H4FQ/uX599jUKrblQ11sWQBhLiXiwLWX
   Gndri+XLqTwn/Em5b/ECqQPCAcPzgytJCEcQHKXas3M1BDeLT2K3H8rH7
   /DQkHcvwleYOFQ2Iaf4H/iDCPf8tgdKpJMNbq/1Ow4hkTmECqAXfovcaI
   g==;
X-CSE-ConnectionGUID: 51ci1fgvSv2RHdfTZyoGPQ==
X-CSE-MsgGUID: RZcdd05fQMiWUC+yVACveQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80390901"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80390901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 23:52:32 -0700
X-CSE-ConnectionGUID: DRB8qYL6RqqxZUhcjZObVw==
X-CSE-MsgGUID: KAXL38eqQ0u62m/Lvs6RSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236602528"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 23:52:30 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQJkC-000000001v9-0avE;
	Fri, 22 May 2026 06:52:28 +0000
Date: Fri, 22 May 2026 14:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 d98d413ca65d0790a8f3695d0a5845538958ab84
Message-ID: <202605221424.ZOyDoQhA-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37911-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: A22875AFB20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: d98d413ca65d0790a8f3695d0a5845538958ab84  usb: typec: ucsi: Don't update power_supply on power role change if not connected

elapsed time: 939m

configs tested: 165
configs skipped: 4

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
arc                         haps_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260522    gcc-9.5.0
arc                   randconfig-002-20260522    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260522    gcc-8.5.0
arm                   randconfig-002-20260522    gcc-10.5.0
arm                   randconfig-003-20260522    gcc-11.5.0
arm                   randconfig-004-20260522    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260522    clang-20
arm64                 randconfig-002-20260522    gcc-14.3.0
arm64                 randconfig-003-20260522    clang-23
arm64                 randconfig-004-20260522    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260522    gcc-15.2.0
csky                  randconfig-002-20260522    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260522    clang-23
hexagon               randconfig-002-20260522    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260522    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260522    gcc-14
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260522    clang-20
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260522    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260522    clang-20
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260522    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20260522    gcc-14
i386                  randconfig-002-20260522    clang-20
i386                  randconfig-003-20260522    gcc-13
i386                  randconfig-004-20260522    gcc-14
i386                  randconfig-005-20260522    gcc-14
i386                  randconfig-006-20260522    clang-20
i386                  randconfig-007-20260522    gcc-13
i386                  randconfig-011-20260522    gcc-14
i386                  randconfig-012-20260522    clang-20
i386                  randconfig-013-20260522    clang-20
i386                  randconfig-014-20260522    gcc-14
i386                  randconfig-015-20260522    clang-20
i386                  randconfig-016-20260522    clang-20
i386                  randconfig-017-20260522    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260522    clang-23
loongarch             randconfig-002-20260522    gcc-15.2.0
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
nios2                 randconfig-001-20260522    gcc-8.5.0
nios2                 randconfig-002-20260522    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260522    gcc-14.3.0
parisc                randconfig-002-20260522    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260522    clang-20
powerpc               randconfig-002-20260522    clang-18
powerpc64             randconfig-001-20260522    gcc-10.5.0
powerpc64             randconfig-002-20260522    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260522    clang-17
riscv                 randconfig-002-20260522    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260522    clang-23
s390                  randconfig-002-20260522    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260522    gcc-10.5.0
sh                    randconfig-002-20260522    gcc-14.3.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260522    gcc-15.2.0
sparc                 randconfig-002-20260522    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260522    gcc-14.3.0
sparc64               randconfig-002-20260522    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260522    clang-23
um                    randconfig-002-20260522    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260522    clang-20
x86_64      buildonly-randconfig-002-20260522    gcc-13
x86_64      buildonly-randconfig-003-20260522    gcc-14
x86_64      buildonly-randconfig-004-20260522    clang-20
x86_64      buildonly-randconfig-005-20260522    clang-20
x86_64      buildonly-randconfig-006-20260522    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260522    clang-20
x86_64                randconfig-002-20260522    clang-20
x86_64                randconfig-003-20260522    gcc-14
x86_64                randconfig-004-20260522    gcc-14
x86_64                randconfig-005-20260522    gcc-14
x86_64                randconfig-006-20260522    gcc-14
x86_64                randconfig-011-20260522    gcc-14
x86_64                randconfig-012-20260522    clang-20
x86_64                randconfig-013-20260522    gcc-13
x86_64                randconfig-014-20260522    clang-20
x86_64                randconfig-015-20260522    clang-20
x86_64                randconfig-016-20260522    gcc-14
x86_64                randconfig-071-20260522    gcc-14
x86_64                randconfig-072-20260522    gcc-14
x86_64                randconfig-073-20260522    clang-20
x86_64                randconfig-074-20260522    gcc-14
x86_64                randconfig-075-20260522    clang-20
x86_64                randconfig-076-20260522    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260522    gcc-9.5.0
xtensa                randconfig-002-20260522    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

