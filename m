Return-Path: <linux-usb+bounces-11595-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45255915390
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 18:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C444328622F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 16:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1452A19FA79;
	Mon, 24 Jun 2024 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrIRuOo/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523219D8A8
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246198; cv=none; b=Jv7/yplhz2jz8ooIpmBggsG6oT6s4u84422L8VstLWiKcEC6iHvjtMwoBlxSwwUIS1kRge2b/1X7oTpR17zRP9HUTAt1I/SDt8ZzLk1kGznD3AjhbPlgtJ30YnLsi5wK88Df03OVPAb3bGmleawMsKlky2XTrWQPEwnXAYjsN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246198; c=relaxed/simple;
	bh=hlQJ0CAErf+1laomT//C4i+GHQ3Zz1nhxE3++61CZBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/l4ueTUOBFESno6VkFKHDO5AoUwZEQmo0ESGlRcXRAnOEbTX2YHNaWDj4B25Gn8GwOVNY4HHuf3+Oju3WrqkugqDDTU1FQuWQjpHNKOCJiA2QN5vOVLRlaFLzuxm2JRngwxBxg/gDIgC7rv/e1vlL4xAUIOehAnL5UPOIhPHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrIRuOo/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719246196; x=1750782196;
  h=date:from:to:cc:subject:message-id;
  bh=hlQJ0CAErf+1laomT//C4i+GHQ3Zz1nhxE3++61CZBo=;
  b=WrIRuOo/RdBu2RoT0BShEChjCjJQa+4gQuymo/QmUGbz/KZTr4cMK6qO
   z0wXaCC2xh2C90IDbuR6JrzrJKI4q6jp0fcko8pyFgjYPXPuD9HtgOxhn
   PuFXtdvop372j4qd3yQz9N7UPXD7KgX+lzCIJFN8wmIP1Mlv6uYdw51g/
   ZATwlZSw3LrsYeEbcCYmTEXekOboyOX/OKYEPzy/TilrkJfeSMQRcM6oY
   NIkWY8no+guHh+uuxwyj9bP0E7xiIzfIIJOW9VJB5enTQCmJ3HsLwyhcZ
   bRWI1Yxt8Ujn/V/zHhth6gxvOSkaW9C+kGnCx7YKFhRNMcopreX2M29Yy
   A==;
X-CSE-ConnectionGUID: h67rtK2ETBWuE6zKRfbsgQ==
X-CSE-MsgGUID: JVVaIiBuRmibPpaPzXPTIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16191783"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="16191783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 09:23:16 -0700
X-CSE-ConnectionGUID: m18MzlvkQICW4Nwv21HanQ==
X-CSE-MsgGUID: 1ZwpluOfTQaMv/qJJVyVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47884055"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2024 09:23:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLmTI-000DVs-2j;
	Mon, 24 Jun 2024 16:23:12 +0000
Date: Tue, 25 Jun 2024 00:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 819984a0dd3606b7c46fe156cd56a0dc0d604788
Message-ID: <202406250024.i8XBhszX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 819984a0dd3606b7c46fe156cd56a0dc0d604788  kselftest: devices: Add of-fullname-regex property

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406230117.PmWeGRVI-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:1: 'hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:1: 'hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm64-randconfig-051-20240622
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

elapsed time: 5650m

configs tested: 120
configs skipped: 1

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240621   gcc-13.2.0
arc                   randconfig-001-20240624   gcc-13.2.0
arc                   randconfig-002-20240621   gcc-13.2.0
arc                   randconfig-002-20240624   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                   randconfig-001-20240621   gcc-13.2.0
arm                   randconfig-001-20240624   clang-17
arm                   randconfig-002-20240621   gcc-13.2.0
arm                   randconfig-002-20240624   gcc-13.2.0
arm                   randconfig-003-20240621   clang-19
arm                   randconfig-003-20240624   gcc-13.2.0
arm                   randconfig-004-20240621   gcc-13.2.0
arm                           tegra_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240621   clang-15
arm64                 randconfig-002-20240621   clang-19
arm64                 randconfig-003-20240621   gcc-13.2.0
arm64                 randconfig-004-20240621   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240621   gcc-13.2.0
csky                  randconfig-002-20240621   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240621   clang-17
hexagon               randconfig-002-20240621   clang-16
i386         buildonly-randconfig-001-20240624   gcc-8
i386         buildonly-randconfig-002-20240624   gcc-13
i386         buildonly-randconfig-003-20240624   clang-18
i386         buildonly-randconfig-004-20240624   gcc-10
i386         buildonly-randconfig-005-20240624   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240621   gcc-13.2.0
loongarch             randconfig-002-20240621   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240621   gcc-13.2.0
nios2                 randconfig-002-20240621   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240621   gcc-13.2.0
parisc                randconfig-002-20240621   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   clang-17
powerpc                      pmac32_defconfig   clang-19
powerpc               randconfig-001-20240621   clang-15
powerpc               randconfig-002-20240621   clang-19
powerpc               randconfig-003-20240621   clang-19
powerpc64             randconfig-001-20240621   clang-19
powerpc64             randconfig-002-20240621   clang-19
powerpc64             randconfig-003-20240621   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240621   gcc-13.2.0
riscv                 randconfig-002-20240621   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240621   gcc-13.2.0
s390                  randconfig-002-20240621   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                    randconfig-001-20240621   gcc-13.2.0
sh                    randconfig-002-20240621   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240621   gcc-13.2.0
sparc64               randconfig-002-20240621   gcc-13.2.0
um                                allnoconfig   clang-17
um                    randconfig-001-20240621   gcc-13
um                    randconfig-002-20240621   gcc-9
x86_64       buildonly-randconfig-001-20240621   clang-18
x86_64       buildonly-randconfig-001-20240624   gcc-13
x86_64       buildonly-randconfig-002-20240621   gcc-11
x86_64       buildonly-randconfig-002-20240624   gcc-13
x86_64       buildonly-randconfig-003-20240621   gcc-11
x86_64       buildonly-randconfig-003-20240624   clang-18
x86_64       buildonly-randconfig-004-20240621   clang-18
x86_64       buildonly-randconfig-004-20240624   clang-18
x86_64       buildonly-randconfig-005-20240621   gcc-11
x86_64       buildonly-randconfig-005-20240624   clang-18
x86_64       buildonly-randconfig-006-20240621   clang-18
x86_64       buildonly-randconfig-006-20240624   clang-18
x86_64                randconfig-001-20240621   gcc-12
x86_64                randconfig-002-20240621   gcc-13
x86_64                randconfig-003-20240621   clang-18
x86_64                randconfig-004-20240621   gcc-13
x86_64                randconfig-005-20240621   gcc-13
x86_64                randconfig-006-20240621   clang-18
x86_64                randconfig-011-20240621   clang-18
x86_64                randconfig-012-20240621   gcc-13
x86_64                randconfig-013-20240621   clang-18
x86_64                randconfig-014-20240621   gcc-13
x86_64                randconfig-015-20240621   gcc-11
x86_64                randconfig-016-20240621   clang-18
x86_64                randconfig-071-20240621   gcc-13
x86_64                randconfig-072-20240621   gcc-13
x86_64                randconfig-073-20240621   clang-18
x86_64                randconfig-074-20240621   clang-18
x86_64                randconfig-075-20240621   clang-18
x86_64                randconfig-076-20240621   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240621   gcc-13.2.0
xtensa                randconfig-002-20240621   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

