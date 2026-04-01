Return-Path: <linux-usb+bounces-35793-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDRxKqcvzWn7aQYAu9opvQ
	(envelope-from <linux-usb+bounces-35793-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:45:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A437C60A
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A0F830309B3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190F5274B43;
	Wed,  1 Apr 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9tBhi3k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84562D0C82;
	Wed,  1 Apr 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054083; cv=none; b=NVfyl/QcryfozaAlyPDz06bqS4+J4GSP6K15EjAMUDMAeUVBGtdiZOwBnoLuYFt2r0WxKYUTPehSazY+iZBt32bCr+IUB8rH2pVenucj+8BHOsXeDCLMBlYpMC5QXnX8XTgOknpo+/f6U7WJ879IpJ+O8Ue8/osXBYP8fN/nICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054083; c=relaxed/simple;
	bh=WKu5Fs8rib/9n9JZLw2RfnLQuKbJU3PyLefIR9RuzPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4mP9yGz/wC9qgiLMktlx+9++uQ5BJCfnCD98cWy3U8miVAxYou7vqzjwGg8xsVg+iRwxR2jdvsRy6gzr64j4VOfWDpoAz8v9bvSMH6uPtdzECWYsVnL7CX7ijkcHk2Cgl9Mv4y1AmEKR0txmMeQphsdHENGsR86e8KMHfJpVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9tBhi3k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775054082; x=1806590082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WKu5Fs8rib/9n9JZLw2RfnLQuKbJU3PyLefIR9RuzPA=;
  b=I9tBhi3kIt0k81nZErwVdcwonH0jHs5eUND3825bJX80Z47Hvaoy7GBx
   jMYKZ5TqqSzbyVqOqEMDjWCr0dxjKZ1KPgG4W0nhFf0FBzrR9vdpBf/+E
   BGokUiKQICq9cb1o9ObObxkpJw70JgbEvsfBxhUjVzgmsdRvdrFGCYszZ
   /5gZhG0N3wpXLlXyJ17NmamiTYd9VMnoDRvs8rmydk5kqvVv6dWbiw7I5
   JF0N5NoOWjTTpZdQTNcMDHRzLtK8p1wQ3QRg3ZEMugp9zEVBypOT7N5FG
   RIS2PDSdlqIIcZtvRVtuqaDAu3nFAn3yGaQvylDb8B2S6IuH5eHFgmGMp
   Q==;
X-CSE-ConnectionGUID: pMS2DcxRTpCnuZVXL925vg==
X-CSE-MsgGUID: F/wnq3QETH2rcKYwynO8vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86707847"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86707847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 07:34:41 -0700
X-CSE-ConnectionGUID: EFfqiJHOSqWSzSqBDaMtYw==
X-CSE-MsgGUID: hQhqmsxATbePcnS6k39SLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221850626"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 07:34:40 -0700
Message-ID: <e14fb308-a003-4a76-b908-106b5271eccc@linux.intel.com>
Date: Wed, 1 Apr 2026 17:34:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Make usb_host_endpoint.hcpriv survive
 endpoint_disable()
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260331010654.269ac270.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260331010654.269ac270.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35793-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 227A437C60A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 02:06, Michal Pecio wrote:
> xHCI hardware maintains its endpoint state between add_endpoint()
> and drop_endpoint() calls followed by successful check_bandwidth().
> So does the driver.
> 
> Core may call endpoint_disable() during xHCI endpoint life, so don't
> clear host_ep->hcpriv then, because this breaks endpoint_reset().
> 
> If a driver calls usb_set_interface(), submits URBs which make host
> sequence state non-zero and calls usb_clear_halt(), the device clears
> its sequence state but xhci_endpoint_reset() bails out. The next URB
> malfunctions: USB2 loses one packet, USB3 gets Transaction Error or
> may not complete at all on some (buggy?) HCs from ASMedia and AMD.
> This is triggered by uvcvideo on bulk video devices.

Were you able to trigger a usb_clear_halt() called with ep->hcpriv == NULL,
causing a toggle/seq mismatch?

The ep->hcpriv should be set back correctly in usb_set_interface():

usb_set_interface()
   usb_hcd_alloc_bandwidth()
     hcd->driver->add_endpoint()
       xhci_add_endpoint()
         ep->hcpriv = udev;

I'm not against this patch, but would like to understand how we end here

Thanks
Mathias


