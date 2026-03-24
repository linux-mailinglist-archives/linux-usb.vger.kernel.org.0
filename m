Return-Path: <linux-usb+bounces-35415-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGMiCyAIw2lKnwQAu9opvQ
	(envelope-from <linux-usb+bounces-35415-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:54:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 824EC31D08C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 785AC3048093
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A58339098A;
	Tue, 24 Mar 2026 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euE0Ci+o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22434C123
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389146; cv=none; b=jbamRX7z/2dP7RKmgzNaDSlc1PzYTMn6eQYbm7qzvlVboEd4TYsxh7lMySpggTPHtgbMLqM1nLdCoYSH2ZtekimWZKUn41sJbRJr16ZhfYuY1tvX/SOXktMsS1MtqTMWHQ9rBMR/t5HM3Fg/kxdt1amXM19iRmxHhjGfxKRzDfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389146; c=relaxed/simple;
	bh=rv9MdSSQwokfy4/AFZ8+hKQ9g2TqP1WZmQairp61M9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kftV0f9PsO85AxuCGLHl0vNhN1SMX9Xhh31jbRG1zC2FQOPkJUbl3UIcyk0kVDq3JN7Vch0YnWK+KNVdPbuJeOj/3ok/WQFwlRvRVcs0s2I7KIURAyLFxeW7OGln2QOI6SzFuvufqkm65WnCypBQt4S+N4pPo8smAq9I2AVD5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euE0Ci+o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774389145; x=1805925145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rv9MdSSQwokfy4/AFZ8+hKQ9g2TqP1WZmQairp61M9w=;
  b=euE0Ci+oLaB8cLm+AbMmE+8QOx6uwQn5WOTkf3lzf8jRRCUvCqGFLMxD
   DaEkVjZnaf34q5LFo7EfFrloZspJeSpr/gqXR4YbgwvyiKCylou/QgAX5
   BpHEyUXN4SXQjyUhriWgsAWWmDk2+Qn9w6KUfPjxcDdrhgi6HCOd/O/9Z
   klQfAjr7Xzjj2DF/bvE9FwxKynuL1paNmIqo6vFny1YPm/x+qLAB+pfOw
   NjFt15O78jRRaBhb60Xq7/w+6Asp/intjIHJqHT02882Bw9uXllJTjn7z
   UmrBFRyTHtaGY/PX5ZWQ49rH0IGIYN2ANHvXDtfUKHAavvV0i9KREdWw9
   w==;
X-CSE-ConnectionGUID: Gnz4BsqQRHCA1ntdmDsnOw==
X-CSE-MsgGUID: wY1sjINRQQ6Ykw6P0HRKnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100865681"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="100865681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 14:52:24 -0700
X-CSE-ConnectionGUID: PloafhW3TB2TphiQo53z0w==
X-CSE-MsgGUID: 0EbXlr8RRRCtPeRxIey8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224495875"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 14:52:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w59ff-000000005Td-0IF8;
	Tue, 24 Mar 2026 21:52:19 +0000
Date: Wed, 25 Mar 2026 05:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Yeh <charlesyeh522@gmail.com>, gregkh@linuxfoundation.org,
	johan@kernel.org, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <202603250523.9ktgw2Ju-lkp@intel.com>
References: <20260324124619.843-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324124619.843-1-charlesyeh522@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,prolific.com.tw,gmail.com];
	TAGGED_FROM(0.00)[bounces-35415-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 824EC31D08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on johan-usb-serial/usb-next]
[also build test WARNING on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus tty/tty-testing tty/tty-next tty/tty-linus linus/master v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Yeh/USB-serial-pl2303-add-new-PID-to-support-PL256X-TYPE_MP/20260324-235444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20260324124619.843-1-charlesyeh522%40gmail.com
patch subject: [PATCH] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archive/20260325/202603250523.9ktgw2Ju-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250523.9ktgw2Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250523.9ktgw2Ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/serial/pl2303.c: In function 'pl2303_update_reg':
>> drivers/usb/serial/pl2303.c:350:24: warning: unused variable 'dev' [-Wunused-variable]
     350 |         struct device *dev = &serial->interface->dev;
         |                        ^~~


vim +/dev +350 drivers/usb/serial/pl2303.c

   346	
   347	static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
   348	{
   349		struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 > 350		struct device *dev = &serial->interface->dev;
   351		int ret = 0;
   352		u8 *buf;
   353	
   354		buf = kmalloc(1, GFP_KERNEL);
   355		if (!buf)
   356			return -ENOMEM;
   357	
   358		if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
   359			spriv->type == &pl2303_type_data[TYPE_MP]) {
   360			ret = pl2303_vendor_read(serial, reg, buf);
   361		} else {
   362			ret = pl2303_vendor_read(serial, reg | 0x80, buf);
   363		}
   364	
   365		if (ret)
   366			goto out_free;
   367	
   368		*buf &= ~mask;
   369		*buf |= val & mask;
   370	
   371		ret = pl2303_vendor_write(serial, reg, *buf);
   372	out_free:
   373		kfree(buf);
   374	
   375		return ret;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

