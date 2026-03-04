Return-Path: <linux-usb+bounces-34027-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIWeKnm8qGlbwwAAu9opvQ
	(envelope-from <linux-usb+bounces-34027-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:12:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F5C208E54
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC9C9307E26D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 23:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EE8398914;
	Wed,  4 Mar 2026 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDyaP0WL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEB38C2C8;
	Wed,  4 Mar 2026 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665725; cv=none; b=aso0fjWrm/8VyhIgNNV0rvP26ygh7yxnlKD/ZRz0fuViNEETEvPuM5S6mK1sIe9qvfKM404ULgn88nIW6MsMzfv73rPGV1LWqgqfhMO3NMYvNHdnkXriJbVq+LdjFkkP3zuVl9FU+0+cci6b7ObQOISRBtqC81VewUU7M34toF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665725; c=relaxed/simple;
	bh=Om1HO60SPxH3vTTTm7kOcRXlH/7T8EhefRjGDaK3l9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkLBZZWO/FBy8cIjU1Zd+Vz7KXthFB1S4KxyAHXLwBVDE8RBb8H+g0Tzfe7d89KQSR30dMKCPblqwuYqhptKSKI0C6oYE2U1rNJcnNMNngWh15syZlFYr/9OaTzYPsNYvV2fDlboETq1PM+Azu6fMdNpqyKNK/7Uu68ma+FelE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDyaP0WL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772665724; x=1804201724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Om1HO60SPxH3vTTTm7kOcRXlH/7T8EhefRjGDaK3l9g=;
  b=RDyaP0WLMWTi/eH4pR9w5ZRctUC0t+hoNuuLROttm27RTSzsbZUQJpCt
   2TXvSj+kZAG5KggAjuL1kpFwHxs/UUjZ6Eu5mz1fLVsbAeq/yv49moKOJ
   vMzKR8EttTaTev+96yprJptepROPMgoVxKhQyIRwWRwybZCdkMsv7VqZL
   Nc7wa/ZD31QoCLQt+WvwRqTNS+TM0bu7mx8oP2LntXnS4BVKKX62Qf3Fp
   v6mIw1g7L5dkChX3YW6q8YM1AIUQpZiDLsdlBEUTbLbpmp8jk3SlXOHvv
   R+6pMf9rVAgOGm6h1q3QSpJfiZWRWs6D+AJBdgCkeKAr8KmF7QhfVpLIa
   w==;
X-CSE-ConnectionGUID: Vk6plC+cSzS555iFvwu3qA==
X-CSE-MsgGUID: hFSQlrCPTKeAdfwfNUUstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73647865"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73647865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:08:44 -0800
X-CSE-ConnectionGUID: tidI9B6pSA2ERLotc7hDmA==
X-CSE-MsgGUID: ixbTbVstT7W2dDxUgjHFzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222632139"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 15:08:41 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvKY-000000004er-0nVQ;
	Wed, 04 Mar 2026 23:08:38 +0000
Date: Thu, 5 Mar 2026 07:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	pawell@cadence.com, rogerq@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <202603050731.SDNJ7lx5-lkp@intel.com>
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
X-Rspamd-Queue-Id: 14F5C208E54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34027-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Action: no action

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Chen/usb-cdns3-Add-USBSSP-platform-driver-support/20260302-110634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260302030339.324196-2-peter.chen%40cixtech.com
patch subject: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
config: x86_64-buildonly-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050731.SDNJ7lx5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050731.SDNJ7lx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050731.SDNJ7lx5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-plat.c:26:28: warning: 'cdns3_plat' defined but not used [-Wunused-const-variable=]
      26 | static const unsigned long cdns3_plat;
         |                            ^~~~~~~~~~


vim +/cdns3_plat +26 drivers/usb/cdns3/cdns3-plat.c

    25	
  > 26	static const unsigned long cdns3_plat;
    27	static const unsigned long cdnsp_plat;
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

