Return-Path: <linux-usb+bounces-17523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F809C667F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 02:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B30AEB24E28
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 01:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D97A17C68;
	Wed, 13 Nov 2024 01:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/7rRrVw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FE2F5A
	for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2024 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731460426; cv=none; b=oQazYXOLpp2gM5oj59zFpQTnegBsiPAkT8sukGeQt3lE1JkghBRuQtAjm7GrJSJYEdQkZ+moLg6WLb1fwcHW+3dgU8oMH02GNd0FrT+J9vJAosIG52x1dhJC2oGnweekeUFHa+9iq9TqRkLLRPhLmA5cSVPIYyGxkejbyEyYo4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731460426; c=relaxed/simple;
	bh=Que3yxJGg4SnGTjMl5VH6aN1xLjVvbpcUqRtis5hhzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bZ4mSnKePIfog40bDtQL1CQMPP4cqr+hHMUG9SQdAf4yI/tKcoIoNF0AzzyPD8HBb4b2QSLAesDzEcUCVa4P1gbgTxbNFdYEEzqXizCj3vS2LBasU7j1O9BLl96AybBZ5cQLBP70DwJNluziUKUu+NZlKQYsuMe4ppSeIr1pWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/7rRrVw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731460424; x=1762996424;
  h=date:from:to:cc:subject:message-id;
  bh=Que3yxJGg4SnGTjMl5VH6aN1xLjVvbpcUqRtis5hhzw=;
  b=e/7rRrVwb0H7Ukva77udpoSYsaWthXAzXwYPGTy7pwxs1lIZtD7CR940
   LitcNfeyRib4l3j1G/HPB9OfXg8dts547RnaEGDQ5gJlWGVdJWtAOFSim
   esovRM5CS8/X+FkJYjSkTjqY7OUM0yrzQDB4P9YMRFeBLYT9DQSzDhQw8
   0SmPgUiufgmoB3h+Y3lPB8fox1R3IJTcX1mQqaIMON2khpXvv82mRh5FM
   5JWfoD/ntjX/lFoYaJhaVdIAlAHgLvKy8RJ1z471EpTR//22qFPkHUPo8
   mruXc8fNobNjzBx2JJz7WBd2BuVLSyIGdX27h2inTj93/0p4FUl6E4HMk
   Q==;
X-CSE-ConnectionGUID: JlHzhKKqTDyZnNkSy+M2+w==
X-CSE-MsgGUID: AFWY+CwlSqeGocQQmbyICQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31434520"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31434520"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 17:13:44 -0800
X-CSE-ConnectionGUID: D58JPjMLSkyzQlaLFrVXmw==
X-CSE-MsgGUID: fXGYFHNJQp+ZJXlmD/ytkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="118538406"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2024 17:13:42 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB1wy-0001uS-0p;
	Wed, 13 Nov 2024 01:13:40 +0000
Date: Wed, 13 Nov 2024 09:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 e56aac6e5a25630645607b6856d4b2a17b2311a5
Message-ID: <202411130945.tzGknS0t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: e56aac6e5a25630645607b6856d4b2a17b2311a5  usb: typec: fix potential array underflow in ucsi_ccg_sync_control()

