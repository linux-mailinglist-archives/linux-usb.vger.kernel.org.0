Return-Path: <linux-usb+bounces-17081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808439BC102
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 23:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F391283032
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 22:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020001FE0F5;
	Mon,  4 Nov 2024 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUHQVo+u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC11FCF4B
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 22:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730759807; cv=none; b=BRC9U254uGHDr9QgGsxnbrfzA8PPKNzr3t+nH0MEUZp6eQWVisnFc44VV0MjGmu7eEdrGmxvBF2b8PJEW0W5EJQ7wgwkge+GXaLoc2y1XfBCU8C02PNdzHL7UcAiMwrNiOZMHRl2g4GW6P3BqXE+Hqy3whkOhFl/3xx8rvc1W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730759807; c=relaxed/simple;
	bh=H1JTDZpeMvwXuJP6jhRj+65Wmajz1BfnJHHLT/Y9jLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jEew+ZgVkOX/X52MR2lWVslhhOE7MB7hL77iXYFeC2sw0xupyqOBSFphe0r4Iq9LOUXYA9y0hqR0IGNxy8rP6FwnnrpuEyZbuK5LFhvQ37tWW3ziDFpAibV+6C/AzuYW4mbTwLf1SHTjim30jPhQaKFaLbQBSDpYNm1YBVZarHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUHQVo+u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730759806; x=1762295806;
  h=date:from:to:cc:subject:message-id;
  bh=H1JTDZpeMvwXuJP6jhRj+65Wmajz1BfnJHHLT/Y9jLU=;
  b=dUHQVo+uRmR6DvSpNBI/1m9iHw0ilZm6tWjHw70rDE8g6bZBt6LNVbrw
   1ECiT06vaa/JNEswPOCRCwi5gERlMlSMl8839dR7EccKFPfsfZ6kE4hJY
   JudnA1LW4orX0lTLoIAMlbNFP+//InyGU6iA/TPCNoiJuiFqkQnskGb2x
   CE9d5GmwFJPa9uL5sbauldLZGWHIi1iQtlCOXJYtTAouYOPXdX9EOMMAg
   9AOYuTypNq/Hv/85euRwVQqLabTc3ogOnXRWpayj0dJOin9f5BaT21ImO
   2Phiz9r++Nk0On7mqBleQxxnudjqGDuSfhmcUHGCtlEo4qJUQyH3E+6ej
   A==;
X-CSE-ConnectionGUID: +bnRYMEuRwqFLeEh/4xplg==
X-CSE-MsgGUID: yvI5oIvdSTuF8ovCp8UDxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41066789"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41066789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:36:45 -0800
X-CSE-ConnectionGUID: zfZmQBHlRuaKx/TvWL70Mw==
X-CSE-MsgGUID: tS/MwAc9RjKpdg/SMh27UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83903606"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2024 14:36:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t85gf-000lLv-35;
	Mon, 04 Nov 2024 22:36:41 +0000
Date: Tue, 05 Nov 2024 06:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 bf373d2919d98f3d1fe1b19a0304f72fe74386d9
Message-ID: <202411050636.011zA8uY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: bf373d2919d98f3d1fe1b19a0304f72fe74386d9  phy: realtek: usb: fix NULL deref in rtk_usb3phy_probe

elapsed time: 1002m

configs tested: 199
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241104    gcc-14.1.0
arc                   randconfig-002-20241104    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241104    gcc-14.1.0
arm                   randconfig-002-20241104    gcc-14.1.0
arm                   randconfig-003-20241104    gcc-14.1.0
arm                   randconfig-004-20241104    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241104    gcc-14.1.0
arm64                 randconfig-002-20241104    gcc-14.1.0
arm64                 randconfig-003-20241104    gcc-14.1.0
arm64                 randconfig-004-20241104    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241104    gcc-14.1.0
csky                  randconfig-002-20241104    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241104    gcc-14.1.0
hexagon               randconfig-002-20241104    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241104    clang-19
i386        buildonly-randconfig-001-20241104    gcc-12
i386        buildonly-randconfig-002-20241104    gcc-12
i386        buildonly-randconfig-003-20241104    clang-19
i386        buildonly-randconfig-003-20241104    gcc-12
i386        buildonly-randconfig-004-20241104    gcc-12
i386        buildonly-randconfig-005-20241104    clang-19
i386        buildonly-randconfig-005-20241104    gcc-12
i386        buildonly-randconfig-006-20241104    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241104    gcc-12
i386                  randconfig-002-20241104    clang-19
i386                  randconfig-002-20241104    gcc-12
i386                  randconfig-003-20241104    gcc-12
i386                  randconfig-004-20241104    clang-19
i386                  randconfig-004-20241104    gcc-12
i386                  randconfig-005-20241104    clang-19
i386                  randconfig-005-20241104    gcc-12
i386                  randconfig-006-20241104    clang-19
i386                  randconfig-006-20241104    gcc-12
i386                  randconfig-011-20241104    gcc-12
i386                  randconfig-012-20241104    gcc-12
i386                  randconfig-013-20241104    clang-19
i386                  randconfig-013-20241104    gcc-12
i386                  randconfig-014-20241104    gcc-12
i386                  randconfig-015-20241104    gcc-12
i386                  randconfig-016-20241104    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241104    gcc-14.1.0
loongarch             randconfig-002-20241104    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241104    gcc-14.1.0
nios2                 randconfig-002-20241104    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241104    gcc-14.1.0
parisc                randconfig-002-20241104    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241104    gcc-14.1.0
powerpc               randconfig-002-20241104    gcc-14.1.0
powerpc               randconfig-003-20241104    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241104    gcc-14.1.0
powerpc64             randconfig-002-20241104    gcc-14.1.0
powerpc64             randconfig-003-20241104    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241104    gcc-14.1.0
riscv                 randconfig-002-20241104    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241104    gcc-14.1.0
s390                  randconfig-002-20241104    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    gcc-14.1.0
sh                    randconfig-001-20241104    gcc-14.1.0
sh                    randconfig-002-20241104    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241104    gcc-14.1.0
sparc64               randconfig-002-20241104    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241104    gcc-14.1.0
um                    randconfig-002-20241104    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241104    gcc-12
x86_64      buildonly-randconfig-002-20241104    clang-19
x86_64      buildonly-randconfig-003-20241104    gcc-11
x86_64      buildonly-randconfig-004-20241104    clang-19
x86_64      buildonly-randconfig-005-20241104    gcc-12
x86_64      buildonly-randconfig-006-20241104    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241104    clang-19
x86_64                randconfig-002-20241104    gcc-12
x86_64                randconfig-003-20241104    clang-19
x86_64                randconfig-004-20241104    gcc-12
x86_64                randconfig-005-20241104    gcc-11
x86_64                randconfig-006-20241104    gcc-12
x86_64                randconfig-011-20241104    clang-19
x86_64                randconfig-012-20241104    gcc-12
x86_64                randconfig-013-20241104    clang-19
x86_64                randconfig-014-20241104    clang-19
x86_64                randconfig-015-20241104    gcc-12
x86_64                randconfig-016-20241104    gcc-12
x86_64                randconfig-071-20241104    clang-19
x86_64                randconfig-072-20241104    clang-19
x86_64                randconfig-073-20241104    gcc-12
x86_64                randconfig-074-20241104    gcc-12
x86_64                randconfig-075-20241104    clang-19
x86_64                randconfig-076-20241104    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241104    gcc-14.1.0
xtensa                randconfig-002-20241104    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

