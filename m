Return-Path: <linux-usb+bounces-18148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF39E4CE0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 04:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B466167440
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 03:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68C91922D8;
	Thu,  5 Dec 2024 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1bI/C/O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809D190674
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370789; cv=none; b=ttQYZkuxBi9iAJliyt7SMTGYC5JVR6vufJb3vDJPMFsZPX4DsjOTPgEa1cHp3xd8DaX78MoWNrdHDYO5OSJoh7Ech11HmFN/KwBsXRNTxlelpJ/1yyYQkkN+2cMUTZN3CTxkQ5n2AYBYCXRjZkEwiWZFz+qWkWlarah79x6ZGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370789; c=relaxed/simple;
	bh=J5ID2SvqukafKudgukchStOISrrdSO4P2eKkQLmQE8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rUafEIveEMQ24qi4ULUn47yfN9P0TuMKHdL1+YwKAIIe5dcwK1BJmj4HRYSH3ItsDljBlFlsuvq4esbDT50SyBWyz2kSVe/K9BgSBCl1zxh8Sgm75zRXvBafuNri+TZTp0DRp6otMkIUxc/velSNUGQ06yrcQeHImqIsW1Jmfoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1bI/C/O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733370788; x=1764906788;
  h=date:from:to:cc:subject:message-id;
  bh=J5ID2SvqukafKudgukchStOISrrdSO4P2eKkQLmQE8w=;
  b=D1bI/C/O37BdSkv5LEFr/ZQ96YGCwyz0pqEAWToMJSiCR4HX030js1P5
   BKoI9R1stoT3ydP/PmU7ZD65pQQrF0P2uiv0yppqvWom4BbbBDGZ8FzJo
   dDqaW5NzzctEXK1NXrPsfMMGFl+jwpLq/hYAbalGNgtlefqgYVsN/7TR/
   r0ZXmtUuIf+X51kkIihpwztOQL17NRetYtHDNHXoAhEp/g9s5UXiEHIXV
   AoJhAvbKevqtNsXu3qAlU3sk0UBsW/EOBdEMoapsrOnXI9aMmcmYGj6fm
   X/0d5UGuGr9bxJNWXeIOK0qb6LA+DS8G7VrUnkGj9iFyiJRojTg5pI3/n
   A==;
X-CSE-ConnectionGUID: IENvwXI/QA20zFiwFNvGaA==
X-CSE-MsgGUID: jtLTJuayRJa8U2D3Z4ZFzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33726209"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33726209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:53:07 -0800
X-CSE-ConnectionGUID: o6XF9VDDT+yiitXzny8MMQ==
X-CSE-MsgGUID: jqjs5O+kSwiFomMU65QXlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93860453"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 19:53:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2vH-0003lr-0E;
	Thu, 05 Dec 2024 03:53:03 +0000
Date: Thu, 05 Dec 2024 11:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 33ead7e538183b1348ba60af90027240a10de751
Message-ID: <202412051110.7xpx7aat-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 33ead7e538183b1348ba60af90027240a10de751  usb: typec: ucsi: Fix connector status writing past buffer size

elapsed time: 736m

configs tested: 169
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    clang-18
arc                        nsimosci_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                            randconfig-001    gcc-13.2.0
arc                   randconfig-001-20241205    clang-20
arc                            randconfig-002    clang-20
arc                            randconfig-002    gcc-13.2.0
arc                   randconfig-002-20241205    clang-20
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-18
arm                           imxrt_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    clang-20
arm                            randconfig-001    gcc-14.2.0
arm                   randconfig-001-20241205    clang-20
arm                            randconfig-002    clang-20
arm                            randconfig-002    gcc-14.2.0
arm                   randconfig-002-20241205    clang-20
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241205    clang-20
arm                            randconfig-004    clang-20
arm                            randconfig-004    gcc-14.2.0
arm                   randconfig-004-20241205    clang-20
arm                        realview_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                       versatile_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                          randconfig-001    clang-20
arm64                          randconfig-001    gcc-14.2.0
arm64                 randconfig-001-20241205    clang-20
arm64                          randconfig-002    clang-20
arm64                          randconfig-002    gcc-14.2.0
arm64                 randconfig-002-20241205    clang-20
arm64                          randconfig-003    clang-15
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241205    clang-20
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241205    clang-20
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241205    clang-19
i386                 buildonly-randconfig-002    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241205    clang-19
i386                 buildonly-randconfig-003    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241205    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241205    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241205    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241205    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                           virt_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                          eyeq6_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                       ebony_defconfig    clang-18
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-18
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    clang-18
sh                         ecovec24_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    clang-20
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                           se7721_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                             shx3_defconfig    clang-20
sh                          urquell_defconfig    gcc-14.2.0
sparc                            alldefconfig    clang-18
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20241205    clang-19
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20241205    clang-19
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20241205    clang-19
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20241205    clang-19
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20241205    clang-19
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20241205    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-20
xtensa                generic_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

