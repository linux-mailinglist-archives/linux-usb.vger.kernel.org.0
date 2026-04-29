Return-Path: <linux-usb+bounces-36706-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCnXJjpG8mmTpQEAu9opvQ
	(envelope-from <linux-usb+bounces-36706-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:56:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 060094985DB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CD1D301F4BA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8103038C2A7;
	Wed, 29 Apr 2026 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T4aQozMH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D9383C83
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485367; cv=none; b=A1w1ttOVdYfQbGPSQTsW/zUqg0GuxC9IDZaPIJvpdILoBnyh8Er08GpkoMHRf1z1e10yPnSqMTm2GfSi5vgr9EPpo/96a/PtqD8h/TtiivEY6apjSTeojwZRr15UGIY9VcXBH02Yxl3JwkGd4GFXrE8e27hRShiJw8zwMPaGxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485367; c=relaxed/simple;
	bh=3oMSdGvhaS5O15idg6mxCFxDso8YAFwXFd0nNSCdQxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioIvvPrRExRFjn/yFu3C89fum9+3sLqGxDHuLjeWW9qDpzsSvYbhZtCWAkKZfOOH14mAjctW+a0t69Ut0OCzIkevdiO49FS4QzvN2+/JbHt+/bItne9MC7UwlmlXD6ccFYVZj142T0b8JrmAy/yHd9Cte4NrzqV9oMbOoPSUgRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T4aQozMH; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d4f78fc9f6so4500985a.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777485364; x=1778090164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65FJtXCpfqPe4NbCRkdmfcp9Mgki0OBNqzmnPS32nJY=;
        b=T4aQozMHPuwBEabkvuz9eK+ax8CeaE5UI+L1eraiccVpmu36oO9mpJ9lFFbT3XWeAS
         7IUZMLR027M4nM+NDl6Sl+lA6EVoxRTVlw67kOe7j51MX77lKm9ih9rucKaLuGiXJEIr
         rKBexlibRgGf0mvj3V+olhOQD/YhAnFWvKTpSljBKuqqyC8kLVRQ64+fZXfJBOgzmJIh
         GlfjPU3zOzIQUpm90PhOmJ4IIvGyZbwpsShycrchA239KaMSl5GSCCjZElh5SsaFLrGS
         munYAbVty48ei9JeHCDDzWYUN4CvFJQtrr5vare9lLoajznk5gR6PGBo02H3zDB42FPq
         SSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485364; x=1778090164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65FJtXCpfqPe4NbCRkdmfcp9Mgki0OBNqzmnPS32nJY=;
        b=DA/aNXeVjBh/Miw6IZLnc88WBn9c8c2b3ihp5CGNtK/HOG1sErRnNOsNEYkAMxEZwW
         eU8aDubAPSOaLeS42E7yut8O9l3/oFdnkXSQQLWAED5c2NBP4wh1NZdb8t02yMKMYcqN
         QJoKl1DD6K16a049OmTFLFYSq9f5LUdWyqAUk2l+WWdKGkgsVJ2LoOcZHMr/m4ukp23k
         /NUxcmaS0gpsvFQv8S09HJbr66xjatD0FkG3FfTvNodwtLt8ZvERIGrPcndlmpIhA0xV
         smzaXJItRIHGxwEHT9iDggDYIr5nfxDUHBg+YjoGUR6kr9gbty9ssSuFRLjNL6Qko87w
         ezjA==
X-Forwarded-Encrypted: i=1; AFNElJ+bixWUlkCoNpw+lkX6j+jt8btqnk0TMNtP+XS3kKD2MCdSnt+I+ArkdhQUEhR4OlKf21/C6QUK1RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBukR2g62fH+HuuzQPZrT6ijonieLHsTMyL+w9WS9uAuv6IIjh
	kuZAdU2yl0NJg0jhFLgis6iqEdipiSFN75wOWqRu6ImoM9t3CZIVAURU+77ESU9M0A==
X-Gm-Gg: AeBDieuzHy36YcSYGmNdHHce1i6h++buRn451ORQjkut2BjALKxl7d31x4tujBxrcOG
	GCEhS/VGxJ39F0HefOaCB3a5OShCc7HnI8xoNScW2DoJwTiohMhDjT3YHr/iYoUbQ3sz8vDnprZ
	QygJENMFhMrWHcYgvnRT6P26p0+XAUCJC0doaSWaBA5GFenF5uKJvt+0GYP7h8PfMHbBTkyUexm
	8Ov3pB5qeCUa+4OwY/3qg/RHZWZGtb8pfJOdy9zXQT7bJITAjZjMQC4h/3u5zWJylmIYs7DLHDv
	sEjDCTVdqY2kZQEpgE4ji+zS01lyc+hWQ4vXQdwBUvyK7BVFf8mUV3SfHUepkwy4aWnSIEzyIO/
	XePHvJDGJuh5zVxcvYmX3YfGoPfgzA75MJ1KjODejQ0xgZK8zWv5kC0SZfCrPvdRKs5+B+nft82
	y90ZqXfWfaJdJeKvSpE2I8AIX6HEqKtdk1N0WaX8yEKs4nnDv5X7NdD0BukPQWjnGv+WbCfae3X
	9woNc3YUkQZdXgK
X-Received: by 2002:a05:620a:2955:b0:8eb:cbf8:85e7 with SMTP id af79cd13be357-8f7d9201d7emr1180541385a.34.1777485364411;
        Wed, 29 Apr 2026 10:56:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f582702sm222334585a.29.2026.04.29.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:56:03 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:56:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; =?utf-8?Q?accom?=
 =?utf-8?Q?modate_1023-byte_full-speed_isochronous=E2=80=93in?= endpoints
Message-ID: <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429113604.2204b646.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 060094985DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36706-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Wed, Apr 29, 2026 at 11:36:04AM +0200, Michal Pecio wrote:
> The host must schedule SSPLITs assuming no bit-stuffing to prevent TT
> buffer underrun on long OUT packets. Assuming minimum/no packet headers
> further minimizes downstream idle. TTs are required to buffer this.

There's a difference between scheduling and budgeting; it sounds like 
you are mixing them up.  Roughly speaking, scheduling refers to when 
transactions actually take place whereas budgeting is concerned with 
when a full/low-speed transaction's SSPLITs and CSPLITs take place.

So the host budgets SSPLITs, it doesn't schedule them.  (Well, I suppose 
it does also schedule them, because we don't want to send too many 
SSPLITs to too many different hubs and TTs in any one microframe and 
thereby overload the high-speed bus, but that's not what we're talking 
about here.)  TT buffer underrun on long OUT transactions doesn't take 
place, because even if only, say, 10 bytes from the start of a 500-byte 
isochronous transaction are budgeted for a particular microframe, the 
host controller will send a full 188 data bytes in the SSPLIT 
transaction.

