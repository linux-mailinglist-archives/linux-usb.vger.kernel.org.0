Return-Path: <linux-usb+bounces-12839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D79448A1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1704A286845
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 09:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF89A16E861;
	Thu,  1 Aug 2024 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6asj+N1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD8EEB3
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505230; cv=none; b=cM2niyiUmAhs/rqyYDeDSTx+IDfkCNeVIP3ru+EEDkKUazYa8Uj/ulD2J1U5PwbceDkm4cvs4vtkauaCUWnXvAJ0J9L/8QWlkhtCI2onrUsQ2E+stE0E2c+xNdNJHpOS1/d++ChHN47WqA5BsfzjCzLChI9xgn8WmjHWnQNnNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505230; c=relaxed/simple;
	bh=xTF3apHnccYbSC+Sl1ZCvR19oURNiB4++elYFFhNxdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqzZ1m8PJn/ovgWiK46/5TjmKeZIWSFErEURlBYe1tcm/QKRDWMA2+hXaQKrK2t/Q4kcO9Ciw4pVqWtLjede/0C8cPJr30pd7/k2ER75WxLYHrwMtPqiEUp5PVZ9eDn9ISUtSQourHi4sLwKaHXMlRmXwFxomPaPMB1N2ucf/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6asj+N1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722505228; x=1754041228;
  h=date:from:to:cc:subject:message-id;
  bh=xTF3apHnccYbSC+Sl1ZCvR19oURNiB4++elYFFhNxdw=;
  b=Q6asj+N1x8cRX3glM4/IjR9JS+J6Hl/nkcV6tX5KkNaHC6YhH9qMVnok
   Cg9bteRhSW6c1l8viapl02U4MDRYzsVHEmrzoq53Jb2rSQBpuPB/r/eqS
   E01Smxb6RaoULIsyYX+FrbP3ghcFPrKcXSgVwOOJZgQmph5+B6nBGuejQ
   HtUbxW/6EjYwledsuXLcd8FydmXOGVb4eOPiZjwsg6yKVv1UZcNdT1ZeV
   igbjAObhJxSPYolx+ZF2alqIrPkd64yI34dwTm+X17HNB86fA7DBtwhdr
   iVi2BrVZi3feDy/3cBJ7f9DKoI1WkkZhtgsFCExVeTziqpTxj3qSIKRJu
   g==;
X-CSE-ConnectionGUID: si2H5ZeNReW54K4n3KCmGw==
X-CSE-MsgGUID: 1Ta7zr6nSn2VA1f0nSpOJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12825308"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="12825308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:40:27 -0700
X-CSE-ConnectionGUID: Ird3ApKtR/uxV1ZUT/rXkA==
X-CSE-MsgGUID: q5p6NfDcRZqyKNKAe6tCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="60013966"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 02:40:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZSIJ-000vQK-0W;
	Thu, 01 Aug 2024 09:40:23 +0000
Date: Thu, 01 Aug 2024 17:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d483f034f03261c8c8450d106aa243837122b5f0
Message-ID: <202408011716.Vbmnrvpd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d483f034f03261c8c8450d106aa243837122b5f0  usb: dwc2: Skip clock gating on Broadcom SoCs

Unverified Warning (likely false positive, please contact us if interested):

arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-evm.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-sk.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-051-20240731
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clock-names:sleep-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp441.dtb:usb-8af8800:clocks:is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clock-names:sleep-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp442.dtb:usb-8af8800:clocks:is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clock-names:sleep-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp468.dtb:usb-8af8800:clocks:is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:core-iface-sleep-mock_utmi-is-too-long
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:mock_utmi-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clock-names:sleep-was-expected
    |-- arch-arm64-boot-dts-qcom-ipq5332-rdp474.dtb:usb-8af8800:clocks:is-too-long
    |-- arch-arm64-boot-dts-ti-k3-am642-evm-nand.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-evm.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t-pcie.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t-usb3.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-hummingboard-t.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-phyboard-electra-rdk.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-ti-k3-am642-sk.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-ti-k3-am642-tqma64xxl-mbax4xxl.dtb:cdns-usb-f900000:compatible:oneOf-conditional-failed-one-must-be-fixed:

elapsed time: 1451m

configs tested: 221
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240801   gcc-13.2.0
arm                   randconfig-002-20240801   gcc-13.2.0
arm                   randconfig-003-20240801   gcc-13.2.0
arm                   randconfig-004-20240801   gcc-13.2.0
arm                          sp7021_defconfig   clang-20
arm                          sp7021_defconfig   gcc-13.2.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240801   gcc-13.2.0
arm64                 randconfig-002-20240801   gcc-13.2.0
arm64                 randconfig-003-20240801   gcc-13.2.0
arm64                 randconfig-004-20240801   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240801   gcc-13.2.0
csky                  randconfig-002-20240801   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-002-20240801   gcc-9
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-003-20240801   gcc-9
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240801   gcc-9
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-005-20240801   gcc-9
i386         buildonly-randconfig-006-20240731   clang-18
i386         buildonly-randconfig-006-20240801   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240801   gcc-9
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-002-20240801   gcc-9
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-003-20240801   gcc-9
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-004-20240801   gcc-9
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240801   gcc-9
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-006-20240801   gcc-9
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240801   gcc-9
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240801   gcc-9
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-013-20240801   gcc-9
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240801   gcc-9
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240801   gcc-9
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240801   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240801   gcc-13.2.0
loongarch             randconfig-002-20240801   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm47xx_defconfig   clang-16
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   clang-16
mips                     loongson1c_defconfig   clang-20
mips                          malta_defconfig   clang-20
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240801   gcc-13.2.0
nios2                 randconfig-002-20240801   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240801   gcc-13.2.0
parisc                randconfig-002-20240801   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig   clang-16
powerpc                  mpc866_ads_defconfig   clang-16
powerpc                      pcm030_defconfig   clang-16
powerpc                      pcm030_defconfig   gcc-14.1.0
powerpc                         ps3_defconfig   clang-16
powerpc               randconfig-001-20240801   gcc-13.2.0
powerpc               randconfig-002-20240801   gcc-13.2.0
powerpc               randconfig-003-20240801   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   clang-16
powerpc                  storcenter_defconfig   clang-20
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8548_defconfig   clang-20
powerpc                         wii_defconfig   clang-16
powerpc64             randconfig-001-20240801   gcc-13.2.0
powerpc64             randconfig-002-20240801   gcc-13.2.0
powerpc64             randconfig-003-20240801   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-16
riscv                    nommu_virt_defconfig   clang-16
riscv                 randconfig-001-20240801   gcc-13.2.0
riscv                 randconfig-002-20240801   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240801   gcc-13.2.0
s390                  randconfig-002-20240801   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                    randconfig-001-20240801   gcc-13.2.0
sh                    randconfig-002-20240801   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-13.2.0
sparc64               randconfig-002-20240801   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240801   gcc-13.2.0
um                    randconfig-002-20240801   gcc-13.2.0
um                           x86_64_defconfig   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-004-20240801   clang-18
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240801   clang-18
x86_64                randconfig-002-20240801   clang-18
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-004-20240801   clang-18
x86_64                randconfig-005-20240801   clang-18
x86_64                randconfig-006-20240801   clang-18
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-012-20240801   clang-18
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-016-20240801   clang-18
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-075-20240801   clang-18
x86_64                randconfig-076-20240801   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240801   gcc-13.2.0
xtensa                randconfig-002-20240801   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

