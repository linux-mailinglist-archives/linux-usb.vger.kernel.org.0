Return-Path: <linux-usb+bounces-37050-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEBNGEn7+2kRJgAAu9opvQ
	(envelope-from <linux-usb+bounces-37050-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 04:39:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED864E26DD
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 04:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9445D301E238
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 02:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC32BCF4C;
	Thu,  7 May 2026 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tW5OgtqU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE7224234
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778121541; cv=none; b=VSrSVGR6se3RfPj3mszheCiaur/yA2Z4tpRL5bwnfrLsS9VnlzZN5B+6fdwChbFmNeZevVBzFiIiabgUCuf2xnpnYp5T9ByRek4+ZKZz2h6AkqONw+uZ58MrFZsZrWYa2Zl7RygMBDZvH497X2K/IIOey9ZHVnMwJCGXrE0u/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778121541; c=relaxed/simple;
	bh=FeqZ2pNjyZSw/cxExEKWj7OkwRiXtpt9OIMLpy7lIqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB5nINRWfgYnTqfRJqZAfj2cVtzxf7RI+MRiVt/LuNrO8YuXmthaSWqGbqDy6aSI4vIMb7tgC5TF//gqHH6vEt1qqj5zqeueusoHpBse4bKI8WA0NPr9hTSJecVHcoexAI1S/41wenE5pIwgcr/5XvZR3VRDHMjj6p3cFmBJWhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tW5OgtqU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8f984bddf4eso36930685a.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778121539; x=1778726339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=javqJm188d2JWKA/o8CgvgiCHsG3n+WEnOmXheLWA+g=;
        b=tW5OgtqUmducGgW4+ZHpPFZUTcfg9J+Gi4TXDz/ohzL9cDr9upEnorMzx/eJJ39kHQ
         OatbmzI3iVMpZ3IyOIzJ/etbkinMpz/ZykDC0hL38FhkEEz0jR5hsDkh0kGsQtcGPRu6
         rlbRpjuE44I2wrMD4eqh1nPXS2l5Ly9MZARX8A6OhL+UwGaXPAClPFDZSXJjFxxzCQnN
         hxzApj+dX6Pd2peqEh+vMWYUS//IpIbz2DKI1Yg+1pbcxyBSY4vqgOMy+fNLaad/DB/w
         aCyoHKqniHpTE4g+c3mYKsWshmc1aqr+Eeqru7G74RuowfHeAK6LJ7bXvSg9EcxrJNYW
         QRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778121539; x=1778726339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=javqJm188d2JWKA/o8CgvgiCHsG3n+WEnOmXheLWA+g=;
        b=XYyMqq531m/uwHJtawqz0iFTUJUDdHMpt8+INQZP2uxO/oDh5dnudJjDcWb9gSYAQ4
         qovq9YbPKJXdrTmHGnfN4dQCaufqXi9qNoHx26vkwn3Smlzo6xM5WJwCrAFqff+lLMX3
         D/yjVFWroCk1h1ufyS7bRKG2ZrF2dGVgnYaWeNF71wokmiZciwVabJzOMNb+0n6+dIF6
         +2K/PZsbrXq8mZG1S/lX3W5bWlFBspT/txJ54mFk/Nd5uB8Z/bXozvJVBnsaBtNRsNfw
         8vkS70Bfz4ujkGFbxga5UfDwg1EdfTUnpr+aTez+cCKKTNjxxbsv6UQPKFPcTDYaYCwy
         a7ZQ==
X-Gm-Message-State: AOJu0Yw1QAVoYIwNnesVsPMt2Q1+OeZB6YEEtXziJ2Zu75t4ttXVQt7M
	AxV23y1uNQpzL4v16FZ3YQzrNQfhi9eLChuSwHTldkhvrGCBXYuzzE8p4EkCodZEXrZbkE197Py
	EV6o=
X-Gm-Gg: AeBDieuw9vjyEY90nIYljHAKq1h1YDppxlxyKct6E/mmZqkiJYx1sV3bfqDRH+ySTf6
	d3srQVRHq2F9zA0nWGA5XM5QlclNuXwAkVHYwf7+vjIxVlMW0F0p7GLF/LsBDMf62TQMOmhu2UJ
	K9cEi0nPD2LPVC6lqrOf6B1d3kxcP8yS/hXJgzZPjaOLMOP21ILlpucTjJvfMvUvZI+UHpdkZ9n
	FzMzzKVff1mel1hgj+PQQbFNejYMlwFjXeXDBEuUhnnbYnkl1rPEz/iUzRkoIbsYO769cjous3A
	+jRfpAQ+LsxGdTEARDptZqjrdX9xtua6YwYYz710R977+IyJRk61dBD3Sy9+8eL8e6J7Ga4IUM5
	34OAr7K9sZgc8V25ZcTGhuucQP2/z0ijsq4stFVnJTMfUNyr3MgGaOcgalMSxB9cQXbSQOQMImc
	V1mOaguwGHXYLm7TtvNpKWB3AkZXVDECVOJRrW4KkW6/9QwA==
X-Received: by 2002:a05:620a:3191:b0:8eb:ddba:2b6f with SMTP id af79cd13be357-904d40a2f59mr943133785a.5.1778121539255;
        Wed, 06 May 2026 19:38:59 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938d0bcsm1768572885a.4.2026.05.06.19.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:38:58 -0700 (PDT)
Date: Wed, 6 May 2026 22:38:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: dylan_robinson@motu.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
X-Rspamd-Queue-Id: BED864E26DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37050-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim,motu.com:email]
X-Rspamd-Action: no action

[Taking this side discussion off Bugzilla]

On Wed, May 06, 2026 at 03:03:44PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=220748
> 
> --- Comment #27 from dylan_robinson@motu.com ---
> Regarding the start_frame, I want to advocate for treating urb->start_frame as
> an input parameter when URB_ISO_ASAP is not set.

For one thing, that would be very impractical, as every driver using 
isochronous transfers would then have to be modified.

For another, what's the point?  In an ongoing stream, all this would 
allow the driver to do would be to break the continuity of the stream.  
At the start of a fresh stream, the driver could easily end up 
requesting the HCD to put the first transaction in a (micro)frame that 
the endpoint isn't scheduled to use or is beyond the end of the HCD's 
scheduling window.

>  In looking into porting our
> drivers to Linux, we've found the current behavior challenging to accommodate.
In what way?  What is it you want to do that you find challenging?

> As Alan mentioned, different host controllers have different representations of
> frame numbers. Other platforms address this by only exposing a normalized,
> frame (not microframe) index, while handling controller-specific conversions in
> the host controller driver.

And thereby forcing every URB to contain an integral number of frames' 
worth of transactions, at the risk of breaking the stream's continuity?

Alan Stern

