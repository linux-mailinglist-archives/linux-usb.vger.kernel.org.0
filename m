Return-Path: <linux-usb+bounces-27061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30773B2DFC6
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 16:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB3E3AB03B
	for <lists+linux-usb@lfdr.de>; Wed, 20 Aug 2025 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80C62DEA9E;
	Wed, 20 Aug 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSfyjMuZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005631DC98C
	for <linux-usb@vger.kernel.org>; Wed, 20 Aug 2025 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700944; cv=none; b=VPHJ+XS3F6ea78OT2qQh3GOmVFNFBewDRPaZGOV6n3mgRvP/TEI4O9/5BR6mxyQpLw8mPvGXeBL3cwkrn4zgVA+8k61+o+2cyMbs0ELfETsN3u3ydMHz5asmTK5V15vNfDSqn6Rjt0XCLIs4KvrsyfTDObTKX5hCn2BtRNt1Sno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700944; c=relaxed/simple;
	bh=1//0pOHJzE3qeXiVKJGxSkQXfG4IOrqXzwvqPAth5fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hg6KKmEgsYvneh6eZAcimgqNKFBVxmUVmWeIt6Nij3aTQMdnVa4bcuevDKMfPAdjcqsMHUhQn/tXd1vE2sKI9EMUU3AXtRfyURP0QcNOjFpSJbFB7Fl9vZRorBuCJqyAO439nb+ZECPcbR/gzkeYD9/ks38cnV8Xf6yW8OQe6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSfyjMuZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755700943; x=1787236943;
  h=date:from:to:cc:subject:message-id;
  bh=1//0pOHJzE3qeXiVKJGxSkQXfG4IOrqXzwvqPAth5fg=;
  b=hSfyjMuZwH10JuX7wP10zYGyJ87fMQazUhWqyyQgTJsGl24Q8u7SNa8N
   aGsUqfIpCiJsD9Hg1AfWt05Lo7Jfai9YOngpC7aaHMdcvLHn9ADlelGBP
   BB9BSS4OrvSDIq/uF8LFRWRj+TGPbbLfXWzM4KjtuIj22wnbOQPSe0flQ
   sr7Ct77sH0Eb5sizXRwWykHD9EMtBZ8JMSAXIg5kvzBExqggxDSM7JbvX
   bNOPx4mLTIWTmrvpt/a4hhibqDPRBPtvaacjxLnCS+yBCeBCf8l+gDRVM
   LxmhFMPEd6cMu+ZvxL4voOZ2mtBakD6QoMYn3cyeinUgRgKNUxb+C9T7H
   g==;
X-CSE-ConnectionGUID: qLL9ht9SRj+VTEpguVigjg==
X-CSE-MsgGUID: vCboyMENRd2cTDtFKYep4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61798166"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61798166"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:42:08 -0700
X-CSE-ConnectionGUID: lyZnPDF9R5Km3DFOTuv+IQ==
X-CSE-MsgGUID: 2E8ONGmiQGuLyl9b3FtR+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="173400969"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Aug 2025 07:42:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uok0r-000JJU-0K;
	Wed, 20 Aug 2025 14:42:05 +0000
Date: Wed, 20 Aug 2025 22:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ff9a09b3e09c7b794b56f2f5858f5ce42ba46cb3
Message-ID: <202508202237.pLCpYK6B-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ff9a09b3e09c7b794b56f2f5858f5ce42ba46cb3  usb: xhci: fix host not responding after suspend and resume

elapsed time: 1446m

configs tested: 113
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250820    gcc-8.5.0
arc                   randconfig-002-20250820    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                   randconfig-001-20250820    gcc-8.5.0
arm                   randconfig-002-20250820    gcc-15.1.0
arm                   randconfig-003-20250820    gcc-13.4.0
arm                   randconfig-004-20250820    clang-22
arm                        realview_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-003-20250820    gcc-8.5.0
arm64                 randconfig-004-20250820    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250820    gcc-15.1.0
csky                  randconfig-002-20250820    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-002-20250820    clang-22
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-002-20250819    clang-20
i386        buildonly-randconfig-003-20250819    clang-20
i386        buildonly-randconfig-004-20250819    clang-20
i386        buildonly-randconfig-005-20250819    clang-20
i386        buildonly-randconfig-006-20250819    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250820    clang-18
loongarch             randconfig-002-20250820    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250820    gcc-11.5.0
nios2                 randconfig-002-20250820    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250820    gcc-8.5.0
parisc                randconfig-002-20250820    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250820    clang-20
riscv                 randconfig-002-20250820    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250820    clang-18
s390                  randconfig-002-20250820    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250820    gcc-15.1.0
sh                    randconfig-002-20250820    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250820    gcc-8.5.0
sparc                 randconfig-002-20250820    gcc-12.5.0
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-002-20250820    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250820    gcc-12
um                    randconfig-002-20250820    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-002-20250820    gcc-11
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-004-20250820    gcc-12
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-006-20250820    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250820    gcc-8.5.0
xtensa                randconfig-002-20250820    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

