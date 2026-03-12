Return-Path: <linux-usb+bounces-34659-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC4fJ5l4sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34659-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:26:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A074726EE32
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9016F300693D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF8040DFBE;
	Thu, 12 Mar 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WL6sQ+K4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843B320A0E
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303956; cv=none; b=EqaTQA7+amdKctJreGMhufAsD+CMVi2dcW/Jr7+MEwh0D9MilZls0iSMT2cfnpgcEhiWqkKnFesppDP3NTzmmZglWppSlx6rMnbsL2FaiHakDxE/rS4aFJmGheStNuLcMmgifAvVP4HtIDH4DCYyXgHpa77Xi7YV2ZL4BHQzDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303956; c=relaxed/simple;
	bh=A7ddV3Z9MH1ojkoBawqowybUKs/5e5fxoLBtYoWLIOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KlbdG5CUC0jtwJINuk8iQfM9sX0NRlbd7LAPRKln2BnT6euB9ZdgVRFrVL4wENG63bkZVLdSvGjm/xSVfjF5Ef4eh7v+ANqkiglsrhhO3nttXrgCB4fTKurZ4yCvnrrVvPt/VvTNlQ8lLcpTVabXzG1XFTw851fW/rBw/BAHq54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WL6sQ+K4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773303954; x=1804839954;
  h=date:from:to:cc:subject:message-id;
  bh=A7ddV3Z9MH1ojkoBawqowybUKs/5e5fxoLBtYoWLIOs=;
  b=WL6sQ+K4d5A+BUh7b4RxMOSRCAQVaDRIlZZGXZUMXZOw2s3n3M2BOPwm
   9FGXRtpGyVqH1eZbDuY1UykhWZkLJNlPBpMACZh7kt7C/MB0p+3Lt1E5a
   f4bUN2WJ76axzPfu/bTJKSEfDM0WkZgWELnujNdr1UGx0yTTxx+Fn98Fy
   gx6NZTURqnlQgPfcXrCqqWnvXT2eZukm9zBUyfclp/dbZRK39xDgr6HAh
   +I54jd1PUrA+cOxdZQvHCLzKGBPadNTwcVPS8ogNXcX5EZR6tHkn5E0A4
   KnHfc2AW91W99vAzS8wK+UMFFzEaEEoMU9pPDYmwYODNePQa2+ziBU3o8
   w==;
X-CSE-ConnectionGUID: It/bSEWxQ/uI/CEtKptEAw==
X-CSE-MsgGUID: nzpxArcZQwmR3OdD5S8BAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85015500"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85015500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 01:25:53 -0700
X-CSE-ConnectionGUID: +bAEa1t6SQ2kED0g3zmw8w==
X-CSE-MsgGUID: xNWRGJPnQiGIJwY9FwHx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="223213076"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:25:52 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0bMb-000000002Fb-2erZ;
	Thu, 12 Mar 2026 08:25:49 +0000
Date: Thu, 12 Mar 2026 16:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 322a81d35ecdf9997c3bbf676e3547d75f38935a
Message-ID: <202603121648.mHCtruv2-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34659-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: A074726EE32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 322a81d35ecdf9997c3bbf676e3547d75f38935a  dt-bindings: usb: maxim,max3421: convert to DT schema

elapsed time: 1031m

configs tested: 179
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
arc                   randconfig-001-20260312    gcc-8.5.0
arc                   randconfig-002-20260312    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260312    gcc-8.5.0
arm                   randconfig-002-20260312    gcc-8.5.0
arm                   randconfig-003-20260312    gcc-8.5.0
arm                   randconfig-004-20260312    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260312    clang-18
arm64                 randconfig-002-20260312    clang-18
arm64                 randconfig-003-20260312    clang-18
arm64                 randconfig-004-20260312    clang-18
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260312    clang-18
csky                  randconfig-002-20260312    clang-18
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260312    gcc-11.5.0
hexagon               randconfig-002-20260312    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260312    gcc-14
i386        buildonly-randconfig-002-20260312    gcc-14
i386        buildonly-randconfig-003-20260312    gcc-14
i386        buildonly-randconfig-004-20260312    gcc-14
i386        buildonly-randconfig-005-20260312    gcc-14
i386        buildonly-randconfig-006-20260312    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260312    gcc-14
i386                  randconfig-002-20260312    gcc-14
i386                  randconfig-003-20260312    gcc-14
i386                  randconfig-004-20260312    gcc-14
i386                  randconfig-005-20260312    gcc-14
i386                  randconfig-006-20260312    gcc-14
i386                  randconfig-007-20260312    gcc-14
i386                  randconfig-011-20260312    clang-20
i386                  randconfig-012-20260312    clang-20
i386                  randconfig-013-20260312    clang-20
i386                  randconfig-014-20260312    clang-20
i386                  randconfig-015-20260312    clang-20
i386                  randconfig-016-20260312    clang-20
i386                  randconfig-017-20260312    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260312    gcc-11.5.0
loongarch             randconfig-002-20260312    gcc-11.5.0
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
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260312    gcc-11.5.0
nios2                 randconfig-002-20260312    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260312    clang-23
parisc                randconfig-002-20260312    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260312    clang-23
powerpc               randconfig-002-20260312    clang-23
powerpc64             randconfig-001-20260312    clang-23
powerpc64             randconfig-002-20260312    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260312    gcc-13.4.0
riscv                 randconfig-002-20260312    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260312    gcc-13.4.0
s390                  randconfig-002-20260312    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260312    gcc-13.4.0
sh                    randconfig-002-20260312    gcc-13.4.0
sh                          rsk7201_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260312    gcc-15.2.0
sparc                 randconfig-002-20260312    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260312    gcc-15.2.0
sparc64               randconfig-002-20260312    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260312    gcc-15.2.0
um                    randconfig-002-20260312    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260312    clang-20
x86_64                randconfig-002-20260312    clang-20
x86_64                randconfig-003-20260312    clang-20
x86_64                randconfig-004-20260312    clang-20
x86_64                randconfig-005-20260312    clang-20
x86_64                randconfig-006-20260312    clang-20
x86_64                randconfig-011-20260312    clang-20
x86_64                randconfig-012-20260312    clang-20
x86_64                randconfig-013-20260312    clang-20
x86_64                randconfig-014-20260312    clang-20
x86_64                randconfig-015-20260312    clang-20
x86_64                randconfig-016-20260312    clang-20
x86_64                randconfig-071-20260312    gcc-14
x86_64                randconfig-072-20260312    gcc-14
x86_64                randconfig-073-20260312    gcc-14
x86_64                randconfig-074-20260312    gcc-14
x86_64                randconfig-075-20260312    gcc-14
x86_64                randconfig-076-20260312    gcc-14
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
xtensa                randconfig-001-20260312    gcc-15.2.0
xtensa                randconfig-002-20260312    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

