Return-Path: <linux-usb+bounces-21219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA164A4A507
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 22:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95727189B53B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 21:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878681D61BC;
	Fri, 28 Feb 2025 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOIsEKH6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508623F370
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740777896; cv=none; b=N0ieUh4St2vyqchhNNaOmVufYQQQuFjwFb2R8HmMBFN7pD0SOqV6lA965/amAXcr0bFYfU7c4bpkMwrCNyo3gnS2risyxku+0uXCEsQNj9AJyKMXpoymXXo/2ApzFuMHUE67kMKJdRhD0+pT5oyzsduY/C6bDq8sbKEGtRu1DD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740777896; c=relaxed/simple;
	bh=SwjmAIFhu5EKVGhpSV2+HXJ+xzyhoEwPdcWwRWDgXh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BWpW0r2xkzDPVQcXHxK9Vg00oZhHi1hoXemlmVcN9i2CoZkIVjSEyLF8llfOBJE7d/yUVkoj3tbVEfmSQz4thOHgMVIUYF3K7TCPEsYL2p67laMPnu9hZZlvow28E28P+kuGDJb5JARvKQGaKz/sMyW1qTplls79lcIcoKx6nbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOIsEKH6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740777894; x=1772313894;
  h=date:from:to:cc:subject:message-id;
  bh=SwjmAIFhu5EKVGhpSV2+HXJ+xzyhoEwPdcWwRWDgXh0=;
  b=UOIsEKH6hkdGBWK01VWf5qCR66JpFxDF1PdygKMf4V32QTXL77jKq/mh
   Ob+2qKa+xGrpxjO0y5EvkyoCPhSQPYa7srw9W1Iout+PKAWmFHprOWNcb
   NV6i230mDqQHEA51Jk7wJVZZEGDAxST1VbJaTsMZOntfi+nvScQPsSSfk
   qd1Cc36d+dYTLQsWKCjH7CJRRAaB7k9hW8klZ1g26diXB6CuHPnBYXc33
   Jriku7E+jPg+FOhEUqhLy8DI8BWpzfY2/i8OlxrGYWkTPzNb9HrklkqF2
   W6bzNSy+FNnaBwFrhJGekURx+mhrszIifjHliLD+votfZS7FmZD4EJ4y8
   A==;
X-CSE-ConnectionGUID: H987vad/TNiAL5NDJZ+Ihw==
X-CSE-MsgGUID: 7FOem8asSKqN71KFsfX8Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52707320"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="52707320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 13:24:53 -0800
X-CSE-ConnectionGUID: V5DsIG+DSliqGFA/IoT6eA==
X-CSE-MsgGUID: xw4VSaKsSnKzlk2+l8uAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117230303"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 13:24:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to7qk-000FX0-0W;
	Fri, 28 Feb 2025 21:24:50 +0000
Date: Sat, 01 Mar 2025 05:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c133ec0e5717868c9967fa3df92a55e537b1aead
Message-ID: <202503010549.sLbCq6ef-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c133ec0e5717868c9967fa3df92a55e537b1aead  usb: xhci: Enable the TRB overfetch quirk on VIA VL805

elapsed time: 1452m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250228    gcc-13.2.0
arc                   randconfig-002-20250228    gcc-13.2.0
arm                   randconfig-001-20250228    clang-21
arm                   randconfig-002-20250228    gcc-14.2.0
arm                   randconfig-003-20250228    gcc-14.2.0
arm                   randconfig-004-20250228    gcc-14.2.0
arm64                 randconfig-001-20250228    gcc-14.2.0
arm64                 randconfig-002-20250228    clang-21
arm64                 randconfig-003-20250228    clang-16
arm64                 randconfig-004-20250228    gcc-14.2.0
csky                  randconfig-001-20250228    gcc-14.2.0
csky                  randconfig-002-20250228    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250228    clang-19
hexagon               randconfig-002-20250228    clang-21
i386        buildonly-randconfig-001-20250228    clang-19
i386        buildonly-randconfig-002-20250228    clang-19
i386        buildonly-randconfig-003-20250228    gcc-12
i386        buildonly-randconfig-004-20250228    clang-19
i386        buildonly-randconfig-005-20250228    clang-19
i386        buildonly-randconfig-006-20250228    clang-19
loongarch             randconfig-001-20250228    gcc-14.2.0
loongarch             randconfig-002-20250228    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250228    gcc-14.2.0
nios2                 randconfig-002-20250228    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250228    gcc-14.2.0
parisc                randconfig-002-20250228    gcc-14.2.0
powerpc               randconfig-001-20250228    gcc-14.2.0
powerpc               randconfig-002-20250228    clang-16
powerpc               randconfig-003-20250228    clang-18
powerpc64             randconfig-001-20250228    clang-16
powerpc64             randconfig-002-20250228    clang-18
powerpc64             randconfig-003-20250228    gcc-14.2.0
riscv                 randconfig-001-20250228    gcc-14.2.0
riscv                 randconfig-002-20250228    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250228    gcc-14.2.0
s390                  randconfig-002-20250228    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250228    gcc-14.2.0
sh                    randconfig-002-20250228    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250228    gcc-14.2.0
sparc                 randconfig-002-20250228    gcc-14.2.0
sparc64               randconfig-001-20250228    gcc-14.2.0
sparc64               randconfig-002-20250228    gcc-14.2.0
um                               allyesconfig    gcc-12
um                    randconfig-001-20250228    clang-21
um                    randconfig-002-20250228    clang-21
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250228    clang-19
x86_64      buildonly-randconfig-002-20250228    clang-19
x86_64      buildonly-randconfig-003-20250228    gcc-12
x86_64      buildonly-randconfig-004-20250228    clang-19
x86_64      buildonly-randconfig-005-20250228    gcc-12
x86_64      buildonly-randconfig-006-20250228    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250228    gcc-14.2.0
xtensa                randconfig-002-20250228    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

