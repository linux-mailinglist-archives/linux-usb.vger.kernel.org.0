Return-Path: <linux-usb+bounces-29300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A862BDB555
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 22:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE0B542828
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 20:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0293074AF;
	Tue, 14 Oct 2025 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbLIAHI5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089DF270553
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760475224; cv=none; b=HfJ1ISS4mTE5yQE50U9rAp6mp9gHP+Y8yN2QzxUXVhMUzm/tzseM9w3Bs6YwAfSx/hRw33eZye+7dT/2QZsNejmjy3vhkmhmOMD2xJjeEtTy437gvRc6wbZddLzFaJDcleGue7W3tCZVu74br6OSP8X7nzq0CAt1HtvFF8CNDOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760475224; c=relaxed/simple;
	bh=1Qsmv8jIdZyqeGevMSXQhpXCOoC59DX8Y2CzdF8mCtM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqn4VUKDYn7q9vs4nZ2N49y15igbnIHk9DJdOf92bFjH1frKvxoKXHhc3F1raCSNd2w/bqLt6iboyDIT/YoNzQtHFkQOFhcQXDluorUmxXY+gVGWU0mzhM8hVHJ9uwPUwHqM+LESr8St8s1/+5J2oR5Cn66VfitvrwrkDjOSNqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbLIAHI5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760475223; x=1792011223;
  h=date:from:to:cc:subject:message-id;
  bh=1Qsmv8jIdZyqeGevMSXQhpXCOoC59DX8Y2CzdF8mCtM=;
  b=mbLIAHI5cvVKV9JJ/6frAK7bHHA5Z970C9NI2oJDAO7xdXZKFqnu7/O0
   rlRV7/wXPvCFq1UhcfaODJaKqzcFOPaBYeqgXFq37L84V/rktxjvUXvTL
   2RIJnHvoGcpBLVo32XxIwwZnq6LVAuhD2INGKPR6p4ihtIA6lWeMFj4vJ
   0b6KIRh0XBtYWxjc0lFI/tCqmM4J+n/Iac3M6hiQGrITWQNsvGszzU96q
   MUW3O0Xnj/08rzvvlJxDXGYdSAKBfkq5yiYMQexfqEBVMVpJt7qiwPz+2
   DPf+mP+26Wy2CL2Kg2g/osF7v2t1yOkuVv7XSmbofQSrlB5Od/HHriVUJ
   g==;
X-CSE-ConnectionGUID: 8Ke/eX8FTd2o8qvDF4/1kA==
X-CSE-MsgGUID: j6MMO738S52ClQyjmYGYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62572439"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62572439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 13:53:42 -0700
X-CSE-ConnectionGUID: VJ7aNLk6RlCHmVE3THxD8g==
X-CSE-MsgGUID: pi8Y7lYdSlaP6dnDEi76pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="187292258"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2025 13:53:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8m1a-0003Bl-2N;
	Tue, 14 Oct 2025 20:53:38 +0000
Date: Wed, 15 Oct 2025 04:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 2bbd38fcd29670e46c0fdb9cd0e90507a8a1bf6a
Message-ID: <202510150437.R989Vgjc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 2bbd38fcd29670e46c0fdb9cd0e90507a8a1bf6a  xhci: dbc: enable back DbC in resume if it was enabled before suspend

elapsed time: 727m

