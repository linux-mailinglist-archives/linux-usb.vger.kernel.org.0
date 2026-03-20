Return-Path: <linux-usb+bounces-35256-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA+aGvx0vWmt9wIAu9opvQ
	(envelope-from <linux-usb+bounces-35256-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 17:25:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AD2DD438
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 17:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE90C3018C00
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 16:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A713CAE87;
	Fri, 20 Mar 2026 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WYl0W0Q3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42CE3CF693
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023611; cv=none; b=B79etXsQ8LwE9w4zAH09saWMpwpKrHfs8mE1xyMkJxNFKxYMERis9N4OjqqTN17m54s2lijzkhKETj/zmjDRAUF1Gheuye1wNyFH6G4TNgkuGPUTIhsqACZATgx1TH1CgeQJU9HqxUWKbirzK3kOQmrRpvJ4L0OVeAnQUM2Lwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023611; c=relaxed/simple;
	bh=3tGSa3ZTKw3k/wO0XphhuvGr1t+nBSpUi2SxnXvBa7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs7RUbLTkzfb1aLfe+UoLr2Um+ALIAT94WTZy5/MO1l93tUznySCFt3ht8JSLNuLBnKESCW+Wb+SLXWAX9vLktid7SgQ6+nnAOR4+WIJEygdq/7WbF829cQ4q596OByMAhL21LbhSS3SA+CR7qoAepnyXL/MdBFxH5dc4kMezsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WYl0W0Q3; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfc085395fso76534685a.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 09:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774023608; x=1774628408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihhb9AkSqRF3BH6GIOPb5fNjw79CdxqRff7fPFyA4F0=;
        b=WYl0W0Q3WMAAQvSJuK8fFkWUZ0bvbDBUK3JrCljQsfWICagWi2ZD1NSx3LZ9n4pqz9
         OkBNJMta3f94G8kjGAx32S7r7/cl8d4dsQtHW6QyfX1jMfhciF7aaEdwYrQO90gypSLk
         lGmEx/gIsZXp75r3KwtgWc0+H2/7z2LnGdUCkJHGEFMJCz9NI49uk+V+z9ECUEN/y5WF
         FdCtLngwfbsfdjf1EPDYhW3MiN0u0iXTzzoi4BlarTFM8UnsJLMVJm8gLE52dV1PypUS
         wA+ltqgAXt8H0/pC/YIaILVkrB9icCjt27Fw24jRGtWabTwY9MkodeC86uTlcz3vTd/l
         XDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774023608; x=1774628408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhb9AkSqRF3BH6GIOPb5fNjw79CdxqRff7fPFyA4F0=;
        b=V4sLVIkjJWnowhkww64Nk+xYuT4SGIjArg0xw6SUB9hd7106FVw+UgmQWmjM/DnT0V
         ObEIN4+wdqandCDSfHI3vpN6hYiSGbCtjO9fcBktTd8j9TWsaFNnmUEkWGu3EEfh3Hs+
         MPuVZZjBpMoDkJ7dDVpvxCxWVdVhMdO91gONXJkwAKwVy1ci6Ry5hchooL8cAX+cAWY0
         LEkdaCKR5wWdwfwhQ1jbb0dSe9D5ccfC5+qAG155xOefV89B8QSBYB5c3aptJ6w8H7NQ
         57jhk9Wp6pCvvqgrHBd8A9Tw72KkqElYpa9+ylexNFUw+vOKuApTtaRfcA/oskDUV5SW
         bYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuyZ1BuUZ4o58GWqCzfE54p5AE7KFxKe5GhwHuGQKlup9lFPykrDT2fQU5J4aDJeNoL84VbKMkkQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuLG00iRnfELsI0n8wIvI3lTV9kgV2WcDCqgy8+q6FEy1LtRS
	bKrCpM8MH2HaehBD3KSKqyb/G1aXdvLV3GvqgYswiW5tiNVcAgu23YYiICXlHTvEZQ==
X-Gm-Gg: ATEYQzwAlaKVLjZwSI7hz0eWOA+mkQsPmTWt2WEb9EqTa5yBZ+zZGw9JHjL4tfUwHF8
	VdVtBDAEOevVZ75jwbhXJzozsX1MyWfrBWpheBlBWrl0wBO+al7zbOhWQekNy6ZbD3dsSceIjXY
	RDsBpR8kQR1CCyIq6ZVB2JJYPfHDjeif8V7ybrCr8fr9gWMIuqoME+VUk4QrnUs+mWgWZcL37S9
	+IsfQkOB2C2yIh5QwSa8ot+Heqty2mbpkCmfC4SPNCA9mW03WXWlJttTARExWK12s/JAZOGfFxR
	ME/MyAnKZahSj4qGT/V/lZ1KKBVlknR1IzZpOac84EDVt8V1PlxhL5w7Js/s+P+Hs7l672ratoF
	b8zRXzEiczvEAUG2asTH32oWiFwQ26xxC7g2Vy144EMfk0DmXZMoAIT3bg04tExi6Ll2yULarJN
	GD3Agox5vS2zC/hycUPrYiKvU=
X-Received: by 2002:a05:620a:4143:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cfc7f516b5mr510680085a.44.1774023607456;
        Fri, 20 Mar 2026 09:20:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::b00])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9088df1sm194487985a.25.2026.03.20.09.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:20:06 -0700 (PDT)
