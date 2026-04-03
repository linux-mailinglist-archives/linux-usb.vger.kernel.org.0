Return-Path: <linux-usb+bounces-35950-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oACMMk8g0GnU3gYAu9opvQ
	(envelope-from <linux-usb+bounces-35950-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 22:17:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2A398171
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 22:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD3AC3045E18
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 20:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F181B3D47A2;
	Fri,  3 Apr 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="V/Sjak95"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35881126F0A
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247436; cv=none; b=q+9cvNPvFZBgSCT4NgJLJoTT/dwaULugXvsZlblD35zCGA3YvLPl3yMS8PCInPQ6kwoSeyai5ammtFfPS0dHL/03h4EtUycO8easZyCxBEkvXgzVJ98XNf9lvHPKQfT5tiNMeiJNL5UC+aFO7AedZLzwLgNGSXWerfhjGgPMkko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247436; c=relaxed/simple;
	bh=X7b5BQKZwXDV/yQHvjlJZ8H9Lg9AHyFw/eSu7ejSUIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhTOWIWwwdw1pmLbx+4fRIS6HN64XhSDrYybG/XqPLO73QDo3sbNqH7gXw9IbrPCrDaO/XVzYxzbWbVZUvjA5Oklcl8EHcq2su6y0axF6DIAZVOOmQF6p4gI38Yim3NFRHanXgluKrFTR5rxysPfY5OrOETbni2DaNiobaKsL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=V/Sjak95; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50d6249bb99so12317481cf.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 13:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775247434; x=1775852234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrHTfUDXpyCQ1AFgLt6WscpfLAuXvMp0wjOq+G5OIvs=;
        b=V/Sjak95Xu7C4esuIfeykPxgy+iWzcOJF8QsbqsDOUY+RKcW3Hl/+zgn6R2Swc5TZq
         Nih+IFEb01aRj3tEGzVicKRSCT+Hi53ABfpFW+dpgy35FmV6lA6Upft2Tln6FUmL8H8U
         06sUrcIda7Cg7He6o0DpHB5BbE9MB0eUOO7wMDYKZY7mfw+gJIDkbv4V8yLpsv3+AmVD
         2tHnM9CLubWPaZ/dLJC7Bm8kLR9seS3ur8pgEoU/7fC4GzVXtRXm1r8CjSwjDeebc+1+
         Br0ccWZi7zbcB6tko4WW5us6mHvxju6OqzW2Oh0C2R/gccEAierpgbDrVUP+aZnIplab
         itfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247434; x=1775852234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrHTfUDXpyCQ1AFgLt6WscpfLAuXvMp0wjOq+G5OIvs=;
        b=C8LPAHHs6scjjytP/CtGbiAbEGHlfAvNFXB1Qs+u/jEh18BEnypQQ0ZT7bZHd6qwLi
         6+ohz6RPLKRKPIxRbtsYLveZqn/XARvlRFjB7NOrTVfvi7RkBOnQeAbDv0awWAW6cCt0
         qpAFoV0z7X9T7ZUBo/u2v9ZSorgauFSWuS5WNvaFZlxur00yDyNM5FQ/6SAJdbOGCyG4
         Nty8VUY8E11Dfudkx3KfN4+KdutqTe83lWXxQHfZUDoycltxwOZMovhSP7K/F15rG8PG
         GW3W6vWXnvkQLoFEk4PM2tndBoa4dVYXimzEsN0zUQU5CQWAcxFhJjqTfoZhKt4TrXMJ
         x3NA==
X-Forwarded-Encrypted: i=1; AJvYcCVqpkDY+4f6AJv4heE8lbHaoudFAybPSWfX6N7UnFulgtShJtAJP7jddBTaf6Td1SbTVc0scJekkOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/gk7q6HMLVuuKpCa0rdkCbt2DbqMl3rHcSzSXAdBC5k7cwjU
	4ayoU1odXCcCArjs0ef6b01i/D0YW0Lk81ZakKUFKcTj9+lCs3Wku/Nw9jWRXFxGng==
X-Gm-Gg: ATEYQzyEFglt3v4TqSF/Ph4kMEyX24J0vzkGRuDRv+JtEBxg4a69qTF3ulXDaSMfKBv
	0Ay/yxIalX3erS9shTRhnFOI6xDQ5b3HYOBFMPq6zzn5eqwqu119CmRvoYIq8gSinh56cIAXHHv
	tocPbt9FKhbZ8vnIQl4G9QBFEeYe2VUBfdAWMPOBSHQ6zxAJ/jvlCqyGz8dHZdh8KpO3RuZ7sTK
	PZ+zhUi6CL46J368HNVWLMFQ3YG9VxbE/mHUTKQjJnr7te7a9tUgUDaVZI7vMT8ssBlvYUWHDfd
	NAkMOaPoAX5F3X/j+8bojsLpLre8JpbifAGIY9kvadv5djTWJT8rvnS6TGqNOIPrFy2DVJUOd7D
	SP/UAY+e5ZHx81D2Sv7KaZXTtJiitGOCJr6kmXWD3/JsNyyuAnNvPG1SmUbtPzufGP+4DArv9YE
	np7vs3x/tMQtXdAOQOBsQzEc9mcwQfA1tYZBk=
X-Received: by 2002:a05:622a:4cc8:b0:509:1590:f5b3 with SMTP id d75a77b69052e-50d62cc0332mr62669381cf.35.1775247433906;
        Fri, 03 Apr 2026 13:17:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a3fd2sm66811731cf.3.2026.04.03.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:17:13 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:17:10 -0400
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: xhci-hcd and URB_SHORT_NOT_OK
Message-ID: <ef1e2648-602e-45c6-90d5-de3ef15a7e7a@rowland.harvard.edu>
References: <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260403105145.7e74a410.michal.pecio@gmail.com>
 <f3897bb1-fd9e-4321-bc62-31ae8329706b@rowland.harvard.edu>
 <20260403211337.7b964af2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403211337.7b964af2.michal.pecio@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35950-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29F2A398171
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:13:37PM +0200, Michal Pecio wrote:
> On Fri, 3 Apr 2026 10:55:58 -0400, stern@rowland.harvard.edu wrote:
> > > This doesn't work in xhci-hcd and I'm not sure if it can. I don't
> > > recall any way to make endpoints halt on short transfer at all.
> > > 
> > > The driver does exactly two things with this flag:
> > > 1. Isochronus frames get EREMOTEIO status when it's detected,
> > >    although ISTR that URB_SHORT_NOT_OK isn't defined for isochronous
> > > 2. All others log a dbg() message. Supposedly, core is
> > >    responsible for updating urb->status then.  
> > 
> > Truly?  What happens if usb-storage is doing a large bulk-IN transfer
> > comprising multiple data URBs (with URB_SHORT_NOT_OK set in all but
> > the last one), and the device indicates an early end-of-data by
> > sending a short packet in the middle?  Will xhci-hcd store the
> > information in the following bulk-IN status transaction to the
> > transfer buffer for the next URB in the queue of data URBs?
> 
> Not sure if I understand the question, but if you mean that the driver
> submits multiple "data" URBs followed by a "status" URB to the same
> pipe and expects it to stop when any data URB completes short, so that
> all others can be unlinked before the status transfer, then nope, not
> gonna happen. It will be racing with status being written to the data
> URBs and likely lose. The status URB may never complete.
> 
> I really don't recall any way of stopping on short transfers and the
> relevant xHCI 4.10.1.1 section isn't helpful. It's possible to stop
> unconditionally and decide to restart or not, at some performance cost.
> 
> But short transfer always terminates the current URB, so natural way is
> to coalesce all data into a big SG URB. Perhaps xhci-hcd could do it
> transparently, though that would get awkward if a driver doesn't unlink
> the remaining SHORT_NOT_OK URBs - we would need to "rewind".
> 
> On the upside, I don't see many users of SHORT_NOT_OK URB. This string
> appears in Documentation, include, drivers/usb/host, files ending wih
> hcd.c, devio/usbip, and usb_sg_init(). The latter is probably what you
> were referring to, and it seems to have a shortcut for SG-capable HCs,
> which hopefully doesn't require SHORT_NOT_OK to be functional?

usb_sg_init() _is_ what I was thinking of, and I had forgotten about the 
single-URB shortcut for SG-capable HCs.

Clearly we're also going to have to update the kerneldoc, not just the 
code.  If an HCD doesn't support SG then it needs to support stopping an 
endpoint on short transfers.

Alan Stern

