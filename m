Return-Path: <linux-usb+bounces-14697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EB96D2F7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 11:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DE8D1F24A85
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73EA4C92;
	Thu,  5 Sep 2024 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Alb/BUJ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F6196D8F
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527906; cv=none; b=bEji9uO1rMoXjFc1/KvSfkMDvbL7lRqokerzDJy5l/OiZmP0FVucktvekWHnIx6h7HUSf6nvR9cCHJ9WBH6V4ffLoPd54hBw5wjUAFu6dGHleJ5iwyzURPfgLTxxiL9EC/OqYkpipWIoYhj1j+qtdOc0oF6SPR7o0mhs7Ai6PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527906; c=relaxed/simple;
	bh=E66EyRBW4bfV26H8pBGntxkYT/k0bI6oDlfxagaBiig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjyHkog9wcoBFERrKCBaQrXRDrozx0R8596QygAM/8esXQqm6dybEDeokc40xWxUqIEjEBQPJ8napgRPAjNCbQGZnDdEOy4ZSFRwx4I6ZDnd86omKFqzE5J1mHlrTUbiYD8POC8Kn15L9ynBEjO8srtYirjOVoojsBIcf2tzsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Alb/BUJ+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725527904; x=1757063904;
  h=date:from:to:cc:subject:message-id;
  bh=E66EyRBW4bfV26H8pBGntxkYT/k0bI6oDlfxagaBiig=;
  b=Alb/BUJ+k9WSp3ljg/XtQm2dE5qZjVe4Ngw3r4WhrZkwRBHEV8IBo837
   QloCgG5ZANWC1SfbvYzzMbXPc84CJ6yVuAaYHrKRq9JXndxZyrulihmlg
   3URnPo2QapfBGt6zEkQKpW9DkeDWn6X3foGPzZasJmjG/Q8wnHMIcPskw
   h76QrfEwbe3zzLn+6WPZrqew0314kFzy5qDjqHO8w56JNNrJ6RMSuN0gu
   7OlVcwUh+xX2H567b6ArNnQggu6tDJKe6n2oILbJi7eY3Ie2ekcSKrFrw
   8MfW2PBdLln384YzhD0rALCOCpPhsNAGVJ43mCWiFYMn7uTflo7hWrtrz
   A==;
X-CSE-ConnectionGUID: ppGxDcdhR5STHHd68b8cNQ==
X-CSE-MsgGUID: o7owBpOHQfazvhFoGTygvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="28021968"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="28021968"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:18:22 -0700
X-CSE-ConnectionGUID: fwKSRa7NRaySqN/Rvj5reA==
X-CSE-MsgGUID: r5OtC43pQ8CjhvU3VmnPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65805443"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2024 02:18:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm8d9-0009A1-0W;
	Thu, 05 Sep 2024 09:18:19 +0000
Date: Thu, 05 Sep 2024 17:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 d40ae4cdd9a400dea9dff3408b8c8983c45e943f
Message-ID: <202409051716.N1r9YbAJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: d40ae4cdd9a400dea9dff3408b8c8983c45e943f  dt-bindings: phy: mxs-usb-phy: add nxp,sim property

elapsed time: 1551m

configs tested: 118
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                               defconfig   gcc-14.1.0
arc                               allnoconfig   gcc-14.1.0
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240905   gcc-13.2.0
arc                   randconfig-002-20240905   gcc-13.2.0
arm                               allnoconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                   randconfig-001-20240905   clang-14
arm                   randconfig-002-20240905   clang-20
arm                   randconfig-003-20240905   clang-20
arm                   randconfig-004-20240905   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240905   clang-20
arm64                 randconfig-002-20240905   gcc-14.1.0
arm64                 randconfig-003-20240905   clang-20
arm64                 randconfig-004-20240905   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240905   gcc-14.1.0
csky                  randconfig-002-20240905   gcc-14.1.0
hexagon                           allnoconfig   gcc-14.1.0
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240905   clang-20
hexagon               randconfig-002-20240905   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240905   clang-18
i386         buildonly-randconfig-002-20240905   gcc-12
i386         buildonly-randconfig-003-20240905   gcc-12
i386         buildonly-randconfig-004-20240905   clang-18
i386         buildonly-randconfig-005-20240905   clang-18
i386         buildonly-randconfig-006-20240905   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240905   gcc-12
i386                  randconfig-002-20240905   clang-18
i386                  randconfig-003-20240905   gcc-12
i386                  randconfig-004-20240905   gcc-11
i386                  randconfig-005-20240905   gcc-12
i386                  randconfig-006-20240905   gcc-12
i386                  randconfig-011-20240905   clang-18
i386                  randconfig-012-20240905   clang-18
i386                  randconfig-013-20240905   gcc-12
i386                  randconfig-014-20240905   clang-18
i386                  randconfig-015-20240905   clang-18
i386                  randconfig-016-20240905   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240905   gcc-14.1.0
loongarch             randconfig-002-20240905   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240905   gcc-14.1.0
nios2                 randconfig-002-20240905   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240905   gcc-14.1.0
parisc                randconfig-002-20240905   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                           allnoconfig   gcc-14.1.0
powerpc               randconfig-001-20240905   clang-14
powerpc               randconfig-002-20240905   clang-20
powerpc               randconfig-003-20240905   gcc-14.1.0
powerpc64             randconfig-001-20240905   gcc-14.1.0
powerpc64             randconfig-002-20240905   gcc-14.1.0
powerpc64             randconfig-003-20240905   clang-20
riscv                             allnoconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240905   gcc-14.1.0
riscv                 randconfig-002-20240905   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240905   clang-20
s390                  randconfig-002-20240905   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240905   gcc-14.1.0
sh                    randconfig-002-20240905   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240905   gcc-14.1.0
sparc64               randconfig-002-20240905   gcc-14.1.0
um                                allnoconfig   clang-17
um                                allnoconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240905   gcc-12
um                    randconfig-002-20240905   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240905   gcc-14.1.0
xtensa                randconfig-002-20240905   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

