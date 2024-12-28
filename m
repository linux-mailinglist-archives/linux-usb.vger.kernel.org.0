Return-Path: <linux-usb+bounces-18845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE79FD868
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 01:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8A4F7A2178
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 00:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FB9E552;
	Sat, 28 Dec 2024 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV5qQDPy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FDD5223
	for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 00:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735346890; cv=none; b=bCjYGYqXP+v31FkSAEBFcmfpK4RdwEcXEFguNTzVj8LQDk1ooUKyvjT4NBOTVGhXkI1iJSDZX3iigCC9pqmqAJj38o7vZsGcLgyvSWl1A7OB+DqnhGPRw2jR0ySBzMRKiV1QTORc+LclK8XmNlbtPVyWCPd6NLnIDAjEtrFo9R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735346890; c=relaxed/simple;
	bh=0ATBqyIQItNvxiShROeYJSAMrJ1xvseJhag1wlIdH2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BwCFm2ih+tAVG0L7CcgtHN7Ub+mHCZ3vELs5j92j1UmPZOEmN3VX3SBJerkwF4ScT7E9VfN2fOCOhDjcpp8gIEfS/Fz1W3ggp3JRlTQs9aYCyKW2YTwGwV5Myhe3OxGMmxrvUzB2Ho3z9trOBsUGsWMPrM5Avu0m088zv5oP8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV5qQDPy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735346888; x=1766882888;
  h=date:from:to:cc:subject:message-id;
  bh=0ATBqyIQItNvxiShROeYJSAMrJ1xvseJhag1wlIdH2w=;
  b=jV5qQDPyQyXIOCfILLzJkn47Qy/KWpp8ccpDQ668pnif1hue7ZoNPfSM
   PvkHAG8D19/zfp0PSa9ECvwTFsfKqZdy57XEN7yJrzhgpemI/IBCXaWZB
   D14cXKTjbgwo3HGMg19ll5FEEZA3kvan+9Tk1Kx4Diid2GO6/4abShzxE
   seEEbHhK6MeNwsrQLX/nMSX0goaRJV4Q5ceWnn9RWsm62AoYiPqt8l1ET
   dsNbbc6nmpJ3mhbCv75xnJszQoIrhTK1WUFhdHgKQC81rnsEfJVIDx5YI
   H0CLAqlEfoG87gn2FUEMgwxUXiEhKj3sslALQEW8JG8gBJYqOhxUuxPmv
   w==;
X-CSE-ConnectionGUID: GIkQjFDhRA2UlcIqPpmqDQ==
X-CSE-MsgGUID: VLDkklAWTFKOo4FaMnvCJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53268844"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="53268844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 16:48:07 -0800
X-CSE-ConnectionGUID: 7ZLqs7MMSziQd9GL9NhMqA==
X-CSE-MsgGUID: VUnVAeTMTSyfTJNe1dH4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105276613"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 16:48:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRKzs-0003lc-1Q;
	Sat, 28 Dec 2024 00:48:04 +0000
Date: Sat, 28 Dec 2024 08:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 f097a36ef88d693edcf4962ff594e3012c6e0277
Message-ID: <202412280814.pQQvlQR9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: f097a36ef88d693edcf4962ff594e3012c6e0277  dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings

elapsed time: 723m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241227    gcc-13.2.0
arc                   randconfig-002-20241227    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20241227    gcc-14.2.0
arm                   randconfig-002-20241227    gcc-14.2.0
arm                   randconfig-003-20241227    clang-18
arm                   randconfig-004-20241227    clang-16
arm                          sp7021_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241227    clang-16
arm64                 randconfig-002-20241227    clang-18
arm64                 randconfig-003-20241227    gcc-14.2.0
arm64                 randconfig-004-20241227    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241227    gcc-14.2.0
csky                  randconfig-002-20241227    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241227    clang-19
hexagon               randconfig-002-20241227    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241227    gcc-12
i386        buildonly-randconfig-002-20241227    gcc-12
i386        buildonly-randconfig-003-20241227    gcc-11
i386        buildonly-randconfig-004-20241227    gcc-12
i386        buildonly-randconfig-005-20241227    gcc-12
i386        buildonly-randconfig-006-20241227    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241227    gcc-14.2.0
loongarch             randconfig-002-20241227    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241227    gcc-14.2.0
nios2                 randconfig-002-20241227    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241227    gcc-14.2.0
parisc                randconfig-002-20241227    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      bamboo_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               randconfig-001-20241227    gcc-14.2.0
powerpc               randconfig-002-20241227    gcc-14.2.0
powerpc               randconfig-003-20241227    clang-20
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241227    gcc-14.2.0
powerpc64             randconfig-002-20241227    gcc-14.2.0
powerpc64             randconfig-003-20241227    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241227    gcc-14.2.0
riscv                 randconfig-002-20241227    clang-18
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241227    gcc-14.2.0
s390                  randconfig-002-20241227    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241227    gcc-14.2.0
sh                    randconfig-002-20241227    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241227    gcc-14.2.0
sparc                 randconfig-002-20241227    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241227    gcc-14.2.0
sparc64               randconfig-002-20241227    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241227    clang-16
um                    randconfig-002-20241227    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241227    gcc-12
x86_64      buildonly-randconfig-002-20241227    clang-19
x86_64      buildonly-randconfig-003-20241227    gcc-12
x86_64      buildonly-randconfig-004-20241227    clang-19
x86_64      buildonly-randconfig-005-20241227    gcc-12
x86_64      buildonly-randconfig-006-20241227    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241227    gcc-14.2.0
xtensa                randconfig-002-20241227    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

