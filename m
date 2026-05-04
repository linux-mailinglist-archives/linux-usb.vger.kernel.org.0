Return-Path: <linux-usb+bounces-36896-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHkuD82y+Gl2zAIAu9opvQ
	(envelope-from <linux-usb+bounces-36896-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 16:53:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A615C4C021D
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 16:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B71843077527
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBFF3E1232;
	Mon,  4 May 2026 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZcG5TGIe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D43E0C5F
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905856; cv=none; b=ArT2aHv7DoRGaUypVQIBoAcxLtnkDyrKKt5dO7lieN+Q5A1KaXiqoo2FjbcRziOVHbHEdEKr3HEo27oOAu+IDPAhMoOVUYQmBHA+8t+3yWtXsNYLGxFiAwvnnU3FdA2X/wKFTQZTRG8Rjt8CKcVpFr0IKzPsV4eM5CNw2zF+1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905856; c=relaxed/simple;
	bh=y1m4XSGSQGiu6FyUsKsipGyyQaHnBMRkWzZina8mt5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFW+aLHAcf4FkOmsk4uR2QxenMozzEokgRPdBfHfx2H46O/6r1+4vl6f61JIosprvy8B7sD+XeP6kKAw+KeCH4c91DHIMipt/Mv3sXtB669Wi3fN0EBgDnO83BBWl86dsj6LXeyUxXpZFMEib+lDbXYT4KuOr9mrRc4R48/y+Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZcG5TGIe; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d65f4073bfso576936185a.3
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 07:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777905852; x=1778510652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v4Kgf9MTri58/nEHMdtVCqGlz8cqOSW29qlQ7mloIf4=;
        b=ZcG5TGIegQKU/zqTKu3qYwOVQRRBnf2qpP5hkKoU9Mr5Ev+m5x1WbSj2bfjLwdEKQ/
         JMlB3NSNBoOkagXnwwZ/YWCq0sWa+klxs24dtjQOTYukJddgqnc8ip5/r7OvlDDy7DXr
         YWyzgLMpIfAaZCjgpC9egXy+tFwsoLA6ipqi5JHKIxEVw1MVn8kQPZXUr8+7WPwJXHb2
         k3rjtoPSTf/GhF+p36u8N4NR0dfUDcOT2Du4iqnshUDIDshNf1bJD3KG/j+xyumROsGx
         U6kbYNlTLVOwib/u8+CnT62pjQi0plb08hTuesEuObQAzMTOOJMQaIiZyRi1EOIpz9ad
         AXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905852; x=1778510652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4Kgf9MTri58/nEHMdtVCqGlz8cqOSW29qlQ7mloIf4=;
        b=NqlgyiptX3q0za49I0HyauxqtXKrOPqfbHStAnTWpf5/8jfYKDFfKtfUM+FnaC43nd
         tERqsjv+C+v+8s0eLjexZW+yZoPa+J6mOVZdwOhdEKk0xf3JG5zwEhXCzEiWPPtxI62q
         ezYhgnxgE1KbJsl55KnmJ26fefVWCbJpf+hGEAvpWfjMIco/djXSVFXWCCwiYR1ZQHBQ
         KYaAxDjiIN3SbhoXzQ3bXvaT590SVUanLyVSgDEou8EaQT8sp+fDxr13JhVEcScLvl0I
         k6dQRqLN/EpYGT7va7Lwzmlg0IOrjxSDPoEq60qM3q5AitAkW4ETgoG1a655EkZRvCvQ
         JzgA==
X-Forwarded-Encrypted: i=1; AFNElJ8VkatvLDK1CiF/Ck7eNuW88QszIJC8OMt2x/RQc9sqk4NrGxMwWwzKKkqVL3gt6ndRjinS4zv42KI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyt6qGq/aVHRPU1si4h+5SDb4xWMsXXjYA0uL9SvBC7LOpp1tF
	mdjNtnluI68UVsL7OnK963ydZsaqLFnMAfLAqbJa0Mi+VqMn+1x2aC+Rq5vEFxq2rw==
X-Gm-Gg: AeBDieujamDUXhVxt847rf3peip2i490BZtNHGzJF2fn6G2GmzCZ2THm5Uc3DLkvEHq
	e8ANum86CQK98oe0E8XDodPychsE5GiwfBVHSEALJV4ldJ/btI+yoZ3vLZn5USgmM0ytyz5gfBr
	vPo5vHLVHZ/S3tNRAcz/WEB9Z8TxfX2SGt0bL4fmP4p1S4nRmnqh/RTqKFjtAB395jWLE0dHsir
	zgMr/qBVX4mRhzoKZYy3M8s8hChgSR2K993j9KmjfkW3jjim9fK4wVD++Vf2/CZZOG1zaKS/EUT
	JAcg2mM0JWhiwa80IR4j/lRAkTJj5v/6uuzbcNJYkFsK1tIzAIpzw+Th68eJcoo3Y9P98szuZ7U
	zTP2DW3rh2Mm0KvuCnmvgTfpAnsrGDPdvdVWjRZ8Y9cm5ay/+pCnegC9Wj2sc8cKSq8xHvvUiLs
	pJSmnNg/+qdUIngfZ7Z3w512ByWFWFCrf/QAFRc7rMY2iiUo594Cmy
X-Received: by 2002:a05:620a:700a:b0:8eb:605f:6ce0 with SMTP id af79cd13be357-8fd15ade350mr1471859785a.5.1777905852362;
        Mon, 04 May 2026 07:44:12 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c349572sm1087451585a.28.2026.05.04.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:44:11 -0700 (PDT)
Date: Mon, 4 May 2026 10:44:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: gerben@altlinux.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: host: ehci-sched: Fix potential out-of-bounds
 access of bandwidth[]
Message-ID: <fcc7ec93-62be-43db-9129-4eab5f3c897a@rowland.harvard.edu>
References: <20260504114340.29295-1-gerben@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504114340.29295-1-gerben@altlinux.org>
X-Rspamd-Queue-Id: A615C4C021D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36896-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altlinux.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 02:43:40PM +0300, gerben@altlinux.org wrote:
> From: Denis Rastyogin <gerben@altlinux.org>
> 
> The microframe index used to access the bandwidth array is not
> properly bounded. Although it is masked to a limited range, subsequent
> loop iterations can advance it beyond the end of the array, leading to
> an out-of-bounds access.

I don't think so.

> This can happen when sitd_slot_ok() is called from iso_stream_schedule()
> with period = stream->uperiod = 1024. In that case, the loop may reach
> sitd_slot_ok() with start = 1981, resulting in uframe = 61. After three
> iterations, the index exceeds the array bounds.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d0ce5c6b9208 ("USB: EHCI: use a bandwidth-allocation table")
> Signed-off-by: Denis Rastyogin <gerben@altlinux.org>
> ---
>  drivers/usb/host/ehci-sched.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index a241337c9af8..d2bace03b8c9 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -1429,6 +1429,8 @@ sitd_slot_ok(
>  		uf = uframe;
>  		max_used = ehci->uframe_periodic_max - stream->ps.usecs;
>  		for (tmp = stream->ps.cs_mask & 0xff; tmp; tmp >>= 1, uf++) {

You (and SVACE) missed the fact that the loop will end when tmp becomes 
0.  And thanks to this test earlier in the function:

	/* for OUT, don't wrap SSPLIT into H-microframe 7 */
	if (((stream->ps.cs_mask & 0xff) << (uframe & 7)) >= (1 << 7))
		return 0;

tmp will become 0 at or before the fourth iteration.

Alan Stern

> +			if (uf >= EHCI_BANDWIDTH_SIZE)
> +				return 0;
>  			if (ehci->bandwidth[uf] > max_used)
>  				return 0;
>  		}
> -- 
> 2.42.2

