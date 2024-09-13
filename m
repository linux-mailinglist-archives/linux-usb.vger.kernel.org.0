Return-Path: <linux-usb+bounces-15100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796B9786AF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 19:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB802281960
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 17:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C2C823A9;
	Fri, 13 Sep 2024 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBu+JluC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7084A46
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726248371; cv=none; b=YqoFoRuDJH9aOv3E04iH+kjI5BwetngUYq1H/LmYaHNSvpSuHZH1ggdotm3b/Be5fv/bAFiUsJXh7wSP7tz0Vwes+F1EN6kvcJv5S2usgOzHUDPBPzsihWiopqifIU/JheTczDTmPfIEWcq/HmkvbP6ooaDYVmHReUlOTqcTHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726248371; c=relaxed/simple;
	bh=SGvTd7hwK/SDh9DwAr/eHxxVBWXAoeOVI6Cngwj4fFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KJWsYYIruPhR/ya3MLzLWif0N6KdoVESF4Ql1BIrKFHCKcuOzhFyT+Yl2mW/38uP0S53mKQxMvw+R/k+DMMkBuG9u9UgISDXWSQLnkOVPzrhvHKfNeQxN8wFnlHNHuD1V8wAzSW3enedXEbdhqEkQlsebrTp+CmBhNcpc2+xO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBu+JluC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726248370; x=1757784370;
  h=date:from:to:cc:subject:message-id;
  bh=SGvTd7hwK/SDh9DwAr/eHxxVBWXAoeOVI6Cngwj4fFc=;
  b=mBu+JluCTt7cHvx8T2zcfA4jP+jKYbbsXEk3TYHjMl1oPJqILFBDCa6q
   uHUpwFiyddkK4XSt1R2MPxo2TgEl6xge0ulNSr1l0RfNx7PtNqF/sA5aw
   3cFOk2ZFpERZI1Ok5hBjh4JMZll/042o3UE1MxY19JaUJQVwJoyq1R11r
   YzMog9XS+7UJd4f34M2BHWhD2y1kiy+Np7OxrfyxyLFnrDUoO0eLGGAhY
   IuE9gMN+TQvRAxPuCgQFMFs/rsqa1mRk8FM7OMKZr/Q07cgCcPFlbO6EM
   +lJYPbrGwDxl5Q53YdEiLfHUPaxxgB6CZ/Jbha5RDE4fd+tmyC5VlfCc+
   A==;
X-CSE-ConnectionGUID: deBL5KO3Qa6L8e+31f+wuw==
X-CSE-MsgGUID: HIEVRIhvTiaiURaTsCvO9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24982454"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24982454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 10:26:09 -0700
X-CSE-ConnectionGUID: o1jRImLrRmuGPqKVzNCXdQ==
X-CSE-MsgGUID: IkNmgPZ5QjOwWxqo+Pkyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68235196"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Sep 2024 10:26:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spA3a-0006k0-19;
	Fri, 13 Sep 2024 17:26:06 +0000
Date: Sat, 14 Sep 2024 01:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 2193ede180dde21b7f866cc457eb9e13341e663b
Message-ID: <202409140148.3dtG9EIH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 2193ede180dde21b7f866cc457eb9e13341e663b  net/9p/usbg: fix CONFIG_USB_GADGET dependency

elapsed time: 1660m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240913    clang-18
i386        buildonly-randconfig-002-20240913    clang-18
i386        buildonly-randconfig-003-20240913    clang-18
i386        buildonly-randconfig-004-20240913    clang-18
i386        buildonly-randconfig-005-20240913    clang-18
i386        buildonly-randconfig-006-20240913    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240913    clang-18
i386                  randconfig-002-20240913    clang-18
i386                  randconfig-003-20240913    clang-18
i386                  randconfig-004-20240913    clang-18
i386                  randconfig-005-20240913    clang-18
i386                  randconfig-006-20240913    clang-18
i386                  randconfig-011-20240913    clang-18
i386                  randconfig-012-20240913    clang-18
i386                  randconfig-013-20240913    clang-18
i386                  randconfig-014-20240913    clang-18
i386                  randconfig-015-20240913    clang-18
i386                  randconfig-016-20240913    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                          rhel-8.3-rust    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

