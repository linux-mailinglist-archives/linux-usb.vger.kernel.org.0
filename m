Return-Path: <linux-usb+bounces-14797-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B096F874
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 17:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5433A2869E5
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2FA1D2F67;
	Fri,  6 Sep 2024 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho1tVtX5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A81D1F60
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725637115; cv=none; b=AjlTFfF9vQ/RhbwS/PLbMoHE2o8O/37GsCFl1uxzpH6FCUi+fNORpa6WQAs03kkzPJBsvvlA1LPUbD06ufqkojNmdAcwGU5TWGGSggHs5SWc6Ewc/n7WAJi2dXonaWEo2bbTeYEUM0qD+u+DXgBA/vv+AbyLFrQIAKW5l6kx/Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725637115; c=relaxed/simple;
	bh=JaBVqsVU8WX6V6UVJg/HWc0gC7APve2Bgl7CXoiu8Zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nxW3g+tIlDfENagEiY18O8yYYQeGYhXRd4FDz/j8C6k4Mf6b+G2BJBsvp9yNn5lYdo0JmYqqjQ7DxKWcnoShNpn0sGjU0HHxpeZ4XlPnZCtaM7I/5EASYC0c9RdYvrCueVvoS4+yWK5Y/Y72KPP9l+X8P8/kwQ5/dsbql4ImWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ho1tVtX5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725637113; x=1757173113;
  h=date:from:to:cc:subject:message-id;
  bh=JaBVqsVU8WX6V6UVJg/HWc0gC7APve2Bgl7CXoiu8Zc=;
  b=ho1tVtX5T3dxZOMRwkxHMMPwMBS6cJXxCw182dLJcfb9FVOQbkSj3L9K
   +xPznqRNGBW6wGtuTMXkrfxNwW8mboZQpokdn1TbVEHpcwEIb4ZNjpN+N
   waNKvNoOkc1VOnxNKwDe2l9jNu6PNP1YX3UOBMsnaOgAe9sF6tXdQQck5
   UMra2D3my9QkugpOExAoAX1UR/jVeTbrgoFdPv9zmtKxjPTA5c3nvm1rS
   DA6Wqb53+3ajCQiQU/hADbGnnvmQCCXS8RtU5STUbL0qEXOE0NaZTchQE
   H8lW+kSoFcsaMM5ZY7nxqAJJiUqqH+XbhDyqRBF0JvDdLAyTrrBrxlrOf
   g==;
X-CSE-ConnectionGUID: mefngSsiSMSwRdQSS8cHZA==
X-CSE-MsgGUID: jsB3kKtkSYO5bwgmaMvPPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13412717"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="13412717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 08:38:30 -0700
X-CSE-ConnectionGUID: wCZFuE5FRieQcY0R4YEQwA==
X-CSE-MsgGUID: mkBEgCYkQWKXhdx+OvmxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65959564"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2024 08:38:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smb2Y-000BR6-34;
	Fri, 06 Sep 2024 15:38:26 +0000
Date: Fri, 06 Sep 2024 23:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09
Message-ID: <202409062311.dPZJfUk0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09  xhci: support setting interrupt moderation IMOD for secondary interrupters

Unverified Warning (likely false positive, please contact us if interested):

arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property

Warning ids grouped by kconfigs:

recent_errors
`-- arm64-randconfig-052-20240905
    |-- arch-arm64-boot-dts-freescale-imx8dxl-evk.dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8dxp-tqma8xdp-mba8xx.dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-eval-v1..dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-eval.dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-ixora-v1..dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-v1.-eval-v1..dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-v1.-eval.dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8qm-apalis-v1.-ixora-v1..dtb:usbphy-5b100000:nxp-sim-is-a-required-property
    `-- arch-arm64-boot-dts-freescale-imx8qxp-tqma8xqp-mba8xx.dtb:usbphy-5b100000:nxp-sim-is-a-required-property

elapsed time: 1465m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                         s5pv210_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1c_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
powerpc                           allnoconfig   clang-20
powerpc                      arches_defconfig   clang-20
powerpc                   bluestone_defconfig   clang-20
powerpc                 linkstation_defconfig   clang-20
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      tqm8xx_defconfig   clang-20
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          landisk_defconfig   clang-20
sh                          sdk7780_defconfig   clang-20
sh                             sh03_defconfig   clang-20
sh                     sh7710voipgw_defconfig   clang-20
sh                            titan_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240906   clang-18
x86_64       buildonly-randconfig-002-20240906   clang-18
x86_64       buildonly-randconfig-003-20240906   clang-18
x86_64       buildonly-randconfig-004-20240906   clang-18
x86_64       buildonly-randconfig-005-20240906   clang-18
x86_64       buildonly-randconfig-006-20240906   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240906   clang-18
x86_64                randconfig-002-20240906   clang-18
x86_64                randconfig-003-20240906   clang-18
x86_64                randconfig-004-20240906   clang-18
x86_64                randconfig-005-20240906   clang-18
x86_64                randconfig-006-20240906   clang-18
x86_64                randconfig-011-20240906   clang-18
x86_64                randconfig-012-20240906   clang-18
x86_64                randconfig-013-20240906   clang-18
x86_64                randconfig-014-20240906   clang-18
x86_64                randconfig-015-20240906   clang-18
x86_64                randconfig-016-20240906   clang-18
x86_64                randconfig-071-20240906   clang-18
x86_64                randconfig-072-20240906   clang-18
x86_64                randconfig-073-20240906   clang-18
x86_64                randconfig-074-20240906   clang-18
x86_64                randconfig-075-20240906   clang-18
x86_64                randconfig-076-20240906   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

