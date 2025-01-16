Return-Path: <linux-usb+bounces-19426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61320A141BD
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 19:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94AF188646A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 18:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047D11DE8AC;
	Thu, 16 Jan 2025 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axAsVYus"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABE4414
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052428; cv=none; b=isVHsiVkWYQ6NqkXlcqIjs4k3FvlMVuM+wAzfO2EiN/tQMwasaLjYhD19ys8DeSIf0t4S8O0Ck9xTb9fR6YsEVuKH2jEu7qTwNGLt8pustRPNwiS33Bf9jgxpgu1SJEJD24+Vh+dIhBWL5bRlr9V/TcWaIUBx0fRhfarHKhDlPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052428; c=relaxed/simple;
	bh=/1HpVK7+HQUWpSl8w8kXlccvdS7sSWv10Qd5QWZltWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YDTiKqE/HbFIGDJthxVT3t9Bdmlb6VKPwo95dDY9Mu7q0igdCte5oCzGN/pGb91/SrE8k0PpHTDlGK4aqyRAfqzfOtgDrKBLrmcLt+c9Dmv2O2jKnQDLHeLTylnVhENLTau4UYlN+6OfTHVEzk8cILW031yF6ofhxfMyUOyW0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axAsVYus; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737052427; x=1768588427;
  h=date:from:to:cc:subject:message-id;
  bh=/1HpVK7+HQUWpSl8w8kXlccvdS7sSWv10Qd5QWZltWM=;
  b=axAsVYusTdhrdKbKxMmgs3FM5J1BqZh1bspzs9rx1LM5jthISMYhbesq
   cdZEP+1AltOzPusSX3tLIENN2RhIu8vbVvt9T8UbJDWcdvgZv3i+Yj8oZ
   lo/LCsovcfW327EdqNk+ShwwghF6J/NL3QejhSBkwXJyJ7ySb3RnU0GH0
   bgnBa884GH3KZqfvHf4HBDnffdqL5hmxMgT1d/8VmaMn8Wullb+UYE1Wh
   VlZ+PIb6OdtyXx36KiJOHTIcT2JjgiccrhQWAkyE9AaNQVQ+h0eYiPcB7
   YyEb1cJmU7dGZl8TkV2kLakyLRQsPd0LescmSCXCz23OeoQsGiBWDveBT
   Q==;
X-CSE-ConnectionGUID: s3SlaOUpRIKP4ZklW35ZSA==
X-CSE-MsgGUID: xj9gOpBWRXC7MSpqRlxk2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37340237"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="37340237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 10:33:46 -0800
X-CSE-ConnectionGUID: MZhotNo5Q1GlHD0eioS6uQ==
X-CSE-MsgGUID: m+si5yDBRa6bXaFLykn57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136450386"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2025 10:33:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYUgU-000SGp-1E;
	Thu, 16 Jan 2025 18:33:38 +0000
Date: Fri, 17 Jan 2025 02:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 ba39e420c0e9a4a609d982d24c1bdb8b6beefb33
Message-ID: <202501170209.ex8LJxqR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: ba39e420c0e9a4a609d982d24c1bdb8b6beefb33  usb: quirks: Add NO_LPM quirk for TOSHIBA TransMemory-Mx device

elapsed time: 1456m

configs tested: 58
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

