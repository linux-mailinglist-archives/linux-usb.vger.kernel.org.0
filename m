Return-Path: <linux-usb+bounces-30056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D77C3235A
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 18:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 814DB4E86B0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 17:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A78B337BA4;
	Tue,  4 Nov 2025 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dw5xZPu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FEF242D88
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275756; cv=none; b=pvHC9Kl0i20T4wEGH8WGLUBuv+teq33UFHHlnZnuMeGIHzim0PtcuFz73lSDWJ2YBuUUEGvU1w/oXEjpokHjLxIC0TMuXmowYivn/+r50EpVmv0rMWPkztfPiCADswbyUaTo7TOwVIWxhzoul2LkYNarpTgCOz3CjmKTUHGlxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275756; c=relaxed/simple;
	bh=Z0MmI1NETHTTq5QqfW8z8KIMnu7Au3hO/FYNo9IIGZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfukSflsbUnaWpN4lSUhqaRvSGULGqSJ+R26o3cMwJjbnPa9/leCqrW7ZmC2EO8tG2kOUQwVV8VUqaGgLniUj9WCoRKJ99VuZn3AjjcuVvyRaCju7NtCyGVaMGpmDDcBcugSwfzBkVwksNHyq+s7JsXFLw3X0TLp4or/mX+PpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dw5xZPu/; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88043139c35so42379096d6.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Nov 2025 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762275754; x=1762880554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4glyS7Rgt70eY/S9G3hD2O8A/QvF248LRGznzijtOw=;
        b=dw5xZPu/4QbE+xu/aIIV5buvRN/QG6OhvpHCpX7lc7B9fgfL6LwxRD4HRFk5B8jHjW
         czKGp9s5PJjGNR+0zA60YVHKiLon4mQkHsLIEIawwZ7sc/jb7xwXtWQvwq+LTdvrcdzk
         vgo2vZYDBEEKcxCZP3S3/7+9pIvemgdEaU3Avkv6PQwpEXt44jY/pPzLEeF4LF7blcSS
         1bAj87Wwo2l9u1gGZxlhG+Uov3wCfbEipetQA3O9lflQKZ4ZWUnGFdGTW9mUPy+uj7+z
         hVG0+oqkyXieGLVv/RxsAeih7UF+Q8jRMbBhvGo6F840f8EJPQYjAK9yo/EQHSLTSUyV
         PSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275754; x=1762880554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4glyS7Rgt70eY/S9G3hD2O8A/QvF248LRGznzijtOw=;
        b=vxlrfVijLHOgdtzqgO+uTmRNim7J4bt53CychQ4HnImvsAIdtS804AkDed5ULXmUC4
         D/HizbnoBO+jVUKpRk6GgmmZrWmcb2+09FHBeYIIQ1A6rqb7s+cPBlCsOSwCY49I925D
         ZNPyFs2TkgeTv6htC1MYGbd85dbUSz1914tTRiRXc4tE3EVxE+Qrb1/DhBQb1QbLEuvD
         sLoFbfxh6yqwiKnGlVng0kguTRfptUxiwizzukcQmCiOWz6bxHoAK3mqU1sG5BKMSqKi
         Y6d63oyhrwLalRuVDcNSyGhFQNzzy+HZNZ083ZYpXcvWX+QU0CiRPfoUW5DUtCu6ty1q
         OwCw==
X-Forwarded-Encrypted: i=1; AJvYcCVJHB/TtOD/U0Kzd9HZbX59RIai2xsN8hRhedb7zl3gJ67dBVxyFRRn576UIwu9BU1r9sJG2XyOTgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGY8BAC1kXFiibqE6XsJ4oZEMEsPYoW1KbxDY/z97xJ71xAJfu
	mJrS11Zv5fXGiSZuzsW4ELjoX5C2jJKadltO+VRnbtZKcH2FANUSAoLJh+R8tAnBaTAwAxLrWCK
	lzEqcTUXHpfsL67eAsqLC7lu5EOCeRcB+rOmUBwIutm4U73HgyHvgU+Bu
