Return-Path: <linux-usb+bounces-11994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2A92791F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2024 16:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A238B213D3
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2024 14:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637C41AE873;
	Thu,  4 Jul 2024 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5jDgcqm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63C15491
	for <linux-usb@vger.kernel.org>; Thu,  4 Jul 2024 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104394; cv=none; b=ij/Nl1+3AtRDuJm9cWA8fi4wnEEdMmqJV3NdWpg29OgXk4RdodepHBs0TinK423DjVolJ8SzSnkLUwMEzxdWglP5ALr7ugOI5QrIBV9i3MDF0Y4+xfVpss1/IUfBSVNIAgUk+dXthpnJq4g5V+2PJTxOlDrYAlRFqWKSOOnr9WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104394; c=relaxed/simple;
	bh=8SHYq6cEZ9dt6k0mKy1i1kWzYoODLqhef4sxDenfTNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRmF8G0oFToPQyT4T6OKkXWI9OhnbhCv6f79qvoloeeoHjMTw++IG/PxiWKaJUfmaIO5TQz636tqCKK8SlW8/K6mKg/nCWc8l2UWahHuvdr1+gNtFH5YmbtYginR7K2naGkIOCxQa608oFrAScYF12INTgvmf0ifHkDB8u58SHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5jDgcqm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720104393; x=1751640393;
  h=date:from:to:cc:subject:message-id;
  bh=8SHYq6cEZ9dt6k0mKy1i1kWzYoODLqhef4sxDenfTNU=;
  b=Q5jDgcqm+FCYG0yd+8XYRAFWhLyj72FpN9WCHrAJnIwduF9XFFL1oB1W
   pukowjbysbBDiOyOWqYIbqtCs92dRjLYGeHaAMBUnCEInDTpgTQeSPp1p
   f4HbWHdmpgjfr5PBd89ZMWcK2Ww9qj15SEQMoArMV3/q+fRETxSHc3KxS
   kAMAPT+MS6hnTIHDPVTXGi58RbIcKEU92m6fQkcJtTLJEl4XlGOlxA8Rg
   wMy5bOwPzzNSbyUeiQdQrT7agrk4BYmfJbEvMN52dkTc48TwEtIBgZxr/
   TyNH+BACkYr9ee9aHzoujXp3yPublYR0gxFhAnYNBToBeUWyw/WhRlu9W
   Q==;
X-CSE-ConnectionGUID: IFmk79PnT9KHyv7qsLAQhg==
X-CSE-MsgGUID: x0IceibJSpK3ojSuXGD4TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21153984"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21153984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:46:33 -0700
X-CSE-ConnectionGUID: 76e2HCECSmuGWxkmBhVWQg==
X-CSE-MsgGUID: ETnfckyfTG6gbcEp5NwBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47267104"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 07:46:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPNjA-000R6M-2u;
	Thu, 04 Jul 2024 14:46:28 +0000
