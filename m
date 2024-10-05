Return-Path: <linux-usb+bounces-15756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0489914F9
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 08:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3EC6B21C34
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 06:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC66485947;
	Sat,  5 Oct 2024 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzOsUWgi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63D43AB3
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110702; cv=none; b=eZT8B+0ezPpQO3KN79WSQVvcWFzozM4gas2yBi/RcjPBhkJfQw9MYOdrEP3q1bXq/afNwtE9xk/SZ19uTjO4YHVzYUdpCMWmZp219O66O7raHe1gPAygM9pLa9Raq8G6Z0qSe7T2Gpdp28JRxChlVcfGH9tsCgWM3/9nvdsL3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110702; c=relaxed/simple;
	bh=0sYOf1tJ9DHc2MmAPqYbsglIIGgRti2aFFm+Dounz04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rwfx6mV2LtnmVoklvkWmXFZPKl1ywODlkFC9Ek9bnVqFas2+Y2/xZ6gkbOlqSL7cOBvGYYC45+DT5hZhq+qYsMSbkfmpQu+/RqfvqMAPcVdE9HovcdTaQs9BUgezddDamDc9w2J9Ra6yPy4Y1XMylAgCqB9HNqziG6fO015/2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzOsUWgi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110701; x=1759646701;
  h=date:from:to:cc:subject:message-id;
  bh=0sYOf1tJ9DHc2MmAPqYbsglIIGgRti2aFFm+Dounz04=;
  b=kzOsUWgin0qF9a8K40ZJf8+kXmPPnS3MmCyRNSc7VSfSnfdIOlzPwGjx
   HIDQ0r2+iXf6tc/RRU/I3h4dzRKRGC/rJPmHvZ0gMnh+OePnfSx/8BQ3I
   anPy0jNAfs9tsWxWe773GgkEwBvLRF6oxrN4Jz6H4N3rS8vHMTn4Akuqg
   LXomFu1+3qFWi9BFWLMZ1j3c0Fr3BDDnEJJ+bbXXkDOY10Gnas1FF4eG2
   0iINrMbezsgRuuvyc9OYAsvUg72RtolmVQujL+etrQEeA2Y9PyhROpL6t
   Gkil8pxCoW8PQPlF+GS1+yRwo0zTGjagdkyXczfHQqOIdfYZml79GUhlV
   Q==;
X-CSE-ConnectionGUID: iasQZJ35TtGcJmWvIPRXvw==
X-CSE-MsgGUID: x5+U9aZsROq7W8PWFbDyjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38465108"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="38465108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:45:01 -0700
X-CSE-ConnectionGUID: 0VS2ki/RSbGyU6EGvj2tkQ==
X-CSE-MsgGUID: G4xWyQGzQriRy+ryUQQWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75353237"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Oct 2024 23:44:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyXA-0002gB-2g;
	Sat, 05 Oct 2024 06:44:56 +0000
Date: Sat, 05 Oct 2024 14:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 4a9fe2a8ac53cc06e53b6e6aff2ca25991d378af
Message-ID: <202410051439.L27j1ZJs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 4a9fe2a8ac53cc06e53b6e6aff2ca25991d378af  dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95

elapsed time: 1016m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-14.1.0
alpha              allyesconfig    clang-20
alpha                 defconfig    gcc-14.1.0
arc                allmodconfig    clang-20
arc                 allnoconfig    gcc-14.1.0
arc                allyesconfig    clang-20
arc                   defconfig    gcc-14.1.0
arm                allmodconfig    clang-20
arm                 allnoconfig    gcc-14.1.0
arm                allyesconfig    clang-20
arm                   defconfig    gcc-14.1.0
arm64              allmodconfig    clang-20
arm64               allnoconfig    gcc-14.1.0
arm64                 defconfig    gcc-14.1.0
csky                allnoconfig    gcc-14.1.0
csky                  defconfig    gcc-14.1.0
hexagon            allmodconfig    clang-20
hexagon             allnoconfig    gcc-14.1.0
hexagon            allyesconfig    clang-20
hexagon               defconfig    gcc-14.1.0
i386               allmodconfig    clang-18
i386                allnoconfig    clang-18
i386               allyesconfig    clang-18
i386                  defconfig    clang-18
loongarch          allmodconfig    gcc-14.1.0
loongarch           allnoconfig    gcc-14.1.0
loongarch             defconfig    gcc-14.1.0
m68k               allmodconfig    gcc-14.1.0
m68k                allnoconfig    gcc-14.1.0
m68k               allyesconfig    gcc-14.1.0
m68k                  defconfig    gcc-14.1.0
microblaze         allmodconfig    gcc-14.1.0
microblaze          allnoconfig    gcc-14.1.0
microblaze         allyesconfig    gcc-14.1.0
microblaze            defconfig    gcc-14.1.0
mips                allnoconfig    gcc-14.1.0
nios2               allnoconfig    gcc-14.1.0
nios2                 defconfig    gcc-14.1.0
openrisc            allnoconfig    gcc-14.1.0
openrisc           allyesconfig    gcc-14.1.0
openrisc              defconfig    gcc-12
parisc             allmodconfig    gcc-14.1.0
parisc              allnoconfig    gcc-14.1.0
parisc             allyesconfig    gcc-14.1.0
parisc                defconfig    gcc-12
parisc64              defconfig    gcc-14.1.0
powerpc            allmodconfig    gcc-14.1.0
powerpc             allnoconfig    gcc-14.1.0
powerpc            allyesconfig    gcc-14.1.0
riscv              allmodconfig    gcc-14.1.0
riscv               allnoconfig    gcc-14.1.0
riscv              allyesconfig    gcc-14.1.0
riscv                 defconfig    gcc-12
s390               allmodconfig    gcc-14.1.0
s390                allnoconfig    clang-20
s390               allyesconfig    gcc-14.1.0
s390                  defconfig    gcc-12
sh                 allmodconfig    gcc-14.1.0
sh                  allnoconfig    gcc-14.1.0
sh                 allyesconfig    gcc-14.1.0
sh                    defconfig    gcc-12
sparc              allmodconfig    gcc-14.1.0
sparc64               defconfig    gcc-12
um                 allmodconfig    clang-20
um                  allnoconfig    clang-17
um                 allyesconfig    clang-20
um                    defconfig    gcc-12
um               i386_defconfig    gcc-12
um             x86_64_defconfig    gcc-12
x86_64              allnoconfig    clang-18
x86_64             allyesconfig    clang-18
x86_64                defconfig    clang-18
x86_64                    kexec    clang-18
x86_64                    kexec    gcc-12
x86_64                 rhel-8.3    gcc-12
x86_64      rhel-8.3-kselftests    gcc-12
x86_64            rhel-8.3-rust    clang-18
xtensa              allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

