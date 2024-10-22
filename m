Return-Path: <linux-usb+bounces-16498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49469A9541
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 03:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14628282A94
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 01:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF4641C94;
	Tue, 22 Oct 2024 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVrbFiSo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887813FF5
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 01:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729559405; cv=none; b=hNJVWLtXtM5OCtubNvaZalG205AJL8X9f7g6TpLZJdSNE/3D6WmwtfxNeP5R9R/r6YHR9U7zHbdNF34XMWel1Rc/0snAT9wxnV5SFJ9PIk8JQgqF+7fnnIF88i5y7rj0IH8mXzuXt8TVTJ/fPvl+07Hu/RLsXM86L+eqfjD4kMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729559405; c=relaxed/simple;
	bh=7TA6swFcKCx6qUMQDBOj402Qt3nqacey9t9CKekAYA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p62YTMsAH2rOe4V8doZKqpEYZPURBq0V/UQsy0U/Ir7I2kNoD06il/mLDghOE8TY9Y+PtPxkF9fLSEF+W19FRDWF9zd6yg4HNj86uKOIrr6CKeWGwRzYmlgV4b94eCB1FnIIAyGrnUBAqyvF9Az+y/RMvlHBCxFrtgi9tRPWpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVrbFiSo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729559402; x=1761095402;
  h=date:from:to:cc:subject:message-id;
  bh=7TA6swFcKCx6qUMQDBOj402Qt3nqacey9t9CKekAYA0=;
  b=aVrbFiSotmKYfmeUCQuHU67Asdfua7DuPmB7+HCr2Ba4SOFinpeSbJoM
   3e72xz3o8nDHAqQjz9nwg3PN0+mIrnTXFRgzXmm4wLiBI7uzE2lFQTcRx
   DNkvJZ1c7aAT3u5r/ZugEAUfHbmlF4AD6AI3I9hITq3PqQYAYgs8fo4yw
   0hpZIERTLxf6BtsaMkn6jlI/KgJOC7e5hKqvsmzatNjlbRwl6lMef+rdd
   9DTHQwdWtaNozgxsN+Jq8rfJ+BUaiMsyoWkFBJO9zepKIhRa5oWcHjwq/
   g4Ejr2UMIQdaBcDLq3u1zw9wmBjFGirY6yrGpuK/RuG+D43ODvQOhmxJX
   g==;
X-CSE-ConnectionGUID: 8JB8ZaCSShe6D6qkN5xRUw==
X-CSE-MsgGUID: 2CmLIeFpR7iwTCyVRpi+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29168951"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29168951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 18:10:02 -0700
X-CSE-ConnectionGUID: bQI/ZJSERzSqnTLsPWWJJA==
X-CSE-MsgGUID: 7iTl1XnnSLitYmotxmM6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="83702905"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2024 18:10:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t33PL-000Sre-0B;
	Tue, 22 Oct 2024 01:09:59 +0000
Date: Tue, 22 Oct 2024 09:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 3cea8af2d1a9ae5869b47c3dabe3b20f331f3bbd
Message-ID: <202410220922.j3tEf2Mh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 3cea8af2d1a9ae5869b47c3dabe3b20f331f3bbd  thunderbolt: Honor TMU requirements in the domain when setting TMU mode

elapsed time: 1098m

configs tested: 188
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241021    gcc-14.1.0
arc                   randconfig-002-20241021    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                             mxs_defconfig    gcc-14.1.0
arm                       omap2plus_defconfig    gcc-14.1.0
arm                   randconfig-001-20241021    gcc-14.1.0
arm                   randconfig-002-20241021    gcc-14.1.0
arm                   randconfig-003-20241021    gcc-14.1.0
arm                   randconfig-004-20241021    gcc-14.1.0
arm                             rpc_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241021    gcc-14.1.0
arm64                 randconfig-002-20241021    gcc-14.1.0
arm64                 randconfig-003-20241021    gcc-14.1.0
arm64                 randconfig-004-20241021    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241021    gcc-14.1.0
csky                  randconfig-002-20241021    gcc-14.1.0
hexagon                          alldefconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241021    gcc-14.1.0
hexagon               randconfig-002-20241021    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241021    clang-18
i386        buildonly-randconfig-002-20241021    clang-18
i386        buildonly-randconfig-003-20241021    clang-18
i386        buildonly-randconfig-004-20241021    clang-18
i386        buildonly-randconfig-005-20241021    clang-18
i386        buildonly-randconfig-006-20241021    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241021    clang-18
i386                  randconfig-002-20241021    clang-18
i386                  randconfig-003-20241021    clang-18
i386                  randconfig-004-20241021    clang-18
i386                  randconfig-005-20241021    clang-18
i386                  randconfig-006-20241021    clang-18
i386                  randconfig-011-20241021    clang-18
i386                  randconfig-012-20241021    clang-18
i386                  randconfig-013-20241021    clang-18
i386                  randconfig-014-20241021    clang-18
i386                  randconfig-015-20241021    clang-18
i386                  randconfig-016-20241021    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241021    gcc-14.1.0
loongarch             randconfig-002-20241021    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                          eyeq6_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241021    gcc-14.1.0
nios2                 randconfig-002-20241021    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241021    gcc-14.1.0
parisc                randconfig-002-20241021    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241021    gcc-14.1.0
powerpc               randconfig-002-20241021    gcc-14.1.0
powerpc               randconfig-003-20241021    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241021    gcc-14.1.0
powerpc64             randconfig-002-20241021    gcc-14.1.0
powerpc64             randconfig-003-20241021    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241021    gcc-14.1.0
riscv                 randconfig-002-20241021    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241021    gcc-14.1.0
s390                  randconfig-002-20241021    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                          landisk_defconfig    gcc-14.1.0
sh                    randconfig-001-20241021    gcc-14.1.0
sh                    randconfig-002-20241021    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sh                             shx3_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241021    gcc-14.1.0
sparc64               randconfig-002-20241021    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241021    gcc-14.1.0
um                    randconfig-002-20241021    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241022    clang-18
x86_64      buildonly-randconfig-002-20241022    clang-18
x86_64      buildonly-randconfig-003-20241022    clang-18
x86_64      buildonly-randconfig-004-20241022    clang-18
x86_64      buildonly-randconfig-005-20241022    clang-18
x86_64      buildonly-randconfig-006-20241022    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241022    clang-18
x86_64                randconfig-002-20241022    clang-18
x86_64                randconfig-003-20241022    clang-18
x86_64                randconfig-004-20241022    clang-18
x86_64                randconfig-005-20241022    clang-18
x86_64                randconfig-006-20241022    clang-18
x86_64                randconfig-011-20241022    clang-18
x86_64                randconfig-012-20241022    clang-18
x86_64                randconfig-013-20241022    clang-18
x86_64                randconfig-014-20241022    clang-18
x86_64                randconfig-015-20241022    clang-18
x86_64                randconfig-016-20241022    clang-18
x86_64                randconfig-071-20241022    clang-18
x86_64                randconfig-072-20241022    clang-18
x86_64                randconfig-073-20241022    clang-18
x86_64                randconfig-074-20241022    clang-18
x86_64                randconfig-075-20241022    clang-18
x86_64                randconfig-076-20241022    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241021    gcc-14.1.0
xtensa                randconfig-002-20241021    gcc-14.1.0
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

