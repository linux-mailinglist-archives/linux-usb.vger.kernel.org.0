Return-Path: <linux-usb+bounces-21503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9451A56D45
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 17:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA16B165A3F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 16:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7F226D16;
	Fri,  7 Mar 2025 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra+u5oO1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62069226D10
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363948; cv=none; b=negvW0YSFkQ72p3RBlJUacW/52uToqUPmqlvkLH7K1iobPY1ZnUFyKDserwHukxVJKCLap/u1Bo1BOfqH0XuCPhFBHW0NuV5NwMDOZOSQAMVpIvnZVD0knqVgfpK0LhYb8nq4mE7/jdMvXsR/hDSiwMV1FobrJUHHD1zTXzQzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363948; c=relaxed/simple;
	bh=IBHMohq6KLamR42aE9+FDEWZOPmjzumYMVngGsxcrho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NoNhdjc5kj4pg0BCmOuy2leSpLkLACoTGHf6Mm1f/oqTTZH3IcOmnvA1t/JVsjTO7PV3ub+PBQa2cai4UI5lkXfRYr8f2FusqqfxycF5HgN3+t990HWJZbAueGh5fd1nO4UC6cXzk/gJlkR5dHhrMWV3ZdCWmwnXd7+mBK5xKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra+u5oO1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741363946; x=1772899946;
  h=date:from:to:cc:subject:message-id;
  bh=IBHMohq6KLamR42aE9+FDEWZOPmjzumYMVngGsxcrho=;
  b=Ra+u5oO1hgqmi/aup83JZjmmV04RHax8ovL6RMA+9iJeBbr9Pq57lpzE
   Iu6oUAo/L+ltQjJkkSl1yOzxcAEH76WTC4eGJm+p5j0n6x46CL8xDtK7/
   pOFya8Jp7Y02lHkp7KjuiabJL2Zs8yTSVLQlmxVvQJGdKJbxchTj+HxUR
   qFUos28rMw7hVuyNgGezeyonMucNm9ho3ohYFHZxxBkG7H2moJLlB2dUG
   9uNvpDB7sFc/rnxW9DDHBDHm7xXUDs0forKGGVgDFoTG4/i4qJ5mR/cR5
   tAgH1v8UVKp5J6mDFnjDaTWcHie8WzecfMQPuX1Hkkf2AGgSGg5aEbkop
   Q==;
X-CSE-ConnectionGUID: ZNoald7vRT2P4ThDWSdQKA==
X-CSE-MsgGUID: UHHS8Ft9Tie6rn4JRPnLvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64855386"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="64855386"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:12:26 -0800
X-CSE-ConnectionGUID: BkuaYR2IRBKfqhnmXt37uw==
X-CSE-MsgGUID: KXO9SIqsQcy7TEkBZ6mixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119300920"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 08:12:25 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqaJC-0000ip-2D;
	Fri, 07 Mar 2025 16:12:22 +0000
Date: Sat, 08 Mar 2025 00:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 b331a3d8097fad4e541d212684192f21fedbd6e5
Message-ID: <202503080052.3FQPHwhy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: b331a3d8097fad4e541d212684192f21fedbd6e5  xhci: Handle spurious events on Etron host isoc enpoints

elapsed time: 1450m

configs tested: 58
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250307    gcc-14.2.0
csky                 randconfig-002-20250307    gcc-14.2.0
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250307    clang-21
hexagon              randconfig-002-20250307    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250307    gcc-14.2.0
loongarch            randconfig-002-20250307    gcc-14.2.0
nios2                randconfig-001-20250307    gcc-14.2.0
nios2                randconfig-002-20250307    gcc-14.2.0
parisc               randconfig-001-20250307    gcc-14.2.0
parisc               randconfig-002-20250307    gcc-14.2.0
powerpc              randconfig-001-20250307    gcc-14.2.0
powerpc              randconfig-002-20250307    clang-21
powerpc              randconfig-003-20250307    clang-19
powerpc64            randconfig-001-20250307    clang-21
powerpc64            randconfig-002-20250307    gcc-14.2.0
powerpc64            randconfig-003-20250307    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

