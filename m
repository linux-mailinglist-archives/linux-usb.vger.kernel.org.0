Return-Path: <linux-usb+bounces-37672-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB6KNLw3DGq2aAUAu9opvQ
	(envelope-from <linux-usb+bounces-37672-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:13:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D927D57BFAD
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78DA0306C283
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031E94779A9;
	Tue, 19 May 2026 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O0FtewB7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8839BFE6
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183853; cv=none; b=qLbj5WkI/N+GYSyodOl66Y3JVhHSPM13IoT4Ad64L7tLeVv51XiIEuBEfPjxCe55WvqQTe41HnAFGXKcIzfsyRsQS1oC/E+7Hgzy+dH841M7zBsrgtKZoWg1X5xKC0KL4lmfqFC+eoCaJlfNSAbgnkkPgMClIdv4KKAMaTZ5EyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183853; c=relaxed/simple;
	bh=mSZUL0l4fKEftjXUSDfUlokrp6H6gPbvFgQIYbi/xUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1jyPZ1fBscMnSMpeO/HBRYvI/7Y47JLbShrYT6RAUkDDpO6BJL7x/sB6GdgYIpV4ALw6+3QS31/dywj+6kXEpnQVlRdyWmRysUxGXCJE8q6BSHOAx6WszJGGmAv4lAXonAsemtE79GTK4JtzbYO1xizGJ92WgBqvLTD8u4nfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O0FtewB7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c822652f82aso2843314a12.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779183852; x=1779788652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6TLd1sgD55ih+j7Q+S88eK0ktvzrMcx/lL04MIu7og=;
        b=O0FtewB7LnFsYNVNSTypZlgByaj6NCBfWM/Dq0HRZAz2W9YBOrhXZGH6RD9mxVznzT
         waXZHAc9x+eyk6VJVG7kKe9iyZ69hnoj3IdswCdRTSn2+9xJFvohGNRvKEmzq0X0c0ev
         GICHiqlwqK/hf2FCdMo9ZwlyaAL4ZmZZ70h14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183852; x=1779788652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6TLd1sgD55ih+j7Q+S88eK0ktvzrMcx/lL04MIu7og=;
        b=Au7cgHyvUg2873T7OlcL09QB+cxVVr7yVT2mQxw/Bqtg6yEw6QTCdp2awCwMtlugle
         zXvF9jGR/i2OKp2d0jiIoHo6mKFIPmeU2PiHDyiU0Pxn9C9usQc63mRL/dfY66q4uPXC
         HxTIxsMmMPu7My5rPQEfVZezwGQWov+My+mKqBxGS31DqGeNoeTqEUYIGUL6QOtFCpOV
         ReybS1uSsPFA8nVpf6XMKy9qwmmG7J/sw37e/E/TX1BC8xJozu+ID8VT/kaA3OjMOMmA
         JKKMc7TyGQRu6tLDd3npB6LQlTTjQm7qFMXzCKZ0UUnWe81skyTHNpEhsyXlVnIYTOrY
         +78A==
X-Forwarded-Encrypted: i=1; AFNElJ/ircEA4PAQ/kcRqV4OxjZ3Z91Tz81F7JhDCLJzlO6JfOCA/K11gVJaxWky+FGuMZU+nEq/7iY3e84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXOT7Zb288dJzjTMMZQHDf38xS0ISXNmY4vnCA/VAboS7U5+KN
	MljhlqwG5ptNSYgkRcpBMnASN+ffcKdr8Zj8LjOuasBvrMvJu4wTbtlTyfCxIld8Aw==
X-Gm-Gg: Acq92OHKghvKZVr5owKMo0sPkhb5e6fQDJFeAHIFhTr1Q/LMqIwPxLN2EJNkjz0rfzt
	FxIVZ01rMpJXJ9LlmWjUrNe+J3PVvDcZS1HKjYKgcTDS9nV+svbTrPnqZBMxPNM9LqK2jsL3VWz
	USjMzrE1f0wSMWpj11zepogGUJZ3sf8WJdOthYwgdFrbvCZu/dyKnNoWHdlHEhGqMpQwDaCn0qZ
	1Xn9HeeOyocmFkWCsGzTGNltd+LnaaOnU2L+XkY4XZO2aXchNVTk9KKMpWDGUo7HE7QWEgeEfPc
	G9UhjEuT7Hatb3PhIyQwtALl/QBf4xM2MVMt5uVGiIMpTvLZIH6haJj6SgFKUjBS0vEEpxXNu6i
	6hkOIZjZ8UImldOfUXco+/egKang7y3F4YRbQnve6GKFa6nrw8pLJV3gk8VbRpn3brqZ619J2zM
	CtcFENQq8bTMuamrNNrAG2LN4AJ+3A6a61K1V7k4L062iJIRx5AjR867rTa/8Tqg==
X-Received: by 2002:a17:903:1b70:b0:2bc:810b:5c0c with SMTP id d9443c01a7336-2bd7e8cbd1dmr216639495ad.34.1779183851730;
        Tue, 19 May 2026 02:44:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1f47:18e:5352:a11e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c26355csm179387465ad.35.2026.05.19.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:44:11 -0700 (PDT)
Date: Tue, 19 May 2026 18:44:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	stable@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [stable 6.6.y] commit e613904fa419 causes suspend regression
Message-ID: <agwu9NGf128-YQST@google.com>
References: <agvqqMt9x0df-WXS@google.com>
 <2026051926-bunt-manifesto-6b92@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051926-bunt-manifesto-6b92@gregkh>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37672-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D927D57BFAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/05/19 11:29), Greg Kroah-Hartman wrote:
> > We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
> > Update power_supply on power role change) (commit 7616f006db07017 upstream)
> > as a root-cause of suspend failures on some of our laptops.  It seems
> > that ucsi_port_psy_changed() causes:
> > 
> > [  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > [  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > 
> > which prevent laptop from entering suspend.  Reverting the commit in
> > question fixes the issue.
> > 
> 
> Ok, and what should we do?

I suppose what you usually do with stable regressions?

> Is this issue also in 7.0.y?

We don't have any boards on 7.0.y unfortunately.  6.6.y is the most recent
we use, but I'd expect 7.0 to regress as well.

