Return-Path: <linux-usb+bounces-19209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF76A0A487
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 16:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6FE16687E
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 15:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E861B0428;
	Sat, 11 Jan 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTObkLh7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484DA55
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736611112; cv=none; b=Yfo+ZumcdZhvDvLnZN0GwbR+jJOv/WXZDo0SnzJ7JXVqOECjR4hTqm17jbrkqc0P9NNCK5gV02PSok/4INqApCrGNziuZ3PlaHZww0OHfD50K+T3KhKGgJb8fgURjMzVuPQiz0t2w0Arq2p0k5483Fwmj9JfdAwa2ajweOlXdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736611112; c=relaxed/simple;
	bh=S285c3KsN5uiXDBaqU/dEi21ANWRoNfJiIrx8GTLn/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N4DXCZ3O7bPe+YttlQESkj3UwaRV1rKy+UxzQInwXj+o9kPxGsX/prEZw4IfZsNmlI6gjDuGIOqlBWZRHQSDnJN/DkxOmLL/IK7Oya0FEqf2Od3qfjQDhhn3/AKgGaz4JqVJnzZR1SsCZO9ALlU/jkQOBrwDDNzqMolf7BBd+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTObkLh7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736611111; x=1768147111;
  h=date:from:to:cc:subject:message-id;
  bh=S285c3KsN5uiXDBaqU/dEi21ANWRoNfJiIrx8GTLn/Q=;
  b=nTObkLh7EoNYUBQAhO9JBcMmiA1ueDlUdEJHi1OXGalDaWQTelvkTRLg
   eyw4OOVwGtUlW+w09YCJQAEae+DQbgNauFyezzGbJpCzG7iUUauKJLCcp
   CyEfBbMnlnWA230QB5gapEQah8T1f7ML6u/gw8QBG940QzjsuTJuF6wvQ
   Ah3/Rd9UwEl4k1rde2lZlqFoBoDH+PyAxJiZomD77HKdYOc6eRRARr4MQ
   +tfkKE0gi5qkdAEyO22QJGwz3IYcXPJk1yKhx5usXo4e1w7obgXtRBlwZ
   5O9nuuWzxKgXwsVotCr5Kk9Mg/h+RKDON03XggOJ3QKzbvG4H6OrscyTy
   g==;
X-CSE-ConnectionGUID: SHkPxuvdTAOF8BvMF5CIgg==
X-CSE-MsgGUID: LTWC0weWQHKghGNIcvFwmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48307960"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="48307960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 07:58:30 -0800
X-CSE-ConnectionGUID: 3H1AbZR1SC2bNAgw/kJAXg==
X-CSE-MsgGUID: Cum4SFcAQeiJne1R570Ecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108637708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jan 2025 07:58:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWdsZ-000Kre-0J;
	Sat, 11 Jan 2025 15:58:27 +0000
Date: Sat, 11 Jan 2025 23:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f3149ed697dd0c4fc1d696fef78129fa2fe4ca12
Message-ID: <202501112315.EFhMwu9u-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f3149ed697dd0c4fc1d696fef78129fa2fe4ca12  Merge tag 'usb-serial-6.13-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1451m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250111    gcc-13.2.0
arc                  randconfig-002-20250111    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250111    clang-16
arm                  randconfig-002-20250111    gcc-14.2.0
arm                  randconfig-003-20250111    clang-20
arm                  randconfig-004-20250111    clang-20
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250111    gcc-14.2.0
arm64                randconfig-002-20250111    clang-20
arm64                randconfig-003-20250111    clang-18
arm64                randconfig-004-20250111    clang-16
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250111    gcc-14.2.0
csky                 randconfig-002-20250111    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250111    clang-20
hexagon              randconfig-002-20250111    clang-15
i386       buildonly-randconfig-001-20250111    gcc-12
i386       buildonly-randconfig-002-20250111    gcc-11
i386       buildonly-randconfig-003-20250111    gcc-12
i386       buildonly-randconfig-004-20250111    gcc-12
i386       buildonly-randconfig-005-20250111    gcc-12
i386       buildonly-randconfig-006-20250111    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250111    gcc-14.2.0
loongarch            randconfig-002-20250111    gcc-14.2.0
nios2                randconfig-001-20250111    gcc-14.2.0
nios2                randconfig-002-20250111    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250111    gcc-14.2.0
parisc               randconfig-002-20250111    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250111    gcc-14.2.0
powerpc              randconfig-002-20250111    gcc-14.2.0
powerpc              randconfig-003-20250111    gcc-14.2.0
powerpc64            randconfig-001-20250111    gcc-14.2.0
powerpc64            randconfig-002-20250111    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250111    clang-18
riscv                randconfig-002-20250111    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250111    clang-20
s390                 randconfig-002-20250111    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250111    gcc-14.2.0
sh                   randconfig-002-20250111    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250111    gcc-14.2.0
sparc                randconfig-002-20250111    gcc-14.2.0
sparc64              randconfig-001-20250111    gcc-14.2.0
sparc64              randconfig-002-20250111    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250111    clang-18
um                   randconfig-002-20250111    clang-20
x86_64     buildonly-randconfig-001-20250111    clang-19
x86_64     buildonly-randconfig-002-20250111    gcc-12
x86_64     buildonly-randconfig-003-20250111    gcc-12
x86_64     buildonly-randconfig-004-20250111    clang-19
x86_64     buildonly-randconfig-005-20250111    gcc-12
x86_64     buildonly-randconfig-006-20250111    gcc-12
xtensa               randconfig-001-20250111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

