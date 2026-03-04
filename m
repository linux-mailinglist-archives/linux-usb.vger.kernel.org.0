Return-Path: <linux-usb+bounces-33951-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OkDLOvzp2mtmwAAu9opvQ
	(envelope-from <linux-usb+bounces-33951-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:57:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9951FD038
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42BA3302BE3B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C84E386C13;
	Wed,  4 Mar 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj2Mciv9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC423D288;
	Wed,  4 Mar 2026 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614416; cv=none; b=cIndM/rZNXvGCb7WskWJFMi9eVKbb3PtKST3QS+NiydNdS7w8SR8Z1StcO/8I4uIrZmKyhjpLBuuFhDBghfY30h9lQNtouTbngU+KkG6OaBai9mwLb+VouTQ30cX8pu66nMzUJnBfdEY8+FOoIkjJpx5unTC26+s1GLPbM2Pew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614416; c=relaxed/simple;
	bh=mAlkRHCWiAISBmc8NyU9Bg+JbUkLphH6WHQlzhMAxKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oV1PJw5R16oEPmHpydGCMuQlRHHaoabl/MWAde9tNcyniNbh0ICGv5FABPl1BkOlEQk6s6kIYMoAiwz3kZsqeT7awxW2lIYDTbvF/MJTFWxpwvzXmIKusxClQa6vTfzmgL5EKAdv2zb3feOJlhUu5p7xuCOr3EnGNMXQXuFR/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rj2Mciv9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772614414; x=1804150414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mAlkRHCWiAISBmc8NyU9Bg+JbUkLphH6WHQlzhMAxKg=;
  b=Rj2Mciv9qXFl++DSPN4RyuFCJhr26VhB/PUova2VbCt+g7Gbm5WZl3IL
   mZom6lIF6+r+T8lOjZ9SjVXR+t0ddXT11agFNWZLetvKMQNGbpRDYsHPt
   DWRgBUZ4DG+a56RowO/R/XPP0IJ/KYOSnDjZPwvrn8PrVj595lP9aW6qR
   H09MdJYvcsp7ML45yjfR3eTl4bLx6u4gcvF1ZGGW7DxaGGPbQM/Zo4KEu
   bfZwrgHbqGuoIx7dIhwhF3CmnYcVpeICKSlxfzhjxigWlSwzTSeqCHvrS
   +1JikrjYB1cEO1omZAM6HYRVjb8zYACY8/jW0Q4OCflVQpXNV+AMR5ipr
   A==;
X-CSE-ConnectionGUID: OjMbJRW0RnCWdcT1Ab3kgw==
X-CSE-MsgGUID: x/1+yE7eTjqV9ue6wrjx4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="85133363"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="85133363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:53:33 -0800
X-CSE-ConnectionGUID: ZBFu2oMNTxibXSgSP3+ztQ==
X-CSE-MsgGUID: og3Uj6XOTraVrVCaTIuTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="223273025"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2026 00:53:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxhyu-000000001en-40Ef;
	Wed, 04 Mar 2026 08:53:24 +0000
Date: Wed, 4 Mar 2026 09:52:27 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Adamenko <marusik.adamenko@gmail.com>, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: Re: [PATCH] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <202603040948.m6LKXcFm-lkp@intel.com>
References: <20260304033418.49357-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304033418.49357-1-marusik.adamenko@gmail.com>
X-Rspamd-Queue-Id: 0A9951FD038
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
	FREEMAIL_CC(0.00)[lists.linux.dev,linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33951-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,git-scm.com:url]
X-Rspamd-Action: no action

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.16-rc1 next-20260303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Adamenko/usb-core-remove-unnecessary-goto-in-usb_create_newid_files/20260304-113844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260304033418.49357-1-marusik.adamenko%40gmail.com
patch subject: [PATCH] usb: core: remove unnecessary goto in usb_create_newid_files()
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260304/202603040948.m6LKXcFm-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040948.m6LKXcFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040948.m6LKXcFm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/core/driver.c: In function 'usb_create_newid_files':
>> drivers/usb/core/driver.c:202:1: warning: control reaches end of non-void function [-Wreturn-type]
     202 | }
         | ^


vim +202 drivers/usb/core/driver.c

0c7a2b72746a96 CHENG Renquan      2009-11-22  183  
ed283e9f0a2cc0 Alan Stern         2012-01-24  184  static int usb_create_newid_files(struct usb_driver *usb_drv)
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  185  {
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  186  	int error = 0;
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  187  
ba9dc657af86d0 Greg Kroah-Hartman 2005-11-16  188  	if (usb_drv->no_dynamic_id)
5523ca85805b3e Mark Adamenko      2026-03-03  189  		return error;
ba9dc657af86d0 Greg Kroah-Hartman 2005-11-16  190  
ed283e9f0a2cc0 Alan Stern         2012-01-24  191  	if (usb_drv->probe != NULL) {
49a78b05d5ca1e Yajun Deng         2024-01-04  192  		error = driver_create_file(&usb_drv->driver,
15147ffd57576f Greg Kroah-Hartman 2007-11-28  193  					   &driver_attr_new_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  194  		if (error == 0) {
49a78b05d5ca1e Yajun Deng         2024-01-04  195  			error = driver_create_file(&usb_drv->driver,
ed283e9f0a2cc0 Alan Stern         2012-01-24  196  					&driver_attr_remove_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  197  			if (error)
49a78b05d5ca1e Yajun Deng         2024-01-04  198  				driver_remove_file(&usb_drv->driver,
ed283e9f0a2cc0 Alan Stern         2012-01-24  199  						&driver_attr_new_id);
ed283e9f0a2cc0 Alan Stern         2012-01-24  200  		}
ed283e9f0a2cc0 Alan Stern         2012-01-24  201  	}
733260ff9c45bd Greg Kroah-Hartman 2005-11-16 @202  }
733260ff9c45bd Greg Kroah-Hartman 2005-11-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

