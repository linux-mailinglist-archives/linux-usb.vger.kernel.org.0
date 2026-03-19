Return-Path: <linux-usb+bounces-35157-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HlcHrcHvGkArgIAu9opvQ
	(envelope-from <linux-usb+bounces-35157-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:27:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B72CCC70
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32561303EC9A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C715D36F43A;
	Thu, 19 Mar 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FOwO+fAM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF325361DCF
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930277; cv=none; b=HnMJBBZtiiTiUScAhxv/4rcqqjkS0Po1KaYzId6R4HH/cyg1KZ4HjZ+qCjwwjXjK0jGQ0FEnYmFw66y3QgoBxACG19g5AEJv4Luyj2h2TeagCVZnZaPMCE9ueTzNBsNSwbx0ErVzJZBJpJQtu+qoqkqaWzuVAoUX/uD6JgxMbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930277; c=relaxed/simple;
	bh=6MdwyRzJThT8lEtM0gSIpqTC067ifdy8pzHtw5kDiVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgtJKSzP9E+CiERyvZA4Z46r9YJe/GjI9mqJn0sbCMzPvv49XmqmLpjbJeP2akRmNM8ZjQhtlxbXnQBlEa1qHNADZcJ4X6suzLbNKL/xSu92iNkNWLqsZDQ96MBsx6NtAirLN83ksfyCLZLmDEoH7JUmFFqqHmS2SQFEKNyGwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FOwO+fAM; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfbbdbaf3cso87394385a.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773930275; x=1774535075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sXJQkKHy/qqAJ7rnINpvbUkwZqPFxGAJAQ1byjp9Lwg=;
        b=FOwO+fAMuaOVN9sz52csIgEzRKki/zeezdsKNoBqk+IUBALa5sMf6/3P3mxAP4arHg
         vtirQjR+hH0lWF04JJK7tZjspbcyxRyr43iXNGoa0XCDSV0wZi27ReBuoct6/9gjUBbw
         HPfv2aooRPeGrWvUU2pDckKu/J8iEFVEPMAkY/YhCLPGhLPTIn6dfejF48UiclgDQF3p
         kmj5TsDfXcVEsWhaOK6bvcLkII6IQ1r7nzZBrQt5ZCAe+4g6wxUuLszx4sdOrcrw6TkQ
         Yz5dG3pWDg3EFoxRBcFBc/Uk9xlCeDvY5RvDC+nMtaiLvuPUMbrCvewS6HaPbIsOAxPJ
         yFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930275; x=1774535075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXJQkKHy/qqAJ7rnINpvbUkwZqPFxGAJAQ1byjp9Lwg=;
        b=o3vhPXxLuJaTybalbo7NQX4rC3k9mKfTndONs6ln+tKh1brNm7YcdSqLNtF+xZZR9G
         208gfaon76pfNpWR1O+Oz06SR+5f6a20ptCJfQS+/B6POHVJcLvx4YPWZmvDux8rrkNn
         HwvchX2AC8PRDOxsTRZCuC2+Uy6vaRHV1nwMAYRFmHlQHsywtD0Y+YNJtrwXh9Ng4z/0
         epRxNVEmU9MxTpotppDn6QsNaxrK/5x8BXRDR472G7NoSYWHbCU/rpuESNrKH4Qptfsj
         HKBE2R902DV94ZIOeIbOxN59uLFssgADUmiN+l80Pb2+mOyLoblIQbP/QBYYSzfRjWaY
         yG3g==
X-Forwarded-Encrypted: i=1; AJvYcCUg21+nnUiZpgwIgUTw23K4bgKhPnhEmo8HgspRpK1OtMkcHwnUrF9LvxVD4LgsnLoL3MyjvcSPoOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkG6O2FgngxqbkLIc0/wSUewh5QcucX5OAQivuEAPlGosZMN7Z
	Y7Rk54SenR1bErMxYpIP3KB6FRcmP1udlpf1or8zLLs4zzyoPj4A/Fr70vUq5Oy3ZKd1QfDXFRw
	zxqE=
X-Gm-Gg: ATEYQzzzmQ6fpaWmdK7QVcNeEl7NkpGIor3LzT+9KmhryPAx1LDAj6mEJNzXwwVFn+s
	3DgsCdM/AcaGP1bWKPvGUHRMCDQ7v0yBYtD50wTYmnwmATJdDTXAk96Y3GAqN69eIBzYro1GomH
	fIYQyLJnAGMU8AesRO6M/TCWKPEnNtRDpmD5iqkPXHNOo6v6fdDXBoQus6dI3BsieBJyROLrpi1
	dYVJiYRsMgTAk109mA7/7+yj6m6KnDYwXkmwz0d94p06Uo/FB3yRzTtdhvdIG/7KK8ayQunQM8Q
	KwSXiF7yU7Z4AMDus0ZurinhyMzDb+iazDdGtomePJY8ynjdGDgRkDaHfQdCyBvERI6cJ9iEAfd
	GpNNhXw8T48L5E/Iv58vNsz6aHIF90++2XwZaY4gcRMgUTiixobuVFlgaA8U/SPygQYztiBKD4N
	6ANFsK+pvUwsxDT00gMdH+fVKZvYSFRFG0H+NjODSI6ni9mjNV70YH
X-Received: by 2002:a05:620a:bd6:b0:8cf:c537:e0aa with SMTP id af79cd13be357-8cfc537f048mr104549685a.10.1773930274639;
        Thu, 19 Mar 2026 07:24:34 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacde2f19sm449674485a.11.2026.03.19.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:24:34 -0700 (PDT)
Date: Thu, 19 Mar 2026 10:24:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <6d4f997f-37c2-4045-912a-338c5975652a@rowland.harvard.edu>
References: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
 <20260319095506.4b1a6ac8.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319095506.4b1a6ac8.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35157-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 1C3B72CCC70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 09:55:06AM +0100, Michal Pecio wrote:
> On Wed, 18 Mar 2026 21:56:27 -0400, Alan Stern wrote:
> > On Wed, Mar 18, 2026 at 10:38:51PM +0100, Michal Pecio wrote:
> > > If you get EPROTO reading from a Transaction Translator and the TT
> > > discards the packet (because of timeout on Int or by explicit SW
> > > request on Bulk) then not only is the particular packet lost
> > > because the device got its ACK and moved on, but I suspect the next
> > > packet will be dropped too due to toggle mismatch.  
> >
> > (Is it the TT that keeps track of the toggle state, or the host 
> > controller?  I don't remember and I'm too lazy to look up the answer.)
> 
> Good question. I skimmed USB2 chapters about TT (11.14+) and haven't
> seen this spelled out clearly. However,
> - I don't remember ever reading about a requirement for TT to keep
>   separate toggle state upstream and downstream
> - there is nothing about what CSPLIT response to send after device IN
>   packet was discarded due to wrong toggle
> - we would need a separate request to clear TT toggle when we clear
>   host and device toggle, no such request seems to exist
> 
> So I still suspect that TT is just a dumb forwarder and that we get
> toggle mismatch when a packet is lost on the HS bus, which sets us up
> to lose the next valid packet too.

I overcame my laziness and checked the USB 2.0 spec.  You are right; the 
toggle control is in the host controller.  See Figures 11-48 and 11-51 
(bulk/control OUT and IN, respectively).

> > By "unusable", I meant that no more data could be transmitted through 
> > that endpoint until some sort of recovery action had been carried out 
> > (such as clear-halt, set-config, or device reset).
> >
> > Yes, data loss is sometimes inevitable, and we shouldn't worry too
> > much about things we can't prevent.
> 
> But an EP which loses data is not as usable as we might wish for.
> Doing usb_clear_halt() prevents at least that second loss, which may
> occur in far future when we think the error has been solved already.

Granted.  However, we should be able to avoid issuing the clear-halt if 
the device is attached to a USB-2 controller.

> USB-IF doesn't seem to consider "pipes" a reliable transport and
> expects class drivers to anticipate data loss and work around it.

Yeah.  As far as I can tell, most don't bother to specify anything about 
this.

> HID, for example, appears to provide a mandatory control request to
> poll for the current state of input controls. This could recover lost
> data (except from mice) after resetting the pipe to avoid more loss.
>  
> > The major example showed up just a few weeks ago.  It was an old
> > system where some component (the PCI bus?) apparently could become
> > saturated at high load, leading to communication failures because the
> > host controller couldn't access the data needed to keep up with its
> > scheduled work.
> 
> I'm aware of this bug and it's an odd one, because I don't understand
> why reducing retry delay seems to help.

It doesn't help the recovery effort.  But it does improve the user 
experience by minimizing the number of lost keystrokes or mouse clicks.

> > Just to be clear, are you saying there's no way for an xHC to restart
> > a (host-side) halted non-SuperSpeed endpoint without setting the
> > toggle back to 0?
> 
> To be clear, I'm saying that most xHCI people probably think so. You
> have seen Thinh's reaction to my suggestion that we could do otherwise.
> 
> We need a Reset Endpoint command (xHCI 4.6.8) to clear the Halted flag
> in xHC, otherwise it will refuse to run the endpoint to protect us from
> race conditions (new submission while the error is being reported).
> 
> Clearing toggle/sequesce state is optional. If we don't clear it then
> "the endpoint shall continue execution by retrying the last transaction
> [after restart] if no other commands have been issued to the endpoint."
> 
> We can command it to move to the next URB (possibly not submitted yet)
> and only then restart the endpoint. But this is another weird thing
> that Linux does, possibly noboddy else does it, USB-IF doesn't expect
> us to do it, and HW vendors may not test this edge case.
> 
> It's something that would have made sense to try 15 years ago, but
> today I think you may meet resistance. Ask Mathias what he thinks.

I'm getting a definite feeling that we shouldn't try to depend on this.

Alan Stern

