Return-Path: <linux-usb+bounces-15832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C918993B2C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 01:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5723284EE4
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 23:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559A718DF65;
	Mon,  7 Oct 2024 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moI+ss5o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2E18CBFD
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 23:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728343585; cv=none; b=eS4K54DhjH03y7/nzb+5HNqEw8QO/JGD5IOlH7ZZFc4ASXwAJ8QfH59iJgO6srPZQqwb/kLTiW5tBT9dWG3rPNXe7HyJ7C/VVp8DiXyhLOp5QhAwuL+1k/yHLB1d/Lw6qIPuTGYmPzmFEM8oSB4FIwoi5Y0/keH7Mh6jdbpeyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728343585; c=relaxed/simple;
	bh=fZHTsXlDSh8DweoazGb9oWLWDpJnknt/JmFXJX7Umzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WlONj97pfKDKhQ2t3L59GYx6J+LNrRN5COLogbJCn5Zca6cluWdA3l05+YDe6CaV72TzI+XX04vHPThG7qzfD0+2bwLM4zfJBDy940o65hf7JPprW90A+0bszs5SK/XsnbOqetn41YJSoEKTR4idvS1gzJl6k6p9gkHGsp9Tw7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moI+ss5o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728343584; x=1759879584;
  h=date:from:to:cc:subject:message-id;
  bh=fZHTsXlDSh8DweoazGb9oWLWDpJnknt/JmFXJX7Umzg=;
  b=moI+ss5oTjmna+0ev7oAWv8k0s75vJ7GonwxyI/LnqYtz6yzT+gEO4OK
   FQWxrL8ZFYF2kFqKHalb7vdn/wnCMO0+/ECRzykZNQrb7l18A67ZYq+a8
   i9OiEXcu3ihZKw1TzhJ3QAGLcaqtXgMIEsoy7l/RpPxYr8fLRae4onRbG
   EMMY3uS6ZiDy+nw4W6j1M50VJytAbV/dZnNOLf8UCEUh8oVleEVH3z2GK
   bhFHlx3T0/6SX4Bsg7XQVebivYqaZCLCpeDoE59Gab+z6YOxzf2ui9rf4
   O8eiyEukzY/f4DKQU/6CutFTZEU+/vFZWQ0kkW0+agZqViKvDRQx42yIF
   g==;
X-CSE-ConnectionGUID: IAFafYVZRheJlnfg7lAB3w==
X-CSE-MsgGUID: YhhVr2OFSzaFTErLeOB6Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50043815"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="50043815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 16:26:23 -0700
X-CSE-ConnectionGUID: sVE/VoGHRg6N/2C+8BgYxg==
X-CSE-MsgGUID: 25iIer3pTbSIrI16V1lq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75474143"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2024 16:26:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxx7M-0005f4-1R;
	Mon, 07 Oct 2024 23:26:20 +0000
Date: Tue, 08 Oct 2024 07:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 39845764a0ca01a89dca4ff5b4e9d896ee410054
Message-ID: <202410080722.LoB0wNjP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 39845764a0ca01a89dca4ff5b4e9d896ee410054  USB: yurex: kill needless initialization in yurex_read

elapsed time: 729m

configs tested: 177
configs skipped: 3

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
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241008    gcc-14.1.0
arc                   randconfig-002-20241008    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-13.2.0
arm                   randconfig-001-20241008    gcc-14.1.0
arm                   randconfig-002-20241008    gcc-14.1.0
arm                   randconfig-003-20241008    gcc-14.1.0
arm                   randconfig-004-20241008    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241008    gcc-14.1.0
arm64                 randconfig-002-20241008    gcc-14.1.0
arm64                 randconfig-003-20241008    gcc-14.1.0
arm64                 randconfig-004-20241008    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241008    gcc-14.1.0
csky                  randconfig-002-20241008    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241008    gcc-14.1.0
hexagon               randconfig-002-20241008    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241008    clang-18
i386        buildonly-randconfig-002-20241008    clang-18
i386        buildonly-randconfig-003-20241008    clang-18
i386        buildonly-randconfig-004-20241008    clang-18
i386        buildonly-randconfig-005-20241008    clang-18
i386        buildonly-randconfig-006-20241008    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241008    clang-18
i386                  randconfig-002-20241008    clang-18
i386                  randconfig-003-20241008    clang-18
i386                  randconfig-004-20241008    clang-18
i386                  randconfig-005-20241008    clang-18
i386                  randconfig-006-20241008    clang-18
i386                  randconfig-011-20241008    clang-18
i386                  randconfig-012-20241008    clang-18
i386                  randconfig-013-20241008    clang-18
i386                  randconfig-014-20241008    clang-18
i386                  randconfig-015-20241008    clang-18
i386                  randconfig-016-20241008    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241008    gcc-14.1.0
loongarch             randconfig-002-20241008    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-13.2.0
mips                      bmips_stb_defconfig    gcc-13.2.0
mips                          eyeq5_defconfig    gcc-13.2.0
mips                           ip27_defconfig    gcc-13.2.0
mips                           ip30_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241008    gcc-14.1.0
nios2                 randconfig-002-20241008    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241008    gcc-14.1.0
parisc                randconfig-002-20241008    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-13.2.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241008    gcc-14.1.0
powerpc               randconfig-002-20241008    gcc-14.1.0
powerpc               randconfig-003-20241008    gcc-14.1.0
powerpc                    sam440ep_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20241008    gcc-14.1.0
powerpc64             randconfig-002-20241008    gcc-14.1.0
powerpc64             randconfig-003-20241008    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241008    gcc-14.1.0
riscv                 randconfig-002-20241008    gcc-14.1.0
s390                             alldefconfig    gcc-13.2.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241008    gcc-14.1.0
s390                  randconfig-002-20241008    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-13.2.0
sh                    randconfig-001-20241008    gcc-14.1.0
sh                    randconfig-002-20241008    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-13.2.0
sh                     sh7710voipgw_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241008    gcc-14.1.0
sparc64               randconfig-002-20241008    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241008    gcc-14.1.0
um                    randconfig-002-20241008    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241008    gcc-12
x86_64      buildonly-randconfig-002-20241008    gcc-12
x86_64      buildonly-randconfig-003-20241008    gcc-12
x86_64      buildonly-randconfig-004-20241008    gcc-12
x86_64      buildonly-randconfig-005-20241008    gcc-12
x86_64      buildonly-randconfig-006-20241008    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241008    gcc-12
x86_64                randconfig-002-20241008    gcc-12
x86_64                randconfig-003-20241008    gcc-12
x86_64                randconfig-004-20241008    gcc-12
x86_64                randconfig-005-20241008    gcc-12
x86_64                randconfig-006-20241008    gcc-12
x86_64                randconfig-011-20241008    gcc-12
x86_64                randconfig-012-20241008    gcc-12
x86_64                randconfig-013-20241008    gcc-12
x86_64                randconfig-014-20241008    gcc-12
x86_64                randconfig-015-20241008    gcc-12
x86_64                randconfig-016-20241008    gcc-12
x86_64                randconfig-071-20241008    gcc-12
x86_64                randconfig-072-20241008    gcc-12
x86_64                randconfig-073-20241008    gcc-12
x86_64                randconfig-074-20241008    gcc-12
x86_64                randconfig-075-20241008    gcc-12
x86_64                randconfig-076-20241008    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241008    gcc-14.1.0
xtensa                randconfig-002-20241008    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

