Return-Path: <linux-usb+bounces-35102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PpoM7W2u2lHmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:41:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 376392C7FCB
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 430D9305A8AA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7A73AA4E5;
	Thu, 19 Mar 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaGu55Zf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F13A783C
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909638; cv=none; b=IlrfgyGXPbJRLbYosKR6p7bZrAmnrx/q2f4rhavGDLVphJwmPSjB03A6bzZbAFYh6YqSc+8+eq3A0iQ5duLqtqYhGnt+UWq326omQ0A/nRLeXA+4p/RKy9ByduOTi0HOExsYMcGHpXOiKa6OND3RXNh6xAcA9MGSQHtC7RfNG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909638; c=relaxed/simple;
	bh=oJGZOLOUeEinYwd+OPWiXnsex5raaI8UMVp7k8OFfwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/LUwCAlOJQau30EjPge4Ge5LteDPtl8dKSttBK4qS5sTCVjM1hrOT/qZZT0emqRipiFaMR6vnLvel3Tm+123EUHcBglXCLSN3KO67vW97lIXJrp7WziPaap1wOQX6FrvzUaJt49YDtQVRcS19zUNjwGW+EL5AkPFhTPH8D+hC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaGu55Zf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773909637; x=1805445637;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oJGZOLOUeEinYwd+OPWiXnsex5raaI8UMVp7k8OFfwM=;
  b=GaGu55Zfm98FjfAbn10ajXpIlFAh+kCFvi/EqPq8Q9VGWgiFK24lSU+b
   GCcv9qaBQHHeH75Tsj7+DqOwVGIxD3GHioymRoS9FVgRa1rN7BaY0FZpS
   bEsIi5K70VzwvX871nwh35RYiwwG0kNH2/38HBqLWC65lkyFGTnHo/ZBZ
   /sT1oI32Wm6b7RnabwAXpJYjgpujQQEwRsYYGwYkWk9CvCTGpOp8+rMpP
   UYuMBay9q978rFtIExQZSKXgY5VYFWRY//Haco6gHyNBcYI7YcRw99KpL
   SyMXsYOL9wFkfmyZxwT6mtinvdFhcA1jY0E09IRKZNhgZtP62+MTQXOM9
   g==;
X-CSE-ConnectionGUID: OgKn6YCMTYOKSg/H6gLfKQ==
X-CSE-MsgGUID: lzww/AsAQnmPHaiQn4cNTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92358616"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="92358616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:40:36 -0700
X-CSE-ConnectionGUID: u/Xu2jd3TBmZRJFOqfQ2zg==
X-CSE-MsgGUID: Gz1rqaMNRlGvEmFZyx0HFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227839932"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.144]) ([10.245.244.144])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:40:34 -0700
Message-ID: <903fa309-775c-4562-bbf2-01ef8ac88cc7@linux.intel.com>
Date: Thu, 19 Mar 2026 10:40:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 USB list <linux-usb@vger.kernel.org>
References: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35102-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[rowland.harvard.edu,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 376392C7FCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 03:56, Alan Stern wrote:

> Just to be clear, are you saying there's no way for an xHC to restart a
> (host-side) halted non-SuperSpeed endpoint without setting the toggle
> back to 0?

There is.
A reset endpoint command with a TSP flag (transfer state preserve)
clear the host side halt and preserve the toggle state.

It's used for soft-retry purposes, retrying a transfer after
a transaction error. This is also the only use-case described in xHCI specification.

Unclear what happens if we clear the host side halt, preserving the toggle, and
then ask host to move to the next URB

Could be worth giving people a way to try it out somehow.
Maybe option to enable it via debugfs, maybe a quirk, or event just provide a patch.
See how different xHC hosts behave

-Mathias



