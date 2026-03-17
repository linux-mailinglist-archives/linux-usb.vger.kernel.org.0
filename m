Return-Path: <linux-usb+bounces-34917-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OT8Iu8ZuWn5qgEAu9opvQ
	(envelope-from <linux-usb+bounces-34917-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:07:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083612A6400
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0162030965E7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529733161AD;
	Tue, 17 Mar 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1gnR2a8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFD0330648
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738348; cv=none; b=S13a3biLG/X+pveR5yMTrYmRkQ7wpOL9h5haa4LH9CuFUgz5Jy6VZE5x9bw2de7vfMO5NjK2Nn0fbU2nOPOXCCVh7stjAQeLHSL0qK/jsecZ4f6jYN00hYZrS6FN+x7IaEQJbFOLg+hcITeiNyOxqUaElPXUcf24B7Z5osUpX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738348; c=relaxed/simple;
	bh=kNY2EbyQ01kXpjCaCbkTWkQZnIlwEenqzBqDc730kxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2NOZGZ4pwQmjP74SG5OHAORlqDvOvxzr0ut1QENufSIF6kJPi5GGkDXcnu3oQx+1E+iNfjjQLpPLIGnxa79w9bQy0G6WXZ+GwIL37k5C+mdpkoY+ROxtHmvQUVcvZACB8QOvJC+gfx2ixZEd+mfDeHLpo8v5zZToTO09yInE04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1gnR2a8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773738348; x=1805274348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kNY2EbyQ01kXpjCaCbkTWkQZnIlwEenqzBqDc730kxc=;
  b=T1gnR2a8HptihIfztCApVUC5iKzZi9QKP754EGiYD2QAPrfLIvRdeZ1T
   UKd16YFReCQaCJUvJoa4N/GTiRFfOt2tUQM6eApFHRFdVnV6093JmrhIv
   vYKz/9sRqffB8yXuelB6SDEDH97yBEnfLkyuOPmu9OOu8ZaA4+x2HsTw+
   BjNWLedd8bRhupxkja0jWMJsFnfROgI8GQR8jX2SHtv0xqpFGil2DxS8e
   sGMMwA9Z+UgJW2V0ES8vBmnOYnqSNgno2dv/nN/QZK82x23vj1TPtGm6l
   ek+qrmI7sqkwUq4Vgf25bkoiD/szqDe6SmRbmqTD1HUOXpFyhv3uPhybD
   g==;
X-CSE-ConnectionGUID: huNle037R+aIGQEshPfUyw==
X-CSE-MsgGUID: Q2wbCe5GQTKW0jjLJFlcXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78370838"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78370838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:05:48 -0700
X-CSE-ConnectionGUID: p5wymnBDQTiJEbrW3oSjeQ==
X-CSE-MsgGUID: xCtMdHxWSLiwF7fqvSvk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227172811"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.138]) ([10.245.245.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:05:46 -0700
Message-ID: <0b78f1a9-7a7b-49a1-aba2-9ad9f67ee5bf@linux.intel.com>
Date: Tue, 17 Mar 2026 11:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34917-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 083612A6400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 21:32, Oliver Neukum wrote:
> On 16.03.26 18:33, Alan Stern wrote:
> 
>> It's more complicated than just clearing halts.  What if the driver has
>> queued a bunch of URBs?  They all have to be unlinked first.
> 
> As far as I can tell for some hardware those URBs may be already be in execution
> when the error is returned. So that is a hard problem. Frankly I do not
> see what we can do more than provide a suitable operation for anchors.
> 

xHC controller stops executing URBs in STALL (-EPIPE) and Transaction error (-EPROTO)
cases, but there is a driver flaw that may restart the endpoint after giving back the
URB.

I'll look into this

-Mathias



