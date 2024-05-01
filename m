Return-Path: <linux-usb+bounces-9956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA48B920C
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 01:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970D6288AE1
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2024 23:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5132D165FBE;
	Wed,  1 May 2024 23:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLx94MLR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9291C68D
	for <linux-usb@vger.kernel.org>; Wed,  1 May 2024 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714605091; cv=none; b=hcKHU2IRCHF157Hl00Ndgfbmo4gCoxdFY3lj4dss8ieXFK/p5BfyI1aTo5jd7jicB/0yaLybw0NVBDIszGMz70HxXMjrB0mVVOqJKyuwnW6rK2Kf5HsuKe+ck/8QqBSnOBaHISwzh6cTTROms/h4a7vDVaR53f8tj1scMkveblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714605091; c=relaxed/simple;
	bh=I0EYIxTlzl46UORKFbo7VMaCOibZ+z8mL+G7IrSOdu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oXcOwKuaOq5ihDT1mcapFG5mS9wUC1At+OGVB/+1CjTTKx41fgt+DTv4O83+4IJZWE6QKzqfeeqhydbMfLAcmCP6kkBy3XzKBK4Xf19ImF6GVNqx0GUIKwXhqfGQ4lu29FIAClfGjTuPVzqg35pSO2sWT4x53vIzvir8rVImkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLx94MLR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714605090; x=1746141090;
  h=date:from:to:cc:subject:message-id;
  bh=I0EYIxTlzl46UORKFbo7VMaCOibZ+z8mL+G7IrSOdu4=;
  b=eLx94MLRE37QN8Y2t02MXobGeo0XysqHwESbFnYweGBQYiV9URVXwuC/
   vvg3YCYW7Wzvs7QFUhPdtWioT5NrqjfKz8ZDlP2u+zNSS/B/bI40jegrP
   fXVcxkB+anO7JcXKyxSPV3V24ovRbte/fmt6Yl0wwzfLz1TS2Dy12cSZ9
   D06SXU+hGH6qlUzAmmft9TysWYRnOGp1H52tYtCKdjCXRKhtMe5k32t7n
   zkc7P3HpXAup2Z7rXvQg9ly0DV8gwW4nqe7susXybUsRwCc81FUgK1IG9
   aYmzca16SxF6D+v+FbofIflObzNceCKRr4V9zgpMvJnuUM6iZBy/xBm31
   A==;
X-CSE-ConnectionGUID: GEUvDx+OQR6yNUv/tmlXaw==
X-CSE-MsgGUID: 6oI/TwmzTBGgygNWTlUCcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10483749"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10483749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 16:11:30 -0700
X-CSE-ConnectionGUID: 9VMOy4I9Sua0dtb/F3TV7w==
X-CSE-MsgGUID: YcAC1niUQb+uppjW4oX/Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27435000"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 16:11:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2J6k-000A8E-0N;
	Wed, 01 May 2024 23:11:26 +0000
Date: Thu, 02 May 2024 07:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ae11f04b452b5205536e1c02d31f8045eba249dd
Message-ID: <202405020733.NaGXP9JY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ae11f04b452b5205536e1c02d31f8045eba249dd  usb: typec: tcpm: Check for port partner validity before consuming it

elapsed time: 1737m

configs tested: 87
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240502   gcc  
arc                   randconfig-002-20240502   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240502   gcc  
arm                   randconfig-002-20240502   gcc  
arm                   randconfig-003-20240502   gcc  
arm                   randconfig-004-20240502   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240502   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240501   clang
i386         buildonly-randconfig-002-20240501   gcc  
i386         buildonly-randconfig-003-20240501   clang
i386         buildonly-randconfig-004-20240501   gcc  
i386         buildonly-randconfig-005-20240501   gcc  
i386         buildonly-randconfig-006-20240501   clang
i386                                defconfig   clang
i386                  randconfig-001-20240501   gcc  
i386                  randconfig-002-20240501   clang
i386                  randconfig-003-20240501   gcc  
i386                  randconfig-004-20240501   gcc  
i386                  randconfig-005-20240501   clang
i386                  randconfig-006-20240501   clang
i386                  randconfig-011-20240501   gcc  
i386                  randconfig-012-20240501   gcc  
i386                  randconfig-013-20240501   gcc  
i386                  randconfig-014-20240501   gcc  
i386                  randconfig-015-20240501   gcc  
i386                  randconfig-016-20240501   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

