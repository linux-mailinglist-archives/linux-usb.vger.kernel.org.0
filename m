Return-Path: <linux-usb+bounces-30979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61137C8B83E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 20:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A325D3B93EF
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F37633F390;
	Wed, 26 Nov 2025 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2CQGKxH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18D33EB04
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183679; cv=none; b=eiUz2GJ5PYmwX9NS/RLeErpp7gxQj51rgLMUHTDcTq2fKscokn+L4uRt52JsF7uzjOjggjtkVhq0v0WKpRYkEKmsSIS9Nq8AUpcz/kecQRa0aM8ylZcf5RX4zMAVNQYfBl73YmqjP562CNWyWWSAjAS7ClnzLqIsrKgTayfqfmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183679; c=relaxed/simple;
	bh=LWnkhdunSePOK/gzTvGNTNzwtnlX87bIvO+zlXEc/18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aqE7RYiOF1EFKI5TbJf+4/2JgbI0kz+T88a1zS8EDmjPAn2Atey4bggCbSmH2GxjqHp9mZcQa3f37Y5wlErnG7lDmJxwZ8qYtLCLdw1oZ2s2WV1Bd3Ld9rlXURKHdXtL8whG0SwtXv1pcsKustngYtflnZA94vgNu/A25/J7fWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2CQGKxH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764183677; x=1795719677;
  h=date:from:to:cc:subject:message-id;
  bh=LWnkhdunSePOK/gzTvGNTNzwtnlX87bIvO+zlXEc/18=;
  b=Q2CQGKxHJZ8b88ehDbQVI/PF0r3mk6yrRC/CjBq9Oz3fpueuzHl3fCZg
   JD60S8FXyK3ZlyqWugWdzXJcyfIhY05gPAdJPDsQJ4eLm0Yb4MmaczlrV
   PkuOR+Nbud3ATv1GSG08Bitynq86cpRZHptvl+DKbhuJMXMEf6wCRZq0S
   tLW8T/6t2e7/wVV5uK3GFjw5Uveqg/oW1e7U+VX7ebSAbSpiGKzLE4XJW
   JESKQuZJmNuyodogIj7IAUKE0OW2bQU+k8v+OnoJVqxOPWyp5ZpdZLrvn
   ApucW5O511V9PDcFRaWQNyRhxZS3eMgaOq753+gYYmoOtQWHrb1AEFSoF
   w==;
X-CSE-ConnectionGUID: sYkZpv7dS+6vWUsvuzJK0w==
X-CSE-MsgGUID: bLmBTpP1RNSoSMWIgzW63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88875283"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88875283"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:01:17 -0800
X-CSE-ConnectionGUID: sxpqINKhQMmFUmiJtGgvMg==
X-CSE-MsgGUID: 9vacozzEQmaEpcDQhXziDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223984872"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 11:01:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOKlN-000000003Gq-38tH;
	Wed, 26 Nov 2025 19:01:13 +0000
Date: Thu, 27 Nov 2025 03:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 74851fbb6d647304f8a7dc491434d3a335ef4b8d
Message-ID: <202511270311.vO5FWxwm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 74851fbb6d647304f8a7dc491434d3a335ef4b8d  usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors

elapsed time: 2966m

configs tested: 73
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251125    gcc-9.5.0
arc         randconfig-002-20251125    gcc-8.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251125    clang-22
arm         randconfig-002-20251125    gcc-10.5.0
arm         randconfig-003-20251125    gcc-10.5.0
arm         randconfig-004-20251125    gcc-8.5.0
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251125    clang-19
hexagon     randconfig-002-20251125    clang-22
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch                 defconfig    clang-19
loongarch   randconfig-001-20251125    gcc-15.1.0
loongarch   randconfig-002-20251125    gcc-12.5.0
m68k                    allnoconfig    gcc-15.1.0
m68k                atari_defconfig    gcc-15.1.0
m68k                      defconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze                defconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips              qi_lb60_defconfig    clang-22
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
nios2       randconfig-001-20251125    gcc-8.5.0
nios2       randconfig-002-20251125    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251125    gcc-13.4.0
parisc      randconfig-002-20251125    gcc-10.5.0
parisc64                  defconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251125    clang-19
powerpc     randconfig-002-20251125    gcc-8.5.0
powerpc64   randconfig-001-20251125    clang-16
powerpc64   randconfig-002-20251125    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251125    gcc-8.5.0
riscv       randconfig-002-20251125    gcc-13.4.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251125    gcc-8.5.0
s390        randconfig-002-20251125    gcc-14.3.0
s390             zfcpdump_defconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sh                r7780mp_defconfig    gcc-15.1.0
sh          randconfig-001-20251125    gcc-15.1.0
sh          randconfig-002-20251125    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251125    gcc-14.3.0
sparc       randconfig-002-20251125    gcc-13.4.0
sparc64                alldefconfig    gcc-15.1.0
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20251125    clang-22
sparc64     randconfig-002-20251125    gcc-8.5.0
um                      allnoconfig    clang-22
um                        defconfig    clang-22
um                   i386_defconfig    gcc-14
um          randconfig-001-20251125    clang-22
um          randconfig-002-20251125    clang-22
um                 x86_64_defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa             common_defconfig    gcc-15.1.0
xtensa        nommu_kc705_defconfig    gcc-15.1.0
xtensa      randconfig-001-20251125    gcc-8.5.0
xtensa      randconfig-002-20251125    gcc-8.5.0
xtensa          smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

