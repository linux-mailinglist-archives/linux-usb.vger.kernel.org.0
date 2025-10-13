Return-Path: <linux-usb+bounces-29242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F6BD6066
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917B04047A5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C6F2DC79F;
	Mon, 13 Oct 2025 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYk8UX6X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326102DC788
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760385759; cv=none; b=e7qBIRxPb3uYFZELVh5pYVTqtw1JWuDWIzcLRyi+3BupFIzTqGDXc/Trugqc0co0iW7twQ76cgcczuXp81JC9kvJnfyiQHXIc/qtsMvEfaNhxF2z7dZYF0wpoOqTZImy43zuMBT5/Ot/8bHBy3rIlbsplMaGzcRty91+wEm+YX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760385759; c=relaxed/simple;
	bh=BgV06YjwMAXu7qArwdoLiwYYco/fR7sckf91O5Y0z/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IvcU37GBeWQKGINCNgsP7sfHzpDydCI+cHnkOOOl4MsGFbtLVPpVvwZN5bfji5E0OiNUbvpBcKYMBScpjROxApAuqJ0V2rCuvlBpjXJLSNTFuqLyDsoFSxBSBo02lBlUr50YJof++iwwib0apStkpoJmWfYzHnDqhi5HCIj/36o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYk8UX6X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760385758; x=1791921758;
  h=date:from:to:cc:subject:message-id;
  bh=BgV06YjwMAXu7qArwdoLiwYYco/fR7sckf91O5Y0z/Q=;
  b=KYk8UX6XOQ0SEDlFBzozB4yhlHZOn/hl9uv5ikBTQSD8VQP5EFvKrQam
   /NmE6UCC2a4pxqBqhrk61fseyEgz/PWORsvoIHmvuRwd/1YJks4vlhfD6
   RErJTmIjT7GTxZjmnY+JHD3YETsx2eXgwjt159Vnvh6g2oa5+vlQWF1Rh
   BwAxcCuhypG4/Ji1kWQDsHSuYmNppaYgSTPEqwmlnV2xD131Wh50vMXza
   sJzvXfSqhMxoLI7y2pbNb1udxMiOHEZ4KkLuvHEVUPqXqKsmZU8rwcJ83
   UUSRRMJ88e/ehahurdXfpgDr/a3xC0PbAU0sETX5TwXobRsISMHyHxgqV
   g==;
X-CSE-ConnectionGUID: LRPyHwmXSg+ZMmXM7Ml8pA==
X-CSE-MsgGUID: A0ovW0nPRIujh3RXJGZNjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62634965"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="62634965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 13:02:38 -0700
X-CSE-ConnectionGUID: wBZPhIbURzet7BBXRHfAdQ==
X-CSE-MsgGUID: Q+2Rnht3Qbiettf31uwEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185705891"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2025 13:02:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Okb-00021B-0Y;
	Mon, 13 Oct 2025 20:02:33 +0000
Date: Tue, 14 Oct 2025 04:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 1c97fc901fb6318aca0160da96736d0bc136ddcd
Message-ID: <202510140437.aMF2khQN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 1c97fc901fb6318aca0160da96736d0bc136ddcd  usb: dwc3: dwc3-generic-plat: Add layerscape dwc3 support

elapsed time: 746m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251013    gcc-8.5.0
arc                   randconfig-002-20251013    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20251013    gcc-10.5.0
arm                   randconfig-002-20251013    clang-22
arm                   randconfig-003-20251013    gcc-12.5.0
arm                   randconfig-004-20251013    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251013    clang-19
arm64                 randconfig-002-20251013    gcc-8.5.0
arm64                 randconfig-003-20251013    clang-22
arm64                 randconfig-004-20251013    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251013    gcc-15.1.0
csky                  randconfig-002-20251013    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251013    clang-22
hexagon               randconfig-002-20251013    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251013    clang-18
loongarch             randconfig-002-20251013    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251013    gcc-8.5.0
nios2                 randconfig-002-20251013    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251013    gcc-12.5.0
parisc                randconfig-002-20251013    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251013    clang-22
powerpc               randconfig-002-20251013    clang-18
powerpc               randconfig-003-20251013    clang-22
powerpc64             randconfig-001-20251013    gcc-10.5.0
powerpc64             randconfig-002-20251013    gcc-15.1.0
powerpc64             randconfig-003-20251013    clang-20
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251013    clang-22
riscv                 randconfig-002-20251013    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251013    gcc-8.5.0
s390                  randconfig-002-20251013    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20251013    gcc-10.5.0
sh                    randconfig-002-20251013    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251013    gcc-8.5.0
sparc                 randconfig-002-20251013    gcc-8.5.0
sparc64               randconfig-001-20251013    clang-20
sparc64               randconfig-002-20251013    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251013    gcc-14
um                    randconfig-002-20251013    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251013    gcc-13
x86_64      buildonly-randconfig-002-20251013    clang-20
x86_64      buildonly-randconfig-003-20251013    clang-20
x86_64      buildonly-randconfig-004-20251013    gcc-14
x86_64      buildonly-randconfig-005-20251013    clang-20
x86_64      buildonly-randconfig-006-20251013    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251013    gcc-11.5.0
xtensa                randconfig-002-20251013    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

