Return-Path: <linux-usb+bounces-31958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F32CF8620
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 13:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70725306E59C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 12:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A3D3271F0;
	Tue,  6 Jan 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bes3Kjah"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93533FCC
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767703146; cv=none; b=nGTw6VTW/lzZtI9Ceii3rpHTwW5lJKhUyUeFgM9lkp+N9d/PhHVElodpI5/CKxyE1F5wZVipfD1sIEm/mtJGRcogfqOPSLBullHET0tkcuFJKBrVemtG9eW+li4IBwgE/d4dARa4CzKug2DxzEi3yYxWOvYe0mLh5cTf7JL/Yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767703146; c=relaxed/simple;
	bh=zEk1xdxpNTVu3w2UyTyy99kP6HWPRveDZuFopCfljPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DeqL4A9Fjq4xGAa3AORTbq4SgHOF8uNIIEyT1tQ7EB6PRjQGSQTzGpyOC2VSzSfgGps+qkbHQbal/Y2PK/IB4cqxAPUjWdlmkwt96eg+Te1lvebBomaLju0CF0/SFqL70XKyUB4vKkQIAgJafEBi0YaUYxpX8/fhx+05GHcOYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bes3Kjah; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767703143; x=1799239143;
  h=date:from:to:cc:subject:message-id;
  bh=zEk1xdxpNTVu3w2UyTyy99kP6HWPRveDZuFopCfljPY=;
  b=bes3Kjahwu9Neo8QUNrClchOuNQtRtU4RFWCjLAQIaOZ0PBJcnw9tcpJ
   apzrH5gtVe5p+tUIkrQmLtKb5RApt/LEB3M6zOAfl9JRB59l23G5BS9Hf
   qgH74h+Tc5uRG3LL3pIg0/wrT5E7C1O+ns23tzEtd/LrWW8GdUd0cBS6d
   0fYUVPRGXWCae3RuOeAGQi7hmQbxIpk72q+fWQW6HTt0BxXghv8CVSw5N
   9g0AQ0pSHYWdjlSveeTPQil/giQh1709aoD1Bh4IThyy2stJztPsH8FUi
   XvzvFL1vhpeHyuh/coc6vmSf3KZz0hMeK652VbQ5goPzyhoKmNIB8vQHw
   A==;
X-CSE-ConnectionGUID: 8VtXo/kpQea7HgNwmpDKQA==
X-CSE-MsgGUID: uNHAZrlDQSeTxxyKB7oYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69116961"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69116961"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 04:39:02 -0800
X-CSE-ConnectionGUID: FIu+AJknSwGbqF+xfoBf5Q==
X-CSE-MsgGUID: mzIVod3ERwGTeSCidPyY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202893073"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jan 2026 04:39:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd6Kw-000000001wo-2LHM;
	Tue, 06 Jan 2026 12:38:58 +0000
Date: Tue, 06 Jan 2026 20:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:next] BUILD SUCCESS
 062191adfde0b11b01656ea6db51a9385fa3d104
Message-ID: <202601062045.OibzVezl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
branch HEAD: 062191adfde0b11b01656ea6db51a9385fa3d104  thunderbolt: Log path activation failures without WARN backtraces

elapsed time: 1520m

configs tested: 141
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-13.4.0
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20260106    gcc-13.4.0
arm                   randconfig-002-20260106    gcc-13.4.0
arm                   randconfig-003-20260106    gcc-13.4.0
arm                   randconfig-004-20260106    gcc-13.4.0
arm                         s5pv210_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    gcc-10.5.0
arm64                 randconfig-002-20260106    gcc-10.5.0
arm64                 randconfig-003-20260106    gcc-10.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20260106    gcc-8.5.0
hexagon               randconfig-002-20260106    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    clang-20
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    clang-20
i386        buildonly-randconfig-006-20260106    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-002-20260106    clang-20
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-006-20260106    clang-20
i386                  randconfig-007-20260106    clang-20
i386                  randconfig-011-20260106    gcc-14
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    gcc-14
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    gcc-14
i386                  randconfig-017-20260106    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-8.5.0
loongarch             randconfig-002-20260106    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       alldefconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20260106    gcc-8.5.0
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-002-20260106    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-002-20260106    gcc-8.5.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260106    gcc-8.5.0
sh                    randconfig-002-20260106    gcc-8.5.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260106    gcc-8.5.0
sparc                 randconfig-002-20260106    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260106    gcc-8.5.0
sparc64               randconfig-002-20260106    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    gcc-8.5.0
um                    randconfig-002-20260106    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-002-20260106    clang-20
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-004-20260106    clang-20
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-006-20260106    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260106    clang-20
x86_64                randconfig-002-20260106    clang-20
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    clang-20
x86_64                randconfig-006-20260106    clang-20
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-14
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    gcc-14
x86_64                randconfig-016-20260106    gcc-14
x86_64                randconfig-071-20260106    clang-20
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    clang-20
x86_64                randconfig-076-20260106    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260106    gcc-8.5.0
xtensa                randconfig-002-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

