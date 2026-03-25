Return-Path: <linux-usb+bounces-35435-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BZWHC2tw2nAtAQAu9opvQ
	(envelope-from <linux-usb+bounces-35435-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:38:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C1322563
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFE9130586A0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 09:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E741398903;
	Wed, 25 Mar 2026 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pwmarhz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7642E38C2C8
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431530; cv=none; b=Xkejte2qvM0JcTy+wc7iqpgvbVgLaGgajF943dbaRAKNGZMLywLZ9Cp76sgf1ujZCVWxYd1QI0/dMGzxHDpRgScTFUCL74oDR2x3dAznsbjgL2hVoGpSACp31+2pICnuo8dLvFjhzjsd7YeXBMOQLKLC0J+NFiap3jPDVGYWfAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431530; c=relaxed/simple;
	bh=INsVKvntqhuLjxBFQylTI0FFmQf+Bc0G4y09CbML7TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBHJDhERo05p4r67SqaSp6zgTwrLqWys96jEUx7nINkIYVped3vUrhF+VxhQO8hO3Fru6XxVtZlstQTJtbbZAJ5ptKeLDjBNPZTg1qIrK0THVHzeVI8Nm7Q1jncb40o3G0hjkt3/5QHAIzJyWsdu+Tx451PA4bhn9g/N7OB/Muw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwmarhz2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774431528; x=1805967528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=INsVKvntqhuLjxBFQylTI0FFmQf+Bc0G4y09CbML7TM=;
  b=Pwmarhz2WHqe2+/Cim0L8d9F66uaT/E/DqLRzJbX95KVpQqvpX7E/Ayh
   iLpofV5t0TLzhxQhNF4WF8v4Lqy7gbmvwhzZuj51OdHlT6ad5exADz/3R
   vqq5/bGMrh7WpUmrJ7n2dzhjrPmXTaakRM5Yxmaap8s5Qdmsd6b4Lo8IV
   qR+M0WCmAj3IoKgDBVXvKggN9zzbJ6eGY5wotWyipKdSIRPf843IBlIT4
   zQdmX0Ywm++NsEidNrVZCkcm831x0WdTwCCAkzgzliQU6JzTEt70dcH1I
   uJ5z+zfQaDkNPLhS0HCPGGCYPLW1Nk7jElmtxn5JxLYcLQAChvy1ztjWT
   A==;
X-CSE-ConnectionGUID: AWhMeVCBR8SeWje1qGEuMg==
X-CSE-MsgGUID: pnhFpa8UTPeZCeZzFwF6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75431496"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75431496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:38:48 -0700
X-CSE-ConnectionGUID: HIbGHD2ySMGXAyhWxZVPJA==
X-CSE-MsgGUID: IMeIVqEXSe6XUih9HaByYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="255129836"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.106]) ([10.245.245.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:38:46 -0700
Message-ID: <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
Date: Wed, 25 Mar 2026 11:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260325015110.v4r5smfvdd62fcua@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35435-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: C38C1322563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 03:52, Thinh Nguyen wrote:
> On Mon, Mar 23, 2026, Mathias Nyman wrote:
>> Avoid automatically restarting bulk or interrupt transfers after a
>> URB is given back due to stall or error.
>>
>> Introduce a 'TD_TAINTED' state for pending TDs queued on a endpoint when
>> it halted. The actual TD the endpoint halted on is marked TD_HALTED,
>> and its URB is given back with proper EPROTO or EPIPE error code.
>>
>> Don't automatically restart an endpoint if the next queued TD after
>> the TD_HALTED one is marked tainted.
> 
> Sounds good for -EPROTO, but will a clear-halt ring the corresponding
> the endpoint's doorbell for STALL endpoint?
> 

With this change xhci would not restart the stalled endpoint after a clear-halt
request. The first usb_enqueue() call after clear-halt would start it.

Could make sense to restart the endpoint after a clear-halt, and just add a small
debug message if the next queued URB is marked 'tainted'.

Thanks for the feedback
Mathias


