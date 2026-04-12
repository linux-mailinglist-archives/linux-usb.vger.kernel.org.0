Return-Path: <linux-usb+bounces-36169-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM0MADKo22lEEwkAu9opvQ
	(envelope-from <linux-usb+bounces-36169-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 16:12:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 583DC3E42C0
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5BE302A07B
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1BC313E10;
	Sun, 12 Apr 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g85NJjCK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13432EAD1B;
	Sun, 12 Apr 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002928; cv=none; b=cLLnf5FuWir7viNlCndtvXl81vdjya5qYTSo5bUQlQodqDxMSqKC+UMy+duF7u1O6NBH8crZqIJYQgMKmgUoEdotYpZsagGHQLLVbckZcMJ2v3pX6zSUX2a4Q0QOlSkmY9kd0r61yButXoBOGQfIVqhDYn7c2YSq5hyFtS0cmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002928; c=relaxed/simple;
	bh=VY4FvtYX9a5WZ1xa6Vy+0vBfFjNoMNioD5mV53SqYj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH7Q2klaeR51l2qA13mJMCS3mXMkMa4wYW3qR9xvLNqkuNledl42uFgT2QJhu8CczF3w6zx4JDIu4lvlDMZ5f5lSTSGQmk8HQD5m48Ml4wQJbOouBbtCefAqjSeWpwN6Rdw8Bu4mj3BjpeoteFPdnGw5YRC9xj7flXz6r45oVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g85NJjCK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776002927; x=1807538927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VY4FvtYX9a5WZ1xa6Vy+0vBfFjNoMNioD5mV53SqYj0=;
  b=g85NJjCKIIoDPjjY21YLYtnDLrVIdytV1hRJQJxzGpKxDxj/DJHuVw//
   Nq7V4IXRhG62CfBp6CZSvXAgnOjEPWQnT++t9YvQuvwUBWdq0sRRCMToo
   +jg8BUQ7NGKfQSGe7vexz9F1D0A4TsBtKVe6q3qIQbJ3DIpziJaBRzBkb
   /86m6xBYCy77b3ullkzgG/3i6ULtI+E6xs2dK6mktA+uD2ov0faOSiJRM
   Ba1SdKSbFShEw23nExutB18i7MGF1OZSokUzdggzj8Wsr3k8CIybODTo3
   4Dprl7PJzl+HKPhNf2Du52KkGBuGHPFk+zDLh+PE6YzBHkc8ZW65JKOg9
   Q==;
X-CSE-ConnectionGUID: GkfRKoU7TdCN4BUDWBjs+Q==
X-CSE-MsgGUID: qLq3L4nfTwGmBQoJOjpPvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88403220"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="88403220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 07:08:46 -0700
X-CSE-ConnectionGUID: Dnv30C5WRdiTPrWnKrfKPQ==
X-CSE-MsgGUID: A8rY8/GvRNOKqrrzyEsnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="226841295"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2026 07:08:44 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBvUP-000000002FB-3J2a;
	Sun, 12 Apr 2026 14:08:41 +0000
Date: Sun, 12 Apr 2026 22:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Taegu Ha <hataegu0826@gmail.com>, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, kees@kernel.org,
	linux-kernel@vger.kernel.org, Taegu Ha <hataegu0826@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: validate control request size
Message-ID: <202604122157.EGkANVeB-lkp@intel.com>
References: <20260401104611.3375330-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401104611.3375330-1-hataegu0826@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36169-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 583DC3E42C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Taegu,

kernel test robot noticed the following build errors:

[auto build test ERROR on westeri-thunderbolt/next]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Taegu-Ha/usb-gadget-f_uac1_legacy-validate-control-request-size/20260412-113035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260401104611.3375330-1-hataegu0826%40gmail.com
patch subject: [PATCH] usb: gadget: f_uac1_legacy: validate control request size
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260412/202604122157.EGkANVeB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122157.EGkANVeB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604122157.EGkANVeB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac1_legacy.c:14:10: fatal error: 'asm/unaligned.h' file not found
      14 | #include <asm/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +14 drivers/usb/gadget/function/f_uac1_legacy.c

  > 14	#include <asm/unaligned.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

