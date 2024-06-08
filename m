Return-Path: <linux-usb+bounces-11041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94001901359
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 21:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F187B214D3
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 19:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF051CD2D;
	Sat,  8 Jun 2024 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf+uqqfb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF21A702
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717874721; cv=none; b=sDxUdEyaJAPhjytxy6dPxOHolTY5RCgFFL7QynOXChF4Ce/8jmElDLZ11yG5C5/tFm1HUnv3RikSVs8NCVN9S+Lpx7DriSf10hTqhrGCnJO7M3QHlQrvDSrlmpLbWX3dTBqvRbfRyOb86PZIRDuMyBDbwa0Mp6r9SjHDBxGU3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717874721; c=relaxed/simple;
	bh=cI99bWZgsyE28gw6SuRURjWUQlpJDxSU8ev2w5Mc0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rutxj/n5Zzdx2OUWeovkP4JX2yVNpxB9oNa9DnEnybQACnLyGEXLjdVyZipHuNCDTVnxmyM+WeKBNLKDFeKFqnfaeh9DMskQrxfhwrHZfwMdV5QHttsk7RQp7BGA670T0UZSlmoBhSP9R72loaM221zFkGMW3qwAgFefCGIIWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf+uqqfb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717874719; x=1749410719;
  h=date:from:to:cc:subject:message-id;
  bh=cI99bWZgsyE28gw6SuRURjWUQlpJDxSU8ev2w5Mc0YQ=;
  b=Cf+uqqfbGXGqvtFG/VfBOamFyit9FvrdCOvxQQ5cT8UlM67lVvodBsaP
   qC7ZnTDBbsfYpqKwaCxU2jIi51/9aXoj08mhPUU8x2dSAEjGa6k31Xe6p
   P5JMyWEgBUNQ9BoOrT1ZZdT0Zf92yvE5V2v1v0yRoj4R6RSHwsNSNh3XE
   E3cZQJgt9KPmtzNzD5wDNp1mx7yLYSYQNlBm6GkXEy2CCd1NB7CrxowZg
   uQoM0i+UyEzpgJthpB5Q7L6yB35d9OzaNVxiVHd3i2VvjfFemNkUL6L8C
   FpXVXzoLpGHpg1H7UHyDWvCHYlJGsJhaiHbllGFuk+oFlWw5+9deEkX7o
   w==;
X-CSE-ConnectionGUID: YeielrOWQjyi0ImAO2qFBg==
X-CSE-MsgGUID: LSFHrz71QEur74Mide5ZdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14761310"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14761310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 12:25:18 -0700
X-CSE-ConnectionGUID: 4LCBUWY+Rhu5kqaUXuaM2A==
X-CSE-MsgGUID: MnD2XX/iTOalv8apyV5fng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43088876"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2024 12:25:17 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG1gh-0000Nh-2V;
	Sat, 08 Jun 2024 19:25:15 +0000
Date: Sun, 09 Jun 2024 03:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 1092c4126bf8fa57d7298724d9894ba3b1c07f86
Message-ID: <202406090354.BCEBMMSA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 1092c4126bf8fa57d7298724d9894ba3b1c07f86  Merge tag 'thunderbolt-for-v6.10-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

elapsed time: 1454m

configs tested: 20
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

