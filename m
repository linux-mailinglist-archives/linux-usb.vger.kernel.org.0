Return-Path: <linux-usb+bounces-17571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C29C8144
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 04:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CED28310C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 03:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF05C1E7C2D;
	Thu, 14 Nov 2024 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLd5eLCV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE701E6DDE
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 03:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731553277; cv=none; b=lcvYkaX5qVTb5b0ENs37BJOG7e0GrJoWnsLRfaJGUVDIX2TlqMtNS6BEZDLdKBfqc2o/cX9txqRsnjZYVP32XxO6nRnCVoB6gNum6jrxrriWLZ0FJlQ/TlBp08iG0GplxfGDrk4r4j+kBqPlwIX9pnhpzHXabTbSXVmcsX/pf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731553277; c=relaxed/simple;
	bh=kimsw77NhQrbS+J6aka0Fmyyaf/7pPWM+yW000md8Ec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+lnmkHyVXQ41gWPaRW1w0QbT0MzkgsuUlz61c62aymVpmU2/rxYSK6kXQQMaCWtu9024jPEGJfHKZ6+Y7a9RbWP7H1C/aZLTDipONNJyEGFjCa2JyXSzzAclorlTfur7Hi0QEvL91PFGwx0IhGT5mIF8I5brZ9urQIgJwkqUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLd5eLCV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731553275; x=1763089275;
  h=date:from:to:cc:subject:message-id;
  bh=kimsw77NhQrbS+J6aka0Fmyyaf/7pPWM+yW000md8Ec=;
  b=nLd5eLCVRhsrUWADjmIsaxuSduQTiQVQZTce7EIHqbZIvZIuUtLWyWt4
   pNcw8nEn97wegDlh5urPdlD/f7tQ3BEzQN2e/2jDpuK4Q0dkz6czkMHLE
   tvucZV+eCnGtUtxQx9Zv9QqM4ExiYUm2m8eGOxVEf9dvtlsUl/4OvYoOK
   kp8ftxFg0PE1MPJMBPJrd0RJ1gg126f/BnQfMknKorXvIk4n/Waxdf9Dp
   t/ReLBMfLH8MzSU+Z531YWf4M0AibSw8SxBdhEN95GHPOjn17etY8/72v
   VODOwonFMIkO4kgjegcnAL7rGNIstxKdRtb6L7xYY7SzSGEHxqI9/fhiO
   w==;
X-CSE-ConnectionGUID: 8tcPyn1BQV+6AzITjdvTUw==
X-CSE-MsgGUID: Bcyhbs1ZQEavo+iX9aMxGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="56863567"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="56863567"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 19:01:13 -0800
X-CSE-ConnectionGUID: T4Z90kqzT/urQknxMOEr0g==
X-CSE-MsgGUID: kSWZu5TaRJihQSzwS6gP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="87816825"
Received: from lkp-server01.sh.intel.com (HELO b014a344d658) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2024 18:58:36 -0800
Received: from kbuild by b014a344d658 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBQ41-00004C-3A;
	Thu, 14 Nov 2024 02:58:33 +0000
Date: Thu, 14 Nov 2024 10:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 528ea1aca24fba5616f397d43ccb2de99d2a41d7
Message-ID: <202411141042.T8ymRo3A-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 528ea1aca24fba5616f397d43ccb2de99d2a41d7  drivers/usb/storage: refactor min with min_t

elapsed time: 755m