configs tested: 233
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    clang-22
arc                   randconfig-001-20251014    gcc-15.1.0
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-002-20251014    gcc-8.5.0
arc                   randconfig-002-20251015    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    clang-22
arm                   randconfig-001-20251014    gcc-15.1.0
arm                   randconfig-001-20251015    gcc-8.5.0
arm                   randconfig-002-20251014    gcc-13.4.0
arm                   randconfig-002-20251015    gcc-8.5.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-004-20251014    gcc-8.5.0
arm                   randconfig-004-20251015    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251014    gcc-9.5.0
arm64                 randconfig-001-20251015    gcc-8.5.0
arm64                 randconfig-002-20251014    gcc-10.5.0
arm64                 randconfig-002-20251015    gcc-8.5.0
arm64                 randconfig-003-20251014    gcc-14.3.0
arm64                 randconfig-003-20251015    gcc-8.5.0
arm64                 randconfig-004-20251014    gcc-14.3.0
arm64                 randconfig-004-20251015    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251014    gcc-15.1.0
csky                  randconfig-001-20251015    clang-22
csky                  randconfig-002-20251014    gcc-13.4.0
csky                  randconfig-002-20251015    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251014    clang-22
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-002-20251014    clang-22
hexagon               randconfig-002-20251015    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251014    gcc-14
i386        buildonly-randconfig-001-20251015    clang-20
i386        buildonly-randconfig-002-20251014    clang-20
i386        buildonly-randconfig-002-20251015    clang-20
i386        buildonly-randconfig-003-20251014    clang-20
i386        buildonly-randconfig-003-20251015    clang-20
i386        buildonly-randconfig-004-20251014    gcc-14
i386        buildonly-randconfig-004-20251015    clang-20
i386        buildonly-randconfig-005-20251014    gcc-14
i386        buildonly-randconfig-005-20251015    clang-20
i386        buildonly-randconfig-006-20251014    clang-20
i386        buildonly-randconfig-006-20251015    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251015    clang-20
i386                  randconfig-002-20251015    clang-20
i386                  randconfig-003-20251015    clang-20
i386                  randconfig-004-20251015    clang-20
i386                  randconfig-005-20251015    clang-20
i386                  randconfig-006-20251015    clang-20
i386                  randconfig-007-20251015    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251014    clang-18
loongarch             randconfig-001-20251015    clang-22
loongarch             randconfig-002-20251014    gcc-15.1.0
loongarch             randconfig-002-20251015    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251014    gcc-11.5.0
nios2                 randconfig-001-20251015    clang-22
nios2                 randconfig-002-20251014    gcc-8.5.0
nios2                 randconfig-002-20251015    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251014    gcc-11.5.0
parisc                randconfig-001-20251015    clang-22
parisc                randconfig-002-20251014    gcc-9.5.0
parisc                randconfig-002-20251015    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251014    gcc-9.5.0
powerpc               randconfig-001-20251015    clang-22
powerpc               randconfig-002-20251014    clang-22
powerpc               randconfig-002-20251015    clang-22
powerpc               randconfig-003-20251014    gcc-14.3.0
powerpc               randconfig-003-20251015    clang-22
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-003-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251015    clang-22
riscv                            alldefconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-001-20251015    clang-22
riscv                 randconfig-002-20251014    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251014    clang-22
s390                  randconfig-001-20251015    clang-22
s390                  randconfig-002-20251014    clang-19
s390                  randconfig-002-20251015    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20251014    gcc-14.3.0
sh                    randconfig-001-20251015    clang-22
sh                    randconfig-002-20251014    gcc-11.5.0
sh                    randconfig-002-20251015    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251014    gcc-15.1.0
sparc                 randconfig-001-20251015    clang-22
sparc                 randconfig-002-20251014    gcc-15.1.0
sparc                 randconfig-002-20251015    clang-22
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251014    clang-20
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-002-20251014    clang-22
sparc64               randconfig-002-20251015    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251014    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-002-20251014    gcc-14
um                    randconfig-002-20251015    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251014    gcc-14
x86_64      buildonly-randconfig-001-20251015    gcc-13
x86_64      buildonly-randconfig-002-20251014    clang-20
x86_64      buildonly-randconfig-002-20251015    gcc-13
x86_64      buildonly-randconfig-003-20251014    gcc-14
x86_64      buildonly-randconfig-003-20251015    gcc-13
x86_64      buildonly-randconfig-004-20251014    clang-20
x86_64      buildonly-randconfig-004-20251015    gcc-13
x86_64      buildonly-randconfig-005-20251014    clang-20
x86_64      buildonly-randconfig-005-20251015    gcc-13
x86_64      buildonly-randconfig-006-20251014    gcc-14
x86_64      buildonly-randconfig-006-20251015    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251015    gcc-14
x86_64                randconfig-072-20251015    gcc-14
x86_64                randconfig-073-20251015    gcc-14
x86_64                randconfig-074-20251015    gcc-14
x86_64                randconfig-075-20251015    gcc-14
x86_64                randconfig-076-20251015    gcc-14
x86_64                randconfig-077-20251015    gcc-14
x86_64                randconfig-078-20251015    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251014    gcc-8.5.0
xtensa                randconfig-001-20251015    clang-22
xtensa                randconfig-002-20251014    gcc-8.5.0
xtensa                randconfig-002-20251015    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

