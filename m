Return-Path: <linux-usb+bounces-21397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C5A50382
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 16:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9F6188B942
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 15:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFE424BD14;
	Wed,  5 Mar 2025 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgnfwRsS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1017BEC5
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188737; cv=none; b=g/tSKpZDQI0Y8VXBCQmDHnE90J9pIc2Z3chA/Df+AI/sMbA/CCSVMRHRu2wK+Ny6EkIAkAA53Vydo+WTOTwXxjlJZ1kqiQnMNaSDYzKp791JYWmr88ySfMKLPM9w1iHFkXAIFxdnUo8jFJ3L0Tux3ozaPzQGhzAfFpNmpQVPfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188737; c=relaxed/simple;
	bh=2kIYwCOuHPQLxjrsje3E22mwIT9louoQN5UFs1Q5u8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RCqzk4UMQI9u7Uvm7TN4yR0DQOWDQmIHUJznfh1HFLGgvAFHCA1tIavy1w41iSjWJ5GrsxT8N7FdalqDh7JfZqefU9AdCpkBDo7Q0wqdTdhaJEZuqQ/ejLlfUhU4cbxGwAKidR7TLjK1pObfPpHpHbxD+LqV8GRy3dYnhh+a+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgnfwRsS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741188735; x=1772724735;
  h=date:from:to:cc:subject:message-id;
  bh=2kIYwCOuHPQLxjrsje3E22mwIT9louoQN5UFs1Q5u8Q=;
  b=CgnfwRsSYyi0csNBMG38QbCWaWmHqdLu2SpPbVpaZbRW81FHXFO7jFlQ
   XsUSQmNii8WtgPqrYHQdApehtyWKrRl0Nrux84I/dTRbOQ0rJ1MqW0ocH
   WFDRnMOnx3lfETos82ahq48JgPE7Ei+liKSl5yEL8BdGpKPinFw/VcxEG
   osj4PseGTlxggKjkmV+ddoV9U5OpJG2hukabrVRfkaEvcb2hyn9w5BO6I
   DiP/jHXVzY4EsRfctu3GFoiSQnEepaleUJNm8075Nf8rn/BREzN9/L2wc
   ZPzWyyRGEfPCV93w/+d17fks+tZHd50M/GpjvtegPKm3KEs75MjgElDWA
   Q==;
X-CSE-ConnectionGUID: fTmuOJXWTXmrxSKfCu9Ffg==
X-CSE-MsgGUID: 9SMypHfNS5qb81yIYABJBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29740310"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="29740310"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:32:14 -0800
X-CSE-ConnectionGUID: uVRt3pH2TXSV2xoXSTTwKg==
X-CSE-MsgGUID: bDeuiw8nTuKSBmJzLn2wgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118730622"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 07:32:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqjC-000LA4-25;
	Wed, 05 Mar 2025 15:32:10 +0000
Date: Wed, 05 Mar 2025 23:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c7c1f3b05c67173f462d73d301d572b3f9e57e3b
Message-ID: <202503052332.rs7lbS2H-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c7c1f3b05c67173f462d73d301d572b3f9e57e3b  usb: xhci: Fix host controllers "dying" after suspend and resume

elapsed time: 1456m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250305    gcc-13.2.0
arc                  randconfig-002-20250305    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250305    gcc-14.2.0
arm                  randconfig-002-20250305    clang-19
arm                  randconfig-003-20250305    gcc-14.2.0
arm                  randconfig-004-20250305    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250305    clang-15
arm64                randconfig-002-20250305    gcc-14.2.0
arm64                randconfig-003-20250305    clang-21
arm64                randconfig-004-20250305    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250305    gcc-14.2.0
csky                 randconfig-002-20250305    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250305    clang-21
hexagon              randconfig-002-20250305    clang-18
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20250305    clang-19
i386       buildonly-randconfig-002-20250305    clang-19
i386       buildonly-randconfig-003-20250305    clang-19
i386       buildonly-randconfig-004-20250305    clang-19
i386       buildonly-randconfig-005-20250305    clang-19
i386       buildonly-randconfig-006-20250305    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250305    gcc-14.2.0
loongarch            randconfig-002-20250305    gcc-14.2.0
nios2                randconfig-001-20250305    gcc-14.2.0
nios2                randconfig-002-20250305    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250305    gcc-14.2.0
parisc               randconfig-002-20250305    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250305    clang-17
powerpc              randconfig-002-20250305    gcc-14.2.0
powerpc              randconfig-003-20250305    gcc-14.2.0
powerpc64            randconfig-001-20250305    clang-19
powerpc64            randconfig-002-20250305    clang-17
powerpc64            randconfig-003-20250305    clang-19
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250305    clang-19
riscv                randconfig-002-20250305    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250305    gcc-14.2.0
s390                 randconfig-002-20250305    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250305    gcc-14.2.0
sh                   randconfig-002-20250305    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250305    gcc-14.2.0
sparc                randconfig-002-20250305    gcc-14.2.0
sparc64              randconfig-001-20250305    gcc-14.2.0
sparc64              randconfig-002-20250305    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250305    clang-19
um                   randconfig-002-20250305    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250305    clang-19
x86_64     buildonly-randconfig-002-20250305    gcc-12
x86_64     buildonly-randconfig-003-20250305    clang-19
x86_64     buildonly-randconfig-004-20250305    gcc-12
x86_64     buildonly-randconfig-005-20250305    clang-19
x86_64     buildonly-randconfig-006-20250305    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250305    gcc-14.2.0
xtensa               randconfig-002-20250305    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