Date: Thu, 04 Jul 2024 22:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 179264157bbaf3d169b184160d0b5283f8a50e73
Message-ID: <202407042257.8PtXRd5a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 179264157bbaf3d169b184160d0b5283f8a50e73  usb: dwc3: core: Check all ports when set phy suspend

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20240704
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:dm_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:dp_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:dm_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:dp_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
    |-- arch-arm64-boot-dts-qcom-sc818-lenovo-flex-5g.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:dm_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:dp_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a6f8800:interrupt-names:hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:dm_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:dp_hs_phy_irq-was-expected
    |-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-ss_phy_irq-dm_hs_phy_irq-dp_hs_phy_irq-is-too-short
    `-- arch-arm64-boot-dts-qcom-sc818-primus.dtb:usb-a8f8800:interrupt-names:hs_phy_irq-was-expected

elapsed time: 1452m

configs tested: 187
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240704   gcc-13.2.0
arc                   randconfig-002-20240704   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                         lpc18xx_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-13.2.0
arm                         orion5x_defconfig   gcc-13.2.0
arm                          pxa168_defconfig   gcc-13.2.0
arm                   randconfig-001-20240704   gcc-13.2.0
arm                   randconfig-002-20240704   gcc-13.2.0
arm                   randconfig-003-20240704   gcc-13.2.0
arm                   randconfig-004-20240704   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240704   gcc-13.2.0
arm64                 randconfig-002-20240704   gcc-13.2.0
arm64                 randconfig-003-20240704   gcc-13.2.0
arm64                 randconfig-004-20240704   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240704   gcc-13.2.0
csky                  randconfig-002-20240704   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240704   clang-18
i386         buildonly-randconfig-002-20240704   clang-18
i386         buildonly-randconfig-002-20240704   gcc-13
i386         buildonly-randconfig-003-20240704   clang-18
i386         buildonly-randconfig-003-20240704   gcc-13
i386         buildonly-randconfig-004-20240704   clang-18
i386         buildonly-randconfig-004-20240704   gcc-12
i386         buildonly-randconfig-005-20240704   clang-18
i386         buildonly-randconfig-005-20240704   gcc-12
i386         buildonly-randconfig-006-20240704   clang-18
i386         buildonly-randconfig-006-20240704   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240704   clang-18
i386                  randconfig-002-20240704   clang-18
i386                  randconfig-002-20240704   gcc-13
i386                  randconfig-003-20240704   clang-18
i386                  randconfig-004-20240704   clang-18
i386                  randconfig-004-20240704   gcc-13
i386                  randconfig-005-20240704   clang-18
i386                  randconfig-006-20240704   clang-18
i386                  randconfig-006-20240704   gcc-12
i386                  randconfig-011-20240704   clang-18
i386                  randconfig-011-20240704   gcc-13
i386                  randconfig-012-20240704   clang-18
i386                  randconfig-013-20240704   clang-18
i386                  randconfig-014-20240704   clang-18
i386                  randconfig-015-20240704   clang-18
i386                  randconfig-016-20240704   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240704   gcc-13.2.0
loongarch             randconfig-002-20240704   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                       bvme6000_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5307c3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                            gpr_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
mips                    maltaup_xpa_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240704   gcc-13.2.0
nios2                 randconfig-002-20240704   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240704   gcc-13.2.0
parisc                randconfig-002-20240704   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                     ksi8560_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240704   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240704   gcc-13.2.0
powerpc64             randconfig-002-20240704   gcc-13.2.0
powerpc64             randconfig-003-20240704   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240704   gcc-13.2.0
riscv                 randconfig-002-20240704   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240704   gcc-13.2.0
s390                  randconfig-002-20240704   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                             espt_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240704   gcc-13.2.0
sh                    randconfig-002-20240704   gcc-13.2.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240704   gcc-13.2.0
sparc64               randconfig-002-20240704   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240704   gcc-13.2.0
um                    randconfig-002-20240704   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240704   clang-18
x86_64       buildonly-randconfig-002-20240704   clang-18
x86_64       buildonly-randconfig-003-20240704   clang-18
x86_64       buildonly-randconfig-004-20240704   clang-18
x86_64       buildonly-randconfig-005-20240704   clang-18
x86_64       buildonly-randconfig-006-20240704   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240704   clang-18
x86_64                randconfig-002-20240704   clang-18
x86_64                randconfig-003-20240704   clang-18
x86_64                randconfig-004-20240704   clang-18
x86_64                randconfig-005-20240704   clang-18
x86_64                randconfig-006-20240704   clang-18
x86_64                randconfig-011-20240704   clang-18
x86_64                randconfig-012-20240704   clang-18
x86_64                randconfig-013-20240704   clang-18
x86_64                randconfig-014-20240704   clang-18
x86_64                randconfig-015-20240704   clang-18
x86_64                randconfig-016-20240704   clang-18
x86_64                randconfig-071-20240704   clang-18
x86_64                randconfig-072-20240704   clang-18
x86_64                randconfig-073-20240704   clang-18
x86_64                randconfig-074-20240704   clang-18
x86_64                randconfig-075-20240704   clang-18
x86_64                randconfig-076-20240704   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240704   gcc-13.2.0
xtensa                randconfig-002-20240704   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

