Return-Path: <linux-usb+bounces-37279-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEEsJA4tAmq/ogEAu9opvQ
	(envelope-from <linux-usb+bounces-37279-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:25:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27E515161
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4257B3008D6B
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 19:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C06D4BCAC5;
	Mon, 11 May 2026 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP94yTa1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375A4C954D
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527499; cv=none; b=iucdEVcMUqAkjnqQOObsfZ1Z6HFfKL49ou7AIMXVm7VwTkvHfnbyuwifDWGpSPX3T/hcJz59lpDGBAVtn8/LimwZNoplWKUcAngkvh4JKuIGjvQS3umKdVFtZdxJQ6v3zXDln/PmlqXU1vUj2O3bvUG8j2E33wsX+HiLUWwUwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527499; c=relaxed/simple;
	bh=AvLVW/240VuwVjAAlIHt8mlScPCPD1YyiTVUAE0mjPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z9xMmBlWPUHsG8nFNQyyiDXsyMb0iCWath9CmGbuvc8OwmxZkdCd7QZsyZEqMQB9sdGQKZ9TYWURcImnYYvzQM0X2URKYZ3L4qkyYwEGa4msayUyIIzkDNbjrDCJh+nUXxeE37VGaiax1mS2ztA8q66KYywyaGPBNBPHyd3eJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP94yTa1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778527498; x=1810063498;
  h=date:from:to:cc:subject:message-id;
  bh=AvLVW/240VuwVjAAlIHt8mlScPCPD1YyiTVUAE0mjPo=;
  b=cP94yTa1kr46KKfIL/vxWODO0iUS5NHgQ+xgAvwpKT6v/UDi98LYObsX
   dkoWBTBCVt721GbiqXxAOms/GmHbPJeue8Bp+m02rqbxi+NbkWFqjtAhL
   mhnbspfuVZTJgqrQVSqYLwCMIqc+u4sic3y0GFzR12Q5nocwbEwq+NcV6
   qqzncqAS/k6XEmaloglY+yCWLnYHNis7jJIqKysA/rUYMblvJQY3yOT4q
   EibfbjE7wzZd3qTz0SKeG+wUIK+YykFG+xF3DUa3Tlt3QrZgek3TKNSfO
   cyhPcvFfQTBUacw+JL9LAx4t8JxaeZ7fbqIb2VNXxOK1VW1lrXie+443m
   w==;
X-CSE-ConnectionGUID: GIWpeGjDSk2E/fKuZDYjFw==
X-CSE-MsgGUID: 0HrOzo7BRHuFQ9v/vrGG4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83275607"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83275607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:24:57 -0700
X-CSE-ConnectionGUID: H4LJdTjLT+6cApXH673xBA==
X-CSE-MsgGUID: 9AkNWDvIQaOGtpbs/MiFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236709293"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2026 12:24:56 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMWFJ-0000000014B-0Y2d;
	Mon, 11 May 2026 19:24:53 +0000
Date: Tue, 12 May 2026 03:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e18b0dbb6ec6030e3369e5dfb2520d7bdbde20d1
Message-ID: <202605120340.vdACxv3o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 0C27E515161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37279-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e18b0dbb6ec6030e3369e5dfb2520d7bdbde20d1  Merge tag 'v7.1-rc3' into usb-next

elapsed time: 726m

configs tested: 291
configs skipped: 6

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
arc                   randconfig-001-20260511    gcc-10.5.0
arc                   randconfig-002-20260511    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260511    gcc-10.5.0
arm                   randconfig-002-20260511    gcc-10.5.0
arm                   randconfig-003-20260511    gcc-10.5.0
arm                   randconfig-004-20260511    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260511    clang-17
arm64                 randconfig-001-20260511    clang-23
arm64                 randconfig-001-20260511    gcc-15.2.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260511    clang-17
arm64                 randconfig-002-20260511    clang-23
arm64                 randconfig-002-20260511    gcc-15.2.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260511    clang-17
arm64                 randconfig-003-20260511    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260511    clang-17
arm64                 randconfig-004-20260511    clang-23
arm64                 randconfig-004-20260511    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260511    clang-17
csky                  randconfig-001-20260511    clang-23
csky                  randconfig-001-20260511    gcc-15.2.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260511    clang-17
csky                  randconfig-002-20260511    clang-23
csky                  randconfig-002-20260511    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260511    gcc-8.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-002-20260511    gcc-8.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260511    gcc-14
i386        buildonly-randconfig-002-20260511    gcc-14
i386        buildonly-randconfig-003-20260511    gcc-14
i386        buildonly-randconfig-004-20260511    gcc-14
i386        buildonly-randconfig-005-20260511    gcc-14
i386        buildonly-randconfig-006-20260511    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260511    gcc-12
i386                  randconfig-002-20260511    gcc-12
i386                  randconfig-003-20260511    gcc-12
i386                  randconfig-004-20260511    gcc-12
i386                  randconfig-005-20260511    gcc-12
i386                  randconfig-006-20260511    gcc-12
i386                  randconfig-007-20260511    gcc-12
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260511    clang-20
i386                  randconfig-011-20260511    gcc-14
i386                  randconfig-011-20260512    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260511    clang-20
i386                  randconfig-012-20260511    gcc-14
i386                  randconfig-012-20260512    clang-20
i386                           randconfig-013    clang-20
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260511    clang-20
i386                  randconfig-013-20260512    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260511    clang-20
i386                  randconfig-014-20260512    clang-20
i386                           randconfig-015    clang-20
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260511    clang-20
i386                  randconfig-015-20260511    gcc-13
i386                  randconfig-015-20260512    clang-20
i386                           randconfig-016    clang-20
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260511    clang-20
i386                  randconfig-016-20260512    clang-20
i386                           randconfig-017    clang-20
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260511    clang-20
i386                  randconfig-017-20260511    gcc-14
i386                  randconfig-017-20260512    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260511    gcc-8.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-002-20260511    gcc-8.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-17
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260511    gcc-8.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-002-20260511    gcc-8.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-20
parisc                randconfig-001-20260511    clang-20
parisc                         randconfig-002    clang-20
parisc                randconfig-002-20260511    clang-20
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                        randconfig-001    clang-20
powerpc               randconfig-001-20260511    clang-20
powerpc                        randconfig-002    clang-20
powerpc               randconfig-002-20260511    clang-20
powerpc64                      randconfig-001    clang-20
powerpc64             randconfig-001-20260511    clang-20
powerpc64                      randconfig-002    clang-20
powerpc64             randconfig-002-20260511    clang-20
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260511    gcc-12.5.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260511    gcc-12.5.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260511    gcc-12.5.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260511    gcc-12.5.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260511    gcc-12.5.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260511    gcc-12.5.0
sh                    randconfig-002-20260512    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260511    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260511    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260511    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260511    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260511    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260511    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260511    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260511    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260511    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260511    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260511    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260511    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260511    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260511    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260511    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260511    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260511    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260511    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260511    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260511    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260511    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260511    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260511    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260511    clang-20
x86_64                randconfig-071-20260511    clang-20
x86_64                randconfig-072-20260511    clang-20
x86_64                randconfig-073-20260511    clang-20
x86_64                randconfig-074-20260511    clang-20
x86_64                randconfig-075-20260511    clang-20
x86_64                randconfig-076-20260511    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260511    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260511    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

