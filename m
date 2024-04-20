Return-Path: <linux-usb+bounces-9505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CF8AB9EA
	for <lists+linux-usb@lfdr.de>; Sat, 20 Apr 2024 07:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49E71C20906
	for <lists+linux-usb@lfdr.de>; Sat, 20 Apr 2024 05:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5DEFBEF;
	Sat, 20 Apr 2024 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kc3csXPD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC92563
	for <linux-usb@vger.kernel.org>; Sat, 20 Apr 2024 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713592290; cv=none; b=mlIgsZ4lFPn0ANwtel8RzA+TikvgX9vje3RJwgDiuw0yhlvFxYarxRgSYeCMGIhok9fm2NjJctbKXf/d/aQF5wJf8eSTEI3dZUy+z/E1IZzbNhL4Kh1WsJCcU4evCdhbmm/KtMMx7TEY0SZxp+2vY7BtkNq2rf8BoQFD+j8gnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713592290; c=relaxed/simple;
	bh=cLeVLvwBA74q4fDk7fAQ4JK2hwYk96xndb2tfwPH14g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMd/S9MtODCU/hFb8uAEeAEB5EPN3eHioGwJrdAjuyP22RiOOlbgRfCxqcq4nDJaCLdOnxaCaebku3XnIZRrG/FYM9/o6FtMvRTg12CGjY43JzYC/V4nP1u3Dl2TqFBieOG+Avj16ug9NQTVhilfL1majMR6mpoNHx2TLlbO0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kc3csXPD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713592288; x=1745128288;
  h=date:from:to:cc:subject:message-id;
  bh=cLeVLvwBA74q4fDk7fAQ4JK2hwYk96xndb2tfwPH14g=;
  b=kc3csXPD0cXzvC/HreCvHw1uxqLNDiRGDHa2XihWamT/Jxzx8cee2EI6
   ahCKnaFynFsTs7/PQ8QnlBv9jOIFCTHMlLlWDTIt1wf+sT01dCw6LsCjF
   Zo4Fak03lXrljmofZJGPy0f+ou8xHUMYcugwDz0270448rtbp80D7XiJj
   D7Z3bwALcqiw9jBxJM4qnUP5GefGyrTt9eFp1/vudLOEiR99uIHk49w+y
   xKqj8rVF8M8FvqQ2Xw143pdku1iRKRSqUS6Q+hSUU3FADphsu3711X6ss
   WZVv8w3vx+55mFCn5tJXlTq5Ufhh3NRCvVlrZ2SkLXKusz+8L3LQySINY
   g==;
X-CSE-ConnectionGUID: 1QYOjKh5RIqIFmzHX1q7XQ==
X-CSE-MsgGUID: qfi2V6dNQSqdGkkshI44MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9425834"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9425834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 22:51:28 -0700
X-CSE-ConnectionGUID: PnX573rfQGSAmdbDgXl0RA==
X-CSE-MsgGUID: 6zMH5Q76Ti2d0s+4IovSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="28188083"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Apr 2024 22:51:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry3dE-000AlY-19;
	Sat, 20 Apr 2024 05:51:24 +0000
Date: Sat, 20 Apr 2024 13:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7a9a304069810c0c5296b851f228f8966d3a030e
Message-ID: <202404201314.TvdANAU6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7a9a304069810c0c5296b851f228f8966d3a030e  Merge tag 'usb-serial-6.9-rc5' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-randconfig-002-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-randconfig-001-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-randconfig-001-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- mips-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- openrisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-randconfig-001-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc64-randconfig-002-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-randconfig-002-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- um-allyesconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-randconfig-003-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- hexagon-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- hexagon-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-randconfig-002-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-randconfig-003-20240420
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- s390-allmodconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1

elapsed time: 934m

configs tested: 121
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
arc                   randconfig-001-20240420   gcc  
arc                   randconfig-002-20240420   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240420   gcc  
arm                   randconfig-002-20240420   gcc  
arm                   randconfig-003-20240420   clang
arm                   randconfig-004-20240420   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240420   clang
arm64                 randconfig-002-20240420   clang
arm64                 randconfig-003-20240420   gcc  
arm64                 randconfig-004-20240420   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240420   gcc  
csky                  randconfig-002-20240420   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240420   clang
hexagon               randconfig-002-20240420   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240420   gcc  
loongarch             randconfig-002-20240420   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240420   gcc  
nios2                 randconfig-002-20240420   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240420   gcc  
parisc                randconfig-002-20240420   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240420   gcc  
powerpc               randconfig-002-20240420   clang
powerpc               randconfig-003-20240420   clang
powerpc64             randconfig-001-20240420   clang
powerpc64             randconfig-002-20240420   gcc  
powerpc64             randconfig-003-20240420   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240420   clang
riscv                 randconfig-002-20240420   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240420   clang
s390                  randconfig-002-20240420   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240420   gcc  
sh                    randconfig-002-20240420   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240420   gcc  
sparc64               randconfig-002-20240420   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240420   clang
um                    randconfig-002-20240420   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240420   gcc  
xtensa                randconfig-002-20240420   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