configs tested: 102
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                allnoconfig    gcc-14.2.0
alpha               allyesconfig    clang-20
alpha               allyesconfig    gcc-14.2.0
alpha                  defconfig    gcc-14.2.0
arc                 allmodconfig    clang-20
arc                 allmodconfig    gcc-13.2.0
arc                  allnoconfig    gcc-14.2.0
arc                 allyesconfig    clang-20
arc                 allyesconfig    gcc-13.2.0
arc                    defconfig    gcc-14.2.0
arc           vdk_hs38_defconfig    gcc-14.2.0
arm                 alldefconfig    gcc-14.2.0
arm                 allmodconfig    clang-20
arm                 allmodconfig    gcc-14.2.0
arm                  allnoconfig    gcc-14.2.0
arm                 allyesconfig    clang-20
arm                 allyesconfig    gcc-14.2.0
arm                    defconfig    gcc-14.2.0
arm               dove_defconfig    gcc-14.2.0
arm            socfpga_defconfig    gcc-14.2.0
arm64               allmodconfig    clang-20
arm64                allnoconfig    gcc-14.2.0
arm64                  defconfig    gcc-14.2.0
csky                 allnoconfig    gcc-14.2.0
csky                   defconfig    gcc-14.2.0
hexagon             allmodconfig    clang-20
hexagon              allnoconfig    gcc-14.2.0
hexagon             allyesconfig    clang-20
hexagon                defconfig    gcc-14.2.0
i386                allmodconfig    clang-19
i386                 allnoconfig    clang-19
i386                allyesconfig    clang-19
i386                   defconfig    clang-19
loongarch           allmodconfig    gcc-14.2.0
loongarch            allnoconfig    gcc-14.2.0
loongarch              defconfig    gcc-14.2.0
m68k                allmodconfig    gcc-14.2.0
m68k                 allnoconfig    gcc-14.2.0
m68k                allyesconfig    gcc-14.2.0
m68k                   defconfig    gcc-14.2.0
m68k           m5272c3_defconfig    gcc-14.2.0
m68k           m5307c3_defconfig    gcc-14.2.0
m68k               q40_defconfig    gcc-14.2.0
microblaze          allmodconfig    gcc-14.2.0
microblaze           allnoconfig    gcc-14.2.0
microblaze          allyesconfig    gcc-14.2.0
microblaze             defconfig    gcc-14.2.0
mips                 allnoconfig    gcc-14.2.0
mips         bmips_stb_defconfig    gcc-14.2.0
mips        loongson1b_defconfig    gcc-14.2.0
nios2                allnoconfig    gcc-14.2.0
nios2                  defconfig    gcc-14.2.0
openrisc             allnoconfig    clang-20
openrisc            allyesconfig    gcc-14.2.0
openrisc               defconfig    gcc-12
openrisc     or1klitex_defconfig    gcc-14.2.0
parisc              allmodconfig    gcc-14.2.0
parisc               allnoconfig    clang-20
parisc              allyesconfig    gcc-14.2.0
parisc                 defconfig    gcc-12
parisc64               defconfig    gcc-14.2.0
powerpc             allmodconfig    gcc-14.2.0
powerpc              allnoconfig    clang-20
powerpc             allyesconfig    clang-20
powerpc             allyesconfig    gcc-14.2.0
powerpc           cell_defconfig    gcc-14.2.0
powerpc          ebony_defconfig    gcc-14.2.0
powerpc        mpc83xx_defconfig    gcc-14.2.0
powerpc       socrates_defconfig    gcc-14.2.0
riscv               allmodconfig    clang-20
riscv               allmodconfig    gcc-14.2.0
riscv                allnoconfig    clang-20
riscv               allyesconfig    clang-20
riscv               allyesconfig    gcc-14.2.0
riscv                  defconfig    gcc-12
s390                allmodconfig    clang-20
s390                allmodconfig    gcc-14.2.0
s390                 allnoconfig    clang-20
s390                allyesconfig    gcc-14.2.0
s390                   defconfig    gcc-12
sh                  allmodconfig    gcc-14.2.0
sh                   allnoconfig    gcc-14.2.0
sh                  allyesconfig    gcc-14.2.0
sh                     defconfig    gcc-12
sh              se7721_defconfig    gcc-14.2.0
sparc               allmodconfig    gcc-14.2.0
sparc64                defconfig    gcc-12
um                  allmodconfig    clang-20
um                   allnoconfig    clang-20
um                  allyesconfig    clang-20
um                  allyesconfig    gcc-12
um                     defconfig    gcc-12
um                i386_defconfig    gcc-12
um              x86_64_defconfig    gcc-12
x86_64               allnoconfig    clang-19
x86_64              allyesconfig    clang-19
x86_64                 defconfig    clang-19
x86_64                     kexec    clang-19
x86_64                     kexec    gcc-12
x86_64                  rhel-8.3    gcc-12
xtensa               allnoconfig    gcc-14.2.0
xtensa             iss_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

