Return-Path: <linux-usb+bounces-35986-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKJLD9qI0WmlKwcAu9opvQ
	(envelope-from <linux-usb+bounces-35986-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 23:55:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE739CAC9
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 23:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA25301D6AE
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 21:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B917035CB6F;
	Sat,  4 Apr 2026 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mDexBVbq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391535DA46
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339693; cv=none; b=qSJ95EymA3oaaLsCZXqn7Pjg+P3l9/++ZDs4eDfSAzjoiT6nlFNRL8S9Wn/n/E7ZrdaDaXCrAmP4y0tS+kpBT+Pbfe+0+sRdtB2YgceXHDWEyiEL3LGi3CgIoo6jfHaHSmpq3KpjlqSrCx71df/v6soC7CmzDomIKroCvVjQSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339693; c=relaxed/simple;
	bh=YYzZENRya7ha8ZwwiH/Q9XCJnTiIoA49kh8wEf53hRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRIbxB/UNRT6GpByRtwqwXMbNW3cBxpcx6X8qoxVIKYXpaVtCJE/zh36pg45FupTfojB1YmWcdqvuUkyaCiU16hztVqWtqU5Yfn3udjR1bqAWrupgVhUUIEHFlE/VECRp8AlL1186xYKcoCwoqeWR33wO2/vnrv0BwU8CUMbrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mDexBVbq; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb5c9ba82bso503141085a.2
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2026 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775339690; x=1775944490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEXYBnWetg55Iq3SPwb4/cXJb0KACaLw1RFgIibrk40=;
        b=mDexBVbqpdXp1gInX8D+QZMr0osdUXhAN8pqy2Byu6uLjI59iKW4scoqs59Crum3y4
         2vX3MimS1elaBxTkN2LxVETvvPbdAxYrhYNSUlF33uy7sNrbA6Uphit2xzIt2B02zVDc
         q4Z65aZqz82mIGzjwRlbPL4zQzVVGlvlWq4m/Ww9SwOzJNYRPvbHIGxWx08KbSH6tu/j
         wPd1zV9ZyMG1P6RcdrFlWlhoksQ0MOmHaWyOTj/gEgHK6/2Cq8Ksa851C9//DDe16fPy
         /Ey8aPFBnTh0UocGtf3snJiQ3t2Avi07jkWvDFt++I2bH+32ZdVTSEZI+b8CCulVkGaE
         Oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339690; x=1775944490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEXYBnWetg55Iq3SPwb4/cXJb0KACaLw1RFgIibrk40=;
        b=X19pB/GtlPwTLImg9b9bMEvr1TmNZ7Ns3/Sxt9MKu8bWnmeWCd4OhSJUg+21A1j9vg
         oF1u3ZbUqkPZNKTF8jPjZpyHC3zig9nC0115odjZMChWejrBXXr+E5RJoWjChmpQSXuz
         gF3Y1rtLoJR8zaiVJl0cfBnkMnTLyKY8yS3NXOB8DZ2XxqVEfakx6Zg1htniI2kBL3z/
         ZLO9l0WYdhvscVTkGPVOpk7Fgg7oDOMmQJifm7g3LO0p2Xpy95VFBdsp7boHDeMj90q7
         ITHggfkXnnAf8yP1e7XzFKrF8Uk0pyKPJ+dzYMCmytMEpvRD716FlIhWVZDRZBhCut9W
         KE1A==
X-Forwarded-Encrypted: i=1; AJvYcCULD8+I5NW3ystkUm807i/wK3+AMUtI842FBKzFbF6Ohogl/YIle0s2wwQtM0jpeZ6dXXr7jsNrMaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRNSazk2BApCjQfJqd2V9aKTUuSMfaI5Pya70JFGNEoA6EEQl
	sdbcikSPO5tGVxNTN7gBjScPxGJ4mMUtoRaoLzJpOKRniBapHS8O+Bv63/NJAfcoAfHfnVuyOxq
	Rq8+Bgg==
X-Gm-Gg: AeBDies+HyKx+x2HOGZFSLy4ol0lfwjyExrYkAJMxpxE9IUGSRM44DY72E6uTFi/r3b
	JXkd6hI0hqoTrJbsfZ5g7aWU1StPw88Dd/6SMjI436oJtRcLYTrRVh6AMn92VifzwLRFQ9tBJsT
	RTRwKCD6TucTp+7WMry2bJjmrOhhMAE4f6ZTUE31WkWtT43RmOtQEFHTJarzTTFKfkfwM4Msxj8
	uwwwY3P31Ne6onXssciLyaPotc/epmWipsNPgN7p5GEIqaxXUFk6uwL/je9yuaC82tyNuZe2K+6
	0xEpd7cznQW3lE07tiRLyOGuk9uxzvHKcb+0mGiLnVsSMoNcAbX+XE3UwJ0olaL+yQksR1UcVcX
	O/rQlgfJ+d/fqWJJDZ87rPnPnA3RbuDJaOVC5uDFMK6iU68e9YSqT5ITGDLHMoeqJeBnMDYpQBb
	NXTWPtNpHQPLEeoVjNBaWSbpao
X-Received: by 2002:a05:620a:4713:b0:8cd:af31:b414 with SMTP id af79cd13be357-8d41c8a963amr1134770885a.31.1775339690412;
        Sat, 04 Apr 2026 14:54:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5a6764esm759228785a.13.2026.04.04.14.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:49 -0700 (PDT)
Date: Sat, 4 Apr 2026 17:54:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
References: <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	TAGGED_FROM(0.00)[bounces-35986-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CCE739CAC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 08:41:36PM +0000, Thinh Nguyen wrote:
> On Fri, Apr 03, 2026, stern@rowland.harvard.edu wrote:
> > Summarizing:
> > 
> > If the class driver wants to unlink queued URBs when a transaction error 
> > occurs, it has to do so itself in the failed URB's completion handler.  
> > We can make this easier by adding a usb_flush_endpoint_queue() routine 
> > to the core.  In the meantime, the HCD ensures that the queue is stopped 
> > before giving back the URB.  (Note: -EPIPE, -ENOENT, -ECONNRESET, and 
> > -EREMOTEIO aren't considered to be transaction errors.)
> > 
> > When the completion handler returns, the core will automatically call 
> > usb_clear_halt(), which will also reset the endpoint on the host side 
> > and will restart the queue.  This also happens after SetConfiguration 
> > and SetInterface, either explicitly or implicitly.
> 
> I like that the core will handle this automatically. But one concern:
> How will the class driver know when the clear-halt complete so it can
> perform the recovery? (ie. it shouldn't perform recovery immediately
> after seeing -EPROTO)

It doesn't know, and it doesn't need to know.  Any recovery URBs the 
class driver wants to send can be submitted as usual, and they will be 
added onto the queue.  When the core resets the endpoint, the queue will 
start going again and the URBs will run.

If the class driver wants to take some other action (like submitting 
URBs to a different endpoint) before using the endpoint that stopped, 
it's free to do so.  It only has to make sure that it doesn't submit any 
URBs to the stopped endpoint until after the other action is finished -- 
which is what it would do anyway.  (And maybe it has to unlink any URBs 
that are already queued, which can be done with a simple function call.)

> > For -EPIPE (device sent a STALL token), the class driver has to clear 
> > the halt itself.  This is because stalls aren't errors; they are an 
> > intentional part of the USB protocol.
> > 
> > -ENOENT and -ECONNRESET (URB was unlinked) and -EREMOTEIO (short packet 
> > received with URB_SHORT_NOT_OK set) are a little trickier.  The HCD may 
> > or may not need to stop the queue for an unlink, possibly depending on 
> > whether the URB being unlinked is the active one.  When a short packet 
> > is received, the HC hardware may or may not stop its queue.  Either way, 
> > the class driver shouldn't need to take any special recovery action; any 
> > necessary actions should be taken automatically by the HCD and the core.
> > 
> > All of this applies only to bulk and interrupt endpoints.  Control 
> > endpoints generally need error recovery only on the host side, because 
> > the device resets automatically when it gets a new SETUP packet, and so 
> > the HCD should handle whatever is needed.  Isochronous endpoints don't 
> > ever halt and they shouldn't need to be reset when an error occurs.
> > 
> > Overall, this seems simpler than anything else we have discussed.
> > 
> 
> The rest sounds good to me!

Good!  Let's wait to hear from Michal, Mathias, and Oliver.

Alan

