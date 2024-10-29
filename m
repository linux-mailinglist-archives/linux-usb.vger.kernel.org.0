Return-Path: <linux-usb+bounces-16839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E949B5432
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 21:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD581F24507
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 20:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91BA208208;
	Tue, 29 Oct 2024 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDj6xhvL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B64A207A26
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234315; cv=none; b=dE2ztZsC8F3fO8XXVVL3xt0EKWSlfB3NrPCQQHz4yIqiU6qQuhSzC/d+rWs8lRVzHRw3Ibv3o1yCpEkTJLM4lqkcAQMiChEduS8FVGAQ1qYpksgG2j4I1C0t5xA8b2/0GOpaBV3K3avU4Rz4sWQLVl1V5yfJILdaJGpY/8tSs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234315; c=relaxed/simple;
	bh=+o9NbaPyGogJ3ZSEbnIsWXzDLnJ3MUKdmQZg9gnG4wY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Elu8Fg5teAuO3O7U7404ZLE3U7MH06wDPyFFp063DVbgLRJIfTNhgL6lN630IkO8KvLZRPcVeqOBvwrs/+E5ZdhCIte4WL3GpgE52ztGAqCgpaTfL/M7hpe7Qt/uHYt2HWgliAPKisMezCx+nUsIaORkiOE93A0WtPOhkcT/sCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDj6xhvL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730234314; x=1761770314;
  h=date:from:to:cc:subject:message-id;
  bh=+o9NbaPyGogJ3ZSEbnIsWXzDLnJ3MUKdmQZg9gnG4wY=;
  b=JDj6xhvL75/vxIBgHBxMBpgxiouPnopA2HEHbSJQ61A+OGtUP3cj3MZs
   aPsO1deBr3O5YipPP/YV/g6dSP/620sh/gBMBYyETfUNLtuI+xpKmbEio
   HD3rQ72yK/a2Zpx4OOZPch+mKLM5Gv0Q1nbMN6uXWZ7YXIVr0DYaAvp/r
   Bd7BxcRWiLSmNJ0NVJZkh/jUILayza9uHmIQxtLpiA9vMp6c/OhUtmDyb
   kCvPXIl2+QMtLTN5Afmt1xRb6UXlMcWkHssddJnrRNZ8Q2gX1ngbWdLFN
   QO+XveIYSpUEulONishiVJgCvvZ86Y5UbtOzdGk2u/NefRzUFRHTzbtz2
   g==;
X-CSE-ConnectionGUID: aPtGTaq5QOiC0bxPRaqfLg==
X-CSE-MsgGUID: na/3/iF3T4yhqbmHBx1Unw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47386746"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="47386746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 13:38:33 -0700
X-CSE-ConnectionGUID: 12HeqPTMQ1OBnV6X0xYLIQ==
X-CSE-MsgGUID: 8CcT62UUSmasKDrLbWlw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="86643526"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 13:38:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5syw-000e7k-1a;
	Tue, 29 Oct 2024 20:38:26 +0000
Date: Wed, 30 Oct 2024 04:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 afb92ad8733ef0a2843cc229e4d96aead80bc429
Message-ID: <202410300407.Cz0waFsa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: afb92ad8733ef0a2843cc229e4d96aead80bc429  usb: typec: tcpm: restrict SNK_WAIT_CAPABILITIES_TIMEOUT transitions to non self-powered devices

elapsed time: 981m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-14.1.0
alpha         allyesconfig    clang-20
alpha            defconfig    gcc-14.1.0
arc           allmodconfig    clang-20
arc           allmodconfig    gcc-13.2.0
arc            allnoconfig    gcc-14.1.0
arc           allyesconfig    clang-20
arc           allyesconfig    gcc-13.2.0
arc              defconfig    gcc-14.1.0
arm           allmodconfig    clang-20
arm           allmodconfig    gcc-14.1.0
arm            allnoconfig    gcc-14.1.0
arm           allyesconfig    clang-20
arm           allyesconfig    gcc-14.1.0
arm              defconfig    gcc-14.1.0
arm64         allmodconfig    clang-20
arm64          allnoconfig    gcc-14.1.0
arm64            defconfig    gcc-14.1.0
csky           allnoconfig    gcc-14.1.0
csky             defconfig    gcc-14.1.0
hexagon       allmodconfig    clang-20
hexagon        allnoconfig    gcc-14.1.0
hexagon       allyesconfig    clang-20
hexagon          defconfig    gcc-14.1.0
i386          allmodconfig    clang-19
i386          allmodconfig    gcc-12
i386           allnoconfig    clang-19
i386           allnoconfig    gcc-12
i386          allyesconfig    clang-19
i386          allyesconfig    gcc-12
i386             defconfig    clang-19
loongarch     allmodconfig    gcc-14.1.0
loongarch      allnoconfig    gcc-14.1.0
loongarch        defconfig    gcc-14.1.0
m68k          allmodconfig    gcc-14.1.0
m68k           allnoconfig    gcc-14.1.0
m68k          allyesconfig    gcc-14.1.0
m68k             defconfig    gcc-14.1.0
microblaze    allmodconfig    gcc-14.1.0
microblaze     allnoconfig    gcc-14.1.0
microblaze    allyesconfig    gcc-14.1.0
microblaze       defconfig    gcc-14.1.0
mips           allnoconfig    gcc-14.1.0
nios2          allnoconfig    gcc-14.1.0
nios2            defconfig    gcc-14.1.0
openrisc       allnoconfig    clang-20
openrisc      allyesconfig    gcc-14.1.0
parisc        allmodconfig    gcc-14.1.0
parisc         allnoconfig    clang-20
parisc        allyesconfig    gcc-14.1.0
parisc64         defconfig    gcc-14.1.0
powerpc       allmodconfig    gcc-14.1.0
powerpc        allnoconfig    clang-20
powerpc       allyesconfig    gcc-14.1.0
riscv         allmodconfig    gcc-14.1.0
riscv          allnoconfig    clang-20
riscv         allyesconfig    gcc-14.1.0
s390          allmodconfig    clang-20
s390          allmodconfig    gcc-14.1.0
s390           allnoconfig    clang-20
s390          allyesconfig    gcc-14.1.0
sh            allmodconfig    gcc-14.1.0
sh             allnoconfig    gcc-14.1.0
sh            allyesconfig    gcc-14.1.0
sparc         allmodconfig    gcc-14.1.0
um            allmodconfig    clang-20
um             allnoconfig    clang-20
um            allyesconfig    clang-20
x86_64         allnoconfig    clang-19
x86_64        allyesconfig    clang-19
x86_64           defconfig    clang-19
x86_64           defconfig    gcc-11
x86_64               kexec    clang-19
x86_64               kexec    gcc-12
x86_64            rhel-8.3    gcc-12
x86_64        rhel-8.3-bpf    clang-19
x86_64      rhel-8.3-kunit    clang-19
x86_64        rhel-8.3-ltp    clang-19
x86_64       rhel-8.3-rust    clang-19
xtensa         allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

