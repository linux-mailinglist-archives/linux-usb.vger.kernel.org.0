Return-Path: <linux-usb+bounces-11796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A4F91C9CB
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 02:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3851283480
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 00:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403880B;
	Sat, 29 Jun 2024 00:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cvdaex9w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96A3FC2
	for <linux-usb@vger.kernel.org>; Sat, 29 Jun 2024 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719621567; cv=none; b=XCsUM87jwu9a8Mn4KP4V4V7rV+qlC1mcdAwXGFwGzwXrjyJ5t9+0esddu4rsmSFbK+GwNO/34QK9FBZRqzbjnsBTaWDUNekMzlQhTE0cxGO3lUF4qK2awZKTmvsJ8g5n9jUBjJnf+QVm3xg5m4nRgtlZE/WEokNielyryEC4lng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719621567; c=relaxed/simple;
	bh=Zkzr6b31lgmRSyDAljLHYf+AtrS0GPC5X+RgsSHOoGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5jDQqumsGJrtvwTE9NU6xsC63OgrTmW6k3pd4oakaNFGsNxcfpEKNVo05QvllZ0jHQjITAvYDFhtD5k/q6rQ7qE+N2TznBIfA23M6mPeAnraLsyFgbOnLw7MCB0K2ApdJFt75ZXI+2t/dAWQyv9/0G9ROFLSmwedXtZpnphygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cvdaex9w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719621566; x=1751157566;
  h=date:from:to:cc:subject:message-id;
  bh=Zkzr6b31lgmRSyDAljLHYf+AtrS0GPC5X+RgsSHOoGI=;
  b=Cvdaex9wFh0whjo9m7bnJ+EQ69Oy47nH8Oe72iCT2sPAnqyaq1df7k4B
   QwkKOj2DDGBi+mCuBz0TuvjnDl5RkHVC9pUmKDxz8cCuysnmVkPVAnM29
   fFD3ZZWy3OsK83LMCrBEGFV9f8GUtcjQUc+PkrS9vq/H2/P3rJLtxvMFX
   Wvyh69gQ1AQ1fx00yIkD0qz1xrQsixhFD2w5dEJU5+LeferA7xQOqXUih
   7gG5iv6DiECHnBWMrfbJa+NpHo9kLXBdlUujcisueFRf1lqNh6BY4aZ6G
   1C/QSiC9aOsgeP3K8ErWTr9I44NgaZa+6xVS6ANRnlC3FP1r3kt7M0wBi
   g==;
X-CSE-ConnectionGUID: Pz4NWF+HTfeMysXMjxEWog==
X-CSE-MsgGUID: bV/GRVsSRZ+aR9io4HWHww==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16772278"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16772278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 17:39:25 -0700
X-CSE-ConnectionGUID: Id2SQrwVR7O5Z3QdaMpjrA==
X-CSE-MsgGUID: /nhl+WqXSm+NoHNLa1feSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44806127"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2024 17:39:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNM7e-000Imi-0E;
	Sat, 29 Jun 2024 00:39:22 +0000
Date: Sat, 29 Jun 2024 08:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 fc1d1a712b517bbcb383b1f1f7ef478e7d0579f2
Message-ID: <202406290802.BP1Th88S-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: fc1d1a712b517bbcb383b1f1f7ef478e7d0579f2  usb: dwc3: core: Workaround for CSR read timeout

elapsed time: 2013m

configs tested: 58
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-002-20240628   gcc-13
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-003-20240628   gcc-13
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-004-20240628   gcc-13
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-005-20240628   clang-18
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-006-20240628   gcc-10
i386         buildonly-randconfig-006-20240628   gcc-13
i386         buildonly-randconfig-006-20240629   gcc-7
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-002-20240628   gcc-13
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-003-20240628   clang-18
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-004-20240628   gcc-13
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-005-20240628   clang-18
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-006-20240628   gcc-13
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-011-20240628   clang-18
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-012-20240628   gcc-9
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-013-20240628   gcc-13
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-014-20240628   clang-18
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-015-20240628   gcc-13
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-016-20240628   gcc-10
i386                  randconfig-016-20240628   gcc-7
i386                  randconfig-016-20240629   gcc-7
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

