Return-Path: <linux-usb+bounces-33778-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jmEnGFxnoWkUsgQAu9opvQ
	(envelope-from <linux-usb+bounces-33778-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 10:43:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677A1B57F0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 10:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE0D3027306
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36FE3939AA;
	Fri, 27 Feb 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AA31DpTh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D41F92E;
	Fri, 27 Feb 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185432; cv=none; b=QTxSYLfWvW2Tbq2fYeebK3p0VLuCyNfGPiFemlsqjM0FnnqX7i6Cyp2scFDLE35w6ZZ1Q/VSm4esloThtzYQz8XZAYl8JEOAMk7tiPBdF8k46yrQZBGpXv9PTKr7WUnuM47fay+clhYGnyASvn9GPCm3/2qWCavOF2uRkc0edQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185432; c=relaxed/simple;
	bh=S40WQZezzw027ipu4rm5m9j2CsiziwZ33LTZqtP2HtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATGnBMhLGMF0RmSdyqVmNn4y6nVF6ca9km5Ec5sWuEtJcLLHtsnHRruIFfjlTWBB4Jsyj9QJxAbjkOnPCSA1fF6RHUcjAK+lI8Uw6v2TA4NioXm3bH44sPvoRelijn017AQKbYA/CEncMiKi3qr/6Ul2NEFA1SPTZSZMzC38n9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AA31DpTh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772185431; x=1803721431;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S40WQZezzw027ipu4rm5m9j2CsiziwZ33LTZqtP2HtM=;
  b=AA31DpTh/W69iIxIJrx65c78ikzBnrKrawauHroec/LJe9vMx3CKc2OZ
   uG1y7Ig9umWX4BGcHFZAk49SxPNuDTYTo4hEzw2HTQvj+E6nLI4y/dKd3
   4VujLlWAx5lzuMawTIfjLDLISZZw5bRX9vtzDkEke3RCCDDr4XglrQ3i4
   /BBnXYI/vO70xPkmmELQtjkDFu8LrA+EZMmod6UjAH7HidxlaP1SOuSbO
   RIuiy3pga10XXdzPL+E3VLtdEshonvaOFUvzRX2rcpcal0GnfIrdXRe4o
   O9sdJYCEGT8oyJjqVNbRY2jyos2Dm+SZ7EmhnvBZ+uD8GANWPm1rIMy3c
   w==;
X-CSE-ConnectionGUID: pCSdgoVNTE2pOcHb99XDVQ==
X-CSE-MsgGUID: apsbN1WPRHuv8Xt145wikA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73310517"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73310517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:43:51 -0800
X-CSE-ConnectionGUID: j6A7cvkISx+xCrwLcfCYAg==
X-CSE-MsgGUID: aHAGDWSfTo+vmda9BcsFbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216751374"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.140]) ([10.245.245.140])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:43:47 -0800
Message-ID: <9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
Date: Fri, 27 Feb 2026 11:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Dayu Jiang <jiangdayu@xiaomi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yudongbin <yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>,
 chenyu45 <chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
 <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33778-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,urldefense.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5677A1B57F0
X-Rspamd-Action: no action

On 2/26/26 20:17, Thinh Nguyen wrote:
> On Thu, Feb 26, 2026, Mathias Nyman wrote:
>> On 2/26/26 11:27, Dayu Jiang wrote:
>>> Hi Greg,
>>>
>>> I have updated the changelog text as requested and resubmitted the patch.
>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/20260128100746.561626-1-jiangdayu@xiaomi.com/__;!!A4F2R9G_pg!ZSJNDKyOinm26qngopLW-axiQtwDAMely4bDqtqYDGv1ErWCtS6kZ6ZamdiKoZKuCyCk0IxMQK5g625GEIxYWFzKpAEiCUq7$
>>> Please kindly review it and let me know if it is acceptable now.
>>
>> I'll send it forward, but changed the commit message.
>> Does this modified version still describe the case accurately:
>>
>> usb: xhci: Prevent interrupt storm on host controller error (HCE)
>>
>> The xHCI controller reports a Host Controller Error (HCE) in UAS Storage
>> Device plug/unplug scenarios on Android devices, which is checked in
>> xhci_irq() function and causes an interrupt storm (since the interrupt
>> isn’t cleared), leading to severe system-level faults.
>>
>> When the xHC controller reports HCE in the interrupt handler, the driver
>> only logs a warning and assumes xHC activity will stop. The interrupt storm
>> does however continue until driver manually disables xHC interrupt and
>> stops the controller by calling xhci_halt().
>>
>> The change is made in xhci_irq() function where STS_HCE status is
>> checked, mirroring the existing error handling pattern used for
>> STS_FATAL errors.
>>
>> This only fixes the interrupt storm. Proper HCE recovery requires resetting
>> and re-initializing the xHC.
>>
> 
> The controller is halted if there's an error like HCE. It's odd to try
> to "halt" it again. Not sure how this will impact for other controllers.

This is why I changed the commit message from:

"When the xHCI controller reports HCE in the interrupt handler, the driver
currently only logs a warning and continues execution. However, HCE
indicates a critical hardware failure that requires the controller to be
halted. This ensures the controller is in a consistent state and prevents
further operations on failed hardware."

to:

"When the xHC controller reports HCE in the interrupt handler, the driver
only logs a warning and assumes xHC activity will stop. The interrupt storm
does however continue until driver manually disables xHC interrupt and
stops the controller by calling xhci_halt()."

I can clarify it further by stating that .."assumes xHC activity will stop
as stated in xHCI spec. On some xHC controllers an interrupt storm continues after
HCE error, and only ceases after manually"..

The host is messed up at this point, and we are not recovering it. I don't think
there is any harm in a manual halt at this stage.

> Even if we don't have the full HCE recovery implemented, did we try to
> just do HCRST, which is the first step of the recovery?

Specs state that HCRST might re-trigger the HCE if it's due to a "hard" fault,
and driver needs to take action to prevent a HCE - HCRST recovery loop.

HCRST will clear all registers, so we need to reinitialize everything here,
write back addresses of event rings, command rings, DCBAA, scratchpads
dequeue pointers etc.

I support taking this fix to prevent the interrupt storm, an issue seen in real
life. And then solve proper recovery later.

Niklas is actually working on decoupling memory allocation and xHC register
initialization which will help future HCE recovery work.

Thanks
Mathias



