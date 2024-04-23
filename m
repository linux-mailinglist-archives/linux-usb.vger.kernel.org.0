Return-Path: <linux-usb+bounces-9659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE68AF5E2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 19:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 974FCB219FA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 17:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF6613E03B;
	Tue, 23 Apr 2024 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTj2Dpb/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ED213D88A
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 17:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713895064; cv=none; b=i8QAY4ySPdwyJzY3roSkOJoh2mr9g0KzEXeMQq+yrdiMqsjfDjIn0Aza/5UWwwc+nytlc/FX49+qWdUpTS00UazaoAfTqpDwvniF6eaM+KZPsYDu3e5lpYr5ISe6nMZMPLT9bkFoqzPymuPpWpPO7XgqRs7LlgmZOYOR7Mlc//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713895064; c=relaxed/simple;
	bh=Cy1UB+8BQdxgX4mqfCdYoTqZO66I3ND5iqD5ZLi7Dhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DacHB08+lVR8biaiRtC3mLK/MQ3UfKQyeuICsyCp3NYnmhAWWIu/C7E36CtrBsrZDfb0iGS4+xEeSdbly2oj3Jl+iPS4IZwl/b8vuTdsdG8zMPfZCfD/V++V+WoFqHV3iIQ9kk8nGg8iAy56iuicrFbKti8o/trLF9rEgLBj/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTj2Dpb/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713895062; x=1745431062;
  h=date:from:to:cc:subject:message-id;
  bh=Cy1UB+8BQdxgX4mqfCdYoTqZO66I3ND5iqD5ZLi7Dhg=;
  b=VTj2Dpb/hV+aEX3YPbZaqZTPROQUMHxENhZpc/QYLCLe+uCbdIhPx5Tc
   I4PvvcpVdPdkWhZByxyhS/q9VHq+k63N0oUBZ0hMLX1j6lhzzlDY3UZHY
   Nd9C8UqDTWpSFzgvQyA/T2WGV7N62arxybSdu0VpFjetSqwWw6/NXWiwQ
   lZQ3M1LlHW2iz2+5unZb4y8RSb7vbQIespvv5h4ZlpEIRyOn8Gx9LzSlG
   OZukzEMLwmo50mi6xQOd65VX/gkZwT1Mf5nibcLGExOE3zE8bSIomjyp8
   eSMDovZMZ63Ha/q7VupxTWpsapnZdPG6qXvoTO9QMqnn0+7uoGKYfxdK1
   A==;
X-CSE-ConnectionGUID: cEyhbT0VTsGPaV2/zIFg5A==
X-CSE-MsgGUID: jpdAJuSISE2mQR3tZJs/zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20192110"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20192110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:57:41 -0700
X-CSE-ConnectionGUID: y9uPb8KtRr6XzYyuwOTbxA==
X-CSE-MsgGUID: rGq0Q8hiTJ6t7DUxQ21XVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24326783"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2024 10:57:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzKOf-0000Pk-3C;
	Tue, 23 Apr 2024 17:57:37 +0000
Date: Wed, 24 Apr 2024 01:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 d4d336f8c4d5a4609217ac83116ba3d06b7e918c
Message-ID: <202404240153.FInA9iIj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: d4d336f8c4d5a4609217ac83116ba3d06b7e918c  thunderbolt: No need to loop over all retimers if access fails

elapsed time: 736m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240423   clang
i386         buildonly-randconfig-002-20240423   clang
i386         buildonly-randconfig-003-20240423   gcc  
i386         buildonly-randconfig-004-20240423   clang
i386         buildonly-randconfig-005-20240423   clang
i386         buildonly-randconfig-006-20240423   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240423   gcc  
i386                  randconfig-002-20240423   gcc  
i386                  randconfig-003-20240423   clang
i386                  randconfig-004-20240423   gcc  
i386                  randconfig-005-20240423   clang
i386                  randconfig-006-20240423   clang
i386                  randconfig-011-20240423   gcc  
i386                  randconfig-012-20240423   clang
i386                  randconfig-013-20240423   clang
i386                  randconfig-014-20240423   gcc  
i386                  randconfig-015-20240423   gcc  
i386                  randconfig-016-20240423   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-003-20240423   gcc  
x86_64       buildonly-randconfig-004-20240423   gcc  
x86_64       buildonly-randconfig-006-20240423   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240423   gcc  
x86_64                randconfig-003-20240423   gcc  
x86_64                randconfig-004-20240423   gcc  
x86_64                randconfig-005-20240423   gcc  
x86_64                randconfig-006-20240423   gcc  
x86_64                randconfig-011-20240423   gcc  
x86_64                randconfig-012-20240423   gcc  
x86_64                randconfig-016-20240423   gcc  
x86_64                randconfig-074-20240423   gcc  
x86_64                randconfig-075-20240423   gcc  
x86_64                randconfig-076-20240423   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

