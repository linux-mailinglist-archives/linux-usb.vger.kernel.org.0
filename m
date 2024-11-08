Return-Path: <linux-usb+bounces-17380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A724B9C266D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 21:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068E31F23EF2
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 20:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C021D014C;
	Fri,  8 Nov 2024 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqwLqeci"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D925192B6F
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097400; cv=none; b=MLDqLDhfFSzSZ6qSXG6ChxzpjInZ2FHZJY8EmVqF5LHXqIaCRCjb2NjSh/k7d4eQORheRZLdadUfb9XshhXCKkpqE09LiQWwrVaLNYT0hEY6kmjCd8122hVWsen6+5Q0ZYrEgPDGuMa2vzJjs36R48gmFoAzF28fVbO83pwVDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097400; c=relaxed/simple;
	bh=PgK6yN+Of4K9Us8I/V2uVUmrJPMHY6RGu4uHoGSDFqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unoL54Sf4Z1nfuvaP2+dF+ng2Wp/wg6TnVgx185/85M7mF9yEILJHceTEboHDUD0fTzynuwHm8xNvlu7j+QX1g5iaiomrNuKTqM0LNZF3T4s7bhaSTZJq5hqoYHBGqyYvZIdiERMdpJBUqhJNlwXtiLdOU314UBdqmZ6RuK09Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqwLqeci; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731097399; x=1762633399;
  h=date:from:to:cc:subject:message-id;
  bh=PgK6yN+Of4K9Us8I/V2uVUmrJPMHY6RGu4uHoGSDFqY=;
  b=IqwLqeciKUyFE1DPar6nrVbwQzZ0lrSUuifITsIn6ON21qZO8Rt92Ptn
   VaK78Gyz2NsKlZmZtCxtCzk46znWCzo9irLgAKLz16rcMrGEJKpJAZIyD
   N/WB2wuWR/psO4TgyhFOJiZGe2o1vlRtp4s/yIMq3oU9KvhOnp2pfDUf5
   YbpE+aarWyN4yLXg2TXYy6zEeSEg3R3iDlWhFRkP3lWFKS1FLqT111UkR
   ujQDZ0obF4Q+61ETI+QvFPVLSjqaxLELaM/Oo4zZ8wqOawDIs4zHq0qAy
   UE/u/iQLbL7Wvp24sf/rarZLvV9umJgVlkx+/ISHAjeOkQ9b8N/D4ZPP3
   g==;
X-CSE-ConnectionGUID: EPuWXtKeS+igZBQ8cTJ9wg==
X-CSE-MsgGUID: 81kghBzsSwOJFW4NivsnEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41606725"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="41606725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 12:23:18 -0800
X-CSE-ConnectionGUID: S7Azy4n9SPywk/q6RRRL8g==
X-CSE-MsgGUID: fBG0Z1soTqm9I10YSOmpTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="109003877"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2024 12:23:17 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9VVi-000rlW-2i;
	Fri, 08 Nov 2024 20:23:14 +0000
Date: Sat, 09 Nov 2024 04:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 742afcc22d8eb5dcc67c1dc58ed249851e7cdbdf
Message-ID: <202411090413.VjcJGEcz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 742afcc22d8eb5dcc67c1dc58ed249851e7cdbdf  Merge tag 'usb-serial-6.12-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 733m

configs tested: 214
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    clang-14
arc                            hsdk_defconfig    clang-14
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-15
arm                            dove_defconfig    clang-14
arm                          ep93xx_defconfig    clang-14
arm                           h3600_defconfig    gcc-14.2.0
arm                        neponset_defconfig    clang-14
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241108    gcc-14.2.0
arm                           sama7_defconfig    clang-14
arm                           sama7_defconfig    gcc-14.2.0
arm                           tegra_defconfig    clang-15
arm                           u8500_defconfig    clang-14
arm                         wpcm450_defconfig    clang-15
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241108    clang-19
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241108    clang-19
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241108    clang-19
i386                  randconfig-011-20241108    clang-19
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241108    clang-19
i386                  randconfig-016-20241108    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-15
m68k                          atari_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    clang-14
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-15
mips                       bmips_be_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-15
mips                           ip30_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-14
mips                          rb532_defconfig    clang-14
mips                   sb1250_swarm_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-14
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                      arches_defconfig    clang-14
powerpc                       eiger_defconfig    clang-15
powerpc                     ep8248e_defconfig    clang-14
powerpc                        fsp2_defconfig    clang-14
powerpc                  iss476-smp_defconfig    clang-14
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-14
powerpc                     mpc512x_defconfig    clang-14
powerpc                 mpc8313_rdb_defconfig    clang-14
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                 mpc836x_rdk_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    clang-14
powerpc                      pmac32_defconfig    clang-15
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     redwood_defconfig    clang-14
powerpc                     sequoia_defconfig    clang-14
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-15
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             alldefconfig    clang-14
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-15
sh                             espt_defconfig    clang-15
sh                          kfr2r09_defconfig    clang-14
sh                            migor_defconfig    clang-14
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-15
sh                        sh7757lcr_defconfig    clang-15
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241108    clang-19
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64      buildonly-randconfig-005-20241108    clang-19
x86_64      buildonly-randconfig-006-20241108    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241108    clang-19
x86_64                randconfig-002-20241108    clang-19
x86_64                randconfig-003-20241108    clang-19
x86_64                randconfig-004-20241108    clang-19
x86_64                randconfig-005-20241108    clang-19
x86_64                randconfig-006-20241108    clang-19
x86_64                randconfig-011-20241108    clang-19
x86_64                randconfig-012-20241108    clang-19
x86_64                randconfig-013-20241108    clang-19
x86_64                randconfig-014-20241108    clang-19
x86_64                randconfig-015-20241108    clang-19
x86_64                randconfig-016-20241108    clang-19
x86_64                randconfig-071-20241108    clang-19
x86_64                randconfig-072-20241108    clang-19
x86_64                randconfig-073-20241108    clang-19
x86_64                randconfig-074-20241108    clang-19
x86_64                randconfig-075-20241108    clang-19
x86_64                randconfig-076-20241108    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                           alldefconfig    clang-15
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-15
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0
xtensa                         virt_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

