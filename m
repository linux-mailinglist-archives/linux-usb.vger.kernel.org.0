Return-Path: <linux-usb+bounces-34373-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGDrNV17r2kXZwIAu9opvQ
	(envelope-from <linux-usb+bounces-34373-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 03:01:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C7243F40
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 03:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FCF931353C4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 01:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FDA3112DC;
	Tue, 10 Mar 2026 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHkBnQUP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3D2ECEA0
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107649; cv=none; b=HF7ChaOasoTbxDhMdRXScEhRc0dWFYLbAikypYikxUee19pqDTZS6RvP8KxLNjhr64cy1Zf6ap6n+5Audnlrucg82Vg/XdGJLQLiPjf9taUVhIW7qgmafiy1fQwra6orwpfa4U3dKYtBwPIv5fALkp5h0a+9Tv5NolLUanS3cWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107649; c=relaxed/simple;
	bh=ABgVTOdy9Mlt6IEw38GUe+c0osktyk2kQ6god4jq64g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dgVDZDwx7tQK16YF/OSUpFdPDpC29PfTOoGfaIqUfKxX+QuhyN5n1L/GfMNCFtlDHVma+VqcMXzl2lJRSzFaZVJ6Z1GmWRvb7BLGwJLKQbSvnOWtD2jfcHi5lQrzV6X5r5dIY+gwK9MhV494+YleUnBfxY2trsaOFW28KztytsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHkBnQUP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773107641; x=1804643641;
  h=date:from:to:cc:subject:message-id;
  bh=ABgVTOdy9Mlt6IEw38GUe+c0osktyk2kQ6god4jq64g=;
  b=NHkBnQUPeTRf/DWXP9GgGxX0pu9flUkKxxsip6GK6ADdkHGcYRp/V3Qe
   WGucuHpKYqezQF4xb6JfCActFaOmuwoYnsL+rn7kSTfEpE4Ax0ql8Cm9Q
   Zde/aexSqAellpH0r8CcfUBtHuWSbyn0ejHBy56ojSYLHPROaog/E6dlm
   COaIwiYGTI6vj0FhrfhzbwGS8TsZrr9IQxL9+aG+jftc2zw4dHIqiQSLv
   gu8IMFA9f8Sx/9OjoSTc/O8o/Vmgys+V86VSmkK5XXk4Kuat0RW1qQmNt
   2Rz2Nr+haHkQ8gL0swtrxWN50vv01amNG86tvDb10gyzmE7M6AeicodOV
   w==;
X-CSE-ConnectionGUID: stJ2oR6yQ72mEk8mmDM4NA==
X-CSE-MsgGUID: qNbBZNf5SAOm8w8PIXgZpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74045705"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74045705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 18:54:01 -0700
X-CSE-ConnectionGUID: reCC4Hx1Q+eH6KuSwkFpqQ==
X-CSE-MsgGUID: WOzzMVl9Qs+kSWCB9dxeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216381854"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2026 18:53:59 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzmIH-0000000015k-0z09;
	Tue, 10 Mar 2026 01:53:57 +0000
Date: Tue, 10 Mar 2026 09:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 73a505dc48144ec72e25874e2b2a72487b02d3bc
Message-ID: <202603100943.KyRP5wdK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 433C7243F40
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
	TAGGED_FROM(0.00)[bounces-34373-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 73a505dc48144ec72e25874e2b2a72487b02d3bc  thunderbolt: Fix property read in nhi_wake_supported()

elapsed time: 842m

configs tested: 275
configs skipped: 4

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
arc                   randconfig-001-20260309    clang-17
arc                   randconfig-001-20260310    gcc-8.5.0
arc                   randconfig-002-20260309    clang-17
arc                   randconfig-002-20260310    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260309    clang-17
arm                   randconfig-001-20260310    gcc-8.5.0
arm                   randconfig-002-20260309    clang-17
arm                   randconfig-002-20260310    gcc-8.5.0
arm                   randconfig-003-20260309    clang-17
arm                   randconfig-003-20260310    gcc-8.5.0
arm                   randconfig-004-20260309    clang-17
arm                   randconfig-004-20260310    gcc-8.5.0
arm                           sama7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260309    clang-20
arm64                 randconfig-001-20260309    clang-23
arm64                 randconfig-001-20260310    gcc-11.5.0
arm64                 randconfig-002-20260309    clang-23
arm64                 randconfig-002-20260310    gcc-11.5.0
arm64                 randconfig-003-20260309    clang-23
arm64                 randconfig-003-20260310    gcc-11.5.0
arm64                 randconfig-004-20260309    clang-23
arm64                 randconfig-004-20260310    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260309    clang-23
csky                  randconfig-001-20260309    gcc-14.3.0
csky                  randconfig-001-20260310    gcc-11.5.0
csky                  randconfig-002-20260309    clang-23
csky                  randconfig-002-20260309    gcc-13.4.0
csky                  randconfig-002-20260310    gcc-11.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260309    gcc-15.2.0
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-002-20260309    gcc-15.2.0
hexagon               randconfig-002-20260310    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260310    clang-20
i386        buildonly-randconfig-002-20260310    clang-20
i386        buildonly-randconfig-003-20260310    clang-20
i386        buildonly-randconfig-004-20260310    clang-20
i386        buildonly-randconfig-005-20260310    clang-20
i386        buildonly-randconfig-006-20260310    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-002-20260309    clang-20
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-007-20260309    gcc-12
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-011-20260309    clang-20
i386                  randconfig-011-20260309    gcc-14
i386                  randconfig-011-20260310    clang-20
i386                  randconfig-012-20260309    clang-20
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-013-20260309    clang-20
i386                  randconfig-013-20260309    gcc-14
i386                  randconfig-013-20260310    clang-20
i386                  randconfig-014-20260309    clang-20
i386                  randconfig-014-20260309    gcc-14
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-015-20260309    clang-20
i386                  randconfig-015-20260309    gcc-14
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-016-20260309    clang-20
i386                  randconfig-016-20260310    clang-20
i386                  randconfig-017-20260309    clang-20
i386                  randconfig-017-20260310    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260309    gcc-15.2.0
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-002-20260309    gcc-15.2.0
loongarch             randconfig-002-20260310    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260309    gcc-15.2.0
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-002-20260309    gcc-15.2.0
nios2                 randconfig-002-20260310    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260309    gcc-8.5.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-002-20260309    gcc-14.3.0
parisc                randconfig-002-20260309    gcc-8.5.0
parisc                randconfig-002-20260310    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260309    gcc-14.3.0
powerpc               randconfig-001-20260309    gcc-8.5.0
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-002-20260309    clang-23
powerpc               randconfig-002-20260309    gcc-8.5.0
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260309    gcc-11.5.0
powerpc64             randconfig-001-20260309    gcc-8.5.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260309    clang-23
powerpc64             randconfig-002-20260309    gcc-8.5.0
powerpc64             randconfig-002-20260310    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260309    gcc-8.5.0
riscv                 randconfig-001-20260310    clang-19
riscv                 randconfig-001-20260310    gcc-15.2.0
riscv                 randconfig-002-20260309    gcc-8.5.0
riscv                 randconfig-002-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260309    gcc-8.5.0
s390                  randconfig-001-20260310    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-9.5.0
s390                  randconfig-002-20260309    gcc-8.5.0
s390                  randconfig-002-20260310    clang-19
s390                  randconfig-002-20260310    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260309    gcc-8.5.0
sh                    randconfig-001-20260310    gcc-15.2.0
sh                    randconfig-002-20260309    gcc-8.5.0
sh                    randconfig-002-20260310    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260309    gcc-13.4.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-002-20260309    gcc-13.4.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260309    gcc-13.4.0
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-002-20260309    clang-20
sparc64               randconfig-002-20260309    gcc-13.4.0
sparc64               randconfig-002-20260310    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260309    clang-23
um                    randconfig-001-20260309    gcc-13.4.0
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-002-20260309    gcc-13.4.0
um                    randconfig-002-20260309    gcc-14
um                    randconfig-002-20260310    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260309    gcc-14
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260309    gcc-14
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260309    gcc-14
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260309    gcc-14
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260309    gcc-14
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260309    gcc-14
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260309    clang-20
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-002-20260309    gcc-13
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-003-20260309    gcc-14
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-004-20260309    clang-20
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-005-20260309    gcc-14
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-006-20260309    gcc-14
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-011-20260309    clang-20
x86_64                randconfig-011-20260309    gcc-14
x86_64                randconfig-011-20260310    clang-20
x86_64                randconfig-012-20260309    clang-20
x86_64                randconfig-012-20260309    gcc-14
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-013-20260309    gcc-14
x86_64                randconfig-013-20260310    clang-20
x86_64                randconfig-014-20260309    gcc-14
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-015-20260309    gcc-14
x86_64                randconfig-015-20260310    clang-20
x86_64                randconfig-016-20260309    gcc-12
x86_64                randconfig-016-20260309    gcc-14
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-071-20260309    gcc-14
x86_64                randconfig-071-20260310    clang-20
x86_64                randconfig-072-20260310    clang-20
x86_64                randconfig-073-20260309    gcc-14
x86_64                randconfig-073-20260310    clang-20
x86_64                randconfig-074-20260309    clang-20
x86_64                randconfig-074-20260310    clang-20
x86_64                randconfig-075-20260309    gcc-14
x86_64                randconfig-075-20260310    clang-20
x86_64                randconfig-076-20260309    gcc-14
x86_64                randconfig-076-20260310    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260309    gcc-13.4.0
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-002-20260309    gcc-13.4.0
xtensa                randconfig-002-20260310    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

