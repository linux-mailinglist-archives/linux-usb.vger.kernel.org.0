Return-Path: <linux-usb+bounces-33213-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFtODQUeimmtHAAAu9opvQ
	(envelope-from <linux-usb+bounces-33213-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:48:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E198113362
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F83F3016297
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 17:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A0530EF66;
	Mon,  9 Feb 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="NUsjFmO/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D42D8379
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659324; cv=pass; b=EmRGv4rUcpi5QnKOUmXu3haR0200BrTjF7mzaO6emE0nOXnrVLSNcFifBD04EOhKsRI4i475buLyobf3qV/NwwdC3OyTp0k45AXBjD2qdKOptGiOkyGH7FQeCZSDp7V0mVqEL+y/11S1EvKdgjBdkJKeBNufeyMjLGdfJsfmuuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659324; c=relaxed/simple;
	bh=g0HZbw2/H8FR47tfpPFL+qeV0wCatbkCangR7IZxcHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrTL0IE8n0dYqEXkFT5xC/j+nf2arAgCTAH4XSjy15nwK4s33Zomv8wRzJ0vLlbwHV8z5t0yMh5DnMC3CyLxZe2rMi7FSaisQELeHbgoM3iTJv9u1i9vnukmB6BVFjwQ1Zu6vZEeMLO0mkNEJo4DjlfnSrgWMuXhlAyiFCDUQD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=NUsjFmO/; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18f80b5c2so3714543a34.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 09:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770659323; cv=none;
        d=google.com; s=arc-20240605;
        b=Oi9kbO2Zwv+ZknCM2XeTLtpgMGMlGwOzH/1cxwOYtU6DhEUuhh41TFhKXRcykaYyz2
         6QNhdXpWWf/sFQVPwN6oZt8lVPtuioS0nr9aH8484TPyetSu9RPVy6SswuuECnPunwLQ
         t3RofUkKsTeOpr+5pzO+asoDt8WsbSXL4ccWQPxi8FDdnLfNnQDEf3RJ4VBXKTMfVjox
         KusSaI0W2GDGqmi9VtQNUPt3v0Ai/8adPN1YoOHZS8UDEF3my3rfh+G/rs2m40WiRCLt
         1aOBsnMH9c8n010qLmp2ztDVLr0jxvbZyiGfwebDWyekov1TOlHyOK5xh3WnM7jFrmVO
         QdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHYo9+17/jdy/rTmLrbaDBuIFiHrvbUePiuYWeSHyxE=;
        fh=o30TzMd99N0gHhvEQ9uRJtBduJILPcy6gU6KgdPTGf4=;
        b=h8qP2GUfLYqDzR0WkjWb3LbnEtiikLAfDd58YkrSALpDKW1HNJcvdvUZqrgsxu11CA
         n+XMTU8qbs5eABmihrHn3m1FDAAi4Ruxn+rlT44sIRWveL+CakTaeqVRge0tPDm/SW0f
         PS0K32rc71mXGnZmcKjSICrIGwhGI3GB3HL2dyLCW5DYdrP/nsOK5N7EBiOD9woO1a91
         b9UXZSpW3gGHGEVnmBPjat/wPs8PjUSwWpAgpmOU8/CAoEj5nzdbcgYHxe9Y4jQ8JlQ9
         0EXa2JCaEd3AfkxWqF+/ssCXCmEoKTIHhMsQq373juD1Vtv0U8/jJqSFKt9amT1gATaz
         1fPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770659323; x=1771264123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHYo9+17/jdy/rTmLrbaDBuIFiHrvbUePiuYWeSHyxE=;
        b=NUsjFmO/oTK4qwz8MT4fL1kk46CZpO/Fny+x4M77xWmpgVfRoBColNX1m/piztLuMz
         FAxF95WRCQ6puTUo5CHJRzaFydaG0OzA8CPTpvwCLsX+ouvu1uoxuVD4RBcVwl5kZQQu
         xLT1oET8vtdbjgpzeznYRb0CVUxeBbsKk9VASntVKbfq2XUwOhTKs93a4ZWD8V7REX/s
         u9ScdqzoM+mbtiXs2/W7rbTe3urIN/JoxjnQIUYPrxyMk4EnOAKH2fZET9w1+3LKBDgK
         64Z35Lh2vUk7iupH3gC5X4jmUvX6AE+5SUV7J9midgBL0KritfFeIqgASaV9g5bdfRyC
         4tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770659323; x=1771264123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHYo9+17/jdy/rTmLrbaDBuIFiHrvbUePiuYWeSHyxE=;
        b=YgToGaVQqvSi30n8PwI7SPB3YvCCRhGNhHyca1w+sBCPkSFwFy8kCir4gF0KEjNeqZ
         oCbDsHgEKmZmUM1ZXbsR/jPw8UkHswgt+Uvo4Q08XSxRJO1uNsbq06rYMrSmDT6rhZnj
         my/I3SVL9XDgqoaCJBcZHVVO0s/lINjneOA4PGLlgFRcaErZsAIgDh8jvf0Qrt5dLk6w
         2HkVBlMdu82fo5dXuUdyNEuWwLYVSN2vzUKJ8JPpDCFY5CrkWxOtZpjv31TrgvGYLdCb
         oSq5r6/w6trh9+5k9N8SHu2U8H2OnlMtoOpnyAuDymULrFRa3P9b+xo12VExGbiD7Si9
         64KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWo5qtD6DZE+c7QdQRsUAoj6kjUCt0wNYtU1qkYcq2L0YP9a08lOj8oWC7DkmIW5489J5GkDs+b8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5+knNhnXfSrHbzYGu1Vk/QtZOgUgQvoejuKRkJVMpCBSY4gL
	pE/vQdM7I0hrcBrWPBxDhBxDrhT6JsI4rXZZXXv9U24YDz4lWOxY8tUouC5/+jkVRCGd9zfqKPy
	41/p9VZK6MIc48gFJdrSkasgwxktepiPx+Ky77qzURw==
X-Gm-Gg: AZuq6aJIz2JaJWK8era2LMw60PdZwrluG2h9zZWDbdlWL29O/9fkTer0Toa0697nVxd
	hRz1wEkoarfAYCq9m/kUooWZOrst5dVMTwYuwIWil4HURCNxGtwavZ3AZOtqDSC3RNL7KIOVeas
	G48Is0LnmnXkVi8DfPtwHEFWpT5vHVRnSDFXMJDvqd6fehN/d49JCRZoZlTHadIP03hdoCsmf3H
	xsXpY/SyiefVP/QcqvPfZHyEOajof3fPwHnhVmCxehnSIn8MAyjkJC7Ej7/m1nQwo+CevtC38y0
	6wh74+t5X4B7EadpZo9OIY+iIjVlITa/G6F1jWjj7S0OTZRouTNAzPLRIro=
X-Received: by 2002:a05:6830:81d6:b0:7cf:d1e2:d386 with SMTP id
 46e09a7af769-7d4646ade26mr7579234a34.33.1770659323048; Mon, 09 Feb 2026
 09:48:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209053013.1701134-1-n7l8m4@u.northwestern.edu> <d697a88f-dd8c-4ec1-ae4d-c97578a98498@lunn.ch>
In-Reply-To: <d697a88f-dd8c-4ec1-ae4d-c97578a98498@lunn.ch>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Mon, 9 Feb 2026 11:48:32 -0600
X-Gm-Features: AZwV_QjvH53WnJ9lJUe27OVtS-KqGcnJKAmovZNjB9GgwAFFxmwcMkg5R37bZeA
Message-ID: <CAMFT1=bFkHFsh-3U+Ca7Dey1mzPdz0rpQweCLmXFrattwZ_uMw@mail.gmail.com>
Subject: Re: [PATCH] net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33213-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 9E198113362
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 7:56=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> I think there needs to be a better explanation why it is safe to
> remove these stop and wake queue operations. r8152 does the same. Is
> it also broken? Rather than removing these, should we actually be
> waiting for the completion of the urb?
>
>         Andrew

Hi Andrew,

Thank you for your time and email, here is my understanding (correct
me if I'm wrong).

I think ndo_set_rx_mode runs in atomic context with a spinlock held,
if we wait for the completion, this would sleep under a spinlock.

And it seems the architecture of r8152 is different from kaweth and
rtl8150. In r8152, the ndo_set_rx_mode callback (rtl8152_set_rx_mode)
won't directly call netif_stop_queue/netif_wake_queue. It only sets a
flag and schedules delayed work.
The function that does call netif_stop_queue/netif_wake_queue is
_rtl8152_set_rx_mode(), which runs from the work handler
rtl_work_func_t() under tp->control mutex, not from the ndo callback
under netif_addr_lock_bh.
Also, r8152's start_xmit never submits URBs directly. It only queues
SKBs to a software queue. Actual URB submission happens in a separate
tasklet using a pool of 4 independent TX aggregation buffers, each
with its own URB.

So even if netif_wake_queue() triggers start_xmit, it just adds an SKB
to the software queue, no URB is touched, and no double-submission can
occur.

In kaweth and rtl8150, start_xmit calls usb_submit_urb() directly on a
single shared tx_urb, so the netif_wake_queue() from the ndo callback
causes the stack to call start_xmit while that URB is still in-flight.

