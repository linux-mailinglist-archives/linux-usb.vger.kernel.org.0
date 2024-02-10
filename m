Return-Path: <linux-usb+bounces-6195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B766850405
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 11:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13A441C220AD
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504E7364C1;
	Sat, 10 Feb 2024 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLpMNJTu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11B4360BC
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707562159; cv=none; b=LQj314TJ7rIORX/luyC4L3Gpoq8ZpSP7upFghlguCv5tKyx/iXjVwmrYv0x65duhxYAhWEgy3VuLGCHTB75HNcdIGUasRkIi6qvLSUVBsL+RRiCyYOMeleAC9dOWZIlFCpBbZLPemJEhpfzAfgF3or/izrV0SYfEsgZXcmtZy78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707562159; c=relaxed/simple;
	bh=hDSmxRqnCFBW6B1X69X0NhvhNRjRoiEbYLVoY9DLqKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fE6wlT7oXphGo8ace6EAjQ62htVY/qmR3ufBKEknYOZ+ACyutpBEMJ2khJ5JEpW8Yyxy/QjdPT59y1r0YCeFaDwWWnXV+4NFPw3KBf6H/deDzHqTjTryHTFzQp9jIDXmOzzqv9hG8bMF+eEQX4UI4V5J8Fh1WjfjdqkQEWFVe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLpMNJTu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707562158; x=1739098158;
  h=date:from:to:cc:subject:message-id;
  bh=hDSmxRqnCFBW6B1X69X0NhvhNRjRoiEbYLVoY9DLqKw=;
  b=nLpMNJTulWYTX3hJCXL67F6vwfloj6Y22g7OBbBhPh1zdbYUut9EnqPt
   9xLFD/kM56GlkEJ5DkUv7UuJutLqSTxLvozsmHbe0qiQR7dA0EQjTshgu
   TKbrxMq3REzWkqmRKLNz7mkEYqxhyQ6JscDeDL42J+2RlHu10mtnmSxsp
   Na0rG9/mYMjZZPkyBQ1LAXb9SiSrbxdOXXBempFERz277wzMN6LnBPvx0
   +0556RBJUNMMtGjbqilHVwCe0X5sJ5ADGl7GzRG0PuJmUZsiMCQpXVAeY
   nJcTNlrjN7PcRDhybZ8qchNikPnzYVFNRTgr+TlMcUugcJyMSur+F6Rp/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12199843"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12199843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 02:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934647947"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="934647947"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2024 02:49:16 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYkv4-0005aN-01;
	Sat, 10 Feb 2024 10:49:14 +0000
Date: Sat, 10 Feb 2024 18:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 7d708c145b2631941b8b0b4a740dc2990818c39c
Message-ID: <202402101844.D32EwsQv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 7d708c145b2631941b8b0b4a740dc2990818c39c  Revert "usb: dwc3: Support EBC feature of DWC_usb31"

elapsed time: 1450m

