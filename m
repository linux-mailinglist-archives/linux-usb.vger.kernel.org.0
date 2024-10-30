Return-Path: <linux-usb+bounces-16845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA99B59A2
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 02:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30072869ED
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 01:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB0113A27D;
	Wed, 30 Oct 2024 01:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaUbxegN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EB83CA0
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 01:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730253046; cv=none; b=ZiyLB+YcbzVgfbUO3UsAqvUM7+J0CugUZozwT9KJ3Sr4dtCCBOeq9Wjr6Zhfvp6GzTmQt//xqE+Zzu7GqxONuWdumyewZXqJcEC5uKgSlJ3AuOVpcvf9E0aTcHYCPpHH6mO511JzjV58aE6XGI7OlZKUEjEsYh/Lvpnd+6Nauaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730253046; c=relaxed/simple;
	bh=hiLMFItzm789ssrTuW84RgNZNzXo+DCrrhm9w5pCt+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c4S628fUrYQ4TJi2XDlTRKQ+GnXbhSS27aBqcArchTDlHxnfDkKY6ERwNnVcE5QG4uwSi8GgLK+oEFWI0NdKj+7F0iFA5pgRNOOqLBFuzfZTYIM7aGorXnUjEVPuMvqtLjV0Q8hMVrlvAo6kPGA7eYNhq65VR9GKb4V7wvGC3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaUbxegN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730253045; x=1761789045;
  h=date:from:to:cc:subject:message-id;
  bh=hiLMFItzm789ssrTuW84RgNZNzXo+DCrrhm9w5pCt+4=;
  b=RaUbxegNuqFK2nFsrOOrVJRwGYtn0YGS9zTHYvU1ltAf3F+8lzRW+9y1
   lGDzQp+vUadw8WbI33RbvcraAebVQwDxhhHcGEWa2anvtyTEqGt5KdLcj
   EQu36GFXj7aX1fC15gh1xVUXFl+n7nzMLSWl7wOgrWqgB0cauDipNcZyS
   xWOlX3lr9mOGGOXDIClag0N5ti6oYO5G8xBDlmjzFUTo/2XBRnTSaIqUg
   A5x939a7zdK51FWekfWzVEthjwikik2p3Mc5eoOaYpVFgxWKsAJyEtGAM
   wm5dsI8OW0/L+a2/nLrlsSrES23RKm9+ORI962MMieSuVlpTe2rN8xVFW
   g==;
X-CSE-ConnectionGUID: fZKZ6SN7R4yKdRBYiEwl1g==
X-CSE-MsgGUID: sy6GLnfDSB2LhY/3jLz1pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30130965"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30130965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:50:41 -0700
X-CSE-ConnectionGUID: xzeeW99PQ/m3clcvxVtWbw==
X-CSE-MsgGUID: GNRSm5x3RTK6xw4lW3NwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="81791119"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2024 18:50:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xr3-000eOK-2k;
	Wed, 30 Oct 2024 01:50:37 +0000
Date: Wed, 30 Oct 2024 09:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 c67e9601e29a636a14626707a7b2e5832ba71a75
Message-ID: <202410300942.lIA0In7l-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: c67e9601e29a636a14626707a7b2e5832ba71a75  usb: core: use sysfs_emit() instead of sprintf()

elapsed time: 1293m

configs tested: 155
configs skipped: 5

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
arc                   randconfig-001-20241029    gcc-14.1.0
arc                   randconfig-002-20241029    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                      integrator_defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm                   randconfig-001-20241029    gcc-14.1.0
arm                   randconfig-002-20241029    gcc-14.1.0
arm                   randconfig-003-20241029    gcc-14.1.0
arm                   randconfig-004-20241029    gcc-14.1.0
arm                           sama7_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241029    gcc-14.1.0
arm64                 randconfig-002-20241029    gcc-14.1.0
arm64                 randconfig-003-20241029    gcc-14.1.0
arm64                 randconfig-004-20241029    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241029    gcc-14.1.0
csky                  randconfig-002-20241029    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241029    gcc-14.1.0
hexagon               randconfig-002-20241029    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241029    clang-19
i386        buildonly-randconfig-002-20241029    clang-19
i386        buildonly-randconfig-003-20241029    clang-19
i386        buildonly-randconfig-004-20241029    clang-19
i386        buildonly-randconfig-005-20241029    clang-19
i386        buildonly-randconfig-006-20241029    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241029    clang-19
i386                  randconfig-002-20241029    clang-19
i386                  randconfig-003-20241029    clang-19
i386                  randconfig-004-20241029    clang-19
i386                  randconfig-005-20241029    clang-19
i386                  randconfig-006-20241029    clang-19
i386                  randconfig-011-20241029    clang-19
i386                  randconfig-012-20241029    clang-19
i386                  randconfig-013-20241029    clang-19
i386                  randconfig-014-20241029    clang-19
i386                  randconfig-015-20241029    clang-19
i386                  randconfig-016-20241029    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241029    gcc-14.1.0
loongarch             randconfig-002-20241029    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241029    gcc-14.1.0
nios2                 randconfig-002-20241029    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241029    gcc-14.1.0
parisc                randconfig-002-20241029    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241029    gcc-14.1.0
powerpc               randconfig-002-20241029    gcc-14.1.0
powerpc               randconfig-003-20241029    gcc-14.1.0
powerpc64             randconfig-001-20241029    gcc-14.1.0
powerpc64             randconfig-002-20241029    gcc-14.1.0
riscv                            alldefconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241029    gcc-14.1.0
riscv                 randconfig-002-20241029    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241029    gcc-14.1.0
s390                  randconfig-002-20241029    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20241029    gcc-14.1.0
sh                    randconfig-002-20241029    gcc-14.1.0
sh                   rts7751r2dplus_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241029    gcc-14.1.0
sparc64               randconfig-002-20241029    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241029    gcc-14.1.0
um                    randconfig-002-20241029    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241029    gcc-14.1.0
xtensa                randconfig-002-20241029    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

