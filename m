Return-Path: <linux-usb+bounces-15607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F998B6E4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 10:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EB228263D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2024 08:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6681519AD5C;
	Tue,  1 Oct 2024 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4oVN2P2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84B19AD6C
	for <linux-usb@vger.kernel.org>; Tue,  1 Oct 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771225; cv=none; b=hLHFHXIgul9CP5lB+26Ld0LyrHGUe78jq0Rj3adzboENoyBsBN/FemMu8ggZRQIj93N55vYlMPStcaElpikY0bwI3+7OpvZ4A6ni6X20HNfa2tYFhQuFaBuoXUN8inHCZsa6jjfp5MLu5l/B8zlU+68Xp/JWdomcz18GsneNrBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771225; c=relaxed/simple;
	bh=/63zi0gJyqssiOfV+tdF9BbJtNY0hyfIC+bzSWWBAEE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RR+S6Ua1JY/+f+VGiTTxGpqjNM1VYQEL/M3HpMdghwZnpzYF/u2E2qV+V3SE7lz29VwpMMwdYcHNbklLyUAmML8EQ3JkipT40vq1sZDzfIzgZWrmNsdsjuf4xHOMPIewrReZCkTM21ZM457fsBU2X3V35ZkW+yvEvkq1ds1RQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4oVN2P2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727771223; x=1759307223;
  h=date:from:to:cc:subject:message-id;
  bh=/63zi0gJyqssiOfV+tdF9BbJtNY0hyfIC+bzSWWBAEE=;
  b=F4oVN2P2HS9U5vk/OLu/1s5CBXoOi3K9EUO6u0cm8zQs0wzc7FMAR7sF
   cREjOcfAoCQeJnPEmKverJv5WNk47WEp3nkJincUf7Wy0bgyj3Dr0W+CC
   ZSkWne2bGjQfvG63E0eonJOLouaDrjQxNxSVi/tu0c2RHN3EDRuyUfcx5
   pBgvAgPUw+fwCHGiqGO3UQEigt91wBdDJZAMMFWvC2+qjR7PVQIfNETVp
   8YNt7cZm6JeiwxBifIRaewyS6Uegq+1clHSDgC5HmKz07Lyof0aa+vizE
   kI6xdMqHRLmzIeYOzMVMy5v0wU/kokt5gBWdo0j8RW9qFYRs348vv4hYh
   Q==;
X-CSE-ConnectionGUID: 8m99MmrbTduUhLTde0+8Eg==
X-CSE-MsgGUID: kBVT8wCSTxe9tcC6JTz5SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30682715"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30682715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:27:03 -0700
X-CSE-ConnectionGUID: qpiHAKpKTLiB1jQoNPzoAQ==
X-CSE-MsgGUID: XbGCMFpmSMuSoZSwriGTTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="74366521"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2024 01:27:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svYDj-000QR1-22;
	Tue, 01 Oct 2024 08:26:59 +0000
Date: Tue, 01 Oct 2024 16:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:rndis-removal] BUILD SUCCESS
 1c8a324d7f6edf32b24f9a9c23b5409a5c1879fc
Message-ID: <202410011658.wXm7Od3Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git rndis-removal
branch HEAD: 1c8a324d7f6edf32b24f9a9c23b5409a5c1879fc  USB: disable all RNDIS protocol drivers

elapsed time: 1166m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         at91_dt_defconfig    clang-20
arm                          collie_defconfig    gcc-14.1.0
arm                     davinci_all_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                            mmp2_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-002-20241001    gcc-12
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-004-20241001    gcc-12
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386        buildonly-randconfig-006-20241001    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-001-20241001    gcc-12
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-004-20241001    gcc-12
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-011-20241001    gcc-12
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-012-20241001    gcc-12
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-013-20241001    gcc-12
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-014-20241001    gcc-11
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-015-20241001    gcc-12
i386                  randconfig-016-20241001    clang-18
i386                  randconfig-016-20241001    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    gcc-14.1.0
mips                           ip32_defconfig    clang-20
mips                      maltasmvp_defconfig    clang-20
mips                        maltaup_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                           rs90_defconfig    gcc-14.1.0
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                 canyonlands_defconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               alldefconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                     magicpanelr2_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                      rts7751r2d1_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sh                            titan_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

