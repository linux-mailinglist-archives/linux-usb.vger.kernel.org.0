Return-Path: <linux-usb+bounces-31037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B9C92071
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 13:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DCE73ACB89
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 12:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EF2329371;
	Fri, 28 Nov 2025 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpZvvOCj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E21CFBA
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334517; cv=none; b=gLbSHE3YKcHXC/O9j9uii/BPPU9CxdaRM+9/4ykdO2nMgPFkZNURJG5OlTAO87cqxr7Lxst5B8k2/jtoGsoqVZ+KpMjXtAwI9mn+MoHozIS8aHzFMF/CTkZvKEtauw1IDxNTd7Sk0vxqZOjS7djIEb5AjG3xxs5fV14LhTEWUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334517; c=relaxed/simple;
	bh=jnTP99zg4EW5R1/drZayVEp/C8hCezNxqz0PZHldYGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhqsgcDcVUdv/TlnQ4nkH9QJtmv9xdbKfDb1jdtpQZTiNI7Kahh8gcf3mJ9SRDbpl8OTP8fcobc1m2lEaE+5bjuppxchFca2K5wW0Tx0hfANb/xxYBqMN8n1TNgO1pmGHgBNyDafs4Yo3obToHdVIAtJLqzq3G7V+S3lvE3Rqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpZvvOCj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764334515; x=1795870515;
  h=date:from:to:cc:subject:message-id;
  bh=jnTP99zg4EW5R1/drZayVEp/C8hCezNxqz0PZHldYGI=;
  b=UpZvvOCjR1vtsw77BGn/Fcd5NFinOTzBvhjs2BQxYBctpc6Td7BauwBK
   MaqAUoh6G5BkysEICVAz6vrVMGlr4prkfSxP7YKtFzkITggJeYmg2IU/u
   YM7jbb93CTIUeQVpl4rppLaJtktzAtPfRLEKI34lB0/3owKTfYVByrbN8
   rpKSIDaY5ACc54sAeyKfCw9o1y9o7hEq7ZhctQ6niJqCT9UgYFPFcm2jE
   OVXZgv+ejA3L+TrL8GZPPd10ZDyLiHAAYHbRTDNo4GPM6AiubhrPgFVLZ
   UJXSPTCKPjgwMiweVXyMs6MffTnlLiFDbN5YhM3YBEu2LJtkb3X1RIgR1
   w==;
X-CSE-ConnectionGUID: DWCNKNkHTXmxFy86Y1aOJA==
X-CSE-MsgGUID: IGCB3FoySN2sDsZz3Nfu/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76999544"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76999544"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 04:55:15 -0800
X-CSE-ConnectionGUID: izafgUIQSZagmxOYxtQI2A==
X-CSE-MsgGUID: JNzzlchyQZmomk+bKAFNyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197797622"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 04:55:13 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOy0F-000000006OF-2dF9;
	Fri, 28 Nov 2025 12:55:11 +0000
Date: Fri, 28 Nov 2025 20:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-next] BUILD SUCCESS
 c7bbc43a17697edb463ee57cff44fc00c107c72a
Message-ID: <202511282018.utQrjgFk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
branch HEAD: c7bbc43a17697edb463ee57cff44fc00c107c72a  Merge tag 'usb-serial-6.19-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

elapsed time: 1633m

configs tested: 128
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251127    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251127    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251128    gcc-8.5.0
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-003-20251128    gcc-8.5.0
arm                   randconfig-004-20251127    gcc-10.5.0
arm                   randconfig-004-20251128    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251128    gcc-15.1.0
arm64                 randconfig-002-20251128    gcc-15.1.0
arm64                 randconfig-003-20251128    gcc-15.1.0
arm64                 randconfig-004-20251128    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                                defconfig    gcc-15.1.0
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20251128    gcc-15.1.0
loongarch             randconfig-002-20251128    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251128    gcc-8.5.0
nios2                 randconfig-002-20251128    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251128    gcc-14.3.0
parisc                randconfig-002-20251128    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251128    gcc-11.5.0
powerpc               randconfig-002-20251128    clang-22
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-002-20251128    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251128    gcc-11.5.0
riscv                 randconfig-001-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251128    clang-22
s390                  randconfig-001-20251128    gcc-15.1.0
s390                  randconfig-002-20251128    clang-22
s390                  randconfig-002-20251128    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251128    gcc-13.4.0
sh                    randconfig-001-20251128    gcc-15.1.0
sh                    randconfig-002-20251128    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    clang-22
sparc                 randconfig-001-20251128    gcc-8.5.0
sparc                 randconfig-002-20251128    clang-22
sparc                 randconfig-002-20251128    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251128    clang-22
sparc64               randconfig-001-20251128    gcc-12.5.0
sparc64               randconfig-002-20251128    clang-22
sparc64               randconfig-002-20251128    gcc-12.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251128    clang-20
x86_64      buildonly-randconfig-002-20251128    clang-20
x86_64      buildonly-randconfig-003-20251128    clang-20
x86_64      buildonly-randconfig-004-20251128    clang-20
x86_64      buildonly-randconfig-005-20251128    clang-20
x86_64      buildonly-randconfig-006-20251128    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251128    gcc-14
x86_64                randconfig-072-20251128    gcc-14
x86_64                randconfig-073-20251128    gcc-14
x86_64                randconfig-074-20251128    gcc-14
x86_64                randconfig-075-20251128    gcc-14
x86_64                randconfig-076-20251128    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251128    clang-22
xtensa                randconfig-001-20251128    gcc-15.1.0
xtensa                randconfig-002-20251128    clang-22
xtensa                randconfig-002-20251128    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

