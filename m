Return-Path: <linux-usb+bounces-33267-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ItvLLD2i2m3eAAAu9opvQ
	(envelope-from <linux-usb+bounces-33267-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 04:25:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C95120E66
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 04:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C482E304F20D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 03:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E7934402D;
	Wed, 11 Feb 2026 03:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hD+G7znn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640A1DDC33
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780330; cv=none; b=SQ3Rt/GDtE5lkkR9kJ8bI8am/FvCTBG4yS5yE57ApjXocB/cBYgGre2pXdl9YNBDSRXl0ZGSI10t2dPl4Ylsx0huZZWgQakzdDYE625tJZOhNl9ELgfurvRdelVz7qvergp/v0o6bfXkFA9Z2VZZOBMKBc88QhtNVGWPMPLIk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780330; c=relaxed/simple;
	bh=Z1UcI356EnYjVrvA/1V5yUonwzJ+3OKttn4Qjuh5ekM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9C8fCjcvcqJuh4u89kpVe+MpuCxNSZg2spytQt8cSnCybni0Cn+Kdwv/Qv2OUsxWajtU8JcnpcJ/EGoGDtDOslwg4wDBfzWurOD4VviWDYCyLi8oMftUbq//ztu8BhDPtZhZniEPD1DGMtPthA5afd0gq1wy3vZenGTD/FFsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hD+G7znn; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50334dd44d2so55946881cf.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 19:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770780328; x=1771385128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scWsq/Wn5Y7xTK78oXHwGRW1HcMjVXrB6+QN5MfVlCM=;
        b=hD+G7znnMUbLt5KeWzjcWkmuioZnxdyqag7ytsCBTn3Gws2yC1Gto67K+EQySQdhb0
         cMGVFU8zJ7JyQ+ilv7Tn5HjHVzjS+U+ivdLK68SLzYrcdro7kksnYsEn6BZx0Rbosev5
         UXkKDvj9sIMzniB/ZC6ia6mifUBWinNl3RvKvxcfjt57cQqwrdyGBDtKppmkfDp3gOE9
         JFRnq0nE61i//zL0c3YrRf0udMA/imun6qOBfBGLByFuIy6uKn1dKra19t1FGUe1a7hO
         yyufsy0tM977vpzVvwCUqD/KbIGMcXqSsS82JfUGevO+NJy11GXM+Tz9oT06fEt0dx6c
         xoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780328; x=1771385128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scWsq/Wn5Y7xTK78oXHwGRW1HcMjVXrB6+QN5MfVlCM=;
        b=hDQuO56ZiFfcjmlXgclHy1kiBic3/u8WoLtAjFRzerf0YDU4k04HHDZk9FayFtdMZF
         Un8oJz7ZfCzyUWHgHxi+1u1e4srr3QAlHqq1qqUPDAcxLGUHrfgqnlGnC9kNmxJSTK9g
         Bz6PA2YyaBruIXIhkw8kTiZEvUI27sWD6btTBDSRx+40qEmplV8pFYS6rMty7pRWv2nX
         s1CLLdqAyTJ8CNJKvfPF2JQvkOa3WGn4UO8WKszgRU+43tTF0sth34dhLxsTOaTAZ5tF
         7urkPdiw3OqBgf6HgOUllgOu7pmdeuQnCONCzIELzasA60Eyrxy28KTW8sXaYOkzAXc2
         DmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlsfbgJYM8JZUhvmbSGRbvpSB0jrURcUxN6+t1H5rPnmR0A5wxe4bvUq6MFX2uMlqnObvQVbC7If8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEG4nhq+0n+iW+GbOKYEBFOKFWJq5aij72byZqtavBtOClbcqI
	ixMdYditgQRSttOkoPKdfePTYnCkCrcfCV5WxeL4MRp/zipP1fKQ4nl9bgu6FGg2myMJ+phwxnX
	xnkI=
X-Gm-Gg: AZuq6aII3VRrQSkQmlzIRij4L57F/FNZxa1HgCQggot/kjq0XpNQAa8gyb/W3xOydwT
	y+4HVTS+pfEVnvIFI6HC/BFOrBekna+2Ed4bxcdO4Pjdu7gv8Xs0mA18dK0ALX/xpA40VZcKi1U
	IGdRxftA26XXwW3gh3pB0vWbgK5b3++H9RfcXcvSBlgdtbXE+uJvphHcTP0dbFwvzyhlFgSwpiY
	cNLrYoNOiQ3/WsGUceZ+8FnFY6GKwlqXeG5n7R9fiZf22vWUg+2B87WuI/nXcJbMaCq3n3wNqrI
	v03+Tmw8Sz98YbPYyVMsQC2BMSpzXv+dY/uM5Dc9PymNorgpTqFhFBMgPdL8wp9Wn4wXVjgABVs
	7vzJfGd/HE14ChJYMafFiIxOewUNhR+sM0xeTSV8BfWvXrY+xNga7/zSLkXCjByhX1lZtzgcc0L
	nl+WF354LD1IhJJzOYDjFjOzcs
X-Received: by 2002:a05:622a:14d3:b0:501:8643:aed3 with SMTP id d75a77b69052e-50681068bf8mr19037501cf.35.1770780328124;
        Tue, 10 Feb 2026 19:25:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7e1bsm22567385a.24.2026.02.10.19.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:25:27 -0800 (PST)
Date: Tue, 10 Feb 2026 22:25:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
Message-ID: <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33267-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10C95120E66
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:03:09AM +0100, Oliver Neukum wrote:
> Hi,
> 
> I am terribly sorry to be only critical today.

That's okay; I can take it.  :-)

> > +	/*
> > +	 * Impose a maximum limit to timeouts because the wait in
> > +	 * usb_bulk_msg is uninterruptible.
> >   	 */
> > -	if (timeout < USBTMC_MIN_TIMEOUT)
> > +	if (timeout < USBTMC_MIN_TIMEOUT || timeout > USBTMC_MAX_TIMEOUT)
> >   		return -EINVAL;
> 
> Limiting the range.
> 
> >   	file_data->timeout = timeout;
> 
> This is, however, used in multiple places. Among them
> usbtmc_generic_read(), which depends on a device actually
> producing data. That uses wait_event_interruptible_timeout()
> 
> I am afraid you will have to check in the specific ioctl
> or recode the wait in it.

How about accepting the value from the user, but limiting the timeout to 
USBTMC_MAX_TIMEOUT in the usb_bulk_msg() calls without changing the 
wait_event_interruptible_timeout() calls?

It probably would help to know something about how this class and driver 
were meant to work...

Alan Stern

