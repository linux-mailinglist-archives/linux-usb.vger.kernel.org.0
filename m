Return-Path: <linux-usb+bounces-34753-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDuXEqcutGkEigAAu9opvQ
	(envelope-from <linux-usb+bounces-34753-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:35:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EEF28618E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5424E3207113
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EE13B0AC8;
	Fri, 13 Mar 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Aix5MvXE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C3A875D
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415734; cv=none; b=Uf7wjpK0mOKMCs605BTYHARcNjmVkub/b9WiDDlOWaV0lIXxyjMYu0dKQWuyL0TcK6wcVMgbQo6ZbsABLhUvvCbFIVtXUTIqLZWnIb3H6BSXQP7bJtfwMSrNTK940HCE4c9Rq4T7bn7hcQT9SQHAeqq87jBHoDqFO7LzhcD10mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415734; c=relaxed/simple;
	bh=8wblv2DrSoEVoCeGxuRJ4B6wQzE5aZKGAOBnDonHuaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl8+dmhGcMwUlVnR3gcmErVsfH6Y9+41WEdS5s6+kmmtfzIJk1SmQtMTx4XMltm9Ss/Uqv1iLP+/falKraQ8dfoYxNrM67w5c8bYcIqqg3B44dYSXsyq1dRfM1yZivjxXMvrxpyfAJHFazNJl087gpnHrBQob/Hwxlhp2EvECEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Aix5MvXE; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89a1347051aso24450926d6.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773415732; x=1774020532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69UAd6oNxLy2Lf12hSFzKO7F+MHfqiSbGFCj/fvgEEg=;
        b=Aix5MvXER+i+sHOO4ACvvY0unXKQxLENJEvvTRaD9oiyaDzB2IrL/dxwkk54FUMg7O
         VMu6/2ZAukOORE84tFtQg6qa5WrY1ED/CizSx+JvY189p3vE/h9aCjX7zstGENJ5cr3f
         hUWSMgWGu1cqqUhMQUoIO2r7vK/mNVOrogX7T3sN7/OIETwX3TqGGA/A9Jw9jKJe8AAr
         irO7QKW6Oo3CCvEqL9a1tDmxHL0KKXQhSB9kHe7evLS/GSrpd8Ep8fj/ro0I826Lv8E1
         3q69Xm9+B5VYXQBdgALKcTRm+lsgrcBxigjlj4NBr1Hs9Dh6vwJaw2Q8+9KYEgVJNT3o
         oxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415732; x=1774020532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69UAd6oNxLy2Lf12hSFzKO7F+MHfqiSbGFCj/fvgEEg=;
        b=beXbTMgvw7BpB9GORvp2SMqsgXKk2XE3sSEoeGUurlcE4t5d+zzQVfHti+Lq43uic6
         fqhxIHu+1oUZrTEwqEHhoLyp0guMJvN5MZSH7FYXzg6iCNcm8tbjphvZOJTVU4QfQdcg
         dyiqd212ywCRY/HjhKWYUCcQdptROYOEUuy4x25SYjhGG84jHnIABj6Zy3s2EFWRBcBy
         6aPp4bcfB2KqVFzufNkeW4C8/IK8xf8IIn/X/fZh6w4LGYVwmsUOAnFMhcPibSGlwNvg
         xUMN3QlVD8cQxzCSbqs7EtIQ3qjmO9K2o5QfAdVg7jdlUIImHTRqz5YfyDSVlruS9ZNe
         q+qw==
X-Forwarded-Encrypted: i=1; AJvYcCVUoxnKjEKDTqxFVT67GYPXMU0N3NLmlgNZXFc50v7AKEUDyxASCHoPHf+SyaFfGaHpU9GvMkBDYdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RRIG+U+WXixEkAP49LiowmKWMuae4nd8GmHMaVe7GvZ/QQAT
	6r03YniqibuPWxvgDVyHNgLsDxy0XVbnYfH+9EyVQXDPfSIAhoHNZ6/oq0zIOxo/KBL36+UlZVW
	WzBg=
X-Gm-Gg: ATEYQzwrHxEd21eDlfojpmlZDl1R2AYNyQ+pz0KeV+fPJVJhlE0j+6apEeRCcUTt1nf
	rJ+reNlJz4Ua9iyrVdmWlq4gPt8xZ0/TnedrS49kizDmLugm5+aOecYMYfIe4pS/9RSqovqVazU
	kGQbUnks2F4tZTP78Fc451CgAHks9w5Y6zq6InbTRfb4YUWZQeQEyhCxU7Dj23qYEzCA5xn3uYS
	yjqlZV0z9LzTgIzrkqafVzHesmJGvD06xhCXJEByDSx3o6PmyL7iiQ/PBzLxl8vJZ2/3ZNYkIw7
	qlOH1yUjtLvPULw+Pp4QwyiCCAE6LiQjRlbzSDfeOE1asTXcpP2PMIKvRoHTjGXiZBi6vuRf/5o
	W879Jf+I8qlNUdKRGJIc3uhJhVscs4KtWb+5K/otu8gPba4agF8AflmrncmUAlFiMgWJxrUw8Ib
	t+T55vO8SpGUVB0JpnUb2rU1CE6qTeyQP8cdo=
X-Received: by 2002:a0c:e941:0:b0:899:fb3a:9f63 with SMTP id 6a1803df08f44-89a81dddbccmr38338796d6.20.1773415731709;
        Fri, 13 Mar 2026 08:28:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d17023sm59222836d6.49.2026.03.13.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:28:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 11:28:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34753-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92EEF28618E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:33:48AM +0100, Oliver Neukum wrote:
> On 13.03.26 08:53, Michal Pecio wrote:
> > The official USB philosophy appears to be:
> > - remove any remaining URBs from the endpoint
> > - clear halt (even if not halted)
> > - use class control requests to bring the HW and SW to a valid state
> > - submit new URBs
> 
> This looks a lot like saying that EPROTO is EPIPE by another
> name in the eyes of a driver. Yes, it indicates that the issue comes
> from the transport, not the device, but does that make a practical
> difference?

In some cases it may.  For example, EPROTO can indicate a short-term 
problem (and so retrying would be appropriate) whereas EPIPE generally 
means that the device does not support a particular request (so retrying 
would be futile).

> > Some thoughts:
> > 
> > 1. Giving up on EPROTO may be overly pessimistic. Bit flips happen.
> > 
> >     But EPROTO may also mean disconnection. Parent hub should notice,
> >     then disconnect() will be called at some point and usb_submit_urb()
> >     will begin returning ENODEV.
> > 
> >     Some cable failures cause persistent EPROTO without disconnection
> >     being detected, e.g. D+ or D- discontinuity at low or full speed.
> 
> There are also these pesky software systems where a perpetual immediate
> retry causes a livelock.

Yes, we need to avoid this.

> We have to ask ourselves to which extent we want to deal with failing
> hardware. I would prefer to deal with true hardware failure separately,
> but if you think that we need to include the possibility on a driver level,
> please say so.

I tend to group transaction-level errors like EPROTO into three 
categories:

	1. Device has been unplugged, hub will notify us soon;

	2. Unrecoverable device problem, needs reset or power cycle;

	3. Short term problem (cable issue, EMI, system load).

Retrying makes sense for 3 but not for 1 or 2.  Unfortunately we can't 
tell which category a particular fault lies in.

Furthermore, most drivers shouldn't have to include the code necessary 
to handle all these possibilities.  For some drivers, giving up entirely 
is a simplistic solution that might be good enough.  But others need to 
be more sophisticated; we should make this as easy as possible for them.

> > 2. The idea that a driver can retry a transfer by resubmitting the
> >     failed URB encounters certain problems.
> > 
> 
> [snipped a fascinating but hideously complicated collection
> of complexities]
> 
> I hope we agree that that is a level of complexity you cannot
> expect any but the most complex drivers to even start thinking
> about.

Indeed.

> > 3. EHCI/OHCI/UHCI can do proper retries, except case 2b, simply by
> >     resubmitting while minding points 2a and 2c (so no clear halt).
> > 
> >     The same action on xHCI currently results in 50% chance of the next
> >     packet being dropped by HW and the URB waiting for another packet.
> > 
> >     Tricking xHCI to behave like EHCI is uncharted territory. It seems
> >     to stray away from offical USB recommendations.
> 
> This is a gigantic layering violation. The specifics of error handling
> in different HCs does not belong into drivers.

Also agreed.

> [..]
> > Summary:
> > 
> > Retrying may or may not be productive - see 1.
> 
> Does it hurt? Furthermore is it likelier to succeed if we clear
> a halt before we do so?
> 
> > In certain cases retries are impossible anyway - see 2b and 4b.
> > Extra work by class specific means is inevitable. See "USB philosophy".
> 
> We are handling errors. That is, conditions that should not happen
> in the first place. Perfection will not serve us. Can we come to
> something reasonable that will mostly work and not preclude going
> to more drastic methods if it fails?

And also bearing in mind that retrying will help only for problems of 
type 3 above.  (Also bearing in mind that the most drastic methods 
involve manual intervention; they can't be done in software.)

Alan Stern

