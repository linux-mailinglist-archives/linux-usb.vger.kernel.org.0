Return-Path: <linux-usb+bounces-28718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF00BA4C82
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 19:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44AB1C23AB1
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 17:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9352EE27C;
	Fri, 26 Sep 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJqG9WzZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABE2BAF9
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758908773; cv=none; b=IwWTxmdy4oMglRja+T0q7SNogTajyNy9k4rbwNKKfUXCa6iBHZYrYKzfh2Jo6ycFNamlhBzszGCNQ5wLpNM5v+qrDqzB1qt+27vRwo9xOt6Fg3wlLq4zXXrd11GD51M8cwBn97DRUZJa/QdOVJKSBGyUDYhyq+405sNzk7obcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758908773; c=relaxed/simple;
	bh=vYwckcOlPtqgljZ3MfjIGaFuJSuJi80bLox23PZPLuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DI+OfOCHMZvivtvWzg87AaMa9PN73o1HriEtcYkpzrzRpq/vQaSp8M1Y5f3w/I84Sk3W26tfuCTcK3x0zoyUIXH5deQkDKtvO8aO2+lSbcqs2BrhB1Ju0VuitIKAzpk+v4Q+xhO9bveMnr1RP4woBQ4e43FwR3tloT09Xp7t0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJqG9WzZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758908771; x=1790444771;
  h=date:from:to:cc:subject:message-id;
  bh=vYwckcOlPtqgljZ3MfjIGaFuJSuJi80bLox23PZPLuk=;
  b=CJqG9WzZaFeh6b7cktVhmfvDha2OVHFsXUj39H1YxLI7DWAIPQokfeEq
   h94utMcUmXpX9KYvEnGFxnIY5f+Vno/RBB/4/AypyBEPvkQE7DsxoN6h/
   LhN31O0Q0KKbku41UOGNK2OZNdjN7doLqN2nowazQ8jDpw2RMM3H4/PzN
   39myr+8heQvuTvaBvqx1COmbOjcGXqpfIZrPw+LOFnLk1p3QNj4YXkJEm
   9ILz8AfbVLu+RI03qQrpWGBaj1UFCLGgDqB9mklNDEVqjw6HMhTbL0xTP
   D2/vrKjn+vNulSj5oBiB+SnvTlCJxM38UzRL/ja20Zr5osS7epkh0fsYS
   Q==;
X-CSE-ConnectionGUID: 8vqgkl8bTTqX4EzLRNZpdw==
X-CSE-MsgGUID: kQhj3SCiTPSqTwIk2LXnlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61165657"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="61165657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 10:46:10 -0700
X-CSE-ConnectionGUID: LcxmCjzFQDiXC+zficnRug==
X-CSE-MsgGUID: LxkFKqikSJGVRusGKMQ84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="214812627"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2025 10:46:09 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2CWE-0006Tz-23;
	Fri, 26 Sep 2025 17:46:06 +0000
Date: Sat, 27 Sep 2025 01:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e40b984b6c4ce3f80814f39f86f87b2a48f2e662
Message-ID: <202509270139.bxVtwOVI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e40b984b6c4ce3f80814f39f86f87b2a48f2e662  usb: vhci-hcd: Prevent suspending virtually attached devices

elapsed time: 1464m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                            dove_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-004-20250926    clang-22
arm64                            alldefconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    gcc-10.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-003-20250926    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-002-20250926    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-002-20250926    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-002-20250926    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

