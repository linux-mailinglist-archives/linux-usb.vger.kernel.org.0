Return-Path: <linux-usb+bounces-35416-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKVsGz8Nw2lKnwQAu9opvQ
	(envelope-from <linux-usb+bounces-35416-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 23:16:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039831D383
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 23:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7757D3046491
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8C82517A5;
	Tue, 24 Mar 2026 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcITY5eJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6A156677
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390588; cv=none; b=sxRmP0Fe+hFwvBIWDcaZjwAIeSel3IGMHzuPMaaxiDsIZt2f1wmFlbET85WWN4UtRKfZt8nXrIDq/4P2Sz9BNpuOp5eJ/s7hXE7imQ+6ThFkD+cMskyrB44x4lhwkrAVjwHnQFVtkN7+j/AOb/tMy4pVvTxi/r/18/8yiGibaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390588; c=relaxed/simple;
	bh=B1bP6pX299IkXbxylHE+45mmAxSmRKP/oz6tHeuqiSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyYXOMUrZMx7b6dtB+WSwMIJ45dDYJUAjswB19/axIwdUU/pYFckohKL+GSEPfN02HzFrkMWO072zTgE4htS3pwmrvvc1pffc5rCCjABCxYVK5/+D6J12ISSQZitQ7wQlCUzkyfvHrTA82Hx9XfsnpwH5oNTXkGqx5a5HbrKjt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcITY5eJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774390586; x=1805926586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B1bP6pX299IkXbxylHE+45mmAxSmRKP/oz6tHeuqiSY=;
  b=YcITY5eJwI/ga5NSpWf03IBx1uRGkQyRzRTX8tIjSsfce18+95rdVwPV
   YJx+aXQNfDFumylL/GdaEme5hqjPJnCEOJTbw+v5/mO11VWdFk6MJcZnm
   pGGAj431WPE3CkRNS1xSnTRdKXB6qvO5GnfvHhkCbua3KrGteDeoN+J3y
   pnNB/sVmS+HwYG6lY838Ar1tKah32XVE0VwN4CJIAs/PwOqxORwnKGmXx
   X1P7lclTRYjyHeADEE3yxPzw+1bHoECXaj2iMrHppib21gnLCWH2cld6q
   iOKc73GNKSCT3Fo323rb9tWg06sm5ZiHyn4QpYWTZwlrDKr5FnvluXqRV
   A==;
X-CSE-ConnectionGUID: xYyn78SlQDiMsk8zDygRhA==
X-CSE-MsgGUID: 9hSadNYGT7KIRGjzZ4Uq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79332223"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="79332223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 15:16:26 -0700
X-CSE-ConnectionGUID: RDISz2itQOyLutUadW4d5Q==
X-CSE-MsgGUID: OgTMIX3mQ56kKpJKiDIACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229259516"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 15:16:24 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5A2v-000000006xp-2zIn;
	Tue, 24 Mar 2026 22:16:21 +0000
Date: Tue, 24 Mar 2026 23:15:48 +0100
From: kernel test robot <lkp@intel.com>
To: Charles Yeh <charlesyeh522@gmail.com>, gregkh@linuxfoundation.org,
	johan@kernel.org, linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <202603242312.CO0aTujP-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,prolific.com.tw,gmail.com];
	TAGGED_FROM(0.00)[bounces-35416-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url,01.org:url]
X-Rspamd-Queue-Id: 1039831D383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on johan-usb-serial/usb-next]
[also build test WARNING on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus tty/tty-testing tty/tty-next tty/tty-linus next-20260324]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Yeh/USB-serial-pl2303-add-new-PID-to-support-PL256X-TYPE_MP/20260324-235444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20260324124619.843-1-charlesyeh522%40gmail.com
patch subject: [PATCH] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260324/202603242312.CO0aTujP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242312.CO0aTujP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242312.CO0aTujP-lkp@intel.com/

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

