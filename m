Return-Path: <linux-usb+bounces-7602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 436218738DC
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 15:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED62286660
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 14:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809E9132C23;
	Wed,  6 Mar 2024 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJmmJzTj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14F132468
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709734947; cv=none; b=ZCazFlTpEl0YanmkXNhNUlWOn9LNOWGAZz/wh33nSWw3wEX5KLT2lCEjoi1YHGd2UxgHcgvVCKUPlYf4xHj743knlijB2GDPBs8OVxqW3+J0tii78agYuKeNjo74uL7+fjray96AkDZMkJHiW2agrdpVNv+5tSM13ZrjL0XuNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709734947; c=relaxed/simple;
	bh=Y4KQY5KepDHjbDHqaL6+ClRo2BWZS1nSMlVn2VI50J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTzFgnlpM/yQKd6mnBSnl6B+xcQQ5l47zckY5/8LAT/xosg+IX6e11A3Iy1lhrbqqcK7xYKv5rBR9amkPWdsnR6hBEddlRYQW//gVSSFvM0Ee0exYtUUZEGwOCRL/kiQC2iGbt09SKA1IHTf2rV5L7MpI5ikaubotOTEL2ZSyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJmmJzTj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709734946; x=1741270946;
  h=date:from:to:cc:subject:message-id;
  bh=Y4KQY5KepDHjbDHqaL6+ClRo2BWZS1nSMlVn2VI50J0=;
  b=OJmmJzTjsjRw74UF1phfEspkF1rcCIFIt+TkT55MJiV+UVs/yAQbPxXI
   aC0+L5VAZExTBnl9ixqx8xP51uRMazr8PJHLW8QLszSz9KA/32Rof5jqR
   f1GKF1fqRhtbHffZRpgwTb1gdl/IFfUYzldLPyS5tCsfnAtdVpYZOF+zC
   liikgq3q7BrhZdggiu7JqWZ8x5Okmod3oSwnsCMQwzY5I36sPF21EHl2X
   09i4YXLU4iYH9ZJlkD2OwMne1SzH21S8OZZr3YoPocGp5iQCrwF3XK1vx
   7V94cLlL6QSACwEalFE4jveZsYnoVGBa/OeTriFnmx7Cklox74Hm8eCPF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15066397"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="15066397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 06:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9920491"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2024 06:22:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhsA2-0004ID-08;
	Wed, 06 Mar 2024 14:22:22 +0000
Date: Wed, 06 Mar 2024 22:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 b234c70fefa7532d34ebee104de64cc16f1b21e4
Message-ID: <202403062230.fbDg5VTA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: b234c70fefa7532d34ebee104de64cc16f1b21e4  xhci: Fix failure to detect ring expansion need.

elapsed time: 1443m

configs tested: 156
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240306   gcc  
arc                   randconfig-002-20240306   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240306   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240306   gcc  
arm64                 randconfig-003-20240306   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240306   gcc  
csky                  randconfig-002-20240306   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240306   clang
i386         buildonly-randconfig-002-20240306   clang
i386         buildonly-randconfig-004-20240306   clang
i386         buildonly-randconfig-005-20240306   clang
i386                                defconfig   clang
i386                  randconfig-002-20240306   clang
i386                  randconfig-003-20240306   clang
i386                  randconfig-004-20240306   clang
i386                  randconfig-006-20240306   clang
i386                  randconfig-011-20240306   clang
i386                  randconfig-012-20240306   clang
i386                  randconfig-015-20240306   clang
i386                  randconfig-016-20240306   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240306   gcc  
loongarch             randconfig-002-20240306   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240306   gcc  
nios2                 randconfig-002-20240306   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240306   gcc  
parisc                randconfig-002-20240306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240306   gcc  
powerpc               randconfig-002-20240306   gcc  
powerpc64             randconfig-001-20240306   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240306   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240306   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240306   gcc  
sh                    randconfig-002-20240306   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240306   gcc  
sparc64               randconfig-002-20240306   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240306   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240306   clang
x86_64       buildonly-randconfig-002-20240306   clang
x86_64       buildonly-randconfig-003-20240306   clang
x86_64       buildonly-randconfig-004-20240306   clang
x86_64       buildonly-randconfig-006-20240306   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240306   clang
x86_64                randconfig-002-20240306   clang
x86_64                randconfig-005-20240306   clang
x86_64                randconfig-006-20240306   clang
x86_64                randconfig-011-20240306   clang
x86_64                randconfig-012-20240306   clang
x86_64                randconfig-013-20240306   clang
x86_64                randconfig-015-20240306   clang
x86_64                randconfig-071-20240306   clang
x86_64                randconfig-072-20240306   clang
x86_64                randconfig-073-20240306   clang
x86_64                randconfig-074-20240306   clang
x86_64                randconfig-075-20240306   clang
x86_64                randconfig-076-20240306   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240306   gcc  
xtensa                randconfig-002-20240306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

