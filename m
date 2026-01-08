Return-Path: <linux-usb+bounces-32080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975ED0543F
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 18:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFDB330A66C2
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 17:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C675F2EC57F;
	Thu,  8 Jan 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTsZzh49"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E38E2EC560
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 17:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894846; cv=none; b=F9rWme2b4T69EuG1aD3lIs2alTzn/YdlOiWDMprb/B9LU9zuhQhppz6SxAkqwMvgGpDB0geY0db4LHRzggGpksTjKmcTBtfHye64mr0aa7beodfydXDMTG9I3ySxmciupB36rnPk93kTQlJMLOT5nwm2i8CsbIs4EAnOQVE2cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894846; c=relaxed/simple;
	bh=52Vbg7n/fbnBh2GnZTVngZxtgyDvudwbNpFtZxLBBrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qETt2q2GcKMlrMRR8YhQn2+5hYEBm4rUx72qI/8MyfhjKZAhanQ40y3ZSds4FmzfqkduBmqo7L3DcVlmzzMrRxcKuQrBVyIuamW2Dr2dbO2UwkWe6jJiQup2iMZuIY6G4ZoYqSuYaZYX+b+4Sh4CP5nqiBhsbeDPLRQAghj75sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTsZzh49; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767894844; x=1799430844;
  h=date:from:to:cc:subject:message-id;
  bh=52Vbg7n/fbnBh2GnZTVngZxtgyDvudwbNpFtZxLBBrE=;
  b=XTsZzh493hacbT5/jn8HmN8PecFk/vtLpNEXXmzqBl1x5QMWOepJlZ4f
   wskOX6n2NVe4xSf7N74z9+vwMwbMhqs+3jzqutOJNnduG3UcfdeJO349J
   p6PhEUhseL7wpqMBB87YCEx6Lj24ohiNU10X4m5ju6rtrimvAR3lEav9A
   g/EVWE48rMCP4PxADQ+5kr0SYLE6BY50j5Lzf3XiBZVbjiGkY3+XP/8aM
   f1c+aJOg/s9d4NHdwuBdWJ5/ma7MJrI/ZKnhMF/fdP9rHNbyhoQ2E6ZOd
   jz85cbxM+YYaFu1AcPpdQKOXbdt1NjhuqNx1aKZjTxpl1o1cdf66V9CZN
   Q==;
X-CSE-ConnectionGUID: PAunPAJLQWe3Csjr8xb4Sg==
X-CSE-MsgGUID: aeO4hNnNTwiepDjNBcryrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68282867"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="68282867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 09:54:02 -0800
X-CSE-ConnectionGUID: ReH5/XO/Rk2dvS52H92EtQ==
X-CSE-MsgGUID: ysTiGmwsSpGLbQij4o0v1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203697585"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 09:54:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vduCt-0000000051Z-0KNG;
	Thu, 08 Jan 2026 17:53:59 +0000
Date: Fri, 09 Jan 2026 01:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 56a512a9b4107079f68701e7d55da8507eb963d9
Message-ID: <202601090157.DTHeG1IH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 56a512a9b4107079f68701e7d55da8507eb963d9  usb: gadget: f_ncm: align net_device lifecycle with bind/unbind

elapsed time: 1586m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-8.5.0
arm                                 defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20260108    gcc-8.5.0
arm                   randconfig-002-20260108    gcc-13.4.0
arm                   randconfig-003-20260108    clang-17
arm                   randconfig-004-20260108    clang-22
arm                             rpc_defconfig    clang-18
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-15.1.0
arm64                 randconfig-002-20260108    clang-22
arm64                 randconfig-003-20260108    clang-22
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-9.5.0
csky                  randconfig-002-20260108    gcc-11.5.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260108    clang-22
hexagon               randconfig-002-20260108    clang-22
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    gcc-13
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260108    gcc-13
i386                  randconfig-002-20260108    gcc-13
i386                  randconfig-003-20260108    clang-20
i386                  randconfig-004-20260108    clang-20
i386                  randconfig-005-20260108    clang-20
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260108    gcc-12
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-12
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    clang-22
loongarch             randconfig-001-20260108    clang-22
loongarch             randconfig-002-20260108    clang-22
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260108    gcc-8.5.0
nios2                 randconfig-002-20260108    gcc-8.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    gcc-13.4.0
parisc                randconfig-002-20260108    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260108    gcc-13.4.0
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260108    gcc-15.1.0
riscv                 randconfig-002-20260108    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20260108    gcc-13.4.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20260108    gcc-9.5.0
sh                    randconfig-002-20260108    gcc-13.4.0
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    clang-20
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    clang-18
um                    randconfig-002-20260108    clang-22
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    clang-20
x86_64      buildonly-randconfig-002-20260108    clang-20
x86_64      buildonly-randconfig-003-20260108    clang-20
x86_64      buildonly-randconfig-004-20260108    clang-20
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260108    clang-20
x86_64                randconfig-002-20260108    clang-20
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-14
x86_64                randconfig-005-20260108    gcc-14
x86_64                randconfig-006-20260108    gcc-14
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    gcc-14
x86_64                randconfig-015-20260108    gcc-14
x86_64                randconfig-016-20260108    gcc-14
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    clang-20
x86_64                randconfig-076-20260108    clang-20
xtensa                randconfig-001-20260108    gcc-11.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

