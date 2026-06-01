Return-Path: <linux-usb+bounces-38240-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIp4DwloHWrqaAkAu9opvQ
	(envelope-from <linux-usb+bounces-38240-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:07:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D561E61E158
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46B343008D6E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 11:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E10392823;
	Mon,  1 Jun 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ka6vf3fe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4C5346E6C;
	Mon,  1 Jun 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312070; cv=none; b=aoZG6dOWcJWpKax3pZyPFNbotc1Hd/ODkB6+VbhHO7M98cX3JZDscn+u3qkOo1NFCINiOn/Uq5d17fTbizgW8zHHxAecchXUF0sVCXxEydWJzDMFTnMqk1nlKpudRx2xXb6ED+9NEBsEhW6whydKCzfcHwOVAtUoOjO1qkuie+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312070; c=relaxed/simple;
	bh=fJrP2cIY4gAwUrjQr3sa9JrD+ggI9hGg0cuQCVVhsA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AksEWPZaArhB4dRFuOgAVy7auLrgP1OKPyh9F7bMZ+8IyNUA15eO22D69RX/KhiweMoBpq0AlD6Km6NvLGlKjcOwZgPbChYLNYZKPzv0t6xOYEM/y9fCg9WPFAeSPP+axfEZToE/mfGxsO+hROHanGW+05789kHnWNHS6W5jVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ka6vf3fe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780312069; x=1811848069;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fJrP2cIY4gAwUrjQr3sa9JrD+ggI9hGg0cuQCVVhsA8=;
  b=ka6vf3fejWop3lWK4rBEP/LLcQr5XU5kj+0IwNaVegyPhibdg7tTfjXC
   ygwIP6IRqc3Ll5Vrhwhr9/j01D76Jn9HJoxPp+AG8EBBDNyP//jFySITi
   ggzHDLc8x9Ylk2eHElD2uzNXD2IpAEsO3sGFXZqf21T+XQ5sLxmGx16nD
   rgt+FL2xJkioTWZqDCo7Y1PGXarV/mKmWbEpsougyjPwYvcTv4J6qsz5F
   a3K5wqrXJdARGd/CcbzCBDPC8iKzFVOc0nKmmtTLLrh941VVxHHzFDpeB
   xnkLT3dAMxZqkZ4s7AKLGhpEChtuBjX+D9msp8kM7Zx1+EZ44mjZ97dIh
   A==;
X-CSE-ConnectionGUID: tOhXma8jQ1anoVkt22MkgA==
X-CSE-MsgGUID: w0UcxGlpTjK0wXjIqig6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92181451"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="92181451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:07:49 -0700
X-CSE-ConnectionGUID: MrUbhzZmR+2WXXmwLz76cA==
X-CSE-MsgGUID: HZGWOlcPSV+lJWmrLHOcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248638146"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:07:46 -0700
Message-ID: <506a9406-91c1-4a1c-9a24-59ef20fd052c@linux.intel.com>
Date: Mon, 1 Jun 2026 14:07:44 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Remove skip_isoc_td()
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260529111002.7621e94b.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260529111002.7621e94b.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38240-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: D561E61E158
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:10, Michal Pecio wrote:
> This function is pointless because usb_submit_urb() initializes all
> isoc frame descriptors to -EXDEV and 0 length so that HCDs don't need
> to do anything with transfers which were never executed.
> 
> Other HCDs rely on this (e.g. EHCI itd_complete()), so we can too.
> This gets rid of a potentially dangereous function which could corrupt
> memory if we weren't super careful to only call it on isoc URBs.
> 
> Also, set status to 0 rather than any random status determined by the
> later TD which caused skipping. This status will be ignored anyway.
> 

Thanks

Adding this as well

-Mathas