configs tested: 227
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240210   gcc  
arc                   randconfig-002-20240210   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                      jornada720_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                             mxs_defconfig   clang
arm                   randconfig-001-20240210   gcc  
arm                   randconfig-002-20240210   gcc  
arm                   randconfig-003-20240210   gcc  
arm                   randconfig-004-20240210   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240210   gcc  
arm64                 randconfig-003-20240210   gcc  
arm64                 randconfig-004-20240210   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240210   gcc  
csky                  randconfig-002-20240210   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240209   clang
i386         buildonly-randconfig-001-20240210   clang
i386         buildonly-randconfig-002-20240209   clang
i386         buildonly-randconfig-002-20240210   gcc  
i386         buildonly-randconfig-003-20240209   gcc  
i386         buildonly-randconfig-003-20240210   clang
i386         buildonly-randconfig-004-20240209   clang
i386         buildonly-randconfig-004-20240210   clang
i386         buildonly-randconfig-005-20240209   clang
i386         buildonly-randconfig-005-20240210   clang
i386         buildonly-randconfig-006-20240209   gcc  
i386         buildonly-randconfig-006-20240210   clang
i386                                defconfig   clang
i386                  randconfig-001-20240209   clang
i386                  randconfig-001-20240210   gcc  
i386                  randconfig-002-20240209   gcc  
i386                  randconfig-002-20240210   gcc  
i386                  randconfig-003-20240209   clang
i386                  randconfig-003-20240210   clang
i386                  randconfig-004-20240209   clang
i386                  randconfig-004-20240210   clang
i386                  randconfig-005-20240209   clang
i386                  randconfig-005-20240210   gcc  
i386                  randconfig-006-20240209   gcc  
i386                  randconfig-006-20240210   gcc  
i386                  randconfig-011-20240209   gcc  
i386                  randconfig-011-20240210   clang
i386                  randconfig-012-20240209   gcc  
i386                  randconfig-012-20240210   clang
i386                  randconfig-013-20240209   clang
i386                  randconfig-013-20240210   clang
i386                  randconfig-014-20240209   gcc  
i386                  randconfig-014-20240210   gcc  
i386                  randconfig-015-20240209   gcc  
i386                  randconfig-015-20240210   gcc  
i386                  randconfig-016-20240209   gcc  
i386                  randconfig-016-20240210   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240210   gcc  
loongarch             randconfig-002-20240210   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240210   gcc  
nios2                 randconfig-002-20240210   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240210   gcc  
parisc                randconfig-002-20240210   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240210   gcc  
powerpc               randconfig-003-20240210   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240210   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240210   gcc  
s390                  randconfig-002-20240210   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240210   gcc  
sh                    randconfig-002-20240210   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240210   gcc  
sparc64               randconfig-002-20240210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240210   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240209   gcc  
x86_64       buildonly-randconfig-001-20240210   gcc  
x86_64       buildonly-randconfig-002-20240209   gcc  
x86_64       buildonly-randconfig-002-20240210   gcc  
x86_64       buildonly-randconfig-003-20240209   clang
x86_64       buildonly-randconfig-003-20240210   gcc  
x86_64       buildonly-randconfig-004-20240209   gcc  
x86_64       buildonly-randconfig-004-20240210   clang
x86_64       buildonly-randconfig-005-20240209   clang
x86_64       buildonly-randconfig-005-20240210   clang
x86_64       buildonly-randconfig-006-20240209   gcc  
x86_64       buildonly-randconfig-006-20240210   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240209   clang
x86_64                randconfig-001-20240210   clang
x86_64                randconfig-002-20240209   gcc  
x86_64                randconfig-002-20240210   clang
x86_64                randconfig-003-20240209   gcc  
x86_64                randconfig-003-20240210   gcc  
x86_64                randconfig-004-20240209   clang
x86_64                randconfig-004-20240210   clang
x86_64                randconfig-005-20240209   gcc  
x86_64                randconfig-005-20240210   clang
x86_64                randconfig-006-20240209   gcc  
x86_64                randconfig-006-20240210   gcc  
x86_64                randconfig-011-20240209   clang
x86_64                randconfig-011-20240210   gcc  
x86_64                randconfig-012-20240209   clang
x86_64                randconfig-012-20240210   clang
x86_64                randconfig-013-20240209   gcc  
x86_64                randconfig-013-20240210   clang
x86_64                randconfig-014-20240209   clang
x86_64                randconfig-014-20240210   clang
x86_64                randconfig-015-20240209   gcc  
x86_64                randconfig-015-20240210   gcc  
x86_64                randconfig-016-20240209   clang
x86_64                randconfig-016-20240210   clang
x86_64                randconfig-071-20240209   gcc  
x86_64                randconfig-071-20240210   gcc  
x86_64                randconfig-072-20240209   clang
x86_64                randconfig-072-20240210   gcc  
x86_64                randconfig-073-20240209   clang
x86_64                randconfig-073-20240210   clang
x86_64                randconfig-074-20240209   gcc  
x86_64                randconfig-074-20240210   gcc  
x86_64                randconfig-075-20240209   gcc  
x86_64                randconfig-075-20240210   clang
x86_64                randconfig-076-20240209   clang
x86_64                randconfig-076-20240210   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240210   gcc  
xtensa                randconfig-002-20240210   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

