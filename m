Return-Path: <linux-usb+bounces-38180-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM+HFWUSG2rM+wgAu9opvQ
	(envelope-from <linux-usb+bounces-38180-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:37:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C060E4E2
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 18:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 665FA3013A68
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 16:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A8834C9AF;
	Sat, 30 May 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8AarYTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085D1DE4EF
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158724; cv=none; b=BmDMgh190DXTYhF5DC8B783uPcRi+vK18jx3G7jGIry+mR2eneOAH73sKXEwlhG+FQUnLPK5xH10kX+peNepjyCT2QGk2cNV3DbJQGB+xuS7Ju2vrsGHPcFrOYBmW1xYa6jMBzdvIob5jiyCj07MfCevSdWwyXR/pM3iP+qdF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158724; c=relaxed/simple;
	bh=TXay2aGh+5LAjK4dv8Rl2u8/pw7H7zoHIIM5Njc89cI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o6QJLTq54UuTilKGxSdux2mz3VKn0cRSfNnDOQEjLVHXnm67CJD2Y8AhsR/b0qwq99SdH+rPYqmyH/7jS7zgNb/2gQqukgeHjbksGg9BcfkI96rhHqjse0GMDSMVtMnOa0ICk1+DcNcHF5k8ONVPlJ7PRC4cu19ZKgMSJNwVYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8AarYTn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780158722; x=1811694722;
  h=date:from:to:cc:subject:message-id;
  bh=TXay2aGh+5LAjK4dv8Rl2u8/pw7H7zoHIIM5Njc89cI=;
  b=U8AarYTnOkt5ji33/0+Y4iu3SY8n+Ib1QIwTm8/FUcjv8hRSgHQ3/eBe
   54BHXf4IbPAnfaBM35pQIWCOnwrMSP1tgX5HmlWZZWAJfiME6jNRAMSm8
   p5tD6m2C7UVwEcqOshg8zt2z1nsFvssgUJesOzGeIw5EMSMgd6z8jK+40
   Laexx0tQ6diEbUfTZ3amjfFb8FUpig20V3cyL35HevPCoybfx3oTIf1sk
   uMpodUQxu1JdegvNbEOOcRt509s2vU499E3fbizCwyv6aojF8yvDC2lkx
   18l5lkA8by6RZGnXSOK8waaVIyyPvh25xF4dmmJeyTPzjSPb1v2RcXpID
   w==;
X-CSE-ConnectionGUID: gmacsd2HSoqpq87FlhWQYQ==
X-CSE-MsgGUID: 2NDVNUgQT72/662TArROFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="68515040"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68515040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 09:32:02 -0700
X-CSE-ConnectionGUID: dcRBTdIyR1SYHsjNUpfoYQ==
X-CSE-MsgGUID: WwKYnp1XQ5WVzlvUKjmrdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="238944816"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2026 09:32:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTMbN-000000008fG-3s8e;
	Sat, 30 May 2026 16:31:57 +0000
Date: Sun, 31 May 2026 00:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 22d91cef94b5b86cff0d68ebfce7741740672704
Message-ID: <202605310013.Y0FPWFFX-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-38180-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: EE2C060E4E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 22d91cef94b5b86cff0d68ebfce7741740672704  usb: cdnsp: Add support for device-only configuration

elapsed time: 11741m

configs tested: 879
configs skipped: 37

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    clang-23
arc                            randconfig-001    gcc-13.4.0
arc                   randconfig-001-20260523    gcc-10.5.0
arc                   randconfig-001-20260524    clang-23
arc                   randconfig-001-20260526    gcc-13.4.0
arc                   randconfig-001-20260527    gcc-11.5.0
arc                   randconfig-001-20260528    clang-23
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-001-20260530    gcc-14.3.0
arc                            randconfig-002    clang-23
arc                            randconfig-002    gcc-13.4.0
arc                   randconfig-002-20260523    gcc-14.3.0
arc                   randconfig-002-20260524    clang-23
arc                   randconfig-002-20260526    gcc-13.4.0
arc                   randconfig-002-20260527    gcc-11.5.0
arc                   randconfig-002-20260528    clang-23
arc                   randconfig-002-20260529    clang-23
arc                   randconfig-002-20260530    gcc-14.3.0
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    clang-17
arm                        multi_v7_defconfig    gcc-15.2.0
arm                            randconfig-001    clang-23
arm                            randconfig-001    gcc-13.4.0
arm                   randconfig-001-20260523    gcc-10.5.0
arm                   randconfig-001-20260524    clang-23
arm                   randconfig-001-20260527    gcc-11.5.0
arm                   randconfig-001-20260528    clang-23
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-001-20260530    gcc-14.3.0
arm                            randconfig-002    clang-23
arm                            randconfig-002    gcc-13.4.0
arm                   randconfig-002-20260523    clang-19
arm                   randconfig-002-20260524    clang-23
arm                   randconfig-002-20260526    gcc-13.4.0
arm                   randconfig-002-20260527    gcc-11.5.0
arm                   randconfig-002-20260528    clang-23
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-002-20260530    gcc-14.3.0
arm                            randconfig-003    clang-23
arm                            randconfig-003    gcc-13.4.0
arm                   randconfig-003-20260523    clang-23
arm                   randconfig-003-20260524    clang-23
arm                   randconfig-003-20260526    gcc-13.4.0
arm                   randconfig-003-20260527    gcc-11.5.0
arm                   randconfig-003-20260528    clang-23
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-003-20260530    gcc-14.3.0
arm                            randconfig-004    clang-23
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260523    gcc-10.5.0
arm                   randconfig-004-20260524    clang-23
arm                   randconfig-004-20260526    gcc-13.4.0
arm                   randconfig-004-20260527    gcc-11.5.0
arm                   randconfig-004-20260528    clang-23
arm                   randconfig-004-20260529    clang-23
arm                   randconfig-004-20260530    gcc-14.3.0
arm                             rpc_defconfig    clang-18
arm                           spitz_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260523    gcc-15.2.0
arm64                 randconfig-001-20260526    gcc-8.5.0
arm64                 randconfig-001-20260528    gcc-15.2.0
arm64                 randconfig-001-20260529    clang-23
arm64                 randconfig-001-20260530    gcc-8.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260523    gcc-8.5.0
arm64                 randconfig-002-20260526    gcc-8.5.0
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-002-20260529    clang-23
arm64                 randconfig-002-20260530    gcc-8.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260523    gcc-9.5.0
arm64                 randconfig-003-20260526    gcc-8.5.0
arm64                 randconfig-003-20260528    gcc-15.2.0
arm64                 randconfig-003-20260529    clang-23
arm64                 randconfig-003-20260530    gcc-8.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260523    clang-23
arm64                 randconfig-004-20260526    gcc-8.5.0
arm64                 randconfig-004-20260528    gcc-15.2.0
arm64                 randconfig-004-20260529    clang-23
arm64                 randconfig-004-20260530    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260523    gcc-9.5.0
csky                  randconfig-001-20260526    gcc-8.5.0
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                  randconfig-001-20260530    gcc-10.5.0
csky                  randconfig-001-20260530    gcc-8.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260523    gcc-15.2.0
csky                  randconfig-002-20260526    gcc-8.5.0
csky                  randconfig-002-20260528    gcc-15.2.0
csky                  randconfig-002-20260529    clang-23
csky                  randconfig-002-20260530    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    clang-17
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260523    clang-23
hexagon               randconfig-001-20260524    gcc-8.5.0
hexagon               randconfig-001-20260526    gcc-11.5.0
hexagon               randconfig-001-20260527    gcc-11.5.0
hexagon               randconfig-001-20260528    gcc-11.5.0
hexagon               randconfig-001-20260529    gcc-11.5.0
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-001-20260530    clang-17
hexagon               randconfig-001-20260530    clang-23
hexagon               randconfig-001-20260530    gcc-11.5.0
hexagon                        randconfig-002    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260523    clang-23
hexagon               randconfig-002-20260524    gcc-8.5.0
hexagon               randconfig-002-20260526    gcc-11.5.0
hexagon               randconfig-002-20260527    gcc-11.5.0
hexagon               randconfig-002-20260528    gcc-11.5.0
hexagon               randconfig-002-20260529    gcc-11.5.0
hexagon               randconfig-002-20260529    gcc-8.5.0
hexagon               randconfig-002-20260530    clang-17
hexagon               randconfig-002-20260530    clang-23
hexagon               randconfig-002-20260530    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260523    gcc-14
i386        buildonly-randconfig-001-20260524    gcc-14
i386        buildonly-randconfig-001-20260526    clang-20
i386        buildonly-randconfig-001-20260527    clang-20
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-001-20260529    gcc-12
i386        buildonly-randconfig-001-20260530    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260523    clang-20
i386        buildonly-randconfig-002-20260524    gcc-14
i386        buildonly-randconfig-002-20260526    clang-20
i386        buildonly-randconfig-002-20260527    clang-20
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-002-20260529    gcc-12
i386        buildonly-randconfig-002-20260530    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260523    gcc-14
i386        buildonly-randconfig-003-20260524    gcc-14
i386        buildonly-randconfig-003-20260526    clang-20
i386        buildonly-randconfig-003-20260527    clang-20
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-003-20260529    gcc-12
i386        buildonly-randconfig-003-20260530    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260523    gcc-12
i386        buildonly-randconfig-004-20260524    gcc-14
i386        buildonly-randconfig-004-20260526    clang-20
i386        buildonly-randconfig-004-20260527    clang-20
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-004-20260529    gcc-12
i386        buildonly-randconfig-004-20260530    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260523    clang-20
i386        buildonly-randconfig-005-20260524    gcc-14
i386        buildonly-randconfig-005-20260526    clang-20
i386        buildonly-randconfig-005-20260527    clang-20
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-005-20260529    gcc-12
i386        buildonly-randconfig-005-20260530    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260523    gcc-14
i386        buildonly-randconfig-006-20260524    gcc-14
i386        buildonly-randconfig-006-20260526    clang-20
i386        buildonly-randconfig-006-20260527    clang-20
i386        buildonly-randconfig-006-20260528    clang-20
i386        buildonly-randconfig-006-20260529    gcc-12
i386        buildonly-randconfig-006-20260530    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260523    gcc-14
i386                  randconfig-001-20260524    gcc-14
i386                  randconfig-001-20260526    gcc-14
i386                  randconfig-001-20260527    gcc-14
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-001-20260529    gcc-14
i386                  randconfig-001-20260530    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260523    gcc-12
i386                  randconfig-002-20260524    gcc-14
i386                  randconfig-002-20260526    gcc-14
i386                  randconfig-002-20260527    gcc-14
i386                  randconfig-002-20260528    gcc-14
i386                  randconfig-002-20260529    gcc-14
i386                  randconfig-002-20260530    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260523    gcc-14
i386                  randconfig-003-20260524    gcc-14
i386                  randconfig-003-20260526    gcc-14
i386                  randconfig-003-20260527    gcc-14
i386                  randconfig-003-20260528    gcc-14
i386                  randconfig-003-20260529    gcc-14
i386                  randconfig-003-20260530    clang-20
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260523    gcc-12
i386                  randconfig-004-20260524    gcc-14
i386                  randconfig-004-20260526    gcc-14
i386                  randconfig-004-20260527    gcc-14
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-004-20260529    gcc-14
i386                  randconfig-004-20260530    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260523    gcc-14
i386                  randconfig-005-20260524    gcc-14
i386                  randconfig-005-20260526    gcc-14
i386                  randconfig-005-20260527    gcc-14
i386                  randconfig-005-20260528    gcc-14
i386                  randconfig-005-20260529    gcc-14
i386                  randconfig-005-20260530    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260523    gcc-14
i386                  randconfig-006-20260524    gcc-14
i386                  randconfig-006-20260526    gcc-14
i386                  randconfig-006-20260527    gcc-14
i386                  randconfig-006-20260528    gcc-14
i386                  randconfig-006-20260529    gcc-14
i386                  randconfig-006-20260530    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260523    gcc-14
i386                  randconfig-007-20260524    gcc-14
i386                  randconfig-007-20260526    gcc-14
i386                  randconfig-007-20260527    gcc-14
i386                  randconfig-007-20260528    gcc-14
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-007-20260530    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260523    gcc-14
i386                  randconfig-011-20260526    gcc-14
i386                  randconfig-011-20260527    clang-20
i386                  randconfig-011-20260528    clang-20
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-011-20260530    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260523    gcc-14
i386                  randconfig-012-20260526    gcc-14
i386                  randconfig-012-20260527    clang-20
i386                  randconfig-012-20260528    clang-20
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-012-20260530    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260523    gcc-14
i386                  randconfig-013-20260526    gcc-14
i386                  randconfig-013-20260527    clang-20
i386                  randconfig-013-20260528    clang-20
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-013-20260530    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260523    clang-20
i386                  randconfig-014-20260526    gcc-14
i386                  randconfig-014-20260527    clang-20
i386                  randconfig-014-20260528    clang-20
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-014-20260530    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260523    clang-20
i386                  randconfig-015-20260526    gcc-14
i386                  randconfig-015-20260527    clang-20
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-015-20260530    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260523    clang-20
i386                  randconfig-016-20260526    gcc-14
i386                  randconfig-016-20260527    clang-20
i386                  randconfig-016-20260528    clang-20
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-016-20260530    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260523    clang-20
i386                  randconfig-017-20260526    gcc-14
i386                  randconfig-017-20260527    clang-20
i386                  randconfig-017-20260528    clang-20
i386                  randconfig-017-20260529    gcc-14
i386                  randconfig-017-20260530    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    clang-23
loongarch                      randconfig-001    clang-18
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260523    gcc-15.2.0
loongarch             randconfig-001-20260524    gcc-8.5.0
loongarch             randconfig-001-20260526    gcc-11.5.0
loongarch             randconfig-001-20260527    gcc-11.5.0
loongarch             randconfig-001-20260528    gcc-11.5.0
loongarch             randconfig-001-20260529    gcc-11.5.0
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-001-20260530    clang-17
loongarch             randconfig-001-20260530    clang-23
loongarch             randconfig-001-20260530    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch                      randconfig-002    gcc-13.4.0
loongarch             randconfig-002-20260523    gcc-15.2.0
loongarch             randconfig-002-20260524    gcc-8.5.0
loongarch             randconfig-002-20260526    gcc-11.5.0
loongarch             randconfig-002-20260527    gcc-11.5.0
loongarch             randconfig-002-20260528    gcc-11.5.0
loongarch             randconfig-002-20260529    gcc-11.5.0
loongarch             randconfig-002-20260529    gcc-8.5.0
loongarch             randconfig-002-20260530    clang-17
loongarch             randconfig-002-20260530    clang-23
loongarch             randconfig-002-20260530    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5208evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           gcw0_defconfig    clang-23
mips                        qi_lb60_defconfig    clang-23
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-17
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260523    gcc-11.5.0
nios2                 randconfig-001-20260524    gcc-8.5.0
nios2                 randconfig-001-20260526    gcc-11.5.0
nios2                 randconfig-001-20260527    gcc-11.5.0
nios2                 randconfig-001-20260528    gcc-11.5.0
nios2                 randconfig-001-20260529    gcc-11.5.0
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-001-20260530    clang-17
nios2                 randconfig-001-20260530    clang-23
nios2                 randconfig-001-20260530    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260523    gcc-9.5.0
nios2                 randconfig-002-20260524    gcc-8.5.0
nios2                 randconfig-002-20260526    gcc-11.5.0
nios2                 randconfig-002-20260527    gcc-11.5.0
nios2                 randconfig-002-20260528    gcc-11.5.0
nios2                 randconfig-002-20260529    gcc-11.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
nios2                 randconfig-002-20260530    clang-17
nios2                 randconfig-002-20260530    clang-23
nios2                 randconfig-002-20260530    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-17
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-19
parisc                         randconfig-001    clang-23
parisc                         randconfig-001    gcc-10.5.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260523    gcc-15.2.0
parisc                randconfig-001-20260524    clang-23
parisc                randconfig-001-20260526    gcc-10.5.0
parisc                randconfig-001-20260527    clang-20
parisc                randconfig-001-20260528    clang-23
parisc                randconfig-001-20260529    clang-19
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                         randconfig-002    clang-19
parisc                         randconfig-002    clang-23
parisc                         randconfig-002    gcc-10.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260523    gcc-9.5.0
parisc                randconfig-002-20260524    clang-23
parisc                randconfig-002-20260526    gcc-10.5.0
parisc                randconfig-002-20260527    clang-20
parisc                randconfig-002-20260528    clang-23
parisc                randconfig-002-20260529    clang-19
parisc                randconfig-002-20260530    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    clang-23
powerpc                        randconfig-001    clang-19
powerpc                        randconfig-001    clang-23
powerpc                        randconfig-001    gcc-10.5.0
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260523    gcc-15.2.0
powerpc               randconfig-001-20260524    clang-23
powerpc               randconfig-001-20260526    gcc-10.5.0
powerpc               randconfig-001-20260527    clang-20
powerpc               randconfig-001-20260528    clang-23
powerpc               randconfig-001-20260529    clang-19
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc                        randconfig-002    clang-19
powerpc                        randconfig-002    clang-23
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260523    gcc-8.5.0
powerpc               randconfig-002-20260524    clang-23
powerpc               randconfig-002-20260526    gcc-10.5.0
powerpc               randconfig-002-20260527    clang-20
powerpc               randconfig-002-20260528    clang-23
powerpc               randconfig-002-20260529    clang-19
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    clang-17
powerpc64                      randconfig-001    clang-19
powerpc64                      randconfig-001    clang-23
powerpc64                      randconfig-001    gcc-10.5.0
powerpc64             randconfig-001-20260523    clang-16
powerpc64             randconfig-001-20260524    clang-23
powerpc64             randconfig-001-20260526    gcc-10.5.0
powerpc64             randconfig-001-20260527    clang-20
powerpc64             randconfig-001-20260528    clang-23
powerpc64             randconfig-001-20260529    clang-19
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64                      randconfig-002    clang-19
powerpc64                      randconfig-002    clang-23
powerpc64                      randconfig-002    gcc-10.5.0
powerpc64             randconfig-002-20260523    clang-20
powerpc64             randconfig-002-20260524    clang-23
powerpc64             randconfig-002-20260526    gcc-10.5.0
powerpc64             randconfig-002-20260527    clang-20
powerpc64             randconfig-002-20260528    clang-23
powerpc64             randconfig-002-20260529    clang-19
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-23
riscv                          randconfig-001    gcc-12.5.0
riscv                          randconfig-001    gcc-14.3.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260523    gcc-8.5.0
riscv                 randconfig-001-20260524    gcc-15.2.0
riscv                 randconfig-001-20260526    gcc-10.5.0
riscv                 randconfig-001-20260527    gcc-14.3.0
riscv                 randconfig-001-20260528    gcc-13.4.0
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                          randconfig-002    gcc-12.5.0
riscv                          randconfig-002    gcc-14.3.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260523    gcc-8.5.0
riscv                 randconfig-002-20260524    gcc-15.2.0
riscv                 randconfig-002-20260526    gcc-10.5.0
riscv                 randconfig-002-20260527    gcc-14.3.0
riscv                 randconfig-002-20260528    gcc-13.4.0
riscv                 randconfig-002-20260529    gcc-15.2.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                           randconfig-001    gcc-14.3.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260523    clang-23
s390                  randconfig-001-20260524    gcc-15.2.0
s390                  randconfig-001-20260526    gcc-10.5.0
s390                  randconfig-001-20260527    gcc-14.3.0
s390                  randconfig-001-20260528    gcc-13.4.0
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                           randconfig-002    gcc-12.5.0
s390                           randconfig-002    gcc-14.3.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260523    clang-23
s390                  randconfig-002-20260524    gcc-15.2.0
s390                  randconfig-002-20260526    gcc-10.5.0
s390                  randconfig-002-20260527    gcc-14.3.0
s390                  randconfig-002-20260528    gcc-13.4.0
s390                  randconfig-002-20260529    gcc-15.2.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-17
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                        edosk7705_defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-12.5.0
sh                             randconfig-001    gcc-14.3.0
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260523    gcc-15.2.0
sh                    randconfig-001-20260524    gcc-15.2.0
sh                    randconfig-001-20260526    gcc-10.5.0
sh                    randconfig-001-20260527    gcc-14.3.0
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-001-20260530    gcc-12.5.0
sh                             randconfig-002    gcc-12.5.0
sh                             randconfig-002    gcc-14.3.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260523    gcc-11.5.0
sh                    randconfig-002-20260524    gcc-15.2.0
sh                    randconfig-002-20260526    gcc-10.5.0
sh                    randconfig-002-20260527    gcc-14.3.0
sh                    randconfig-002-20260528    gcc-13.4.0
sh                    randconfig-002-20260529    gcc-15.2.0
sh                    randconfig-002-20260530    gcc-12.5.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-17
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-11.5.0
sparc                          randconfig-001    gcc-15.2.0
sparc                          randconfig-001    gcc-9.5.0
sparc                 randconfig-001-20260523    gcc-8.5.0
sparc                 randconfig-001-20260526    gcc-8.5.0
sparc                 randconfig-001-20260527    gcc-8.5.0
sparc                 randconfig-001-20260528    gcc-15.2.0
sparc                 randconfig-001-20260529    gcc-11.5.0
sparc                 randconfig-001-20260530    gcc-9.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                          randconfig-002    gcc-15.2.0
sparc                          randconfig-002    gcc-9.5.0
sparc                 randconfig-002-20260523    gcc-8.5.0
sparc                 randconfig-002-20260526    gcc-8.5.0
sparc                 randconfig-002-20260527    gcc-8.5.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc                 randconfig-002-20260529    gcc-11.5.0
sparc                 randconfig-002-20260530    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64                        randconfig-001    gcc-15.2.0
sparc64                        randconfig-001    gcc-9.5.0
sparc64               randconfig-001-20260523    clang-23
sparc64               randconfig-001-20260526    gcc-8.5.0
sparc64               randconfig-001-20260527    gcc-8.5.0
sparc64               randconfig-001-20260528    gcc-15.2.0
sparc64               randconfig-001-20260529    gcc-11.5.0
sparc64               randconfig-001-20260530    gcc-9.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64                        randconfig-002    gcc-9.5.0
sparc64               randconfig-002-20260523    gcc-15.2.0
sparc64               randconfig-002-20260526    gcc-8.5.0
sparc64               randconfig-002-20260527    gcc-8.5.0
sparc64               randconfig-002-20260528    gcc-15.2.0
sparc64               randconfig-002-20260529    gcc-11.5.0
sparc64               randconfig-002-20260530    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                             randconfig-001    gcc-15.2.0
um                             randconfig-001    gcc-9.5.0
um                    randconfig-001-20260523    gcc-14
um                    randconfig-001-20260526    gcc-8.5.0
um                    randconfig-001-20260527    gcc-8.5.0
um                    randconfig-001-20260528    gcc-15.2.0
um                    randconfig-001-20260529    gcc-11.5.0
um                    randconfig-001-20260530    gcc-9.5.0
um                             randconfig-002    gcc-11.5.0
um                             randconfig-002    gcc-15.2.0
um                             randconfig-002    gcc-9.5.0
um                    randconfig-002-20260523    gcc-14
um                    randconfig-002-20260526    gcc-8.5.0
um                    randconfig-002-20260527    gcc-8.5.0
um                    randconfig-002-20260528    gcc-15.2.0
um                    randconfig-002-20260529    gcc-11.5.0
um                    randconfig-002-20260530    gcc-9.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260523    gcc-14
x86_64      buildonly-randconfig-001-20260524    clang-20
x86_64      buildonly-randconfig-001-20260526    gcc-14
x86_64      buildonly-randconfig-001-20260527    gcc-14
x86_64      buildonly-randconfig-001-20260528    gcc-14
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260523    gcc-14
x86_64      buildonly-randconfig-002-20260524    clang-20
x86_64      buildonly-randconfig-002-20260526    gcc-14
x86_64      buildonly-randconfig-002-20260527    gcc-14
x86_64      buildonly-randconfig-002-20260528    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260523    gcc-14
x86_64      buildonly-randconfig-003-20260524    clang-20
x86_64      buildonly-randconfig-003-20260526    gcc-14
x86_64      buildonly-randconfig-003-20260527    gcc-14
x86_64      buildonly-randconfig-003-20260528    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260523    clang-20
x86_64      buildonly-randconfig-004-20260524    clang-20
x86_64      buildonly-randconfig-004-20260526    gcc-14
x86_64      buildonly-randconfig-004-20260527    gcc-14
x86_64      buildonly-randconfig-004-20260528    gcc-14
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260523    gcc-14
x86_64      buildonly-randconfig-005-20260524    clang-20
x86_64      buildonly-randconfig-005-20260526    gcc-14
x86_64      buildonly-randconfig-005-20260527    gcc-14
x86_64      buildonly-randconfig-005-20260528    gcc-14
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260523    clang-20
x86_64      buildonly-randconfig-006-20260524    clang-20
x86_64      buildonly-randconfig-006-20260526    gcc-14
x86_64      buildonly-randconfig-006-20260527    gcc-14
x86_64      buildonly-randconfig-006-20260528    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260523    clang-20
x86_64                randconfig-001-20260524    clang-20
x86_64                randconfig-001-20260526    clang-20
x86_64                randconfig-001-20260527    clang-20
x86_64                randconfig-001-20260528    gcc-14
x86_64                randconfig-001-20260529    clang-20
x86_64                randconfig-001-20260530    clang-20
x86_64                randconfig-001-20260530    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260523    gcc-14
x86_64                randconfig-002-20260524    clang-20
x86_64                randconfig-002-20260526    clang-20
x86_64                randconfig-002-20260527    clang-20
x86_64                randconfig-002-20260528    gcc-14
x86_64                randconfig-002-20260529    clang-20
x86_64                randconfig-002-20260530    clang-20
x86_64                randconfig-002-20260530    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260523    clang-20
x86_64                randconfig-003-20260524    clang-20
x86_64                randconfig-003-20260526    clang-20
x86_64                randconfig-003-20260527    clang-20
x86_64                randconfig-003-20260528    gcc-14
x86_64                randconfig-003-20260529    clang-20
x86_64                randconfig-003-20260530    clang-20
x86_64                randconfig-003-20260530    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260523    clang-20
x86_64                randconfig-004-20260524    clang-20
x86_64                randconfig-004-20260526    clang-20
x86_64                randconfig-004-20260527    clang-20
x86_64                randconfig-004-20260528    gcc-14
x86_64                randconfig-004-20260529    clang-20
x86_64                randconfig-004-20260530    clang-20
x86_64                randconfig-004-20260530    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260523    gcc-14
x86_64                randconfig-005-20260524    clang-20
x86_64                randconfig-005-20260526    clang-20
x86_64                randconfig-005-20260527    clang-20
x86_64                randconfig-005-20260528    gcc-14
x86_64                randconfig-005-20260529    clang-20
x86_64                randconfig-005-20260530    clang-20
x86_64                randconfig-005-20260530    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260523    gcc-14
x86_64                randconfig-006-20260524    clang-20
x86_64                randconfig-006-20260526    clang-20
x86_64                randconfig-006-20260527    clang-20
x86_64                randconfig-006-20260528    gcc-14
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-006-20260530    clang-20
x86_64                randconfig-006-20260530    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260523    gcc-14
x86_64                randconfig-011-20260524    clang-20
x86_64                randconfig-011-20260526    clang-20
x86_64                randconfig-011-20260527    clang-20
x86_64                randconfig-011-20260528    gcc-14
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-011-20260530    gcc-14
x86_64                         randconfig-012    clang-20
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260523    clang-20
x86_64                randconfig-012-20260524    clang-20
x86_64                randconfig-012-20260526    clang-20
x86_64                randconfig-012-20260527    clang-20
x86_64                randconfig-012-20260528    gcc-14
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-012-20260530    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260523    gcc-14
x86_64                randconfig-013-20260524    clang-20
x86_64                randconfig-013-20260526    clang-20
x86_64                randconfig-013-20260527    clang-20
x86_64                randconfig-013-20260528    gcc-14
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-013-20260530    gcc-14
x86_64                         randconfig-014    clang-20
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260523    clang-20
x86_64                randconfig-014-20260524    clang-20
x86_64                randconfig-014-20260526    clang-20
x86_64                randconfig-014-20260527    clang-20
x86_64                randconfig-014-20260528    gcc-14
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-014-20260530    gcc-14
x86_64                         randconfig-015    clang-20
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260523    gcc-14
x86_64                randconfig-015-20260524    clang-20
x86_64                randconfig-015-20260526    clang-20
x86_64                randconfig-015-20260527    clang-20
x86_64                randconfig-015-20260528    gcc-14
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-015-20260530    gcc-14
x86_64                         randconfig-016    clang-20
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260523    clang-20
x86_64                randconfig-016-20260524    clang-20
x86_64                randconfig-016-20260526    clang-20
x86_64                randconfig-016-20260527    clang-20
x86_64                randconfig-016-20260528    gcc-14
x86_64                randconfig-016-20260529    clang-20
x86_64                randconfig-016-20260530    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260523    gcc-14
x86_64                randconfig-071-20260524    gcc-14
x86_64                randconfig-071-20260526    clang-20
x86_64                randconfig-071-20260527    clang-20
x86_64                randconfig-071-20260528    gcc-14
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-071-20260530    gcc-14
x86_64                         randconfig-072    clang-20
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260523    gcc-14
x86_64                randconfig-072-20260524    gcc-14
x86_64                randconfig-072-20260526    clang-20
x86_64                randconfig-072-20260527    clang-20
x86_64                randconfig-072-20260528    gcc-14
x86_64                randconfig-072-20260529    clang-20
x86_64                randconfig-072-20260530    gcc-14
x86_64                         randconfig-073    clang-20
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260523    gcc-14
x86_64                randconfig-073-20260524    gcc-14
x86_64                randconfig-073-20260526    clang-20
x86_64                randconfig-073-20260527    clang-20
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-073-20260529    clang-20
x86_64                randconfig-073-20260530    gcc-14
x86_64                         randconfig-074    clang-20
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260523    clang-20
x86_64                randconfig-074-20260524    gcc-14
x86_64                randconfig-074-20260526    clang-20
x86_64                randconfig-074-20260527    clang-20
x86_64                randconfig-074-20260528    gcc-14
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-074-20260530    gcc-14
x86_64                         randconfig-075    clang-20
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260523    clang-20
x86_64                randconfig-075-20260524    gcc-14
x86_64                randconfig-075-20260526    clang-20
x86_64                randconfig-075-20260527    clang-20
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-075-20260530    gcc-14
x86_64                         randconfig-076    clang-20
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260523    clang-20
x86_64                randconfig-076-20260524    gcc-14
x86_64                randconfig-076-20260526    clang-20
x86_64                randconfig-076-20260527    clang-20
x86_64                randconfig-076-20260528    gcc-14
x86_64                randconfig-076-20260529    clang-20
x86_64                randconfig-076-20260530    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-11.5.0
xtensa                         randconfig-001    gcc-15.2.0
xtensa                         randconfig-001    gcc-9.5.0
xtensa                randconfig-001-20260523    gcc-15.2.0
xtensa                randconfig-001-20260526    gcc-8.5.0
xtensa                randconfig-001-20260527    gcc-8.5.0
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                randconfig-001-20260529    gcc-11.5.0
xtensa                randconfig-001-20260530    gcc-9.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                         randconfig-002    gcc-9.5.0
xtensa                randconfig-002-20260523    gcc-8.5.0
xtensa                randconfig-002-20260526    gcc-8.5.0
xtensa                randconfig-002-20260527    gcc-8.5.0
xtensa                randconfig-002-20260528    gcc-15.2.0
xtensa                randconfig-002-20260529    gcc-11.5.0
xtensa                randconfig-002-20260530    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

