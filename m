Return-Path: <linux-usb+bounces-18372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AD9EC4EE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 07:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39D97160F39
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 06:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D8B1C4610;
	Wed, 11 Dec 2024 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN4Opb4S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FD6DCE1
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899203; cv=none; b=D5CXMSDjpGVLF318NC5VQ1yfUF0wx0t41F6ekDk8xRNiUfX8Z/+7ifF1KSbAlHmCleOyWnqQ4f2S2yJOyS/M1UoLYZMUH4PFAMnwTcylK7fmSOpIFKpGqaW3KjdvzGHzzBHrkfC664quejVdTTHSZy1iQ43/xs5HWDCt6ddecKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899203; c=relaxed/simple;
	bh=5v80fWVQF8QZigDzyrSV5deatyMjwCTWR78upcS4DwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZwwU7kl57orOysTbvNxKtcK3KA23WDGauN7Jcg/EV9R9/WX1UI5QKHHeBefb8BzcztOq+GlS3RBIyDTzWZ/yE/Z6MpJJ/OywQc7Av1RNvSrdMu3cjeL4o0Tpl7K9o0lQpqJAWflpzNuEF7aenmHWRDOzPOkyjKpA0UDvQufjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CN4Opb4S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733899201; x=1765435201;
  h=date:from:to:cc:subject:message-id;
  bh=5v80fWVQF8QZigDzyrSV5deatyMjwCTWR78upcS4DwY=;
  b=CN4Opb4SMkXQMqtWNYSEew0UkSlPrptxldJvE3uqRGf1F/R38RpPE5fw
   QoeLuqAB8QPVOWtiiafSI0I9IYrQSs3HXo3F0TuBVAW3lSOGR/fMQK4I0
   1biLF5uDKjkrQWjCPOXN0Hnw+okzaGX4XyzVnvezVtr4ehIX21Nft9rML
   QQgjMtLufQP/9CWMJe4Rse59u8EN34onyzv1etOEaYD+eoh/ysE3ZlZ8+
   C7TktIxKrYMW8P6AUvx5PVN6ijrBzLTBudnniyyM8ubb+Pa6GPi6BQYiM
   nkzBmPkIwB3/CYA+4cf9SvD1GccVUlOvP8/frdKHyQh5XZkSHEU7BTK95
   A==;
X-CSE-ConnectionGUID: XflwP/ToQ2G/M7XsqpUwyw==
X-CSE-MsgGUID: QhIQCLLCTaGpHT+eub/A9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34144714"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34144714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:40:00 -0800
X-CSE-ConnectionGUID: HFIfFXFTRSKUIpWrDm+P2A==
X-CSE-MsgGUID: vaiS2+cARcyNZlGVxtQS4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95548345"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 22:39:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLGO4-0006Mv-11;
	Wed, 11 Dec 2024 06:39:56 +0000
Date: Wed, 11 Dec 2024 14:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 8644b48714dca8bf2f42a4ff8311de8efc9bd8c3
Message-ID: <202412111447.X9KjwfTi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 8644b48714dca8bf2f42a4ff8311de8efc9bd8c3  thunderbolt: Add support for Intel Panther Lake-M/P

elapsed time: 1457m

