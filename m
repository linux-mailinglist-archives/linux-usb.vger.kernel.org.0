Return-Path: <linux-usb+bounces-20925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8003A3F5BF
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 14:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351DF188A486
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F35220A5CC;
	Fri, 21 Feb 2025 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmqfR/de"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABB220DD46
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740143827; cv=none; b=mw2uUy7RLvjso9aCH8Ty2mR58EB4NuN+JdQIqA4/PEWsfds/FwQs8aLiNb9CTmRRNGLZTfZwGFUtIAsd7ZJVkpEMCAqcWPk1EOSxNFlh58p6J5/uWs2sfKEoidynJW/NYG+Wlvd0u59xQImlEzWhxKn6t1wVtjiz8RlBEXckN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740143827; c=relaxed/simple;
	bh=6EkA0Whd3rwh7QbA6tEKxw4plsP8zIaMB1BgmIkivbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Np1E6AN3ffADC56JyyLthJ8p6W7UvV/WW3/SmwDcblDen2mwnG0xmLgJJKxh1qw/517cIUvnKfT7yOtV5BJg6EfvwxpTUzcvLgAoggG2FhWO94+qrmAZDvzoXiRNuaTcSs8KnjT/+rAB9D9YZuzSCmnaa0BxkVSj0WjjVN3HVPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmqfR/de; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740143826; x=1771679826;
  h=date:from:to:cc:subject:message-id;
  bh=6EkA0Whd3rwh7QbA6tEKxw4plsP8zIaMB1BgmIkivbU=;
  b=FmqfR/dec6XMIfROhXdACl3vXU/zwi8XlNgCvZivq6MNgWNNul63Wu4b
   yMxn2hG64KfuxQ7GKAcqlRCLU4HZIiuDQKFsxdfUKf0DE4Qh5M1DZAZWx
   FZnpVRVBAckkh90MTm7F6qjVTmYq+fJhRCPwJG5GSbbqzYF0A4xU5dg8b
   8HjvCsAIPV6pp2o2F8NvaVahOX1ppA0ooU2BlQp9dRDmCDQfl6kP4t5kt
   zrD6riGhscELkJzWCheYSItXYMCL7YkARyfkuTNpv2BYmXxRUWipUJZGu
   xQxUIaLZ5GokOUKqmqewN4xL2HYBj+sl4ArXDyhI3BuluqJU1nFMmNYZJ
   A==;
X-CSE-ConnectionGUID: I0LQxB+nS9ue9P0n9VkE6Q==
X-CSE-MsgGUID: VAMKFhR7RVSKIbcdjRuG+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44746404"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44746404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:17:05 -0800
X-CSE-ConnectionGUID: b98/v52IS8mDCBtsyJdLFg==
X-CSE-MsgGUID: BclHW2icSqGPIQ9eka5ngQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="120347651"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2025 05:17:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlStq-0005Xx-19;
	Fri, 21 Feb 2025 13:17:02 +0000
Date: Fri, 21 Feb 2025 21:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c783e1258f29c5caac9eea0aea6b172870f1baf8
Message-ID: <202502212124.xUyCxnSg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c783e1258f29c5caac9eea0aea6b172870f1baf8  usb: gadget: Fix setting self-powered state on suspend

Unverified Warning (likely false positive, kindly check if interested):

    drivers/usb/gadget/composite.c:1054 set_config() error: we previously assumed 'c' could be null (see line 983)
    drivers/usb/gadget/composite.c:2619 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2608)

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20250220
    |-- drivers-usb-gadget-composite.c-composite_suspend()-error:we-previously-assumed-cdev-config-could-be-null-(see-line-)
    `-- drivers-usb-gadget-composite.c-set_config()-error:we-previously-assumed-c-could-be-null-(see-line-)

elapsed time: 1451m

configs tested: 88
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250220    gcc-13.2.0
arc                  randconfig-002-20250220    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250220    gcc-14.2.0
arm                  randconfig-002-20250220    gcc-14.2.0
arm                  randconfig-003-20250220    gcc-14.2.0
arm                  randconfig-004-20250220    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250220    gcc-14.2.0
arm64                randconfig-002-20250220    gcc-14.2.0
arm64                randconfig-003-20250220    clang-21
arm64                randconfig-004-20250220    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250221    gcc-14.2.0
csky                 randconfig-002-20250221    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250221    clang-21
hexagon              randconfig-002-20250221    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250220    gcc-12
i386       buildonly-randconfig-002-20250220    gcc-12
i386       buildonly-randconfig-003-20250220    gcc-12
i386       buildonly-randconfig-004-20250220    clang-19
i386       buildonly-randconfig-005-20250220    clang-19
i386       buildonly-randconfig-006-20250220    clang-19
i386                               defconfig    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250221    gcc-14.2.0
loongarch            randconfig-002-20250221    gcc-14.2.0
nios2                randconfig-001-20250221    gcc-14.2.0
nios2                randconfig-002-20250221    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250221    gcc-14.2.0
parisc               randconfig-002-20250221    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250221    clang-21
powerpc              randconfig-002-20250221    clang-21
powerpc              randconfig-003-20250221    clang-17
powerpc64            randconfig-001-20250221    clang-21
powerpc64            randconfig-002-20250221    clang-21
powerpc64            randconfig-003-20250221    clang-19
riscv                           allmodconfig    clang-21
riscv                           allyesconfig    clang-21
riscv                randconfig-001-20250220    gcc-14.2.0
riscv                randconfig-002-20250220    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250220    clang-19
s390                 randconfig-002-20250220    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250220    gcc-14.2.0
sh                   randconfig-002-20250220    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250220    gcc-14.2.0
sparc                randconfig-002-20250220    gcc-14.2.0
sparc64              randconfig-001-20250220    gcc-14.2.0
sparc64              randconfig-002-20250220    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250220    gcc-12
um                   randconfig-002-20250220    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250220    gcc-12
x86_64     buildonly-randconfig-002-20250220    gcc-12
x86_64     buildonly-randconfig-003-20250220    gcc-12
x86_64     buildonly-randconfig-004-20250220    gcc-12
x86_64     buildonly-randconfig-005-20250220    gcc-12
x86_64     buildonly-randconfig-006-20250220    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250220    gcc-14.2.0
xtensa               randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