> (BTW, periodic transfers should occur before async. Could the TT run
> out of periodic, do async, then get an unexpected periodic transaction
> in the next uframe? What happens?)

This can't happen as long as each SSPLIT transfers the smaller of 188 
bytes or the number of bytes remaining.

> Including packet headers for SSPLIT scheduling seems harmless unless
> overestimated, but apparently it's not required. TTs must cope.

Again, budgeting not scheduling, but yes.

> Separately, for go/no-go (ENOSPC) decisions, the host should consider
> all overhead in order to guarantee >10% downstream time for async.

It does.  That's scheduling, not budgeting.  Both have to be taken into 
account.

> Max payload is still close to 1157 because it may be just two packets.

Well, on the full-speed bus there has to be an OUT packet (3 bytes).  
Each data packet has to have a PID byte and 2 CRC bytes (another 3).  
Isochronous transactions don't have handshakes, but interrupt 
transactions do (one more byte).  Also, each packet has to start with a 
SYNC field (one byte).  Then there's EOP (End Of Packet) signalling, 
inter-packet delays, and turnaround delays, which are hard to add up.  
Plus time required for the SOF packet.  Taking it all together, I don't 
think you can realistically squeeze more than 1140 periodic data bytes 
into a frame, probably less.

> That's how I see it.
> 
> > Since the value of stream->ps.tt_usecs calculated in
> > iso_stream_init() does include the 7/6 bit-stuffing factor, it makes
> > sense to adjust the us-per-uframe values to reverse that effect for
> > purposes of budgeting. It would be more in the spirit of the spec to
> > do the budgeting in terms of bytes rather than microseconds, but
> > since it's all estimates anyway this shouldn't matter.
> 
> Not entirely sure about it, *if* these computations are later used to
> schedule SSPLIT or CSPLIT transactions. That needs to be exact IMO.

The ps.tt_usecs values are the number of microseconds required behind 
the TT, on the full-speed bus.  They are used for scheduling on that bus 
and for budgeting, but not for scheduling on the high-speed bus.  See 
the definition of struct ehci_per_sched in host/ehci.h.

> Does anyone understand why the previous attempt at enabling 1023 byte
> isoc IN resulted in isoc OUT corruption?

I don't know if we ever figured it out.  It probably had to do with 
running up against the limitations of the implementation in ehci-hcd.

> BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next frame?
> It's an edge case which likely won't occur with one 1023 byte endpoint,
> but it may occur with more periodic endpoints and unlucky bit stuffing
> or with periodic BW limit carefully increased for testing purposes.

It does not support CSPLITs in Y7 of the current frame or Y0 of the next 
frame.  This is one of those limitations just mentioned.  Adding support 
would complicate the driver considerably and yield relatively little 
benefit now that xHCI is so widespread.

And yes, this does mean that there are some loads ehci-hcd simply can't 
handle even though in theory they ought to work.  A realistic example is 
having large isochronous transfers going on along with some interrupt 
transfers; it's not uncommon for audio devices to include both sorts of 
endpoints.  Ironically, these things work better with an OHCI or UHCI 
controller than they do with ehci-hcd.

(IMO the USB-IF misjudged the design for split transactions, putting too 
much of the burden on the host controller driver software instead of the 
TT hardware.  They could have required TTs to have considerably larger 
buffers; it would have made things a lot simpler.  But no doubt they 
were constrained by the hardware's capabilities back then.)

Alan Stern

