Return-Path: <linux-usb+bounces-36057-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJwRDe9n1Wm05gcAu9opvQ
	(envelope-from <linux-usb+bounces-36057-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 22:24:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D673B486B
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 22:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 421643004D84
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 20:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164D229B78F;
	Tue,  7 Apr 2026 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIduhf0Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E93793BD
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593449; cv=none; b=lsJP1tsootKSU5wsqgBERb/ViHrPeFstbj2JTihGslA6s9UEOC0fkfXgWEU5KDXEzzbxVIBPBVue5klcoxy0y0cfj8H9QcgyUn77F8tsJ6A3YmGlf/LmSPvhmNRhTGz8Spba1yBv5X2IJvUUDaZllwMxpTA4IlvmfqgF8KFtd+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593449; c=relaxed/simple;
	bh=6GvVUlrI0aMtcX3yncA72sTdQchMD5E94Bi/02vtTdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4SguxTMhnvtx2BpDfRZY+12l04c8oe+PYvOUfnGMO4Pb3rhdr39McvjOLNmu0FuBoCMvHs8LRg2XQcE5mAMozk64DFtRtRZBeMh5df6DefWErrVwZBORWjjS4FXJmCyrtISWjMbNw243C0UZWhZ+puBaaCJgnXUzwVgzzX28p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIduhf0Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775593447; x=1807129447;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6GvVUlrI0aMtcX3yncA72sTdQchMD5E94Bi/02vtTdc=;
  b=CIduhf0QCt8AejMdh0DBLfKfLfrfxCZJjTuz+G9OA9FOTNeuFL0NzzIx
   jZQrFRHK0zg123SOdpFhh4gw3GBM0fwgvFuotYh9Op8fCO7E31KhOuQG5
   qv2Z8Rm3R2nAgv++QHdDUGMRM5nNoLj8RD4r0IznSce5M4a5EzgxiXPYQ
   b93DOiKuUw0MIafoIlEqrnEfrC849IojXXi3df3rpUF9427fsrr35jwqU
   ATCsZHLgZh8ZNKhG86gVc4M2tULSCJ/wMONqpWXFst+A+3UOio0ECBpAp
   iLNgAfClciBYYY7Bccs5yF8obfMWQNeZzucYTc4bZTByJHkPGo90DBI7a
   g==;
X-CSE-ConnectionGUID: r6QtP4RbReus+duUoJ383w==
X-CSE-MsgGUID: 2iKGMQUpTqSzAGdYb4Kn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79158021"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="79158021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:24:07 -0700
X-CSE-ConnectionGUID: 7g+qmj3DTY2Fl2XB2U7SIw==
X-CSE-MsgGUID: jQtMFJR2RjyqQ8HXsqinFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="258696499"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:24:04 -0700
Message-ID: <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
Date: Tue, 7 Apr 2026 23:24:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Alan Stern <stern@rowland.harvard.edu>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36057-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 54D673B486B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 18:23, Alan Stern wrote:
> It's been a while now, and nobody has objected to the proposed plan for
> handling this issue, so I'm going to assume that everyone is on board
> with the idea.

Yes, I support this

So basically usb core will call usb_clear_halt() after EPROTO URB completion
handler finishes, and xhci-hcd needs to prevent bulk/interrupt endpoint
from restarting after returning a EPROTO URB up until usb_reset_endpoint()
is called

I also support adding usb_purge_endpoint_queue(), but it doesn't have to
be done at the same time as the EPROTO changes.

> 
> There is a loose end still to be straightened out.  It concerns handling
> of -EREMOTEIO errors (short packet received with URB_SHORT_NOT_OK set).
> While some HCDs -- especially those supporting SG -- may not stop the
> endpoint queue when this error occurs, other HCDs will do so.  The
> question is how the core should tell them to start it up again.  This
> shouldn't happen until after the completion handler returns.
> 
> Short packets don't cause any loss of synchronization between the
> endpoint state on the host and on the device, so -EREMOTEIO doesn't
> require usb_clear_halt() or usb_reset_endpoint() for recovery.  This
> means we need to find some other way to tell the HCD when the queue can
> restart.  Should we create a new hc_driver callback specifically for
> this purpose?

For xHC the issue is the other way around as Michal pointed out.

Can't find a way to stop the endpoint on short packets.
Can only manually stop the endpoint when xhci-hcd detects the short transfer
event, when xHC likely already processing the next URB.

Thanks
Mathias


