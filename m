Return-Path: <linux-usb+bounces-29941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C60FDC246E5
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 11:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9212C4F209E
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 10:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600433DEE9;
	Fri, 31 Oct 2025 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M78CS6co"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE0C20F067
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 10:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906146; cv=none; b=OUN8VtppMUmDK5/Z7ryuSZ1NFRycUGo8k5b/IvOqSG5KdqE5hnpVMCzGR1v5e8Ia2c/I38usEkLSj7LFXs3QsRzCmhUkdlWEne6mA83Iai/BCfcx8z8WR5SyHmFI5Twkvt+cnC3702YCg6BcDbZfPJQa1GvBtmsYdW3QuoWPnqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906146; c=relaxed/simple;
	bh=Zt/1vL1vaUK8pRQncuK7/PhsOQcBpTgff9iD8TLiR/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SXX1wCcfVCSbeK+hO5xNGmSVxl3N/A7yPPQF9opcrYHAkQC884oC93qtApFEs4/pcV65pXfJmCTB/AXxnIvFjJXPH2+9OqnyNMRz4d1uBfFZNkqmDxxqQwBlJk5tyTyYJ2KPYEc82POiqD9MLByUPrnnis3JdWjXUHRYrJOYrh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M78CS6co; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761906144; x=1793442144;
  h=date:from:to:cc:subject:message-id;
  bh=Zt/1vL1vaUK8pRQncuK7/PhsOQcBpTgff9iD8TLiR/o=;
  b=M78CS6cozNU7bd2OlisyPo1MHPQbUpXasuFYPhemzVM2c64sO8092sRE
   Ds5uy1DF4YViKPjGXfLWekEkqhNe4dqQ5es0/piFYMsESCAGN519nfG/+
   HnHVgp8RbtN8dyqfHWPDbiQGpF8lx4A/KHqWAI2cp8YPoU9Ga5NRQ689P
   xEFt79A7E+W30LF2H4ID/Kt7jSsON/BAHAGXd/RJtR87CX61n/F1ZZZ0s
   p0ChxvXcfG8S8csORxk+F9zv/kqZ6soLOMDAY99JsRigZwPnFmkUVqHyf
   UzKz+xUm5T/Ewe5F4ctzyXbt5AUhoUlQsuBwZ57qCZHjDLeuwGhEmUDrs
   Q==;
X-CSE-ConnectionGUID: 9+NvVxYuQpusOFUVYWxXsw==
X-CSE-MsgGUID: QK73K3rcTYKv1OO4Z8+mTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75515204"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75515204"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:22:23 -0700
X-CSE-ConnectionGUID: sQ0+MjKsTDaAGvvki/wgGA==
X-CSE-MsgGUID: +gzZGEZVR+e7XlWWEmytHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190550111"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2025 03:22:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEmGx-000Mzi-0M;
	Fri, 31 Oct 2025 10:22:19 +0000
Date: Fri, 31 Oct 2025 18:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 ad8415a85703a0cc415aef5682c99ed2d9facaf5
Message-ID: <202510311804.SH7qeuIl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: ad8415a85703a0cc415aef5682c99ed2d9facaf5  Merge tag 'thunderbolt-for-v6.18-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

elapsed time: 1486m

configs tested: 99
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-8.5.0
arm64                 randconfig-002-20251031    clang-22
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-9.5.0
csky                  randconfig-002-20251031    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251031    gcc-14
i386        buildonly-randconfig-002-20251031    gcc-14
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    gcc-14
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    clang-22
um                                allnoconfig    clang-22
um                    randconfig-001-20251031    gcc-14
um                    randconfig-002-20251031    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    clang-20
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    clang-20
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    clang-20
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251031    gcc-13.4.0
xtensa                randconfig-002-20251031    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

