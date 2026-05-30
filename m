Return-Path: <linux-usb+bounces-38177-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB+0Orv4GmrH+AgAu9opvQ
	(envelope-from <linux-usb+bounces-38177-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 16:48:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4C60D926
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 16:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697EA3024CB3
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 14:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958722F9C37;
	Sat, 30 May 2026 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aurWcXcO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBFD2D3225
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780152499; cv=none; b=fF7F8HT4GA+gdTK9GkCESuCFo/dbq6zmrvdxtxBXbHWIWJc/jxni7qHOGdLvI9TbeKjQOf8RdX/5R0U/2hSUm8HWaNeQG+6sWsECv00cQR+SpjseyjbF1Yel9TUQvY7JhlSU5jV1IYlkD3X0pvx7Jp1qNSWFf1r+/mHrxAWcaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780152499; c=relaxed/simple;
	bh=smmYulatWZaRea8tVQuishn0gIRf1ZCPedgK+60sp5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8WlhR0/G4ND0y+JI/q855bjekvtJtGRRWn9cdOmZKrKk9qFm4Pe/HY4JKkGemKpFbQQl9bAEPNYx0J7Q15e6HNFwyKrerBfEwTECDBzDSLxZuFW1RuwKAYBlHu/g/6mrNw63/9xlWg6pOPmFMAcztyhT4rIdnic7mA6pHewC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aurWcXcO; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso168740096d6.0
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780152497; x=1780757297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8TCSz8CdiHlYDuiVY2jRC+66HY0ze0yI9AAz8gUT+ms=;
        b=aurWcXcO4957xdaDk/9Kd6j2cO1fkVrFrpRDTD5yRxPOTTmaGqtczk0Z/TdXsc5Tzo
         berbqpR8n0mVmNvU2KOq3YZhv0ESYLeioh2M0aLWcaMZ7k5noGj38eXPJ9LCrrTElsbN
         UhkeWrjExvCIES6x6JqPW0oXd/27lBc+kl7qVRNnEso8MidQ7I69WPRLPRAqAHMBLL93
         ICb3FAMoMhJFdnhhKjqjg7Tr9gWxcdDQifhBjtXcXQBzWE1iKVYazycX0WTKAAj/OF+C
         nRFrPvcpiVEAUuCZtD3qTcmtQSNbSoC0D6UwNFZjDN+OI8vGJ2QRAsH8fzhQnj6HbIie
         MFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780152497; x=1780757297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TCSz8CdiHlYDuiVY2jRC+66HY0ze0yI9AAz8gUT+ms=;
        b=c6hPPB+hSTl5oAjTWDZWaR7pJ0ZduwWSuY1paOIOqT8DOPcX6ywUVHtOsV7vaYnXhL
         L9QcRoQwkLYR4WLghKUrgNUvt7jCi3tXNwFU1GS7LP0iFFtol5PO+W5WJuygq3hMhWSy
         tbxFUNQVhO6zN7JFbqWeqV+rvAWRquCNTGyXAPZUpvZSEH4xfOIeLg7AUIQqNA8sNwCQ
         VMc0UIUHw0g0eREuQsMiFwYjOFKq0EXTnvZHAoTy7y38+qoVrBRINOOuPVNprPT349At
         QsWloR9YY94Uly6xPWL1wwHRUpAnpVyb6UAj2tHBLxKg2w6rYfGnKsMgpoudcRP57y8H
         Oevw==
X-Gm-Message-State: AOJu0YzWo15MryXK8R25ZGxuL5Q+747WNiROTSE4OQ10Vyf7F5WTmI0Q
	XJp7zAx+BZ1G1bvsNK24duaHqYT3ETKrBRL8pOPivCv2/BK0+32OPAegmw8T4IueHA==
X-Gm-Gg: Acq92OFPucxtf8AXfMkVIKL6b7WegodgLU3wj855rB+sES79OL5nmtavHW3teqhLAbT
	Gnz+Z9XEhvw5c2ygw2XvTyqYjYiRoIKWZyhwHEB1XtQLwIDXrMXtiJJ6EanUsIjYjxw4Upk+oRz
	OXEmeUDx001vTTYxtbOJWBQyQo9JORb6vhFthpEqqiRiHTvcu8jjyelBIwyY6z7nVWr63G5ppdE
	OyJnNr8syRWaqGpibN3iCoaacUy8ds0R8KjHOBrCHB4NatuZebEz+SPE98gilRGvdo9+rGsamgL
	Zggky3DagXEkPnpf7q4YRqSrOEFJFuTZ6uzSKzAhbUk7oaQ0u3eakwCPV2rN+rsA5J9TVP6xP87
	Neg70RhGMqpqSMwOQj4Ew6tIDcsQ7pevnB74VmQ/8ccZIEsp72T7j2k5UszIfT2+iXYAKGB0mkd
	DnCP1AkgjUnlVr+15tB4sgsd95QZkvQqK+KI39aQSWnXTK+u7A4SpYLA==
X-Received: by 2002:ad4:5b87:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-8ccefd8d30amr65293046d6.23.1780152496833;
        Sat, 30 May 2026 07:48:16 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea1c2ca3sm45934456d6.29.2026.05.30.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:48:16 -0700 (PDT)
Date: Sat, 30 May 2026 10:48:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de,
	lijiayi@kylinos.cn, oneukum@suse.com, bence98@sch.bme.hu,
	eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38177-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 48F4C60D926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 12:27:13PM +0530, Nikhil Solanke wrote:
> Thanks for the follow up.
> 
> > It would be nice to know _how_ the 9-byte request fails.  That is, what is the status code when the request completes?  This information is in the usbmon trace.
> 
> The device reports failure by responding with a GET DESCRIPTOR
> Response (not a GET DESCRIPTOR Response CONFIGURATION) that has no
> descriptor response data and sets URB Status with EPROTO (-71) which
> the kernel reports as is in dmesg (unable to read config index 0
> descriptor/start: -71).

Actually what happens is the device disconnects from the USB bus without 
responding at all.  (Probably it does this as part of reinitializing 
with the fallback-mode firmware.)  That's what leads to the -71 errors.

> > Also, what happens under Windows?  Isn't a 9-byte Get-Config-Descriptor request standard in Windows as well as Linux?
> 
> Yes it is the standard on both platforms and that is what bugged me
> too. I'll be attaching the packet traces here, but here's a quick
> observation regarding that:
> On windows, the usbpcap captures shows that windows sets Packet Data
> Length in the URB data as 8 but requests wLength of 9 in Setup Data.

The Packet Data Length probably refers to the length of the request, not 
the length of the response.

The difference between the two operating systems is that Linux issues a 
Get-Device-Qualifier-Descriptor request three times (each time the 
device responds with a Halt) before issuing the length-9 
Get-Configuration-Descriptor request.  But Windows does not ask for the 
Device Qualifier descriptor; it just sends the length-9 request for the 
Configuration descriptor directly and the device responds properly.

> Linux on the other hand has URB Length equal to the wLength and Data
> Length as 0.

Again, you may be misinpreting the meaning of those values.  But it 
doesn't matter.

> Furthermore, the device enumerates perfectly fine in the
> fallback mode (Android mode) with the 9-byte descriptor request.
> Further testing also revealed that the xinput mode would fail with
> broken pipe error if I use an external USB hub. However, all these
> issues are magically resolved with just a slightly bigger request.
> 
> I also had tested the device with various other existing quirks as
> well but none worked. I also tested using the
> usbcore.old_scheme_first=1 kernel cmdline, which failed as well.
> 
> > I doubt that anything needs to be instrumented.  If the device doesn't respond properly to a standard request, it's the device's fault.
> 
> That seems most likely to be the case. However, this behavior is found
> with other third-party Xbox-compatible controllers as well (i
> personally tried 2 other controllers that failed the same way). They
> all fail the enumeration stage in the same way. Wouldn't it be
> appropriate to introduce a proper fix as a "quirk" in the main line
> kernel?

You should try setting the USB_QUIRK_DEVICE_QUALIFIER flag for the 
device.  If that doesn't fix the problem, collect and post another 
usbmon trace showing what happens.  If it does fix the problem, you can 
submit a patch with this quirk flag instead of adding a new one.

> Note: i have attached the packet traces, but they are truncated to
> only show the device communications with the host and any intermediate
> packets. There were other packets sent and received that communicated
> with the USB root hub before the device started its enumeration.
> Should I include those as well?

No, what you did is fine.

Alan Stern

