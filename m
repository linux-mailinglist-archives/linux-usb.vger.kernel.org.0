Return-Path: <linux-usb+bounces-35647-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHQcDwI9ymnG6wUAu9opvQ
	(envelope-from <linux-usb+bounces-35647-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:06:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D1357C4C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF9263011505
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8C3AEF34;
	Mon, 30 Mar 2026 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWD2x+Cb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4818382383
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860826; cv=none; b=ufXqt8BdS2JW/ORTkTZXp0Pwz9URjuiFY+U6CTVx6gbWWDTqRTxQOyPtDnuGbLxwKYSk4/pGfg0l34GLzzb2d5xAcqpHFdl8fIwgsXYbSuizzuizV1k13uuu09kWXzB1G5zDdgMiaXCAAHlOCy+NC5OLdAudXl7o7j7UFpmetp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860826; c=relaxed/simple;
	bh=a6uDhOf8cHZKi+iFmInk3x/N08PeQYWjm+nQ6PFfUYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfH6Lhh0az9sJv9L/mOKUF2LMGLcJDWK4+YLxrCvuIeBpsVakv2n6KvKpKYvB5KCTO/MmpzEdW8VU9ISNFe2tJHT29ig2FalYK/PbVeqH3a50nSLI7N9sJpQ9l6S5RSHreyLMFt0RvL1BIaQJdkM7zQJnLiFIH8Y7PoW4APUpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWD2x+Cb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774860825; x=1806396825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a6uDhOf8cHZKi+iFmInk3x/N08PeQYWjm+nQ6PFfUYw=;
  b=NWD2x+Cb7r0ydIahb3xMm+FeK7GzB9x3tNtAulzvR1BEDupl2ycdksXx
   ydPYZwoi6B9KUNU3y+O9Alizk5surZsGnUHK11j6aklewTgxd8BWu1yIU
   oLMDie/7ZzlNGvIQFGmTsWVGH5+5FZ/0sqd3gYtM0lyAuev15sXHWkzCf
   rDixly8hc20FrP2+fFMnzyDSivXxPvcQpJmPUgg71D8Uv7Z68w0ZWCYXf
   xuOZvJnsI6B0yDRy9VcS1XC4lsc4gMIc+P3x5b80qeemCYisVp183PCZK
   9jFXamdklvoidw+nZe7k5r9UerwjQYf9Q/9Lg2R/29WEjNOWL9LeIUFf0
   w==;
X-CSE-ConnectionGUID: vcqLWKk+R4qufIG/OWMOoQ==
X-CSE-MsgGUID: sCzomhzmSfSKGCFeUK8A9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79449945"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79449945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:53:45 -0700
X-CSE-ConnectionGUID: Y5OZtWRWRbKiSDuG+ihocg==
X-CSE-MsgGUID: wwmcZEkbQHOATMY7uwQdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230803431"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.250.130]) ([10.94.250.130])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:53:39 -0700
Message-ID: <33373f50-7e86-4854-a651-577662d54811@linux.intel.com>
Date: Mon, 30 Mar 2026 11:53:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] usb: xhci: move ring initialization
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
 <20260327123441.806564-6-niklas.neronin@linux.intel.com>
 <20260330104207.40c7500e.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260330104207.40c7500e.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35647-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[104.64.211.4:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 5C4D1357C4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30/03/2026 11.42, Michal Pecio wrote:
> On Fri, 27 Mar 2026 13:34:36 +0100, Niklas Neronin wrote:
>> Move ring initialization from xhci_ring_alloc() to xhci_ring_init().
>> Call xhci_ring_init() after xhci_ring_alloc();
> 
> This adds more code and more opportunities for bugs.
> Can't ring_alloc() just call ring_init() itself?

Sure, but the naming would not be accurate.
ring_create() or ring_alloc_and_init() would be accurate.

> 
>> in the future it can also be used to re-initialize the ring during
>> resume.
> 
> Yes, but it seems we don't have the opposite problem: there is no
> need to allocate rings but never initialize them.

Technically there is, during ring linking. The "new" ring does not
need to be initialized, as it will be initialized according to the
"dst" rings values.

This is not implemented in this patch series, but I planned to do it
later.

> 
>>
>> Additionally, remove xhci_dbg_trace() from xhci_mem_init(). The
>> command ring's first segment DMA address is now printed during the
>> trace call in xhci_ring_init().
>>
>> This refactoring lays also the groundwork for eventually replacing:
>> * xhci_dbc_ring_init()
>> * xhci_clear_command_ring()
> 
> Or xhci_clear_command_ring() could just call memset() and ring_init(),
> instead of duplicating this sequence in every place which needs it.

xhci_clear_command_ring() clears the command ring specifically.

The idea is to have (naming not set in stone):
ring_alloc() <- allocate necessary ring memory
ring_free()  <- free all ring memory
ring_init()  <- initialize necessary ring memory
ring_reset() <- resets the ring

The reader can then easily understand what each function does.

>  
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>


