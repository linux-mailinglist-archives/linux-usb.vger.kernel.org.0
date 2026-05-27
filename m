Return-Path: <linux-usb+bounces-38101-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNVUORQBF2p80wcAu9opvQ
	(envelope-from <linux-usb+bounces-38101-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 16:35:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5535E5F2E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 16:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A4803061272
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 14:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A4E4266AA;
	Wed, 27 May 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmOTCCMS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF13644BD
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892329; cv=none; b=FR/lxhtwL/KbxrVpbh/XO1Po4upZQEPwbcqI52NYtpd/BqiMQuuZJ6j+2KxPermCJLBqDO30hxvVdUSFc2JSi6GYYm1g14SWS4TsVdQgQC3cJTU+kM4VhMAa5fGTDchiDpxjv5EpCl4ua7850J4QRwp7585rrXHsBnWD0OSORwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892329; c=relaxed/simple;
	bh=prCok3ZhpoOiyrEO8UpFmI/kjtdZ01F9es3aVwjj3Lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u4Dfe2rzDhSZ6nGFvPNbq1Tn+vzy7cN5QFxfYyVUUnMFmqtPIW4Dws2t4dYUQYPnjfw4c8Ty98WxpyFmJI4kvHV/T9sP6rfEyQgHanRpS9kQ+7+dNszMCNtxiMSscLUiakHHASKTZd4n2uu689ES3a6OjN9WyZm0Gqwju5ohI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmOTCCMS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779892328; x=1811428328;
  h=date:from:to:cc:subject:message-id;
  bh=prCok3ZhpoOiyrEO8UpFmI/kjtdZ01F9es3aVwjj3Lw=;
  b=KmOTCCMSxLlvnNbPaluFPS0uWU7FQKnxg2rX6XZO/V6pVHqUhgHQfgDT
   X/5J7IP1wGf1/rGxznzFyC6SG+xsMCYTYv7R3X2WLc/wBf7Y70AuIw+IQ
   JhniRAsVcmJ4+x4pnwg/9xXy7LtpteBW2SWj0osYxcJBjYitgqtUNDpEn
   SR/qnDCw5hbLD4B4WkaCD0bsh327Q8IPQDvQQEA9Qagc2bVrq6u64Elv9
   FEG/wSosrcSNA9o7H+DH0rLvY3x/Ef7ZWY8Hb1GzWIArG/JMjPIUIq1CE
   k3Jdi7zmR+C9X8poOFo1Mqh+Jk/Gdi4wLl+2Nye5wlA3uZsDnWW7L8MUk
   A==;
X-CSE-ConnectionGUID: q1OKI0nDRM+aK/u6dFW1cA==
X-CSE-MsgGUID: lJx4BF19RB68xtoqRvAX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92196517"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="92196517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:32:07 -0700
X-CSE-ConnectionGUID: N03vBK/ORimtjMaaTwUyUQ==
X-CSE-MsgGUID: PSTcIynATL2ibviPpW6d6g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 May 2026 07:32:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSFIi-0000000043W-0IdH;
	Wed, 27 May 2026 14:32:04 +0000
Date: Wed, 27 May 2026 22:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [westeri-thunderbolt:fixes] BUILD SUCCESS
 4db2bd2ed4785dbadaeeab9f4e346b21ac5fb8eb
Message-ID: <202605272219.DjUPANAs-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38101-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8D5535E5F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git fixes
branch HEAD: 4db2bd2ed4785dbadaeeab9f4e346b21ac5fb8eb  thunderbolt: Limit XDomain response copy to actual frame size

elapsed time: 1346m

configs tested: 54
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

