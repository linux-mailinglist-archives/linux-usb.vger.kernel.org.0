Return-Path: <linux-usb+bounces-30576-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7FC65A61
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 19:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 891C8349E49
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 17:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B613B301026;
	Mon, 17 Nov 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIBbLzrD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2012C08BC
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763402136; cv=none; b=Hga06Ga83tQBQFkuVKcQrgjW9LeBV1wIbB2ANu3WiYH6XhDGgUOirYJzZZ9xPN+V1ivEI9o1nP7ySebSujZITReh1FGRH3uvk0TgPi2oCgJHc6wh1yybsekKt5+BwtmYQVGPmYEK1TvInt/aId1RJoWrr1DC0e2xtwTl/aWFObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763402136; c=relaxed/simple;
	bh=N6lqB0C506xceuwh3bKRtocuDh0/5uJR4cQpVxCZT64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mu44l1BjxU7RCjyd5tsueM+rlScq3Zvlme+qwtlmBziWTD35+JIVelJR6kmfSnKtbY91f0cCDq8Vr0E6vm+iNC0eV3zJbBGmjuAoNZdn2Fwhvl0CdKFKA3idtUGhYUZEAjTGNQCp4wafXH1trZj5u/ymRdgdbx6aTX/G3koOIJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIBbLzrD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763402134; x=1794938134;
  h=date:from:to:cc:subject:message-id;
  bh=N6lqB0C506xceuwh3bKRtocuDh0/5uJR4cQpVxCZT64=;
  b=nIBbLzrDOv2qnZdvCVbn4tRauVvqg6SpwcfwoNyjkr0klUKDXhBWM+9e
   3116g/ozCmeQ52j+3v7xVsOCnFEYnofX3xNJCnAtk1ZqCZZJO5bWJWxVo
   5QWX5taUeb+il7Y5LBOjPlRLuBvGFdTRdXJQuHF2B1GAX+aAb/qxAp9S/
   0PKcGI4wnh5gPFnzvPVlLrfSs5jY74Uhtil8lZIhs6YaLG69i8xafOMDK
   KfGriBLL103jH2M96vKiDA/Sr0G7Hr0jIEMF7N8hIsojnt/LnZp9o609d
   pm9o0VQR3MwLfPXlPPAhWeZPc+ms4R/xXkrvVW8J70Nx+IkwqpvwF3ciO
   w==;
X-CSE-ConnectionGUID: H8CYj8H3RASob4k2O2Sw7Q==
X-CSE-MsgGUID: erdkVzMnTlqyng2RwlitxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90886659"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="90886659"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:55:33 -0800
X-CSE-ConnectionGUID: FO1oemFmSlmT99t6hk2rWA==
X-CSE-MsgGUID: fZ9HnHDOQk6dhul6PBJzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="221174189"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2025 09:55:32 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL3Rq-0000uJ-18;
	Mon, 17 Nov 2025 17:55:30 +0000
Date: Tue, 18 Nov 2025 01:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2e558d86e0975fdfb048bd600e253993edc068fe
Message-ID: <202511180100.s9uG6rBt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 2e558d86e0975fdfb048bd600e253993edc068fe  Merge tag 'usb-serial-6.18-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 7503m

configs tested: 77
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251113    gcc-8.5.0
arc         randconfig-002-20251113    gcc-8.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251113    gcc-10.5.0
arm         randconfig-002-20251113    clang-22
arm         randconfig-003-20251113    clang-22
arm         randconfig-004-20251113    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
hexagon     randconfig-001-20251113    clang-22
hexagon     randconfig-002-20251113    clang-22
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251113    gcc-15.1.0
loongarch   randconfig-002-20251113    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251113    gcc-8.5.0
nios2       randconfig-002-20251113    gcc-11.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251113    gcc-8.5.0
parisc      randconfig-002-20251113    gcc-14.3.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251113    clang-22
powerpc     randconfig-002-20251113    clang-22
powerpc64   randconfig-001-20251113    clang-22
powerpc64   randconfig-002-20251113    clang-22
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                  allmodconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                  allyesconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

