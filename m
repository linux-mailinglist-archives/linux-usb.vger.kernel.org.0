Return-Path: <linux-usb+bounces-9476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7228AA814
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 07:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA67A1F228B4
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 05:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791DDBA41;
	Fri, 19 Apr 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktfy5Jnm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E4BE4B
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713505740; cv=none; b=mcZJSzramXneW7VuEXmwoX8zu43uQ7rg23/a4FW7bOc30gZgfxmxipREhNvcj2wYeJ0i5fvw5+/V6x8Sfhm2G7H2726l6jYkBcBF/xtxClU/XWrugG7vVUaPo3wdp1AQY8urs1cfNofapGM8amw4ebUs/O3GJl6wkffEEoPDeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713505740; c=relaxed/simple;
	bh=F9ogXBsQsWi3Do3d7VtjwqMFC8C5Ms/j6Gx2Y8sbEc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UDVIWRAlG0dAMfGJoTtbA3U9KfqRejYl8ZFY+74aQH0rPmtFnHhT6sxJ6VKnRw2xtqmg4ihiGVRvj5okIfJF7cf1E3RGMoOd5IU5farr0FOzUm++K2nZoWFWi0WF3k3qUO9GiKzcn0Xejg7w1pp075LZrrOyDFhFFVBLBJvaCBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktfy5Jnm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713505738; x=1745041738;
  h=date:from:to:cc:subject:message-id;
  bh=F9ogXBsQsWi3Do3d7VtjwqMFC8C5Ms/j6Gx2Y8sbEc8=;
  b=ktfy5JnmptCHcABqIcg3/GhU1cBT/mmMiLNbP6UpXc2ek7poKxY/2dG4
   683uA1p4cqwMc9dwmcb3m1TjmVeMnMis8WRHZrc4zjz6xmzAk4qLnVU0i
   Grf3RTHfGZk7/fOOxi+kz6ADLL4eC8zzeupCvo5qNPFVI4YrJ+Zik1j+h
   30eYGK+K8KEtzkFBNttpxIrHvwAWbAjTUW/oAISM9McbRxv77mmuHcYq5
   nrmHAbjV2eKyDBeKjl3YIumda+2wytNI+O0M+B0sZwUWwcumwiB/jlZzK
   9NIVAjqumU6tv5LJo4Vni8nx0e7PhL1QOSrOJgJlR8QNNk+xwwweWyW6J
   A==;
X-CSE-ConnectionGUID: doEUq608S16LcJ/4x1JoWg==
X-CSE-MsgGUID: EG/qTYFeSZSLazcKRXu5ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9634651"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9634651"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 22:48:57 -0700
X-CSE-ConnectionGUID: ua/kiUoIRkmE5LxF57cO7Q==
X-CSE-MsgGUID: wAUs7cvSREuwYGrvW788QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23244589"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2024 22:48:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxh7F-0009dh-2b;
	Fri, 19 Apr 2024 05:48:53 +0000
Date: Fri, 19 Apr 2024 13:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 f2e0eee4703869dc5edb5302a919861566ca7797
Message-ID: <202404191322.jj53Tz8N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: f2e0eee4703869dc5edb5302a919861566ca7797  usb: dwc3: ep0: Don't reset resource alloc flag

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- csky-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-004-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-buildonly-randconfig-005-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-004-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-011-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-015-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- loongarch-randconfig-002-20240419
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
|-- nios2-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- openrisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- parisc-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc64-randconfig-002-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- s390-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc-randconfig-002-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- sparc64-randconfig-002-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- um-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- xtensa-randconfig-002-20240419
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- arm64-randconfig-003-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- hexagon-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- hexagon-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-001-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-003-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-005-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- i386-randconfig-006-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- powerpc64-randconfig-003-20240419
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allmodconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
|-- riscv-allyesconfig
|   `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1
`-- s390-allmodconfig
    `-- drivers-usb-dwc2-core_intr.c:warning:Function-parameter-or-struct-member-remotewakeup-not-described-in-dwc2_wakeup_from_lpm_l1

elapsed time: 900m

configs tested: 139
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
arc                   randconfig-001-20240419   gcc  
arc                   randconfig-002-20240419   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240419   gcc  
arm                   randconfig-002-20240419   clang
arm                   randconfig-003-20240419   gcc  
arm                   randconfig-004-20240419   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240419   clang
arm64                 randconfig-002-20240419   clang
arm64                 randconfig-003-20240419   clang
arm64                 randconfig-004-20240419   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240419   gcc  
csky                  randconfig-002-20240419   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240419   clang
hexagon               randconfig-002-20240419   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240419   clang
i386         buildonly-randconfig-002-20240419   gcc  
i386         buildonly-randconfig-003-20240419   gcc  
i386         buildonly-randconfig-004-20240419   gcc  
i386         buildonly-randconfig-005-20240419   gcc  
i386         buildonly-randconfig-006-20240419   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240419   clang
i386                  randconfig-002-20240419   clang
i386                  randconfig-003-20240419   clang
i386                  randconfig-004-20240419   gcc  
i386                  randconfig-005-20240419   clang
i386                  randconfig-006-20240419   clang
i386                  randconfig-011-20240419   gcc  
i386                  randconfig-012-20240419   clang
i386                  randconfig-013-20240419   gcc  
i386                  randconfig-014-20240419   clang
i386                  randconfig-015-20240419   gcc  
i386                  randconfig-016-20240419   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240419   gcc  
loongarch             randconfig-002-20240419   gcc  
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
nios2                 randconfig-001-20240419   gcc  
nios2                 randconfig-002-20240419   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240419   gcc  
parisc                randconfig-002-20240419   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240419   gcc  
powerpc               randconfig-002-20240419   gcc  
powerpc               randconfig-003-20240419   gcc  
powerpc64             randconfig-001-20240419   gcc  
powerpc64             randconfig-002-20240419   gcc  
powerpc64             randconfig-003-20240419   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240419   clang
riscv                 randconfig-002-20240419   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240419   clang
s390                  randconfig-002-20240419   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240419   gcc  
sh                    randconfig-002-20240419   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240419   gcc  
sparc64               randconfig-002-20240419   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240419   gcc  
um                    randconfig-002-20240419   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240419   gcc  
xtensa                randconfig-002-20240419   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

