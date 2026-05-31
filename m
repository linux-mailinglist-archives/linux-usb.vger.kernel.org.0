Return-Path: <linux-usb+bounces-38202-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tm8sE+1BHGq0LwkAu9opvQ
	(envelope-from <linux-usb+bounces-38202-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 16:13:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFBF616A1E
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 16:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90D39300493D
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E495D31D381;
	Sun, 31 May 2026 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DXfByrjk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44D2848AA
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236775; cv=none; b=TRK4QM4S8Pizc5NtIJqlAYBs+bMR8YxCF4i+xY/zSf/UyjDMpIfx7/jzV7B6dVSvWs2B2QMEZv/cvV2y1uXub0D9y1p89AYKRSJChqnFzWU0LS37gor0vRrskFxoCucxdhTyBNbuw5zNvHQb6rmGmcVTLUyu//D5ihTlxqB/XUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236775; c=relaxed/simple;
	bh=WHlnyNdMxsSN8P3bbK5ZwQ0xp4cZWtilZwFTftjT0Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiKA6Q7yM+W5JB96eyicH8UYWQCb99VZSYTYDxQYhUnrKtYjR/NoskPR8zcgZYNwBH6ymW16LoPT5oGfzvGG/ORTW0lhDCmHP01Q4rbD/ttHQInCgv4gw5BwT/AvEROzVFVfC7tSme/47evUc4g2thAh8fTGSYrK74zZ41yV2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DXfByrjk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccea53f35cso25712846d6.1
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780236773; x=1780841573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/b+Yv8kdCmY++SO/zOkeFE8s0W/XADjHeaaMjZyxfU=;
        b=DXfByrjkB/HHchnZF6xJnKuyVNivjxjS9IWw3UkfnghqyUuvvFhadLL/Pq8gXuZfw0
         rnksRCkG6i2RTdvFQO2UgClicvNFyq9Sjpq7jcH0tHivva5OSvrgyCS9swlu9MKv7O67
         me9VlNh1jvlXEk0wj5kWwZB7CNoHlmtMr/9S22gUdp+bEwyn4KgHTH/0xBVsDU7S/jZ+
         9TvgZ52rWPUZhSS7mVmXxAQSe/6Xbc0Y7uvx7z7pp10jwNqgiyaWyZ+8IPuSUsbpBkDR
         9PO0QpqjX+hAJBNUUblGLxbW819ndGs5gUQmGadA1R3Jviq2BBxdkw3wxt+l7Oyc9GfU
         +Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236773; x=1780841573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/b+Yv8kdCmY++SO/zOkeFE8s0W/XADjHeaaMjZyxfU=;
        b=Z7WZ+IW8RkhBVUHyZoDdCRC/ETR3FBstgkPR5qFub5uIywdnlPBitrBsJ6XLZ3p2RI
         eOmYvCzMyg1uOj3Jc/DpgRiGePmzL/djQD2YlUZ7eyQmYOkC93I8ZbE46GKLhhvN7dH3
         JkZYDfNxfb1N1umVmSnaZlBSLSuk5dNY95zjggL9UPHGg+hllQHHQTglTEDdPx9NqBd8
         +Hc69aGk5zTpIZUMZWuA8aoZT4NwqmSAfxa5cf5/PBVvR5QfDFUfaJbA0uzYFCk1CE0S
         dGkSs04UFEwJ0ebLK7I2encF9XzkvjWDCCPhHlIwGz8fUne33xpbyiup4JK0VBdPHma1
         pr2Q==
X-Forwarded-Encrypted: i=1; AFNElJ84p1XPcHZKV7urs+IoB/r7DOtux0si/4ZIGlJhIdaTBphJKutE2RJhwMCJIf4+zkXlyrOmKYRouVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rdWJPpv175YRyEk70LExqQgKpR0qW34c7DfV9zFNWz2X6bCn
	ai0mRvneT++0Nj61J9/x2V9N0Lm6lDnhBjTtruTKIMzqvxdz8q2B1N/46S6Kt3ogtA==
X-Gm-Gg: Acq92OGQxKOr8dzhWkBG5t++RX8WoYnuqID1VBJb+xM8ak5qZ53pSVNuWgtwZH2Tx60
	g3gmfzIViM9AwiaszUakXbkuZkQB70PjxWQ/6wt5NolASdTGb85gSVu2XcevuD/s2m+MH8V3cse
	7YSsi7cZuII5s92L9wNO6GpmqU6I8WXQPZIpmacFLIgiThxQNp05remidQqsx5ZyM6C8X1kVvfB
	Wghn8z4E/j3R0GVtDq9v1Qauvh8kfqGuiCcC5wvTClHcnvcKg52W4mC7UsIoLCsCv9q+jOSqydB
	3y48UD9J9vbvJ40sajIsf43FY7+gohPMfck7a0ZRGcvZTy1iTvVeRNndEUcM/iYXVs20R7UhmoY
	72hwpjRjsUbCdSRUBqngGwwLZ/Nt+5ISYHo+ThMz6RyQPHghycWSS6TMl/S/lQQicrG3Nr8LBpP
	K4Lonp7gZBrP2LCNYpAPpVasiqUuiYF+zKVqxKNJb9+D53AakuitLCdg==
X-Received: by 2002:a05:6214:f65:b0:8ce:a542:361 with SMTP id 6a1803df08f44-8cea54205bamr34413626d6.13.1780236773331;
        Sun, 31 May 2026 07:12:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea2164cfsm69234936d6.37.2026.05.31.07.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:12:52 -0700 (PDT)
Date: Sun, 31 May 2026 10:12:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com>
 <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531123843.736bd69a.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38202-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: DAFBF616A1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 12:38:43PM +0200, Michal Pecio wrote:
> That's what I mean. There is plenty of missing communication with hubs,
> which "should be there", particularly when the device is connected to
> an external hub. And IIRC some descriptors (like BOS) are missing too
> in Windows Wireshark traces.
> 
> I don't know if it can be fixed, and how.
> 
> I also found this article, which claims that Windows uses wLength=255
> for its config descriptor request "for compatibility reasons". But your
> pcap doesn't show anything like that and so do mine (Windows 10).
> 
> https://thewindowsupdate.com/2018/10/12/how-does-usb-stack-enumerate-a-device/
> 
> So I don't know what's true anymore. Running Windows under a Linux host
> with individual device passthrough (e.g. qemu) could show what really
> happens. Even better would be a USB bus analyzer. I don't have one :(

I do.  But I don't have one of those Xbox clone devices to test.  And 
I don't think I have access to any computers with EHCI controllers 
running Windows 10/11.

Alan Stern

