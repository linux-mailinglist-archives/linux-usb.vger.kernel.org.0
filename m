Return-Path: <linux-usb+bounces-30313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C89C4B551
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 04:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BBC0434B6E9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 03:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35783313526;
	Tue, 11 Nov 2025 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtmrOsUD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2C261B77
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762832019; cv=none; b=uKL47vFyTCYIyuR685Q4Co5xGBKE40ORWi0wG01KkOQUfQONOl+vaXzD+Xn8oSAOggUPVOVmk8y4m/ZboV9/XEiQTJhbQkqNU0F7SWp+JguYtzr8A1aLdpCvsbZBCRtqwsE/RPSkcRP3Z3ZdG5aSuVBMASlmTOvId1bJzx5T8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762832019; c=relaxed/simple;
	bh=zaW/QrsDOq0fRxtidOXSO9UKDKbJI3oyV1LDnNCValE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HDQU1Rft8neAmlXssn+xhJEuRHlDYAsj8zKi33pwkrIUQVJtd277aop2OVH+swU+8lDRPkjM2xqtdkzh+UvrdQoBRNk83MnyCpvCTIRpESB0VYmlJNimJC93SJWvLbIjUCKmkuYJOQ7t2P23KwKyeAgrbb74Es0vnCoIORQ23CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtmrOsUD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762832018; x=1794368018;
  h=date:from:to:cc:subject:message-id;
  bh=zaW/QrsDOq0fRxtidOXSO9UKDKbJI3oyV1LDnNCValE=;
  b=MtmrOsUDMa9cUAYbcWpQWK36KpH79L+v/kTXuQ1fg1IU98EEsUVPfNjt
   4quXrcvZabsJbcNMSsig/2GkBWkjDMrj1aFsEG6fG10SnXuNIcbE24CU9
   1+FDBy57K3t+Ld4/mhFbtDI/YAp4X4iQuGth58aFwdD3XzhIhZjXw4t+U
   mmrCPjRKDvRiE8KW2ar5DhkT/HqYraxQ6HY/h/z/ZJOzuby9onuJQAm83
   AufEu49N5E5us3LyqcOsxmnUdPLG7FqKQ0CAVvABhVWq6TW8HsiR5NiHH
   qJ43ubJMeQ5Bd/pKxz7sPPh23qZUMGNm59he+57/Jp7u6Gl4ed4mh/oKq
   w==;
X-CSE-ConnectionGUID: +4zsFo4IQ6+z5SNzveg4PA==
X-CSE-MsgGUID: L3eLDACkR5yzX+0rhIs8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68740577"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="68740577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 19:33:37 -0800
X-CSE-ConnectionGUID: 5W9jSyqtTFmW1xYUZCwd8w==
X-CSE-MsgGUID: ivypW4coQy2hoKs+5izLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="194037434"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2025 19:33:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIf8P-0002jN-2q;
	Tue, 11 Nov 2025 03:33:33 +0000
Date: Tue, 11 Nov 2025 11:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 23379a17334fc24c4a9cbd9967d33dcd9323cc7c
Message-ID: <202511111157.y9zYMVbp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 23379a17334fc24c4a9cbd9967d33dcd9323cc7c  usb: typec: ucsi: psy: Set max current to zero when disconnected

elapsed time: 2934m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251110    gcc-11.5.0
arc         randconfig-002-20251110    gcc-9.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251110    clang-22
arm         randconfig-002-20251110    clang-22
arm         randconfig-003-20251110    clang-16
arm         randconfig-004-20251110    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251109    gcc-9.5.0
parisc      randconfig-002-20251109    gcc-13.4.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251109    clang-22
powerpc     randconfig-002-20251109    clang-22
powerpc64   randconfig-001-20251109    gcc-8.5.0
powerpc64   randconfig-002-20251109    gcc-8.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251109    gcc-9.5.0
riscv       randconfig-002-20251109    gcc-8.5.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251109    gcc-14.3.0
s390        randconfig-002-20251109    gcc-8.5.0
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sh          randconfig-001-20251109    gcc-11.5.0
sh          randconfig-002-20251109    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251110    gcc-8.5.0
sparc       randconfig-002-20251110    gcc-13.4.0
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20251110    gcc-14.3.0
sparc64     randconfig-002-20251110    gcc-13.4.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
um                        defconfig    clang-22
um                   i386_defconfig    gcc-14
um          randconfig-001-20251110    gcc-14
um                 x86_64_defconfig    clang-22
x86_64                  allnoconfig    clang-20
x86_64                    defconfig    gcc-14
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251110    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

