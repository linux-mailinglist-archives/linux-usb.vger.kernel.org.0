Return-Path: <linux-usb+bounces-8346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1C88B7BB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 03:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7482E7C6E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 02:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C8012839D;
	Tue, 26 Mar 2024 02:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IT3Ydzwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74661CA82
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711421630; cv=none; b=RVPtb5pH3zCtUb0d+Ap4vRipvWj+oIs6wLJSSXgP1bCZSrRpVB+4Cg/De+SWB2FtokUGfRe/VAtX30zjGTfWdQ8yYK/jvvWEAnXazNRew5ZZYFRNCOV8YHKPmhOazvQvG3KAgsv/RgmLXZ9FrPtYPfnV+rwz0YcguXo+Bn3jOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711421630; c=relaxed/simple;
	bh=KzaaaKc0KWIcvj0CteSiczO/5CgoGKu7YnrBlxG+TvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t/4OSvIS7FUgs1X2PG0tZ4cUT+4XFlgeUsSbkca2cCS/mcuIuHr1XeCYTLNCO/JX+N/jG5TaRvfIq4mS8BZt66omJCQMbFburUxDRp9Xtmf580SKwPHrpvIAUkfSD8WPdWy6catVtE5ZPHvJ6ILzzF49GFvn6iQFhh6UfQQqyG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IT3Ydzwa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711421629; x=1742957629;
  h=date:from:to:cc:subject:message-id;
  bh=KzaaaKc0KWIcvj0CteSiczO/5CgoGKu7YnrBlxG+TvA=;
  b=IT3YdzwaeJE6jiX+NSToHYO8CS7inCXJ4fmfEGr89pVxKILgqKzqVacl
   bw804GtOMwkbkltULHg+vitPO8TMQflM9NyWGPWZHR6otxQV85WxRGLm1
   fXwI07ZYi13JbHshEl4qWuob7nNYoYueG9u72ymf+FkCV1V14oo7Jnl7r
   eoM7cNlw9c5VXRQlZ2OAQvsj1MB5oF3IbRGuJ3UuFxrJprura/AkIbaOJ
   lm5Lxj5um4aQB4FcAgwsjsIajmCkFXrLV4uovC6yuVEF6+nU3K/7k/ZXl
   oTMQTqrG16FWLyJVIW7l0JtvBAYNCdhdNs3Lu6DHWlTCNx8kDp7m7rw1x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="28934790"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="28934790"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 19:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="20540559"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2024 19:53:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rowwa-000N4k-0J;
	Tue, 26 Mar 2024 02:53:44 +0000
Date: Tue, 26 Mar 2024 10:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:gadget_char] BUILD SUCCESS
 8ea5252749a313594ee60e95253fa29192fe441c
Message-ID: <202403261000.YgE2SV1V-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git gadget_char
branch HEAD: 8ea5252749a313594ee60e95253fa29192fe441c  USB: gadget: dummy_hcd: switch char * to u8 *

elapsed time: 816m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240326   gcc  
arc                   randconfig-002-20240326   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240326   gcc  
arm                   randconfig-002-20240326   gcc  
arm                   randconfig-003-20240326   gcc  
arm                   randconfig-004-20240326   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         s5pv210_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                       spear13xx_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240326   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240326   gcc  
csky                  randconfig-002-20240326   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240326   gcc  
i386         buildonly-randconfig-002-20240326   clang
i386         buildonly-randconfig-003-20240326   clang
i386         buildonly-randconfig-004-20240326   gcc  
i386         buildonly-randconfig-005-20240326   gcc  
i386         buildonly-randconfig-006-20240326   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240326   gcc  
i386                  randconfig-002-20240326   gcc  
i386                  randconfig-003-20240326   gcc  
i386                  randconfig-004-20240326   clang
i386                  randconfig-005-20240326   gcc  
i386                  randconfig-006-20240326   clang
i386                  randconfig-011-20240326   clang
i386                  randconfig-012-20240326   gcc  
i386                  randconfig-013-20240326   clang
i386                  randconfig-014-20240326   clang
i386                  randconfig-015-20240326   clang
i386                  randconfig-016-20240326   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240326   gcc  
loongarch             randconfig-002-20240326   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240326   gcc  
nios2                 randconfig-002-20240326   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240326   gcc  
parisc                randconfig-002-20240326   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   microwatt_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-002-20240326   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240326   gcc  
powerpc64             randconfig-002-20240326   gcc  
powerpc64             randconfig-003-20240326   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240326   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240326   gcc  
sh                    randconfig-002-20240326   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240326   gcc  
sparc64               randconfig-002-20240326   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240326   gcc  
um                    randconfig-002-20240326   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240326   gcc  
x86_64       buildonly-randconfig-004-20240326   gcc  
x86_64       buildonly-randconfig-005-20240326   gcc  
x86_64       buildonly-randconfig-006-20240326   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240326   gcc  
x86_64                randconfig-002-20240326   gcc  
x86_64                randconfig-003-20240326   gcc  
x86_64                randconfig-005-20240326   gcc  
x86_64                randconfig-011-20240326   gcc  
x86_64                randconfig-013-20240326   gcc  
x86_64                randconfig-014-20240326   gcc  
x86_64                randconfig-072-20240326   gcc  
x86_64                randconfig-073-20240326   gcc  
x86_64                randconfig-074-20240326   gcc  
x86_64                randconfig-075-20240326   gcc  
x86_64                randconfig-076-20240326   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240326   gcc  
xtensa                randconfig-002-20240326   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

