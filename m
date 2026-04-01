Return-Path: <linux-usb+bounces-35812-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HjvkEnWXzWkrfQYAu9opvQ
	(envelope-from <linux-usb+bounces-35812-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:08:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B7380D44
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 00:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A5F23006919
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 22:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5717E33EAF9;
	Wed,  1 Apr 2026 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3VCVCRM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFDE317159
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081325; cv=none; b=G2Cjj7dZNuVqWCfTta7+FZPK6d48cu8b2NBFDZxMsGD8EjSFXp3PtoI1B+iXI+ZuSqx46z/xw+o0ud7XVMHYWK9HZRvptjR3RFiruT+9qR6jbZX1Y5/A/T+bxbVAC3FrbSvogldSCnZhbx6CDsWYFjPHsFHaENqvadBr3tiQfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081325; c=relaxed/simple;
	bh=mebR3LDZGRKAnq9Hd1Ve0fiCOVnrCMxLx7aCZed4d5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPP1qga5vM8B0Q6utYHku+XScLD0c+B4puA3DeWnzIRjj0BK7Rf/+bdektCjVHLntVazx4PheU+SijmbssE/+UFwvAxh2Lc0/vUYSp+Bu6uS7XICJaGQZObZhMTFLZLdWb57C+2exDqy79tV17mEK4/5WZYdmgYjg4B/gtoeCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3VCVCRM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775081324; x=1806617324;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mebR3LDZGRKAnq9Hd1Ve0fiCOVnrCMxLx7aCZed4d5I=;
  b=j3VCVCRMWW8E2JRyNi4i6kzPgf3uskUx/b+j08Vf8VhwQVjViOK+Yt7x
   4jOfYA421TjoJb24WpalLhOhmMJ2raW9zEUmBGckNEmG2h2AgONd0fFy0
   U/aJAuX67NTReaOLJrTZEy6JbO71+3MoLV8EbxwVgEmhgL9tJJ48uIDV0
   foh5SqjLpAjN78JIkTGtZnVc25B1L+Kmwvj3tb/xUN3782jgH8IPZ35uY
   InCYvUdjO8z1QJVYcJkYd/4oOD5R3b8HT8/4C5OfMqPhVHKyPVTLOMHcq
   0tvhqxPnJ+/LVjro2FT8zb5BtqZfmfX1NpYnQz+rSqa5yz+cGTpCOfRSu
   Q==;
X-CSE-ConnectionGUID: 1nhV0iohRyys+JjOWZneHg==
X-CSE-MsgGUID: UYwu3zpFToO1cgpPSKoi/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87528500"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87528500"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 15:08:43 -0700
X-CSE-ConnectionGUID: r9R2YaApRpSQ5hUWYlhUTA==
X-CSE-MsgGUID: BRMg8IrIT6CFfPtMl5sRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231209817"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 15:08:41 -0700
Message-ID: <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
Date: Thu, 2 Apr 2026 01:08:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35812-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,harvard.edu:email]
X-Rspamd-Queue-Id: 030B7380D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 18:31, stern@rowland.harvard.edu wrote:
> 
> How about this instead?  We add a "halted" flag to the usb_host_endpoint
> structure, and the core will set this flag whenever a bulk or interrupt
> URB gets a status other than 0 (before putting the URB on the bh list).
> If an URB has one of these statuses, when its completion handler returns
> the core will unlink all the URBs queued to the same endpoint.  Finally,
> the "halted" flag should be cleared after a completion handler returns
> if there are no more unlinked URBs still in the queue or URBs waiting on
> the bh list to be given back.
> 
> The result of this is that any URB remaining in the queue when the flag
> is cleared must have been submitted by the class driver _after_ the
> failing URB's completion handler has run.  We can assume the class
> driver knows what it's doing in this case.
> 
> The endpoint queue shouldn't be restarted until the "halted" flag is
> cleared.  Either right away, if there are any URBs in the queue, or not
> until the next URB is submitted.  Doing this might require a new HCD
> callback.  (It would also mean the kerneldoc for usb_unlink_urb() would
> need to be updated, because the endpoint might restart before all the
> completion handlers for the unlinked URBs have run.)
> 
> What I'm trying to do here is come up with a single, consistent proposal
> for exactly when halted endpoint queues should restart.  Maybe someone
> else has a better suggestion.

Sounds like a possible solution to me.

Just to clarify, core should unlink the remaining URBs queued to that endpoint
after setting the "halted" flag, but before URB completion is called.
"Halted" flag should be cleared after URB completion returns, and endpoint
should be restarted if there are any pending URBs.

This allows the class driver URB completion handler to re-queue the halted URB
without core unlinking it.

> 
>>> Here's a troubling consequence for people to consider: Suppose an
>>> endpoint queue stops with -EPROTO or -EPIPE, and before the class driver
>>> gets around to calling usb_clear_halt(), it is unbound.  What happens
>>> the next time a driver binds to the device and tries to use the
>>> endpoint?
>>
>> The disable/enable interface and set config calls during unbind/bind should,
>> if I remember correctly flush pending URBs and drop and re-add the endpoint,
>> clearing the xhci side halt and reset toggle.
> 
> usb_probe_interface() doesn't do any of that stuff, other than a
> deferred switch to altsetting 0 if needed.
> 
> usb_unbind_interface() does call usb_enable_interface() if the interface
> is already in altsetting 0, but the reset_ep argument is false so the
> endpoint state doesn't get affected.  Should that be changed?

Looks like this needs more attention. Interface driver unbind/bind with
halted endpoint could be an issue. I don't have an answer right now.

Thanks
Mathias


