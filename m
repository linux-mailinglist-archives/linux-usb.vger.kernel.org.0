Return-Path: <linux-usb+bounces-32939-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNiJLzfSfGlbOwIAu9opvQ
	(envelope-from <linux-usb+bounces-32939-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 16:45:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542ABC2B6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 16:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 464C93014C67
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE85A342521;
	Fri, 30 Jan 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E1wpn+kG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6565338925
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769787956; cv=none; b=F3cVc3RR0oYOHZC/DZunT+QStrHHU/Qp1EU6QxdirxZ/k5UNniYbv0a7ZYVYVLRn9dZEP1FNo5KbM6m1pom6Gc+B9AFqugcGQVrYFG8NdGEvs7iXuhgt/BF3QgPRhMMTeSXi2XcsQP4U/LGCIAJoNBvnJGEgZNebueIPh/cC+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769787956; c=relaxed/simple;
	bh=mOwKgzC80rHgU/cgwhT+RrAQg0iQ9bzIVcyx49C40j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obWSVa91ATF9SHAK8OfQGW9SGCejm/0fV+KmPLFe4yw+PEZVR9hyoIYfGbynXwnrKJJ2uVNwCOeQ/f9Spakz6sTI0xy8PqkB6E9ErxQw1SJ33fDmCLxLUSCfSqN4rwfAEFX9xRh72S5JqUh1LtrVPR0DqM9s/6YZIG3kM2TFXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E1wpn+kG; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8946f12b1cfso25999246d6.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 07:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1769787953; x=1770392753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/6OChCUJu7afXorJSopg/R4rXNkwBrJdqlKyRVfatg=;
        b=E1wpn+kGS8c3qoCWqoYUvTF/6xHBKjVabmrsoJLkWkv9i7NDgxeXmlZziwZCsglhGK
         it3upE+Md/dExd6pG+ZifE1LyEldDm52gPu7FKG9lY7MKS7sRFt9O4pxdhk9dxRlk+Wl
         WetUkmbFPFUh6ud+riNuuJZZ8BYWzxGPYh2/50k5oSTMg25lCQbyHbKz8QfyrVRqc9xn
         1I4wsy8vfl1O5SgSQLxRYj8oENZEV5CutxRy0gqVeAeuKjPaOAt/iXbSrK3oqYDUPibd
         DURvstqQ7SizBCuA5TzwCadNxcfzQXUqGgJ0K/QP3Plg4gKFIrNMo5eFjSNuEsVyjNyE
         vNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769787953; x=1770392753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/6OChCUJu7afXorJSopg/R4rXNkwBrJdqlKyRVfatg=;
        b=qErZH0s5ZsmZg+QpH6iOMivALNpP65rRHpdFUKsADBn6S/kiY20SWj5El2018NKiak
         KxZLJcXFEFVPu8C+f25woGIiKfgnzO65MjULWOqYnfYatbOPwPb87k52Pd9xVsn5DQJ9
         0fXDH7xKOIrheMz+L6NX55FfNNhVHOlczAeMBUu0cdM8va99VF2kG5VgSkRhdC8zKttc
         654psGGWzjdfiOmsnGFWh0QyRk5588I/FQ+uXGa8SXM+y7/OT6J2QR1p22jlok6h1G+g
         5WadX/DTZQkyO3Th9dilK5xefIAJ9MQUjnNyXbNBxmQB8G1w66mVUSLUwxqER9I8OWDE
         75ZA==
X-Gm-Message-State: AOJu0Yyzi7RxTf9XGm4VvVRJKlEk5UlQGT+QlInmHc+YOMHJg+4Sg/2G
	NPsQHRhEhwKPGtUQJWs1Jnvx3G3GZQdHhsCZomXSsGnLFxAieYRjT37r0jewa6KW0w==
X-Gm-Gg: AZuq6aKr6yi7awsd0G5EnqRBUDqLZDIRHjr2ZhQW9EVKT9zQKMYndO+5/odxMeZg2Qk
	Tdr74BRtnB9lAIKvqC2+nyjtmZUm90L77oZBfzLPXT3Hbj3Wt/Cx5Lb91CtO2DKkN9v26BJsuWR
	HtZpW4Q9cQdV8c0y/tjR7dQ0/hPNpQ+BjC68+p86DwQeZaZoPyZu+aHnelUBvhkGylIYUlAQe/e
	iEYATyEsle8kNLIjTesBbEhH6aC2Mhp7/jK5fBPlhsUGMKrppSs0PaqNkzwFQjXR1G+eRaAFCqX
	qbqWrYELF3YbB6Cpr1pKJy4r1xLsz6RgKYaDaK7dK+PpusfZq3+arLCEVo7IRismjlc+OJqUIHS
	LF/0i3JC0WEnx1TMmYfy9yP4VoFrbZHRvR/zTM9HFJOFeY08vF9nIqeVE1UGSApVTbkKyJzsIGY
	m+II12YBStZlV3wYoaPsmcZIM=
X-Received: by 2002:a05:6214:c4c:b0:894:6f51:b4b5 with SMTP id 6a1803df08f44-894e9fb0dafmr44866866d6.30.1769787953428;
        Fri, 30 Jan 2026 07:45:53 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740d3esm59735926d6.29.2026.01.30.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:45:52 -0800 (PST)
Date: Fri, 30 Jan 2026 10:45:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: storage: Ignore driver CD interface of SR9700 USB
 Ethernet adapters
Message-ID: <6025d11a-8370-49f9-a3a0-1493d5c2ba9d@rowland.harvard.edu>
References: <20251211062144.138796-1-enelsonmoore@gmail.com>
 <576ae551-0ed4-4363-b19a-8c4d1692e1ad@rowland.harvard.edu>
 <CADkSEUiHa=MiG8m9uNx-k2BcQibVep+YGdYsdhABdxo5YvDjNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkSEUiHa=MiG8m9uNx-k2BcQibVep+YGdYsdhABdxo5YvDjNg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32939-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 3542ABC2B6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:03:52PM -0800, Ethan Nelson-Moore wrote:
> Hi, Alan,
> 
> Thanks for your feedback. Sorry for the extremely delayed response.
> 
> On Thu, Dec 11, 2025 at 7:06 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > This just a statement of fact; it doesn't explain anything.  For
> > example, it doesn't explain what the patch does, and most importantly,
> > it doesn't explain _why_ the patch does it.
> I will fix this in a new version if you think this patch is worth merging.
> 
> > In particular, is there any real reason for ignoring the CD interface?
> > What's wrong with letting it bind to the usb-storage driver and be
> > available to the user as a virtual CD?
> The driver works without this patch, but the CD is still visible, and
> it does not contain Linux drivers, so it is just an annoyance.

Except for people who are interested in the drivers it contains, even 
though they aren't meant for Linux.

> Is that enough justification for blacklisting it?

IMO, no.  I don't think kernel modifications and blacklist entries 
should be added merely because of somebody's personal preferences.

> Is there any way to have the storage device be ignored only when the
> sr9700 driver is loaded? Would that be better?

No.

However, you can always create a local module parameter for usb-storage 
in a config file under /etc/modprobe.d, telling it to ignore the device:

	options usb-storage VID:PID:i

where VID and PID and the Vendor and Product IDs of the device and the 
"i" stands for "ignore".

Alan Stern

