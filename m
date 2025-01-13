Return-Path: <linux-usb+bounces-19285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F097A0C52F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 00:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9713F7A2615
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 23:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667591F9EDA;
	Mon, 13 Jan 2025 23:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+erlWVD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C01F9AAE
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809714; cv=none; b=XoeVv87t2U4wUCshvaHEtq1lGPmbJPzSOVrlHf/i+lL2qthIEc1dN+eIfOj0aURbet2mlUhMy54GO4X9j2ClzvvPek208M1F5oJjOeHAmpkv86UXavpfTO45raExBEeZ13B7e30myvy92vejXddsJzqVyEjuPjt9ipnzO1Q8/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809714; c=relaxed/simple;
	bh=bqM/uUOS8+8FSsrekjnFe8fO8dEA7Omz8+WEfRew/JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qU0BI/R+8M9u2IkNgOyBrZ1bKO9wGy4UMco0ZoHjkYn3dkMdT4InRFcXCwSVwY24zgdzNRTKub4Bh/JMjV7AerJym4vR6yxS8SQGvakizuFStdQcNqUDE8xD7UHGDFaPiJYhboatRyRnmiavzihyVUKUOpb42vqZRvSpkcmBYqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+erlWVD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736809713; x=1768345713;
  h=date:from:to:cc:subject:message-id;
  bh=bqM/uUOS8+8FSsrekjnFe8fO8dEA7Omz8+WEfRew/JI=;
  b=M+erlWVDxpRTs6j6RGXH/Sxc72+Ui9StjBMOH0Kic8OrNJSLkxTdl8iD
   KimyPtfXsgM384vysdbWlPPBug8H5vzSUoL9iUOUDC9g0R7IktH6BbRYx
   7ibDKgOrT01CS+fA0UnER1okOulgCFyUmwX0y8qHXWUPCNoJTjSpaCnwG
   Wkar9dcMyfKbdVsaRh8JgoXQyA0v62nZfnkpoHBjFEfdfPDphv8pqL+ft
   5PDKOtDpF8c2QRF89/jdoXby9t+6mhgg860FxGbeXQdsuoQ9bi7EPVzOO
   dnE6tVP2lOLqEM3aRNrxDcygnv3UgmogvxDy24afHlKrnTUpDONvj2DX2
   w==;
X-CSE-ConnectionGUID: ry+e2s/4RsmvOjdfFL+NlA==
X-CSE-MsgGUID: 1OCVmokBQ0GRocIKGEQhjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37207323"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37207323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 15:08:33 -0800
X-CSE-ConnectionGUID: jN7Bl5WGQlGWmTfaQvpAkA==
X-CSE-MsgGUID: CPaI/8w7RUOkyidCq/wOrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141899754"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 15:08:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXTXp-000Nof-0J;
	Mon, 13 Jan 2025 23:08:29 +0000
Date: Tue, 14 Jan 2025 07:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 2919c4a3d883361105185f9d2f658e1a4545a1a7
Message-ID: <202501140704.zgNaPLpt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: 2919c4a3d883361105185f9d2f658e1a4545a1a7  Merge 6.13-rc7 into usb-next

elapsed time: 1056m

configs tested: 127
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250113    gcc-13.2.0
arc                   randconfig-002-20250113    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250113    gcc-14.2.0
arm                   randconfig-002-20250113    gcc-14.2.0
arm                   randconfig-003-20250113    gcc-14.2.0
arm                   randconfig-004-20250113    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250113    gcc-14.2.0
arm64                 randconfig-002-20250113    clang-18
arm64                 randconfig-003-20250113    clang-20
arm64                 randconfig-004-20250113    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250113    gcc-14.2.0
csky                  randconfig-002-20250113    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250113    clang-20
hexagon               randconfig-002-20250113    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250113    clang-19
i386        buildonly-randconfig-002-20250113    gcc-12
i386        buildonly-randconfig-003-20250113    clang-19
i386        buildonly-randconfig-004-20250113    clang-19
i386        buildonly-randconfig-005-20250113    clang-19
i386        buildonly-randconfig-006-20250113    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250113    gcc-14.2.0
loongarch             randconfig-002-20250113    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250113    gcc-14.2.0
nios2                 randconfig-002-20250113    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250113    gcc-14.2.0
parisc                randconfig-002-20250113    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-18
powerpc               randconfig-001-20250113    clang-18
powerpc               randconfig-002-20250113    gcc-14.2.0
powerpc               randconfig-003-20250113    clang-20
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250113    clang-20
powerpc64             randconfig-002-20250113    gcc-14.2.0
powerpc64             randconfig-003-20250113    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250113    gcc-14.2.0
riscv                 randconfig-002-20250113    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250113    gcc-14.2.0
s390                  randconfig-002-20250113    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250113    gcc-14.2.0
sh                    randconfig-002-20250113    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250113    gcc-14.2.0
sparc                 randconfig-002-20250113    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250113    gcc-14.2.0
sparc64               randconfig-002-20250113    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250113    gcc-12
um                    randconfig-002-20250113    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250113    gcc-12
x86_64      buildonly-randconfig-002-20250113    gcc-12
x86_64      buildonly-randconfig-003-20250113    gcc-12
x86_64      buildonly-randconfig-004-20250113    gcc-12
x86_64      buildonly-randconfig-005-20250113    clang-19
x86_64      buildonly-randconfig-006-20250113    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250113    gcc-14.2.0
xtensa                randconfig-002-20250113    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

