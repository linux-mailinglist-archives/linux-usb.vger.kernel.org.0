Return-Path: <linux-usb+bounces-11795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FD91C915
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 00:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84781F22B07
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 22:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54168172D;
	Fri, 28 Jun 2024 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMW2YYq4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C3811FE
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719613765; cv=none; b=VvVzM7cPKGBtMZLSsmn/IQ9NlUA0rJIFwfZCNpOqyIHeogxvLTTBr47Z002pCR28Qg11XaPQZlkSB3HZVQ6WwOh7K0y8vIxW1jaEzlZecMnhoykQLGxA0iSh09zW8ZDLjm7iwxTWggUKYy6F1W10ic+jzjkON209a7y6o2QKEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719613765; c=relaxed/simple;
	bh=oAHXUJLxfAeu9HQTUMCXWHuR+vC7xuZ9doFffU0C8l8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FMnONhZganBo0TvDdKbG66rHmT6AQ21XcofqjP3JPsMz6+a09LLpRxbPR5JLT3UgawvjWU2nmjD1jEee2QHcLlsrTaTClevQRhfWeOljWrU4/xXhriaP8LQwBBU2NAURXofPW7LhzuAEijiY5EhEtjyOrcit39J9yjyLVIxTvCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMW2YYq4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719613764; x=1751149764;
  h=date:from:to:cc:subject:message-id;
  bh=oAHXUJLxfAeu9HQTUMCXWHuR+vC7xuZ9doFffU0C8l8=;
  b=iMW2YYq4f07qva59QupE08ctPdjL1Syt/QzIq+PjH32db2OYaNf5dZi7
   A/OT63+UDzvD5dzD/bqQyEqdJpZ7gkKZqEa8W8TUOs9IWhPJ68bYn14sj
   tfmgLH0wlowVpNQMQxOZ7JL/KW8I051ZBOcypvAKyVvSbriUta5tahN23
   9sCOzhWl3hrqUgxfCIJ0OuULMgENvCWtdWC4MKVGWsFLy8+JbYcJVoZJd
   SrduOcIwDKTRPpE+iyK14jv/PzBOWmDDL6LVqkiTrn1Ms49GiVSRLIQlB
   4Tki7GvvUzp5RM/iVkGpCQKkq+zto6VNuvlNEdl8wKMJhdXuuDYmq1EvI
   Q==;
X-CSE-ConnectionGUID: fj+oI8o9S6aUMLNwxH7o0w==
X-CSE-MsgGUID: wEqnge9uS5esDZKr+N0y8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34252362"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="34252362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 15:29:23 -0700
X-CSE-ConnectionGUID: EuAPkEirQgiiAsqJTcQnAQ==
X-CSE-MsgGUID: rEpR3W7BRuumBsVZiBj6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44990782"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2024 15:29:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNK5n-000IZx-2C;
	Fri, 28 Jun 2024 22:29:19 +0000
Date: Sat, 29 Jun 2024 06:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [usb:usb-testing] BUILD SUCCESS
 2ea6d07efe5388d47afdb49079423334c97fe22b
Message-ID: <202406290653.FAhWmmW0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
branch HEAD: 2ea6d07efe5388d47afdb49079423334c97fe22b  usb: typec: ucsi: add Lenovo Yoga C630 glue driver

elapsed time: 1882m

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

