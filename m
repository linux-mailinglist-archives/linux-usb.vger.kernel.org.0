Return-Path: <linux-usb+bounces-21504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB93A56D4C
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 17:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F87172645
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 16:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0D7227EBC;
	Fri,  7 Mar 2025 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj3rYval"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E53226D1D
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364069; cv=none; b=LIgOVzymWBlNaV+7Gfd6drfHephXdQXRZOA/9UuGW8Olj1usckoLC/FSppXF0N2wqU6RO2rAKUefim9P3lUddIcbx6jvdkDi+qw9Nr5c/XTmkBfIxH5GWAhPeviiNSlQGr/3Zgs1Y7UexHNk2lRX8xcIEQT6GD0cLmNbYBS6QlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364069; c=relaxed/simple;
	bh=kt3MU8mM27+Iy+ooEFF2h7KFcg97uEG0SPzjsyy+/fQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WMBQt3LCVgS+yT6xx1njCviKNIJJJysc2np1HN7tXMOcP9DJ3xIR2eZAzTK/wOJZ0+WQKF5moa+xeMyA9T0aMd2b+7KbsN7Jz7YV4xwNvGA+cMCFzO/lRTZuPA7uLoQJmiX3ChbSGK9sDsbBP7Hb5yhH1UA5XXTxKLCZfR/xREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj3rYval; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364068; x=1772900068;
  h=date:from:to:cc:subject:message-id;
  bh=kt3MU8mM27+Iy+ooEFF2h7KFcg97uEG0SPzjsyy+/fQ=;
  b=Fj3rYval/8S7DBtwsLITAHadBQoPNwSxxEEO2fgLtg6mUPQzvKTSpxEt
   pNv1zRegUvoitVLRBXONcPNG/wI5ljB/iz5W6Vy+kLm0fh8P85Fy2rdLu
   oAisETV6qUyVMQUOdZ7hPiyGZ9bQIXwRbfzXAZDDF8s9DZtHTh9qtWCWM
   vODy1CRLNLt5vDVNF9WNX+0CRaSAFhb6PwFtZapGfjt1cB0FA5JHHLgHi
   Y5/Q06sjY8swncfxvSPipWRVVa3u8z5+NeEv1izSKA9Nst66J68R/EixN
   Kx37wvI2QDugZD3cwJrpPorqay19t9UdJU4vlzp7miSsqADBM1wtCLlfz
   A==;
X-CSE-ConnectionGUID: cPyGDttiSUe9NrQ84q8new==
X-CSE-MsgGUID: 2wz7BiJ5TCK7nXg2chnsbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42328284"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42328284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:14:27 -0800
X-CSE-ConnectionGUID: VBjYhZh8SpicgcYdFUCsMQ==
X-CSE-MsgGUID: IHEN8d06Rwi3QVYt8ZL1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="120060128"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2025 08:14:26 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaL9-0000jD-2E;
	Fri, 07 Mar 2025 16:14:23 +0000
Date: Sat, 08 Mar 2025 00:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b13abcb7ddd8d38de769486db5bd917537b32ab1
Message-ID: <202503080045.Tgqv8rnY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: b13abcb7ddd8d38de769486db5bd917537b32ab1  usb: typec: ucsi: Fix NULL pointer access

elapsed time: 1453m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

