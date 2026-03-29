Return-Path: <linux-usb+bounces-35620-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T6xKO/CFyGmanAUAu9opvQ
	(envelope-from <linux-usb+bounces-35620-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 03:52:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F900350690
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 03:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 691CC301D324
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 01:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAC114B08A;
	Sun, 29 Mar 2026 01:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b3Ne+uXZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B072622
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774749163; cv=none; b=IMQeTfHbXjJsLD0pquLtwkaO5JwssaaKKhKffZ5PUrhmqNP8pHVfuyVRwkhx+iRC8WnvRzggfSzqor+oN57LXEPbmlaALGjGG3hjudWgs+srnN4uWAvoamsYG8Op1kr6k2hnv/zQ09C0sWoPj9RciGliFWeHEI0ISD3MGZL8QzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774749163; c=relaxed/simple;
	bh=Ysn8WD7ybEmT9PYeWDdfZbfhalZ2Qm6MVPaSXY9AjbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy6VM2PRrWr0xWxFlUCwNq/bBponLh4aq1HkhI0hF4AtoV0GbM/KZt5R9NjSQM+We7ab3YOFwf8YGP+nXI8eJvJ2Wbqthm5w1E2WolTMyAiEljf8JTkOMg8N/bO+/zHTst7tNwP9O7rw89rVpb0aBCYltCkNOZLM7MgI2EZyk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b3Ne+uXZ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89cd8596724so38794506d6.0
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774749161; x=1775353961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vCBEX61SOfV4HBbTzacjhIBYnmxX15SV5IqJ3wmy/i4=;
        b=b3Ne+uXZM3JHMtsPNJnt2v1BbdXSrtqtl30iTqCyGETcC9iBAzbswkDaBSmvUOsJMW
         Kirwi4AbbVJvnz1SiifhIztG+TdYXovRAnWtKaJILI6ukSKiSzy5L0en1Lfr2I//HKPq
         UblzNlbu3YG1XSqpumf9ldkGqWoeNOjxJjg88gsUtgM6S8DrWNA8n2DKzk+BwYq7FXGh
         /qNMmX5zbiCzOYGoXovyNg08lBhiqlLgnP8aXRBUiMO+0Zs0uFkS84yd6CkD8iIpMG6i
         J/h5oG0/tXUTCMJTAygCmCIhEN8uLkLE1k/vnQCl0gUyJ6zCiP7BweePET/YJAwmMm0M
         RI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774749161; x=1775353961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCBEX61SOfV4HBbTzacjhIBYnmxX15SV5IqJ3wmy/i4=;
        b=TdEUxJzdOS4HkE5EUfn64Px/EApu2xdViu3EoupKvh00Fs9oHBoaHJ3OoM4bin/KPc
         Tdeiaj1D3/q3fHUZG6EkhnJshGBVqeXwk+mEN2vkPGwMK4ZsHAYpfdPPZqFjUws7RUsy
         PN0oRRx9bOuJIV9b8thWPfYuP5p9cDnjcWy7wBwGdv3z4B/gd9TrEECkYifVor7NlE9w
         oI3yQu/vDht0pi2w+v33SdHKXKPjMSvoscAOQjT6cBS4qPldYqSsH9xbHuGRC5hN+97M
         q+YTi+xg5p5K1VEN3lT/ynpKz/jVkEw8q+YEMW/x6J//mppp8i7zciSePVFMb9uA9h2y
         dD9A==
X-Forwarded-Encrypted: i=1; AJvYcCUik/0vTv3ZvwE9hT8Jwi0y7w5Mc+lltiYsD+8Mav09zhI47meV0GAtjQw+ooQS+Hkdx6j6H9XTDwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dxBNVfE3Tk7/Zs/PB6QqSl/5jfcn0IsZlka54J2gBJPFtLTA
	iYDNcjKTc543AtpT+TTGvh4Sb6vcjRjx6VeZzQUhK8yEgDZ+uFX1laSiRmuDGe8KAsxxPBQSr1K
	0JwUg4A==
X-Gm-Gg: ATEYQzxQ1qAWPiNJ40CEnnckd+d+K3We/RZvlpqgP5BHgMlPwtRxFGLtfDYdGlSjbvA
	rclBI5NYzZwn8Mb3HrMA+33la4MYKFtasF0MT1SgLben5qmFPdKTPNmV1ns/Hq8gj4au0fJJ4LB
	iOnLnYEFBrwGkfC87egyK+S1N3zAmS7u076gQ6WPMZJJUpDqUbTRX5x44ndxg4qd76Oi/xftMSC
	6jfbF9Xk9Q22XDXUxngdseuIwoALArBokMhtqBr+wfgVNpjV7eBKU3/ibI7qRX3hy1zh09147zO
	LlCzFPdzToOa7LQiFgqXy35MUnFc1NKbsQ49v+14ueJD5aF18lCliBLh/Z4xYJD2G35ulC5OZu2
	D8Q2VdYy24FDB08thCVjlyf5t4fD5SX/lct0yL/TZKKRjkqZwWYAAteMViWXBjzSOMpoovfWJeN
	B3JmSpAUIiBVF7R2kesBwFnh4q
X-Received: by 2002:ad4:5768:0:b0:899:f6bb:331f with SMTP id 6a1803df08f44-89ce8ea6a8cmr103062646d6.41.1774749160668;
        Sat, 28 Mar 2026 18:52:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb14bsm28042876d6.1.2026.03.28.18.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 18:52:40 -0700 (PDT)
Date: Sat, 28 Mar 2026 21:52:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <22c70ca7-57dc-4328-a5cc-d46c4f73556f@rowland.harvard.edu>
References: <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <20260321065424.76a80508.michal.pecio@gmail.com>
 <d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
 <20260328222217.297200bd.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328222217.297200bd.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35620-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3F900350690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:22:17PM +0100, Michal Pecio wrote:
> On Sat, 21 Mar 2026 11:58:53 -0400, Alan Stern wrote:
> > On Sat, Mar 21, 2026 at 06:54:24AM +0100, Michal Pecio wrote:
> > > Nope, for many years now, if not forever, xhci-hcd has been
> > > restarting the endpoint after giving back the failed URB if its
> > > completion hasn't unlinked all remaining URBs.  
> > 
> > How can that work in the presence of BH givebacks?
> 
> Certainly not reliably and I started a similar thread two years ago
> after coming to this exact realization.
> 
> Does anyone know class drivers affected by this which could be used
> to validate such changes? Writing a patch is one thing, knowing whether
> it does any good is another. I recall that last time Mathias tried to
> touch this logic it caused a regression by unearthing more issues.
> 
> I was reluctant to touch this mess in absence of known impact. The race
> is as old as BH giveback (2019) and automatic restarting is even older.
> It could get awkward if users (or driver developers) learned to expect
> this behavior.
> 
> But if somebody can point out serious issues like data loss in storage
> then it's a different ball game.

Storage is not a good example.  It's so obviously critical that a huge 
amount of effort has gone into making it exceptionally robust.  Very few 
of the other drivers do as good a job of error recovery.

Other drivers that might be affected include things like HID, various 
serial protocols, network drivers, video & audio.  Those are what come 
to mind when I try to think of the most consequential USB drivers; maybe 
other people will add a few more.  But a lot of class drivers are in 
relatively less widespread use.

At any rate, I think most of the people on this thread have agreed that 
automatic restart of endpoints following transaction errors is not the 
best approach.  Automatic cancellation of later URBs in the queue, on 
the other hand, might be a useful service, and it's something that 
usbcore could do fairly easily.  Automatic clear-halt is more 
questionable, and I would leave it out for now, at least.

Alan Stern

