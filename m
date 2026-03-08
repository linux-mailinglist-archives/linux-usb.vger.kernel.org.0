Return-Path: <linux-usb+bounces-34199-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOgQM95grWk92AEAu9opvQ
	(envelope-from <linux-usb+bounces-34199-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 12:43:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F422F87C
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 12:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50D57306EE33
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C5F36EA8A;
	Sun,  8 Mar 2026 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV0DY+1h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7962EF66B;
	Sun,  8 Mar 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772969914; cv=none; b=BGZcW3N5UmC3vMJUHUnABRrqK/7lhvCqFSJ7hHHUvkv7kt5k/5K6b5oZ0DypmB7CL+7elCKai4HUNS1J+VMhxNZWfc7RJkoRfUPe1OusmEaSYvQC2v+jru/7zalcqwv/ImbJx1Gbj53SZNUY+HdtnstZ2v9PNZ40JCayXWFDJJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772969914; c=relaxed/simple;
	bh=mmMybctDR8D92vwDkf9gN71GD1oxXI9oTAulQ0XJiV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLYpAiV9KWXV8RMU1t+z83LnsWR7KRcTrr31s6Kxjch+rA1s0tq2BA/acoOF2pqnDcPnYYVt9DPvirw7yaH9VYtKGJd7iut98dtvHlOI1J+YIhXDlCR9ZlPVVFtCIWvYyq17rWkvPciM4KWNuYe64bj9JKPPja+/nzuTLCH1s1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV0DY+1h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772969913; x=1804505913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mmMybctDR8D92vwDkf9gN71GD1oxXI9oTAulQ0XJiV4=;
  b=gV0DY+1hwsOJkOWoiIs1GNBfNnn6sWlm8LX3Ngl4CC+NpGe1jcb/00TN
   49MH7b7fNqmLfrdOWciJdpueFN5KJ4vstP5+TdE7qmgfQbASWXlSyk46w
   dm0FH36f+u+EDuSUPTC2rEheUe3s93OftczOwmdle2m9NUxWTGn/dotVT
   GSUL5bgQeoTVnFHk7vKD3E/MWGYSH6B+9P+/rVRUiKXsCOzB2bPXSzg6T
   VFWWUL2iArrfB/7Ealnr0xnw6zTbyqtLPMd8llMyazTplG+NUBhWWsjjk
   wiegh2wJQZvEFU7ZqH6/4DTrSxDjQ/Yv8a3gt2WETN261FUCkAlYGLct8
   Q==;
X-CSE-ConnectionGUID: b6d8VxmHRvyf7DDb/jivvA==
X-CSE-MsgGUID: pkVM7DX/ScOamfK2qqQe9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74126983"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74126983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:38:32 -0700
X-CSE-ConnectionGUID: 7FozyQ3qSHGwP867eWsu9Q==
X-CSE-MsgGUID: oP8dA15fTEm09PwfajJ5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223583348"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2026 04:38:29 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzCSn-0000000034m-1ojp;
	Sun, 08 Mar 2026 11:38:25 +0000
Date: Sun, 8 Mar 2026 19:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	pawell@cadence.com, rogerq@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <202603081901.b3stSZC8-lkp@intel.com>
References: <20260302030339.324196-2-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-2-peter.chen@cixtech.com>
X-Rspamd-Queue-Id: 834F422F87C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34199-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Chen/usb-cdns3-Add-USBSSP-platform-driver-support/20260302-110634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260302030339.324196-2-peter.chen%40cixtech.com
patch subject: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
config: i386-randconfig-007-20250530 (https://download.01.org/0day-ci/archive/20260308/202603081901.b3stSZC8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081901.b3stSZC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081901.b3stSZC8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: cdns_usb_common -> cdns3 -> cdns_usb_common
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:2007: modules_install] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

