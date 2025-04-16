Return-Path: <linux-usb+bounces-23132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE60A90453
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 15:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9B9190616D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D0F1ADC97;
	Wed, 16 Apr 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUy3Eha2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9919B3EE
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810143; cv=none; b=ZSl8tAc1n/Y43Cbn2S97XDFAWKXhIzAGqSb0/Zs6AVUljPtlIW7BmJWVBYk8NMW2XYO4DROIbKBAgzv5Nn/IVYhz1prfyCvosVArGBSCA2Xw10arFYdjnqb209LG59cXotZytVeGHDkyUyYR+X+QnpqU+TZ/h82ySOUUiNe3Tb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810143; c=relaxed/simple;
	bh=DMxVatlBYyF0+GYr0EhZBjB0OpzmVDwOFUSACAO3oGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hOl+4cCY5Gzb0RTRTY1qT0HLXWrm0plcWk/cac+At4ixnZH1w4Ls0htktFq/qlUf58BZaBzZ1Z3Ivujt32l/n72+iqkLHul7lL/HiZ/okcfWnqW8aAXTw3xEX6MxRMnHSqnhUneb4kXwgJHkDvK6+aXatt0L7n4ZspU5g3LbDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUy3Eha2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744810141; x=1776346141;
  h=date:from:to:cc:subject:message-id;
  bh=DMxVatlBYyF0+GYr0EhZBjB0OpzmVDwOFUSACAO3oGI=;
  b=JUy3Eha2707TpIkv6EsWZKHpxp3b7AOxWWS7STAtOJiQDpyzIGIikvDd
   c4p2yDp89YXoirSNMqeAptZxGqWLdg+tCPHz4uWMxA9SbcWTey20BKWju
   Wa9xYjNiVi6ch1SnfWoNJrO+ZM7w/9ImTMPBiJwDAGe7eSLjtYL3GtmoP
   jYiNkEywrKn7UkHJ7hwb1ZxHAg73PKTZbPJgAGwo3TMVhTcmKtMJW6vRo
   eYruLnuqZ+IuM7rta2CkFs4hPlYDstWD4MzDJi3qsIKogwoV2O/L5ayhD
   Me9nfZLt27eaMTfztiEtR3Np/JG2EkrDSs3Le6DxUz3TVApC6ARY1a2L+
   Q==;
X-CSE-ConnectionGUID: auMEhvM0TyaZkLGkahGWjQ==
X-CSE-MsgGUID: cp7odWq7SmCqmQrxo0xwPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68848698"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="68848698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:29:00 -0700
X-CSE-ConnectionGUID: 9pZljFF3TM6knEq/mq1IYA==
X-CSE-MsgGUID: diuVDPOzQIGSMqi01hQTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161442622"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2025 06:28:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u52oy-000JnC-2Z;
	Wed, 16 Apr 2025 13:28:56 +0000
Date: Wed, 16 Apr 2025 21:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 429a98abfc01d3d4378b7a00969437dc3e8f647c
Message-ID: <202504162139.eYcd5x68-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 429a98abfc01d3d4378b7a00969437dc3e8f647c  usb: typec: class: Unlocked on error in typec_register_partner()

elapsed time: 1446m