Date: Fri, 20 Mar 2026 12:20:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
References: <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35256-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: C23AD2DD438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:16:22PM +0000, Thinh Nguyen wrote:
> On Wed, Mar 18, 2026, Alan Stern wrote:
> > On Wed, Mar 18, 2026 at 11:59:21PM +0000, Thinh Nguyen wrote:
> > > I've seen Windows drivers handling UAS transaction error recovery
> > > through clear-halt and retry SCSI command, and it works well. I hope to
> > > see this type of recovery implemented for usb storage and uas devices in
> > > the future.
> > 
> > I don't know about uas, but usb-storage handles transaction error 
> > recovery in approximately the same way.  A clear-halt is issued only if 
> > the device sent a halt token -- but that's not considered a transaction 
> 
> That's -EPIPE right? With this, the storage driver knows that it needs to
> perform clear-halt because the bulk endpoint is STALL, not -EPROTO.

Correct.  As for Michal's caveats regarding TTs, they don't really apply 
to USB mass-storage devices because almost all of them can connect at 
high speed or even at SuperSpeed.  Besides, even if there was a device 
behind a TT and the TT messed up recovery from a -EPIPE, usb-storage 
would simply proceed with a port reset.

(There may be a few oddball devices out there which can only run at full 
speed.  For instance, at one time when Linus reported that his wife was 
having a problem with some low-end mass-storage device she used for 
knitting or crochet.  It turned out not to be any sort of protocol 
error; the problem was caused by the userspace utilities that probe each 
newly added disk looking for partition and LVM information -- this 
device was extremely slow and had a total storage capacity something 
like a mere 100 KB (not MB!), and the utilities were trying to read all 
of it repeatedly, which took a long time.)

> > error.  Otherwise, for things like -EPROTO, usb-storage does a device 
> > reset and the SCSI command is retried.  Possibly skipping some initial 
> 
> The recovery I'm thinking of doesn't involve a port reset. A port reset
> is very disruptive and will impact performance greatly. I'm referring to
> an intermediate recovery step at the usb storage driver without
> delegating to the SCSI layer.

I don't know what other sort of intermediate reset could be carried out.  
The Bulk-Only-Transport protocol _does_ include a class-specific reset 
request, but usb-storage doesn't use it because experience has shown 
that practically no USB mass-storage devices implement it properly 
(which was probably a consequence of the fact that Windows did not use 
it).

In fact, the error recovery sequence used by usb-storage is as similar 
to what Windows does -- or did, since this goes back quite a few years 
-- as I could make it.

Naturally, UAS may be a totally different situation.

> Currently we _have_ to do a port reset because the bulk sequence can be
> out of sync and the xhci doesn't synchronize against the device for the
> storage driver to retry the command directly.

The same is true for EHCI.

> What I'd like to see is that the endpoint can be put in a state where
> the class driver can submit a new URB without unbind/reset/power cycle.
> With the current implementation of the xhci driver, we cannot do that
> for bulk endpoints with -EPROTO error.

Which means unlinking queued URBs (either automatically by the core or 
else by hand in the class driver), waiting for them to complete, and 
issuing a clear-halt.  Once that is done, submission of new URBs should 
work, if the cause of the error was transient and has gone away.

I don't make any distinction here between resubmitting the URB that 
failed (a retry) or submitting a new, completely different URB.  But 
Michal is right that under some circumstances, when communicating with a 
low- or full-speed device (which is common with HID), data may get lost 
or duplicated.  I don't see anything we can do about that.

Alan Stern

