Return-Path: <linux-usb+bounces-24282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A7AC2FB8
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 14:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB5F189A3BD
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 12:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA97112B93;
	Sat, 24 May 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTOrIF4V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922BA26AC3
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748089918; cv=none; b=m+bWssFso3R+Ku7Y2AsnevwGriezpiZgloUyWSN/yHrnCDh2wW/SFhZX/gtaVwqi1HVBlcgzaKQbX2K1QF2qXNWM+iYM1uJZ4ayf3NJh5qxNHkvaaI7UAU5lOCIGnX+Nm8dYr//r4ClIS0EJtW0TrGoSCqDW5QMOU4iQXPMDK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748089918; c=relaxed/simple;
	bh=BV9eCBdv52tbOAQeCldTyB2V3FUsCFQJeVYhijdaopA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AmpBBmopAN/3JayB32jRxbgDLfWD+dwoGqv8kxbJN3a2l686bd8bMp1rR+8CtDhVeLT/ZU0OZKEy1VvevthCgfXe20j7LeUvczDFU5xWvTAqjFPRVAolBk3K4GlYQ6Sm6Pg1XeWh32pATdqpu/RpCJFaiJSnh0dn0r5sAIAMoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTOrIF4V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748089915; x=1779625915;
  h=date:from:to:cc:subject:message-id;
  bh=BV9eCBdv52tbOAQeCldTyB2V3FUsCFQJeVYhijdaopA=;
  b=QTOrIF4V5j8X3Fjfqo/vOyGh8r0zi3s1y4RflfA+mi5DJAQORxSTM3vB
   zo40Ny1BivoCp3N/2ofaGFVA/cyhMDTYDNCuXOsxGXdIqjlWq+uyeymL6
   XL36rMO0U2p822Y+e3ofiZARVtN95NfNBKPrHvp0HqfUHL1dXkjByzgy1
   zjQEfNtORTmshDxKLsOM/sUiKiB/sY7DbpOSoTBnKcQqHw6dRTvA9/Oou
   N25szrYq/eaSYlj7ZBd4IfmrJ37R671+/25kHdgFvrqrDIDlOVYg9w61y
   zGn8vUZYwEVzz4Pj9HtaPL3Aie2Wm94jUj6+UYoc8OG3FQbwcBtFssJZz
   A==;
X-CSE-ConnectionGUID: eLfzA68aSmqwcPnifTF7KQ==
X-CSE-MsgGUID: g0TGfg4gTIeioxGCdM6EGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="52753636"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="52753636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 05:31:55 -0700
X-CSE-ConnectionGUID: w1p0Lg+rQmGllvj2ewFzdg==
X-CSE-MsgGUID: /qn8TL58RMGHa8ITAJhuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="172503748"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2025 05:31:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIo2Z-000RCl-2w;
	Sat, 24 May 2025 12:31:51 +0000
Date: Sat, 24 May 2025 20:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS WITH WARNING
 882826f58b2c48cafc7084a799207e76f2c74fe0
Message-ID: <202505242025.di67Rg6c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 882826f58b2c48cafc7084a799207e76f2c74fe0  ALSA: usb-audio: qcom: fix USB_XHCI dependency

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505220522.rT5u07uk-lkp@intel.com

    sound/usb/qcom/qc_audio_offload.c:1019: warning: Excess function parameter 'xfer_buf' description in 'uaudio_transfer_buffer_setup'
    sound/usb/qcom/qc_audio_offload.c:1019: warning: Function parameter or struct member 'xfer_buf_cpu' not described in 'uaudio_transfer_buffer_setup'

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arc-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arm-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arm-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- arm64-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- hexagon-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- hexagon-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- i386-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- i386-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- loongarch-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- loongarch-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- m68k-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- m68k-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- microblaze-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- mips-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- openrisc-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- parisc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- parisc-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- powerpc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- powerpc-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- riscv-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- riscv-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- s390-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- s390-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- sparc-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- um-allmodconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
|-- um-allyesconfig
|   |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
|   `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup
`-- x86_64-allyesconfig
    |-- sound-usb-qcom-qc_audio_offload.c:warning:Excess-function-parameter-xfer_buf-description-in-uaudio_transfer_buffer_setup
    `-- sound-usb-qcom-qc_audio_offload.c:warning:Function-parameter-or-struct-member-xfer_buf_cpu-not-described-in-uaudio_transfer_buffer_setup

elapsed time: 1430m

configs tested: 127
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250523    gcc-15.1.0
arc                   randconfig-002-20250523    gcc-10.5.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250523    clang-16
arm                   randconfig-002-20250523    gcc-8.5.0
arm                   randconfig-003-20250523    gcc-7.5.0
arm                   randconfig-004-20250523    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250523    gcc-8.5.0
arm64                 randconfig-002-20250523    clang-16
arm64                 randconfig-003-20250523    clang-21
arm64                 randconfig-004-20250523    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250523    gcc-10.5.0
csky                  randconfig-002-20250523    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250523    clang-21
hexagon               randconfig-002-20250523    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250523    clang-20
i386        buildonly-randconfig-002-20250523    clang-20
i386        buildonly-randconfig-003-20250523    clang-20
i386        buildonly-randconfig-004-20250523    clang-20
i386        buildonly-randconfig-005-20250523    clang-20
i386        buildonly-randconfig-006-20250523    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250523    gcc-15.1.0
loongarch             randconfig-002-20250523    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250523    gcc-10.5.0
nios2                 randconfig-002-20250523    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250523    gcc-9.3.0
parisc                randconfig-002-20250523    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250523    clang-21
powerpc               randconfig-002-20250523    clang-21
powerpc               randconfig-003-20250523    clang-20
powerpc                     skiroot_defconfig    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250523    clang-21
powerpc64             randconfig-002-20250523    clang-19
powerpc64             randconfig-003-20250523    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250523    gcc-8.5.0
riscv                 randconfig-002-20250523    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250523    gcc-6.5.0
s390                  randconfig-002-20250523    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250523    gcc-12.4.0
sh                    randconfig-002-20250523    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250523    gcc-10.3.0
sparc                 randconfig-002-20250523    gcc-10.3.0
sparc64               randconfig-001-20250523    gcc-9.3.0
sparc64               randconfig-002-20250523    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250523    gcc-12
um                    randconfig-002-20250523    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250523    gcc-12
x86_64      buildonly-randconfig-002-20250523    clang-20
x86_64      buildonly-randconfig-003-20250523    clang-20
x86_64      buildonly-randconfig-004-20250523    clang-20
x86_64      buildonly-randconfig-005-20250523    clang-20
x86_64      buildonly-randconfig-006-20250523    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250523    gcc-9.3.0
xtensa                randconfig-002-20250523    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

