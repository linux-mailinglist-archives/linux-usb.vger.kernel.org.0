Return-Path: <linux-usb+bounces-32666-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id phQSKaFMdGmu4QAAu9opvQ
	(envelope-from <linux-usb+bounces-32666-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 05:37:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6B7C7E7
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 05:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE5D03006B4C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 04:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77AE2F49F6;
	Sat, 24 Jan 2026 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kn4IgOMa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1FE84039
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769229469; cv=none; b=YLG2ZOgGzpV4fQWAwwnafmw4CLdISoL5soirBJaON+E7hjQbv1esSN6L8Ql0cSKNjmJtfrXHOWosnXuQqHT7s1/eRnFnAuVIVpWln+yX5LggzX+WcrDtTKH28odNpwqiMKwq87D6FfLDCWq2MWCGf0DuwyqnUUATfNhQJNiHVD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769229469; c=relaxed/simple;
	bh=TsDPrYiYuFLWiSDz68T/czVo75/8urLMbnJ3o5F8tEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h0NcaPjw2378qkfJ97ToJUDvjOsYRsYkyQjbp8xAdnASQwaOPb4fLt1PK3fd/gLXDxZXGOyvSPpmW5dZl8CrM3gZXwm3+SPF3Mf7nBj0tifuUrCw2l0eOrqy/5D6THS8lNhCDdssuwxcsB1ZmvufHiotOEj3o6uKz6O0QLL0Riw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kn4IgOMa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769229467; x=1800765467;
  h=date:from:to:cc:subject:message-id;
  bh=TsDPrYiYuFLWiSDz68T/czVo75/8urLMbnJ3o5F8tEA=;
  b=Kn4IgOMa12xQoZcUFYT3TX2KpzZA7t29H6yLoJp4VYTfjUj1CNfcJlxZ
   TI3/IIVuISwUb2Zt+cGkKx/PbQ6YUKsCsywWPyTzH8XyLrpZSSJNNs4tj
   uoZN0sPVvBetxtOKbNWGxGFDUz5O4Z+pJ17fTar0QC21iWOacpBcKgkXH
   Pjxh3pgTMi4+H+qbJPwpgOLD5gw5HkDzqAum26n0xbIhnsrtt7Bz+s/CG
   p4urnsQcGa4l7rzLu/zlRLPH72hszezh92JBj4CcEKqzaBg1YbDYmfT9+
   97yNlozuInXrbGa2YN+fDSaYI2Oqsv7Wct9n20XdHZi03NY/SETfb9AM4
   Q==;
X-CSE-ConnectionGUID: b+k9VmYdSlaNNTXwZQPywg==
X-CSE-MsgGUID: +gy2GNZjQUySz5h2blTWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70392236"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70392236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 20:37:46 -0800
X-CSE-ConnectionGUID: P9JA1HrcTYawwECoYl1fow==
X-CSE-MsgGUID: JYj9odidTEG7KAroN44zMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207006488"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2026 20:37:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjVP4-00000000Up5-2LBg;
	Sat, 24 Jan 2026 04:37:42 +0000
Date: Sat, 24 Jan 2026 12:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 72fe00b71067e141908153dda66bc0cebe3094ea
Message-ID: <202601241238.WjfLgqYH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32666-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: EEE6B7C7E7
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 72fe00b71067e141908153dda66bc0cebe3094ea  usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode

elapsed time: 728m

configs tested: 204
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260124    clang-18
arc                   randconfig-002-20260124    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                          pxa168_defconfig    clang-16
arm                   randconfig-001-20260124    clang-18
arm                   randconfig-002-20260124    clang-18
arm                   randconfig-003-20260124    clang-18
arm                   randconfig-004-20260124    clang-18
arm                           sama7_defconfig    clang-16
arm                        spear3xx_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260124    gcc-15.2.0
arm64                 randconfig-002-20260124    gcc-15.2.0
arm64                 randconfig-003-20260124    gcc-15.2.0
arm64                 randconfig-004-20260124    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260124    gcc-15.2.0
csky                  randconfig-002-20260124    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260124    gcc-15.2.0
hexagon               randconfig-002-20260124    gcc-15.2.0
i386                             alldefconfig    clang-16
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260124    gcc-14
i386        buildonly-randconfig-002-20260124    gcc-14
i386        buildonly-randconfig-003-20260124    gcc-14
i386        buildonly-randconfig-004-20260124    gcc-14
i386        buildonly-randconfig-005-20260124    gcc-14
i386        buildonly-randconfig-006-20260124    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260124    gcc-14
i386                  randconfig-002-20260124    gcc-14
i386                  randconfig-003-20260124    gcc-14
i386                  randconfig-004-20260124    gcc-14
i386                  randconfig-005-20260124    gcc-14
i386                  randconfig-006-20260124    gcc-14
i386                  randconfig-007-20260124    gcc-14
i386                  randconfig-011-20260124    clang-20
i386                  randconfig-012-20260124    clang-20
i386                  randconfig-013-20260124    clang-20
i386                  randconfig-014-20260124    clang-20
i386                  randconfig-015-20260124    clang-20
i386                  randconfig-016-20260124    clang-20
i386                  randconfig-017-20260124    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260124    gcc-15.2.0
loongarch             randconfig-002-20260124    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5475evb_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    clang-16
mips                  maltasmvp_eva_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                        qi_lb60_defconfig    clang-16
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260124    gcc-15.2.0
nios2                 randconfig-002-20260124    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260124    gcc-8.5.0
parisc                randconfig-002-20260124    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260124    gcc-8.5.0
powerpc               randconfig-002-20260124    gcc-8.5.0
powerpc64             randconfig-001-20260124    gcc-8.5.0
powerpc64             randconfig-002-20260124    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260124    gcc-8.5.0
riscv                 randconfig-002-20260124    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260124    gcc-8.5.0
s390                  randconfig-002-20260124    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    clang-16
sh                    randconfig-001-20260124    gcc-8.5.0
sh                    randconfig-002-20260124    gcc-8.5.0
sh                   secureedge5410_defconfig    clang-16
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260124    gcc-13.4.0
sparc                 randconfig-002-20260124    gcc-13.4.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260124    gcc-13.4.0
sparc64               randconfig-002-20260124    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260124    gcc-13.4.0
um                    randconfig-002-20260124    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260124    clang-20
x86_64      buildonly-randconfig-002-20260124    clang-20
x86_64      buildonly-randconfig-003-20260124    clang-20
x86_64      buildonly-randconfig-004-20260124    clang-20
x86_64      buildonly-randconfig-005-20260124    clang-20
x86_64      buildonly-randconfig-006-20260124    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260124    gcc-13
x86_64                randconfig-002-20260124    gcc-13
x86_64                randconfig-003-20260124    gcc-13
x86_64                randconfig-004-20260124    gcc-13
x86_64                randconfig-005-20260124    gcc-13
x86_64                randconfig-006-20260124    gcc-13
x86_64                randconfig-011-20260124    gcc-12
x86_64                randconfig-012-20260124    gcc-12
x86_64                randconfig-013-20260124    gcc-12
x86_64                randconfig-014-20260124    gcc-12
x86_64                randconfig-015-20260124    gcc-12
x86_64                randconfig-016-20260124    gcc-12
x86_64                randconfig-071-20260124    gcc-14
x86_64                randconfig-072-20260124    gcc-14
x86_64                randconfig-073-20260124    gcc-14
x86_64                randconfig-074-20260124    gcc-14
x86_64                randconfig-075-20260124    gcc-14
x86_64                randconfig-076-20260124    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260124    gcc-13.4.0
xtensa                randconfig-002-20260124    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