elapsed time: 778m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                       allnoconfig    gcc-14.2.0
alpha                      allyesconfig    clang-20
alpha                      allyesconfig    gcc-14.2.0
arc                        allmodconfig    clang-20
arc                        allmodconfig    gcc-13.2.0
arc                         allnoconfig    gcc-14.2.0
arc                        allyesconfig    clang-20
arc                        allyesconfig    gcc-13.2.0
arc                      hsdk_defconfig    gcc-14.2.0
arm                        allmodconfig    clang-20
arm                        allmodconfig    gcc-14.2.0
arm                         allnoconfig    gcc-14.2.0
arm                        allyesconfig    clang-20
arm                        allyesconfig    gcc-14.2.0
arm                   at91_dt_defconfig    clang-20
arm               davinci_all_defconfig    gcc-14.2.0
arm                integrator_defconfig    clang-20
arm                  keystone_defconfig    gcc-14.2.0
arm                  mvebu_v5_defconfig    gcc-14.2.0
arm                 netwinder_defconfig    clang-20
arm                      qcom_defconfig    clang-20
arm                  shmobile_defconfig    gcc-14.2.0
arm64                      alldefconfig    gcc-14.2.0
arm64                      allmodconfig    clang-20
arm64                       allnoconfig    gcc-14.2.0
arm64                         defconfig    clang-20
csky                        allnoconfig    gcc-14.2.0
hexagon                    allmodconfig    clang-20
hexagon                     allnoconfig    gcc-14.2.0
hexagon                    allyesconfig    clang-20
i386                       allmodconfig    clang-19
i386                        allnoconfig    clang-19
i386                       allyesconfig    clang-19
i386                          defconfig    clang-19
loongarch                  allmodconfig    gcc-14.2.0
loongarch                   allnoconfig    gcc-14.2.0
m68k                       allmodconfig    gcc-14.2.0
m68k                        allnoconfig    gcc-14.2.0
m68k                       allyesconfig    gcc-14.2.0
m68k                 m5249evb_defconfig    gcc-14.2.0
m68k                 m5475evb_defconfig    clang-20
microblaze                 allmodconfig    gcc-14.2.0
microblaze                  allnoconfig    gcc-14.2.0
microblaze                 allyesconfig    gcc-14.2.0
mips                        allnoconfig    gcc-14.2.0
mips                  qi_lb60_defconfig    gcc-14.2.0
mips                     xway_defconfig    clang-20
nios2                       allnoconfig    gcc-14.2.0
openrisc                    allnoconfig    clang-20
openrisc                   allyesconfig    gcc-14.2.0
openrisc                      defconfig    gcc-12
parisc                     allmodconfig    gcc-14.2.0
parisc                      allnoconfig    clang-20
parisc                     allyesconfig    gcc-14.2.0
parisc                        defconfig    gcc-12
powerpc              adder875_defconfig    clang-20
powerpc                    allmodconfig    gcc-14.2.0
powerpc                     allnoconfig    clang-20
powerpc                    allyesconfig    clang-20
powerpc                    allyesconfig    gcc-14.2.0
powerpc                  cell_defconfig    clang-20
powerpc           linkstation_defconfig    gcc-14.2.0
powerpc               mpc512x_defconfig    gcc-14.2.0
powerpc               mpc5200_defconfig    clang-20
powerpc           mpc836x_rdk_defconfig    clang-20
powerpc            mpc866_ads_defconfig    clang-20
powerpc                pcm030_defconfig    clang-20
powerpc               ppa8548_defconfig    gcc-14.2.0
powerpc               sequoia_defconfig    gcc-14.2.0
powerpc               tqm8555_defconfig    gcc-14.2.0
riscv                      allmodconfig    clang-20
riscv                      allmodconfig    gcc-14.2.0
riscv                       allnoconfig    clang-20
riscv                      allyesconfig    clang-20
riscv                      allyesconfig    gcc-14.2.0
riscv                         defconfig    gcc-12
s390                       allmodconfig    clang-20
s390                       allmodconfig    gcc-14.2.0
s390                        allnoconfig    clang-20
s390                       allyesconfig    gcc-14.2.0
s390                          defconfig    gcc-12
sh                         allmodconfig    gcc-14.2.0
sh                          allnoconfig    gcc-14.2.0
sh                         allyesconfig    gcc-14.2.0
sh                   apsh4a3a_defconfig    gcc-14.2.0
sh                            defconfig    gcc-12
sh          ecovec24-romimage_defconfig    clang-20
sh             secureedge5410_defconfig    clang-20
sh               sh7710voipgw_defconfig    gcc-14.2.0
sh             sh7724_generic_defconfig    clang-20
sh                       shx3_defconfig    clang-20
sparc                      allmodconfig    gcc-14.2.0
sparc64                       defconfig    gcc-12
um                         allmodconfig    clang-20
um                          allnoconfig    clang-20
um                         allyesconfig    clang-20
um                         allyesconfig    gcc-12
um                            defconfig    gcc-12
um                       i386_defconfig    gcc-12
um                     x86_64_defconfig    gcc-12
x86_64                      allnoconfig    clang-19
x86_64                     allyesconfig    clang-19
x86_64                        defconfig    clang-19
x86_64                            kexec    clang-19
x86_64                            kexec    gcc-12
x86_64                         rhel-8.3    gcc-12
xtensa                      allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