configs tested: 318
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-14.2.0
arc                   randconfig-001-20241211    gcc-14.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-14.2.0
arc                   randconfig-002-20241211    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241210    gcc-14.2.0
arm                   randconfig-001-20241211    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241210    gcc-14.2.0
arm                   randconfig-003-20241211    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241210    gcc-14.2.0
arm                   randconfig-004-20241211    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241210    gcc-14.2.0
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241210    gcc-14.2.0
arm64                 randconfig-002-20241211    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241210    gcc-14.2.0
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241210    gcc-14.2.0
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-001-20241210    gcc-14.2.0
hexagon               randconfig-001-20241211    gcc-14.2.0
hexagon               randconfig-002-20241210    clang-14
hexagon               randconfig-002-20241210    gcc-14.2.0
hexagon               randconfig-002-20241211    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-002-20241211    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-004-20241211    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-005-20241211    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-001-20241211    gcc-12
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-002-20241211    gcc-12
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-003-20241211    gcc-12
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-004-20241211    gcc-12
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-005-20241211    gcc-12
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-006-20241211    gcc-12
i386                  randconfig-007-20241210    clang-19
i386                  randconfig-007-20241211    gcc-12
i386                  randconfig-011-20241210    clang-19
i386                  randconfig-011-20241211    gcc-12
i386                  randconfig-012-20241210    clang-19
i386                  randconfig-012-20241211    gcc-12
i386                  randconfig-013-20241210    clang-19
i386                  randconfig-013-20241211    gcc-12
i386                  randconfig-014-20241210    clang-19
i386                  randconfig-014-20241211    gcc-12
i386                  randconfig-015-20241210    clang-19
i386                  randconfig-015-20241211    gcc-12
i386                  randconfig-016-20241210    clang-19
i386                  randconfig-016-20241211    gcc-12
i386                  randconfig-017-20241210    clang-19
i386                  randconfig-017-20241211    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-001-20241210    gcc-14.2.0
powerpc               randconfig-001-20241211    gcc-14.2.0
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-002-20241210    gcc-14.2.0
powerpc               randconfig-002-20241211    gcc-14.2.0
powerpc               randconfig-003-20241210    clang-20
powerpc               randconfig-003-20241210    gcc-14.2.0
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241211    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241211    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-001-20241211    clang-20
riscv                 randconfig-002-20241210    gcc-14.2.0
riscv                 randconfig-002-20241211    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241210    gcc-14.2.0
s390                  randconfig-002-20241211    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.2.0
sh                             espt_defconfig    clang-20
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-001-20241211    clang-20
sh                    randconfig-002-20241210    gcc-14.2.0
sh                    randconfig-002-20241211    clang-20
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-20
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-001-20241211    clang-20
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc                 randconfig-002-20241211    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-001-20241211    clang-20
sparc64               randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-002-20241211    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-001-20241211    clang-20
um                    randconfig-002-20241210    gcc-12
um                    randconfig-002-20241211    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-002-20241211    gcc-12
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241210    clang-19
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64      buildonly-randconfig-006-20241211    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241210    gcc-12
x86_64                randconfig-001-20241211    clang-19
x86_64                randconfig-002-20241210    gcc-12
x86_64                randconfig-002-20241211    clang-19
x86_64                randconfig-003-20241210    gcc-12
x86_64                randconfig-003-20241211    clang-19
x86_64                randconfig-004-20241210    gcc-12
x86_64                randconfig-004-20241211    clang-19
x86_64                randconfig-005-20241210    gcc-12
x86_64                randconfig-005-20241211    clang-19
x86_64                randconfig-006-20241210    gcc-12
x86_64                randconfig-006-20241211    clang-19
x86_64                randconfig-007-20241210    gcc-12
x86_64                randconfig-007-20241211    clang-19
x86_64                randconfig-008-20241210    gcc-12
x86_64                randconfig-008-20241211    clang-19
x86_64                randconfig-071-20241210    gcc-12
x86_64                randconfig-071-20241211    clang-19
x86_64                randconfig-072-20241210    gcc-12
x86_64                randconfig-072-20241211    clang-19
x86_64                randconfig-073-20241210    gcc-12
x86_64                randconfig-073-20241211    clang-19
x86_64                randconfig-074-20241210    gcc-12
x86_64                randconfig-074-20241211    clang-19
x86_64                randconfig-075-20241210    gcc-12
x86_64                randconfig-075-20241211    clang-19
x86_64                randconfig-076-20241210    gcc-12
x86_64                randconfig-076-20241211    clang-19
x86_64                randconfig-077-20241210    gcc-12
x86_64                randconfig-077-20241211    clang-19
x86_64                randconfig-078-20241210    gcc-12
x86_64                randconfig-078-20241211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-001-20241211    clang-20
xtensa                randconfig-002-20241210    gcc-14.2.0
xtensa                randconfig-002-20241211    clang-20
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

