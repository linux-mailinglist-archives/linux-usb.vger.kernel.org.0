Return-Path: <linux-usb+bounces-16441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED339A4F95
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 18:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 861311C23912
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2024 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C86718B48B;
	Sat, 19 Oct 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6fp5kXu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2032F3E
	for <linux-usb@vger.kernel.org>; Sat, 19 Oct 2024 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729354122; cv=none; b=p3ZMJaSjuyTXONqXNuuiaCK25cs+Qm8Ngh1eIWHjhXBVZyH/VnHjyWyA330Mj4VBgWfIOTnoPM4fhgdYXCTf1153U5xHFJMFq3FOFQzvrwgp4G5AmERx0VazEFFpyEV1FgONiXtR0vYvHdhgDkTnc2S77dB98Y7TobQ1gQn8VUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729354122; c=relaxed/simple;
	bh=Pt+b3BjGGmUjv+VLmrLajZ5SkBU5QlryjRqBcbDbiJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ai8T2ZvEBBm34+n1WDhdhFKJsv+R10G1t5Pp2jGc8YMspEh+C/g0NbOS3pqCH+f8r/ypreldab2k67YlNvihnMD/aM97oMBouSw6OGoVCO1Lpc4XTuvsfendPv666MIS2VcNR1ALDiuWrrmbK0OjzNWIAW+lv4evQwzBM1+afsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6fp5kXu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729354120; x=1760890120;
  h=date:from:to:cc:subject:message-id;
  bh=Pt+b3BjGGmUjv+VLmrLajZ5SkBU5QlryjRqBcbDbiJI=;
  b=S6fp5kXuLJxr9/DtSuqeY+PSLZalmK0Ai9dFqp9Tr/xitDtYB5iiWI0h
   DWSEizr6Ki/lkblxGXE2KzfSys1b7wbjMZbqdLeoAWPpi9OZSz5unfjg+
   EMBVa4xGisaB+Ue7M2iMiDT0YR/qRQFMMum6YpHvyg9tjIpoMnBGvS1Hx
   EinJMl97youAXgqix8uAFG7jWHUjaifY8X/NElKglvq4ENmP4P8a4QhNt
   q47Q3dGffESzQuHAg+WkbGTVmqSv2sEpigYbJiMeqPePeqH1qbka5+xhy
   fInySQs2OEAL3/Jw/02QI3vP77cC/2FhJ/qrk0AM9B0b/1uZ8KQDOgQ8I
   g==;
X-CSE-ConnectionGUID: OXERA79tT7aYs62d3fvhIQ==
X-CSE-MsgGUID: gse2x/cQRw+tBOQFvyDFww==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="54290396"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="54290396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 09:08:39 -0700
X-CSE-ConnectionGUID: uyK3OFmzQ8GjBDQKuYK9WQ==
X-CSE-MsgGUID: PXEH48nfSgSiB3XvdsK/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="78721833"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2024 09:08:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2C0K-000P8v-18;
	Sat, 19 Oct 2024 16:08:36 +0000
Date: Sun, 20 Oct 2024 00:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1154a599214c655c8138b540f13845257f1952fd
Message-ID: <202410200037.cP2P7191-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1154a599214c655c8138b540f13845257f1952fd  Merge tag 'usb-serial-6.12-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 1785m

configs tested: 121
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
arc                     haps_hs_smp_defconfig    clang-20
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       imx_v6_v7_defconfig    clang-20
arm                             mxs_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241019    clang-18
i386        buildonly-randconfig-002-20241019    clang-18
i386        buildonly-randconfig-003-20241019    clang-18
i386        buildonly-randconfig-004-20241019    clang-18
i386        buildonly-randconfig-005-20241019    clang-18
i386        buildonly-randconfig-006-20241019    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241019    clang-18
i386                  randconfig-002-20241019    clang-18
i386                  randconfig-003-20241019    clang-18
i386                  randconfig-004-20241019    clang-18
i386                  randconfig-005-20241019    clang-18
i386                  randconfig-006-20241019    clang-18
i386                  randconfig-011-20241019    clang-18
i386                  randconfig-012-20241019    clang-18
i386                  randconfig-013-20241019    clang-18
i386                  randconfig-014-20241019    clang-18
i386                  randconfig-015-20241019    clang-18
i386                  randconfig-016-20241019    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    clang-20
m68k                        m5407c3_defconfig    clang-20
m68k                       m5475evb_defconfig    clang-20
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                           gcw0_defconfig    clang-20
mips                         rt305x_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                generic-64bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       eiger_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc                     tqm8541_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             alldefconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                      rts7751r2d1_defconfig    clang-20
sh                           se7780_defconfig    clang-20
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

