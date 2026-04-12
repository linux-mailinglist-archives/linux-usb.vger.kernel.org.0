Return-Path: <linux-usb+bounces-36168-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GsAMMBq22kFBwkAu9opvQ
	(envelope-from <linux-usb+bounces-36168-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 11:49:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F03E352D
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 11:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA666301C931
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 09:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72502374730;
	Sun, 12 Apr 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSK3kVvb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E5373C12;
	Sun, 12 Apr 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775987379; cv=none; b=a5ktNowgk4iyCZFOksPIW7mI57uJV0RGNPMcIiwYHheekGFDFxx5RSRxj2yasy9Wl6nl+DtEwSvEoHGuXjzdsKN6sXAHhlSvih6QK4B2L0XmId7qZr28H8N+6c18CTxJuE7QIDOp4SMauMjzr1YAYfT1QZ3jD0+r3KVbyai8wPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775987379; c=relaxed/simple;
	bh=8A2laZ9CPmMYYzJz27dy0OAKPZeCKyNAlDSmALSOoBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXyPhEx+Dy2dC+3u2TGRv6P3ecmYsCkZOHFP41p0g5qSn3zbbbwwc42JUoDAeriP2PZO62vup5B/qlR7+kLeYWRNGk2IXLBVB4kdu28oP/bcPGjZH36f0ZLjB57LzMZ7/+4idSk9o33T+yHFEo8lTL8rYM8BUPCz/vm2ygneXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSK3kVvb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775987377; x=1807523377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8A2laZ9CPmMYYzJz27dy0OAKPZeCKyNAlDSmALSOoBI=;
  b=eSK3kVvbCwCcMR12qNsjt0bxihDUv4EnzQ7lC/iapndePRN83Z6/vgtz
   ao5uJeMzuWmVge1JRJVfYNNkW0KR2k4rpfWVT0vHZwfnxDDQel5kRzFQ7
   6sNVE7Z+VxrUrHBXm4GDPEHdoJIHy8ZurBEkE0jzYT4FP6ojgThcwFPcx
   H0CENgy/hfsNgpvkFyoy7GovQWYZDx2Ua0i/6lcYyz5N5EeW9ZXaY7qua
   weZytOlL0VyF0nXjYWauj/2O+ze5jbLhSAaR2ELcaF/7fE9EptReiFgpS
   NB7VHAP7hBexTEaOiJNjfPB50apDRxNreV6jUh6WoS70FYozj1f3/ek9K
   Q==;
X-CSE-ConnectionGUID: 8Oj70TLGQj68Z77EhzzF7g==
X-CSE-MsgGUID: C/VBs65MT9GAwnalHS1Puw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87647934"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="87647934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 02:49:36 -0700
X-CSE-ConnectionGUID: pvJaQSmdT5uM4FxEy6OcQA==
X-CSE-MsgGUID: ykQodKseTK68jFE+R52YnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="231246193"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2026 02:49:35 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBrRc-0000000025F-1psX;
	Sun, 12 Apr 2026 09:49:32 +0000
Date: Sun, 12 Apr 2026 17:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: Taegu Ha <hataegu0826@gmail.com>, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: validate control request size
Message-ID: <202604121754.9JyQH6bx-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36168-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: 3E7F03E352D
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260412/202604121754.9JyQH6bx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121754.9JyQH6bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604121754.9JyQH6bx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac1_legacy.c:14:10: fatal error: asm/unaligned.h: No such file or directory
      14 | #include <asm/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/usb/gadget/function/f_uac1_legacy.c

  > 14	#include <asm/unaligned.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