configs tested: 218
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250415    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-7.5.0
arc                   randconfig-002-20250415    gcc-14.2.0
arc                   randconfig-002-20250416    gcc-7.5.0
arc                           tb10x_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250415    clang-21
arm                   randconfig-001-20250416    gcc-7.5.0
arm                   randconfig-002-20250415    clang-21
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250415    gcc-10.5.0
arm                   randconfig-003-20250416    gcc-7.5.0
arm                   randconfig-004-20250415    gcc-6.5.0
arm                   randconfig-004-20250416    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                 randconfig-001-20250415    clang-16
arm64                 randconfig-001-20250416    gcc-7.5.0
arm64                 randconfig-002-20250415    gcc-7.5.0
arm64                 randconfig-002-20250416    gcc-7.5.0
arm64                 randconfig-003-20250415    gcc-9.5.0
arm64                 randconfig-003-20250416    gcc-7.5.0
arm64                 randconfig-004-20250415    gcc-9.5.0
arm64                 randconfig-004-20250416    gcc-7.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                  randconfig-001-20250415    gcc-13.3.0
csky                  randconfig-001-20250416    gcc-7.5.0
csky                  randconfig-002-20250415    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-7.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250415    clang-20
hexagon               randconfig-001-20250416    gcc-7.5.0
hexagon               randconfig-002-20250415    clang-21
hexagon               randconfig-002-20250416    gcc-7.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-002-20250416    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-003-20250416    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-004-20250416    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250415    gcc-12
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250416    clang-20
i386                  randconfig-002-20250416    clang-20
i386                  randconfig-003-20250416    clang-20
i386                  randconfig-004-20250416    clang-20
i386                  randconfig-005-20250416    clang-20
i386                  randconfig-006-20250416    clang-20
i386                  randconfig-007-20250416    clang-20
i386                  randconfig-011-20250416    gcc-12
i386                  randconfig-012-20250416    gcc-12
i386                  randconfig-013-20250416    gcc-12
i386                  randconfig-014-20250416    gcc-12
i386                  randconfig-015-20250416    gcc-12
i386                  randconfig-016-20250416    gcc-12
i386                  randconfig-017-20250416    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch             randconfig-001-20250415    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-7.5.0
loongarch             randconfig-002-20250415    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-7.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                          eyeq5_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250415    gcc-13.3.0
nios2                 randconfig-001-20250416    gcc-7.5.0
nios2                 randconfig-002-20250415    gcc-7.5.0
nios2                 randconfig-002-20250416    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250415    gcc-12.4.0
parisc                randconfig-001-20250416    gcc-7.5.0
parisc                randconfig-002-20250415    gcc-10.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250415    gcc-5.5.0
powerpc               randconfig-001-20250416    gcc-7.5.0
powerpc               randconfig-002-20250415    clang-17
powerpc               randconfig-002-20250416    gcc-7.5.0
powerpc               randconfig-003-20250415    gcc-7.5.0
powerpc               randconfig-003-20250416    gcc-7.5.0
powerpc64             randconfig-001-20250415    gcc-7.5.0
powerpc64             randconfig-001-20250416    gcc-7.5.0
powerpc64             randconfig-002-20250415    clang-17
powerpc64             randconfig-002-20250416    gcc-7.5.0
powerpc64             randconfig-003-20250415    gcc-10.5.0
powerpc64             randconfig-003-20250416    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-001-20250416    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
riscv                 randconfig-002-20250416    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-001-20250416    gcc-14.2.0
s390                  randconfig-002-20250415    gcc-7.5.0
s390                  randconfig-002-20250416    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250415    gcc-9.3.0
sh                    randconfig-002-20250416    gcc-14.2.0
sh                           se7721_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-001-20250416    gcc-14.2.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc                 randconfig-002-20250416    gcc-14.2.0
sparc                       sparc64_defconfig    clang-21
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-001-20250416    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-002-20250416    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-001-20250416    gcc-14.2.0
um                    randconfig-002-20250415    clang-21
um                    randconfig-002-20250416    gcc-14.2.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250415    clang-20
x86_64      buildonly-randconfig-001-20250416    clang-20
x86_64      buildonly-randconfig-002-20250415    gcc-11
x86_64      buildonly-randconfig-002-20250416    clang-20
x86_64      buildonly-randconfig-003-20250415    gcc-12
x86_64      buildonly-randconfig-003-20250416    clang-20
x86_64      buildonly-randconfig-004-20250415    clang-20
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250415    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250415    gcc-12
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250416    gcc-12
x86_64                randconfig-002-20250416    gcc-12
x86_64                randconfig-003-20250416    gcc-12
x86_64                randconfig-004-20250416    gcc-12
x86_64                randconfig-005-20250416    gcc-12
x86_64                randconfig-006-20250416    gcc-12
x86_64                randconfig-007-20250416    gcc-12
x86_64                randconfig-008-20250416    gcc-12
x86_64                randconfig-071-20250416    gcc-12
x86_64                randconfig-072-20250416    gcc-12
x86_64                randconfig-073-20250416    gcc-12
x86_64                randconfig-074-20250416    gcc-12
x86_64                randconfig-075-20250416    gcc-12
x86_64                randconfig-076-20250416    gcc-12
x86_64                randconfig-077-20250416    gcc-12
x86_64                randconfig-078-20250416    gcc-12
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-001-20250416    gcc-14.2.0
xtensa                randconfig-002-20250415    gcc-10.5.0
xtensa                randconfig-002-20250416    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