X-Gm-Gg: ASbGnct8KoxhYvJ9QYftIBe49GyNEgwsPN8XEuvLtaCA9dAzds9DtNFoRTigMAPDUh5
	yNmPfqs7bYeGGXmxzaQABTH+30L6mu8Dym4G3cvLb5IAPgt3+2KagAY9o8qc6GNYVtXlvSL5ZOm
	B1WXe4ZT8d652WVo1Y+KiFF8EFUyF3L+20nno5QoiwkiwuI0jLaHg/DlL6+St/8E9vC/5pkveIa
	4+VtpCECUYFR9nOQFn4UoCh1GOF+wcfhP/oGBaKzTnTm1maX4xyzk3oT0T8oYzbUTm2pi0=
X-Google-Smtp-Source: AGHT+IEP0Knug0eg6x3P5QTPqchVM7SA3E0sgAIW2kcZdyMcc+uoGFlV6Ji4+Yy9nmF7xS/q5KGEOJsBFGl5S23+xP4=
X-Received: by 2002:a05:6214:202b:b0:880:56f6:92ae with SMTP id
 6a1803df08f44-880711da703mr4649616d6.57.1762275753291; Tue, 04 Nov 2025
 09:02:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104161327.41004-1-simon.schippers@tu-dortmund.de>
In-Reply-To: <20251104161327.41004-1-simon.schippers@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 4 Nov 2025 09:02:22 -0800
X-Gm-Features: AWmQ_bk_LR7X34Hl5Btww0CX54bIHOZ1bYk73juX3wYUQMz2ygA_bOipGaJwTpo
Message-ID: <CANn89iLLwWvbnCKKRrV2c7eo+4UduLVgZUWR=ZoZ+SPHRGf=wg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/1] usbnet: Add support for Byte Queue Limits (BQL)
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 8:14=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> During recent testing, I observed significant latency spikes when using
> Quectel 5G modems under load. Investigation revealed that the issue was
> caused by bufferbloat in the usbnet driver.
>
> In the current implementation, usbnet uses a fixed tx_qlen of:
>
> USB2: 60 * 1518 bytes =3D 91.08 KB
> USB3: 60 * 5 * 1518 bytes =3D 454.80 KB
>
> Such large transmit queues can be problematic, especially for cellular
> modems. For example, with a typical celluar link speed of 10 Mbit/s, a
> fully occupied USB3 transmit queue results in:
>
> 454.80 KB / (10 Mbit/s / 8 bit/byte) =3D 363.84 ms
>
> of additional latency.

Doesn't 5G need to push more packets to the driver to get good aggregation =
?

>
> To address this issue, this patch introduces support for
> Byte Queue Limits (BQL) [1][2] in the usbnet driver. BQL dynamically
> limits the amount of data queued in the driver, effectively reducing
> latency without impacting throughput.
> This implementation was successfully tested on several devices as
> described in the commit.
>
>
>
> Future work
>
> Due to offloading, TCP often produces SKBs up to 64 KB in size.

Only for rates > 500 Mbit. After BQL, we had many more improvements in
the stack.
https://lwn.net/Articles/564978/


> To
> further decrease buffer bloat, I tried to disable TSO, GSO and LRO but it
> did not have the intended effect in my tests. The only dirty workaround I
> found so far was to call netif_stop_queue() whenever BQL sets
> __QUEUE_STATE_STACK_XOFF. However, a proper solution to this issue would
> be desirable.
>
> I also plan to publish a scientific paper on this topic in the near
> future.
>
> Thanks,
> Simon
>
> [1] https://medium.com/@tom_84912/byte-queue-limits-the-unauthorized-biog=
raphy-61adc5730b83
> [2] https://lwn.net/Articles/469652/
>
> Simon Schippers (1):
>   usbnet: Add support for Byte Queue Limits (BQL)
>
>  drivers/net/usb/usbnet.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> --
> 2.43.0
>

