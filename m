Return-Path: <linux-usb+bounces-37979-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKFzOJxmEmojzAYAu9opvQ
	(envelope-from <linux-usb+bounces-37979-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 04:46:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CAE5C1286
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 04:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55ACB301CF8E
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 02:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC72425B0B1;
	Sun, 24 May 2026 02:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTLY9cT7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5921343899
	for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590775; cv=none; b=b/x044iFyBIZKfvETlB5Npqkf8PGC+VkmeNBzRp2g903eO6trinHEZZi2Jm65/z4yt/KQAaMqxyHCH/y+pPudxahvSw+d68mDpun8dkhXjfQzjAWNtpohWUzN+6lc6Oogynvq8kK7kOg/4DeCaOEs0imx5fDuJfjj0IhtJAkLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590775; c=relaxed/simple;
	bh=3m1zEWhMN8vGn1YKFZg8ZWK0YwkCaqrMpknODGXbGhc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pb0lFvtvuk/935s+qNTEsR1nI/vzob24kU0RG9VRTq0WadEBV+qtwyilMs2rPAjMaogFiPL7kO5rM9OCDzHzyPL6OX+AJIc580gAs4vlc4aBQ5MjA50wOLIICecfsZ76U+s3s0dCP14QMtkd9Qz6y1+UywILNJM/yhRUQsB2Igc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTLY9cT7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779590774; x=1811126774;
  h=date:from:to:cc:subject:message-id;
  bh=3m1zEWhMN8vGn1YKFZg8ZWK0YwkCaqrMpknODGXbGhc=;
  b=KTLY9cT7VgZX1Bi5T6z+mLZc4Zh0pw06ejKYD8tJbnDIGFYfskF5BVf7
   rJ/SngTEeSO7se/c5Jj9/IvF46MEvRiDQS0YxXXLkO500Ann3hT7tH9wJ
   ddOi6YJbbpNspd4fD5uyQcpzZfiPV5MTM7OWO6GWPvAkH7wd8qY+A0CO/
   6Ad2IP3a2kyjNM8L/qaLp4Zi+EJJeQkC9uqbJcJClu6FsXFqWy6qgN3wP
   /zMYE8AP5sF+ihPeuGTmyy2zRFjzY/hOZk4+/VO4zgFuhO2wR0tgDeb/j
   fVzgQWB00k3JXJJTz/tRw+Uba5Y4vmCCm8X52sy2cNdM8iw6vYzOfz82b
   A==;
X-CSE-ConnectionGUID: oMfv50ZgRtGY2cFJSf5Y2A==
X-CSE-MsgGUID: nKQrDPGsSe2+j9AYtZQPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80641900"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80641900"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:46:14 -0700
X-CSE-ConnectionGUID: D4zPtWvfTB6qnIGSldfXmg==
X-CSE-MsgGUID: xF5UpD1nTfSjtnc9VCjEVg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 May 2026 19:46:12 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyqw-000000000cb-0ITu;
	Sun, 24 May 2026 02:46:10 +0000
Date: Sun, 24 May 2026 10:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-linus] BUILD SUCCESS
 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef
Message-ID: <202605241037.SpF3DXn1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37979-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 65CAE5C1286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
branch HEAD: 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef  Merge tag 'usb-serial-7.1-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

elapsed time: 806m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-002-20260524    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-002-20260524    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260524    clang-20
s390                  randconfig-002-20260524    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                    randconfig-001-20260524    gcc-15.2.0
sh                    randconfig-002-20260524    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-005-20260524    clang-20
x86_64      buildonly-randconfig-006-20260524    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

