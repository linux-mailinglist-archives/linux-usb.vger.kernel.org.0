Return-Path: <linux-usb+bounces-35636-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dTG7JrbSyWlj2wUAu9opvQ
	(envelope-from <linux-usb+bounces-35636-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 03:32:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8604135495C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 03:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B8873001F9F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 01:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD239202C29;
	Mon, 30 Mar 2026 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="u5hgZmAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD013D51C
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834352; cv=none; b=ajrHXEv4YVCZU5tTpzzzP164P/diki80mjhLKIpE4YgkFsXyu703ZKswp7CEchlajjrcfJbWnZcl1OOAchCRD5YpniLvuzH2vXCvdaMD/vRcZHDWv1CePMSB4bxxgNUlKJqrbdEE9Mj+QJguUQV/PqKk7Zs06EcMB1dzjnhzSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834352; c=relaxed/simple;
	bh=PZSXf9E3dY/2FG74Zz1fPytBnIP5Tk4dBsocHBbmI9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byku0BLWs0Vbko5+qwxvMOfTwKSh95Chebz3o5xdm0YHfydSJWv2go4UNo5JdiRUwV4l4ybpiwrSNjQf3Tbe8gdo8RaByANfJbKmOXTDX77PFnyZFbboujidiO4MrqC88n+YJR2hNxeYldixViymDhLr1j9SILJx7PgvCQdrLVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=u5hgZmAb; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89f68634786so16315596d6.1
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 18:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774834350; x=1775439150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzqLy+cwNRvIPoFwXjevR5uPDspg3lNF5se3ZxeSfHY=;
        b=u5hgZmAbHjaJh9XCpm5fXTZOS36QmISpvNjWyc0NrTaqVDmwb4r7rVdcRUY4nKhwJv
         1Z7Jhk2EE7ZFK6FCBhgrCqSSKykSdSnFPClVMgqezZFyiQK395h1eGCSsyOVyihy8aeR
         JBjs4qWLJ/2YqbPXXnE9Cd3m0QrpdqHv72XZLTTS5Qdu/1BkNHQ0IvzCK/2/yRRga8A9
         p+PU/ZoXUuUpfrbK6+tL7tp4FCWy7LbeIfLtQqsX4dNnO64KyDFE36Uwj/lFFNnhIOt2
         o+muRPboSAOuszxDDvsDzoiotRmpjEH/sysRn7bZ8WFPyKVbCF2+42thum03slfGRMcR
         PiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774834350; x=1775439150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzqLy+cwNRvIPoFwXjevR5uPDspg3lNF5se3ZxeSfHY=;
        b=M1I2mXHJsJB7dXykk9qjY3AsMx6hNTEJRqFBi0N+oUQdKkLLccdMUDHsyZAyFWwYuL
         lCrwG2w7SjA+EGNLYm3MdizIhzg9VMt0ONy0yiP523Ii1dAryd4iKFwtLDsXjGG8nTtC
         QHqHYvvTRQqE5zv9iI3LXSZvPm2hJmXfU8fZnJRzkTC5nsou7wrWnlYl1ar0+1ZTwl/b
         Weyllv7QGQIWimIGgRhY6HLacsQ6Q4jCPhqrj1ZZqzkJhOjPMLlG2njn9PZXnKjxUONH
         96Lw0c1WQR5wJqathjOmVLek4KyonfehrScvTQmnnqg+P8kJv+nrjjd9jR0xaaoP943P
         CFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHhwwnfmTFZVH5ReR1kYPB9TxOQGJ7KdvuCnj+mbevpv6+54myNqp+cnE+jXssUmJw39c36krvKQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23ZbRjqy0SgbxU/eK9ZGCzGb1JO6U+CyDc8I7CBwVdrkihftv
	SrsOA3tyYdQfrU7Ny3MMD2S1fdixzK3ydfNipTq/8ElfUu5sySd0OAFl7LudNPV8P8FHpztAhSw
	wmzTGJQ==
X-Gm-Gg: ATEYQzxzC11j2Kmd05P7K/OLPp425R2wK7WGdvAz2XN76wWvyCIAF0Zm88Jj6CKYm5/
	eTJszE2VDNAagGTvqbY2wyMfGshBaGNRkfWvhVAlxOaUbDi8akxKQ+AvViHDm6VuM3h7oBZxMf/
	k82+wp/sIZZssfzH/+G/BmbFOzBYSwVV4KaV1QRNIrYvaLdqt43hPkbfDjK684Wq0Vg6MGrmaw6
	/2Lw76SukmstEZUD33Xe+c7xXbe5TjIZyRXMU76r2ON8HWKh8vUdUMQLXYHehD7dKPZ3Vd5Zg+I
	W4K5tN34kfLarbxpCOy4vAHyS+AsZN+nn3U1n9p7VorAnSpPrLaoT+ckhqX8wfSDxnVBDTJOMes
	SAdUZxnS4iM1rNFSpUFa/mv1Zt0NCMBqcCZqoZ1j7cpiryo+nqy+STuRCVLSxAvuPVvEWM0jR77
	BpRBz96CyC8fjkniLyM3VtLsqm
X-Received: by 2002:a05:6214:3215:b0:89c:d808:c255 with SMTP id 6a1803df08f44-89ce8e8e731mr132545376d6.37.1774834349890;
        Sun, 29 Mar 2026 18:32:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecfd520a6sm47898236d6.41.2026.03.29.18.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 18:32:29 -0700 (PDT)
Date: Sun, 29 Mar 2026 21:32:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <ba68bdbb-9ffd-47d3-8915-9e2e40fd6adb@rowland.harvard.edu>
References: <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <20260321065424.76a80508.michal.pecio@gmail.com>
 <d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
 <20260328222217.297200bd.michal.pecio@gmail.com>
 <22c70ca7-57dc-4328-a5cc-d46c4f73556f@rowland.harvard.edu>
 <20260329184611.0afa92c7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329184611.0afa92c7.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35636-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 8604135495C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 06:46:11PM +0200, Michal Pecio wrote:
> On Sat, 28 Mar 2026 21:52:37 -0400, Alan Stern wrote:
> > Storage is not a good example.  It's so obviously critical that a
> > huge amount of effort has gone into making it exceptionally robust.
> > Very few of the other drivers do as good a job of error recovery.
> 
> I though it's a good example because all the effort is in vain if
> xhci runs subsequent URBs before the driver even knows about it.

While I can't speak about the uas driver, usb-storage submits only one 
URB at a time for command and status.  For data transfers it uses the 
scatter-gather library in core/message.c, which does queue up a whole 
list of URBs.  But the library is very careful, when any error occurs, 
to have the completion handler immediately unlink all the outstanding 
URBs in the queue (see sg_complete()).

uas has to work with USB streams, which no doubt makes everything even 
more complicated.

> > Other drivers that might be affected include things like HID
> 
> HID doesn't submit multiple URBs so there is nothing to restart after
> an error, but it's affected by the unilateral toggle reset issue.
> 
> And by the way, is there any chance that ohci-hcd also clears host
> toggle on errors? I'm doing simple test with a keyboard (low speed
> interrupt in): disconnect D+ which causes some ETIME errors, connect
> it back, press and hold 'u'. Half the time uuuuu shows up, half the
> time only when I later add shift does UUUUU show up. Looks like the
> first packet is dropped due to toggle. I see it on xhci (known bug)
> and also on ohci, but never on ehci with a TT hub.

OHCI maintains its data toggle values in data structures that are stored 
in the host computer's memory and accessed/updated via coherent DMA.  
The data toggles are not updated when an error occurs -- but I don't 
remember all the details of what the driver does, so something funky 
could be happening.

It's hard to say what's going on with your hardware tests.  You'd have 
to use a bus analyzer to be certain.

> > various serial protocols
> 
> If you mean usbserial, they are pretty boring. On completion they just
> submit the next URB, except for EPIPE, ENODEV etc. There is data loss
> on OUT endpoints, there can be more data loss due to toggle mismatch,
> and throwing out already queued URBs would probably add more loss.
> 
> It seems usbserial won't care whether we restart instantly or not.

I was also thinking of things like cdc-acm and cdc-wdm.  They do 
maintain queues of URBs, and I don't know how they handle errors.

> > network drivers, video & audio
> 
> And I suspect they are similar, because higher layers can tolerate loss
> so why bother recovering from USB errors. I may play with them later.
> 
> BTW, I think audio only runs over isochronous. But I should have a bulk
> video device somethere.

There may be a few oddball devices doing things like that.  A lot of 
video devices use the uvcvideo driver, which (as far as I know) relies 
entirely on isochronous transfers for its streaming data.

Alan Stern

