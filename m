Return-Path: <linux-usb+bounces-33980-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJecA7VBqGn8rgAAu9opvQ
	(envelope-from <linux-usb+bounces-33980-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:29:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BADE201773
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 15:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E60B30A0C6E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4388936C9D5;
	Wed,  4 Mar 2026 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX/wsVZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DB3368AC
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634350; cv=none; b=XVNxZCnR0cIwtDQuO+xrSV3XXr+nqOXaMPXRL6YGX5FgdCfQ+lHt8eVNwB+NwOu74KefOe3UrHmuU9A1eVQVwJENXzSXveuPpwFheg5ynG7AEHimw03jYvnGldkzovNGNGyjYcqqEMZUqoUHZC+B+2DygXAXefQgZM9IC61kYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634350; c=relaxed/simple;
	bh=LhgZBq4TGceRNjY0wD5X4IaCKxC72XoA+iFeCuk7CXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFN5rHSKw9AMvmsR7jcGaRAacBYwEFo70sZdLZqCuuGXtNRJdCTWAgNwk4egRaHrYpurhkK+MrI/YXtB8l/np/EW852nnCgFhYeB7MBAe0lxEwtrqX1Sv5Aop1DgLUiZ10/wvbx89UEFIS68GMA6HqMrX8VoW+cEdq3YpYsKy00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX/wsVZV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772634349; x=1804170349;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LhgZBq4TGceRNjY0wD5X4IaCKxC72XoA+iFeCuk7CXM=;
  b=RX/wsVZVDXT+ZF4YSWNKGMUqRukyVLANKMg1IppK8n1RR7JU10TRy+9k
   RshsFW0A93UcARliffF3/55kAC8xLVQU1fIohN5bpmIe9WXscEzHFYKmE
   lYm0qwHs4qCH1ctHYQ2txPE3WbW1t8hXe0NDmZ1D+hyssNiIxZIUk5pRD
   UB5GbsDOU8LkHED6O9aqSB7qN7a9vrANExXwBWR22mGCldqWczM0PQz4A
   Qs4zHN55jYFIfFAHfGEJ/YwADkKez5Horfyn8gDfJlJhBaeJVfTkRfNXZ
   LIU04s+STH0lzRyiwL4pkcCjpd9tF0msgMvLL157+yRy6foxWQKX59By6
   A==;
X-CSE-ConnectionGUID: eBc0AgtbRJ6QRhWCCma7Aw==
X-CSE-MsgGUID: 3eBmmYVLTeKD78VDgdvVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77299220"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77299220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:25:49 -0800
X-CSE-ConnectionGUID: QeVzfo3KRFycGwvYTsZ35w==
X-CSE-MsgGUID: 5p74+rwCTGusdUg9TbChiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222517795"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.180]) ([10.245.245.180])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:25:48 -0800
Message-ID: <d26eb83b-e67c-4319-82fb-9aba76bb2b76@linux.intel.com>
Date: Wed, 4 Mar 2026 16:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/23] usb: xhci: Add debugfs support for xHCI Port Link
 Info (PORTLI) register.
To: Michal Pecio <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Rai Amardeep <amardeep.rai@intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
 <20251119142417.2820519-24-mathias.nyman@linux.intel.com>
 <20260304103856.48b785fd.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260304103856.48b785fd.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9BADE201773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33980-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

On 3/4/26 11:42, Michal Pecio wrote:
> On Wed, 19 Nov 2025 16:24:17 +0200, Mathias Nyman wrote:
>> From: "Rai, Amardeep" <amardeep.rai@intel.com>
>>
>> Each xHCI roothub port has a Port Link Info (PORTLI) register that is
>> used by USB3 and eUSB2V2 ports.
>>
>> USB3 ports show link error count, rx lane count, and tx lane count.
>>
>> eUSB2V2 ports show Rx Data Rate (RDR) and Tx Data Rate (TDR).
>>
>> Rx/Tx Data Rate is a multiple of USB2 2.0 HS 480 Mb/s data rates,
>> and is only valid if a eUSB2V2 device is connected (CCS=1).
>>
>> 0 = "USB 2.0 HS" normal HS 480 Mb/s, no eUSB2V2 in use
>> 1 = "HS1" Assymetric eUSB2V2 where this direction runs normal 480Mb/s
>> 2 = "HS2" 960Mb/s
>> ...
>> 10 = "HS10" 4.8 Gb/s, max eUSB2V2 rate
>>
>> PORTLI is Reserved and preserve "RsvdP" for normal USB2 ports
>>
>> Sample output of USB3 port PORTLI:
>> cat /sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port14/portli
>> 0x00000000 LEC=0 RLC=0 TLC=0
>>
>> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
>> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Hi,
> 
> This patch causes an oops when there are more port registers counted in
> xhci->max_ports than ports reported by Supported Protocol capabilities.
> On my HW it's due to max_ports being more than maximum port number, but
> it seems that gaps between ports of different speeds are also possible.
> 
>> +static int xhci_portli_show(struct seq_file *s, void *unused)
>> +{
>> +	struct xhci_port	*port = s->private;
>> +	struct xhci_hcd		*xhci = hcd_to_xhci(port->rhub->hcd);
> 
> In such cases port->rhub will be NULL so we can't reach xhci. One
> obvious solution (which works for me) is an explicit NULL check here
> and another seq_printf just for this case, followed by early return.
> 

Thanks for reporting and debugging this.

I was able to fake a similar scenario by leaving out a port in xhci_add_in_port().
It triggered the same oops.

The null pointer check you suggested below fixes it for me. Does it work for you?

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c1eb1036ede9..5ff5b761bccf 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -386,11 +386,19 @@ static const struct file_operations port_fops = {
  static int xhci_portli_show(struct seq_file *s, void *unused)
  {
  	struct xhci_port	*port = s->private;
-	struct xhci_hcd		*xhci = hcd_to_xhci(port->rhub->hcd);
+	struct xhci_hcd		*xhci;
  	u32			portli;
  
  	portli = readl(&port->port_reg->portli);
  
+	/* port without protocol capability isn't added to a roothub */
+	if (!port->rhub) {
+		seq_printf(s, "0x%08x\n", portli);
+		return 0;
+	}
+
+	xhci = hcd_to_xhci(port->rhub->hcd);
+
  	/* PORTLI fields are valid if port is a USB3 or eUSB2V2 port */
  	if (port->rhub == &xhci->usb3_rhub)
  		seq_printf(s, "0x%08x LEC=%u RLC=%u TLC=%u\n", portli,

Thanks
Mathias


