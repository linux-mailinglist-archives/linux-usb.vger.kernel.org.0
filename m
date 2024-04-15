Return-Path: <linux-usb+bounces-9368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72C8A5BC1
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 21:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA991C2138A
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 19:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AB5156237;
	Mon, 15 Apr 2024 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsOSE9e9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C9671B50
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210532; cv=none; b=Qs7eMC9TWAWteI41tEbdNrGt6TIfjqya9TllJVVWoKKHwMz7xZ6B164ZE2vw9M/lQB/JfUKRFtKybCoQng+dNWDoEDFZcHGoVQwlJrO0eO88ltHPoh8DmCSwfu8rrKzKa3LRKYa6foxpRK25u1KwuFXL/Ofw92ymh0M65LiRnjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210532; c=relaxed/simple;
	bh=rZarHCw0EuzarALGySMRaBE7kyKkwE/5DTnHdqkClUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UBS94FYt9VxJI/kO1ysfIGEQBKQt6XpenVF1AT/yhaBRhHIhqRuMB+N787mryF6jGkLheZ1m9ctFanNSqxzydJG/SeQIGhU+frbP67C5AMdw8yEcj2YAw7HdONxmKYz4HHVXYUr/bzawcbgTAJ0VD0GI7iBTjW8lyrDJaPHzacI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsOSE9e9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713210530; x=1744746530;
  h=date:from:to:cc:subject:message-id;
  bh=rZarHCw0EuzarALGySMRaBE7kyKkwE/5DTnHdqkClUc=;
  b=nsOSE9e9/dx/KyVbwfVXNdyH3Cihewhi5T9amm7iTwpOxgOBZTx2WRH8
   xCUpFvHdduwDmTnUl5bjERx6VIuOYQsxys/JUXLm4ILCOzCk9VgVMjTZd
   ju9YKCk4gtL6srIxUx+d88j2FmcEzR3f5ixmE0m5f4zgSG8PWH/kqI/Z4
   5DrA5r1/aNX00LQaLtEfM5N2oTwe3PxFYP83A6mwaDnlEbr952tw7A8FY
   SNRZ6GxqchQCpdb+kuSks39tAoTo2kW911g8nzP9y0Cs271kf60EIpq2A
   1S8L6WuT4CF844x5MJXtuW4TGRv9N+fwqgFBoovGIBa8XFpiGhKrYQhIa
   Q==;
X-CSE-ConnectionGUID: Lt1ZTsltRs6EeeEL+XvAeg==
X-CSE-MsgGUID: 20NR4m99QdyW/IxG3jPWIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8785829"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8785829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:48:49 -0700
X-CSE-ConnectionGUID: dZ1qLVo5TuWh8bayaaq9sw==
X-CSE-MsgGUID: MMyyJuWwRa6v3zHuoZb2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="53216467"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2024 12:48:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwSJp-0004bm-2t;
	Mon, 15 Apr 2024 19:48:45 +0000
Date: Tue, 16 Apr 2024 03:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 c281d18dda402a2d180b921eebc7fe22b76699cf
Message-ID: <202404160313.lT3bSEk5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: c281d18dda402a2d180b921eebc7fe22b76699cf  Merge tag 'thunderbolt-for-v6.9-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- alpha-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-002-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-003-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-005-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-011-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-014-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-randconfig-002-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- m68k-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- microblaze-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- mips-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- mips-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- nios2-randconfig-r122-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- openrisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-randconfig-001-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- um-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- xtensa-randconfig-r123-20240415
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-randconfig-004-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-141-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc64-randconfig-002-20240415
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- x86_64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- x86_64-allyesconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1

elapsed time: 727m

configs tested: 179
configs skipped: 4

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
arc                   randconfig-001-20240415   gcc  
arc                   randconfig-002-20240415   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240415   gcc  
arm                   randconfig-002-20240415   gcc  
arm                   randconfig-003-20240415   clang
arm                   randconfig-004-20240415   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240415   clang
arm64                 randconfig-002-20240415   clang
arm64                 randconfig-003-20240415   clang
arm64                 randconfig-004-20240415   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240415   gcc  
csky                  randconfig-002-20240415   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240415   clang
hexagon               randconfig-002-20240415   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240415   clang
i386         buildonly-randconfig-002-20240415   gcc  
i386         buildonly-randconfig-003-20240415   gcc  
i386         buildonly-randconfig-004-20240415   gcc  
i386         buildonly-randconfig-005-20240415   gcc  
i386         buildonly-randconfig-006-20240415   clang
i386                                defconfig   clang
i386                  randconfig-001-20240415   gcc  
i386                  randconfig-002-20240415   clang
i386                  randconfig-003-20240415   gcc  
i386                  randconfig-004-20240415   gcc  
i386                  randconfig-005-20240415   gcc  
i386                  randconfig-006-20240415   clang
i386                  randconfig-011-20240415   gcc  
i386                  randconfig-012-20240415   clang
i386                  randconfig-013-20240415   gcc  
i386                  randconfig-014-20240415   gcc  
i386                  randconfig-015-20240415   gcc  
i386                  randconfig-016-20240415   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240415   gcc  
loongarch             randconfig-002-20240415   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                           ip27_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
mips                          rb532_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240415   gcc  
nios2                 randconfig-002-20240415   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240415   gcc  
parisc                randconfig-002-20240415   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20240415   gcc  
powerpc               randconfig-002-20240415   gcc  
powerpc               randconfig-003-20240415   clang
powerpc                     sequoia_defconfig   clang
powerpc                      tqm8xx_defconfig   clang
powerpc64             randconfig-001-20240415   clang
powerpc64             randconfig-002-20240415   clang
powerpc64             randconfig-003-20240415   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240415   clang
riscv                 randconfig-002-20240415   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240415   gcc  
s390                  randconfig-002-20240415   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240415   gcc  
sh                    randconfig-002-20240415   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240415   gcc  
sparc64               randconfig-002-20240415   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240415   clang
um                    randconfig-002-20240415   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240415   clang
x86_64       buildonly-randconfig-002-20240415   clang
x86_64       buildonly-randconfig-003-20240415   clang
x86_64       buildonly-randconfig-004-20240415   clang
x86_64       buildonly-randconfig-005-20240415   gcc  
x86_64       buildonly-randconfig-006-20240415   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240415   gcc  
x86_64                randconfig-002-20240415   gcc  
x86_64                randconfig-003-20240415   clang
x86_64                randconfig-004-20240415   gcc  
x86_64                randconfig-005-20240415   clang
x86_64                randconfig-006-20240415   clang
x86_64                randconfig-011-20240415   clang
x86_64                randconfig-012-20240415   clang
x86_64                randconfig-013-20240415   gcc  
x86_64                randconfig-014-20240415   clang
x86_64                randconfig-015-20240415   clang
x86_64                randconfig-016-20240415   clang
x86_64                randconfig-071-20240415   gcc  
x86_64                randconfig-072-20240415   clang
x86_64                randconfig-073-20240415   clang
x86_64                randconfig-074-20240415   clang
x86_64                randconfig-075-20240415   clang
x86_64                randconfig-076-20240415   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240415   gcc  
xtensa                randconfig-002-20240415   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

