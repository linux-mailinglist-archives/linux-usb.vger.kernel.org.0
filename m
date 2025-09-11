Return-Path: <linux-usb+bounces-27916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C324B5293B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 08:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD26B3B85CA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 06:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81928257AC1;
	Thu, 11 Sep 2025 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gwuG8z0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D9145A05
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 06:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757573446; cv=none; b=jq3Y9H6p6PhbnM273TmrUpSnktl9sizsI8rGjEYkV8hx2JRhV0DkZsu/GC8JFfFOJ56Yyj987IDSpYnEV9pBRjTBL6MMjJx0PZJB9bjhmZSB458QzQKX7piVLI/05Nxl5EWNw2tKvuwcb22VmWMMY2PULwTi8YRh3t93Xro/fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757573446; c=relaxed/simple;
	bh=Qmej7+PbGLzKdrf5NwREGPDWn8BnQ+ox2SidyFmQdxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvEjkOO51E9DoMy06MV7qufPpMkXAIc3LwbQYzhdXD1nki2ttXoTJvPHUA6KCaqDCpwoOdvoNQZlc9REH2Dy8IuOFAbg0AatySdDnMLi2wz8HCbsaVBhqZpmbJzJuNlUEy1cyeMQn7HYxkKYDSrm52ChXzXBOUZ1ihplu8NwX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gwuG8z0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de54bfc36so52725e9.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757573443; x=1758178243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYiFEl1cKyTzdaxqboCqwBqA3eL+ISbCaMPkWSxLypQ=;
        b=0gwuG8z0AUSg4EHovM95JhXgLPVSeaWXR5PqvVxEiUEQ3EKiAKD5/SQnZFhC7jUKu4
         uJ11zOhwYVKYt/hTh468v5sXKrRz5SWjTFCatC2hjSiN6nT/6NKAWRoUeeAf5oiVDw8K
         Dv6jdUxmbkdGz5A+e5mVF/ornV6ESQhtW82KGOzavRgZqRu2vW5CyuDQxDk/ILeWdM0o
         le3SHHgFRtqpS4Ej0HFvNFJrcvswh1v7NFBacFmuhN2/tq7V56mt2MVrsNopDR3mFYOn
         o11ZYItvOLmiwwz1MKLxRS09LI1uNHYeplX81IEGmC10uWt8eJccdHkI1lTYiK5usykG
         jF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757573443; x=1758178243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYiFEl1cKyTzdaxqboCqwBqA3eL+ISbCaMPkWSxLypQ=;
        b=Dk+hZo1uCBDTOu4vABGhJ8tH8xjAffCZsb4luxM+LyAGtnuo+oFRIqrtw9GttFbVBs
         PyS2dVLQDIbcXzpuZbFGmHeWLNKETzDHBZgD64zrv/dikIc/fPUK5L1ZX5c5CC2z42V9
         epCTT7EfvJjxKnPBcxSXXPPFrNaCbL72GKNgdSA2T1s/04zKkroeOKd4afuuLgB79wQ4
         agmSkMhGYtAq7uOoulNSioHtTAngqSxppSben+T5l9k3042vD8z3wk390PxHX/8If/sk
         fVoJqMPcZzi43liw8Il3GqezkTMbRhODwUpYZNFA92pmIxBfs096ClqCG1e+VsGB5wv4
         bgBg==
X-Forwarded-Encrypted: i=1; AJvYcCW4F5CTgXkokepfFLtQ6OgpBKRz6gu9zuFXLneK8pz4FRJycNnZj0+FYIAmfICwJ434bj4yrekNbrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/4GPvn76bla20ow+q9KGl2BrYqa0UILtlVMehGuMzGBB39ME
	8jul68WwsTtinNhuWFMVnY6MGPy++VTVO9/9o81Bv2lM+eYz+ksAE6o3eJF0bJ9x35RMqi4AsFV
	ZZVUy+bp5hWuUQuyUeZMGEXzUlti+KuYm9ylUKwv6
X-Gm-Gg: ASbGncvDNgmE3EFtu3B0Mz8TORbSKsRZBoVcst7c8+DHxgXwW5AIXBxishWLRUSGBA6
	JB6hhPNrp3A/r3/fZiJsPCRBsBgQX3RI5YiZ4O3kV1tm/ZwnzDqJj95OXxjMxqT4MqBtsezEPnp
	XzJ68bG4FeTHexvEbYwTt2+8CCAm8zPlP1cgG4CgSRyDGxlNF9kgC6mahaS5AB4CMUSHl3kSn32
	q0H9VIIZjeXz4Vf9naifIFgdLPfQ4qI3GmxAznw
X-Google-Smtp-Source: AGHT+IFJbf1IyXGBCFdg7upsR0ji8KKP+f1JtPl42/vxHPTsLQ1LycUtAnMTQe1qYHPH1lEHLbkyiQchIBkA8tyrg54=
X-Received: by 2002:a05:600c:12c9:b0:45d:cfca:a92d with SMTP id
 5b1f17b1804b1-45df74af1b6mr2252505e9.2.1757573442443; Wed, 10 Sep 2025
 23:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114854.1913155-1-khtsai@google.com> <2025090651-unifier-award-3e0a@gregkh>
In-Reply-To: <2025090651-unifier-award-3e0a@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 11 Sep 2025 14:50:15 +0800
X-Gm-Features: AS18NWAMPsNVcx8vukdIJf2WC9FuB49krMkFwHqi-L2lEbkeXdxFuuWz00OB9vc
Message-ID: <CAKzKK0oi85bnyT3Lq_TXz8YwFrmBxQd8K1q7hRDv-Oww75F_tQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix NPE in ncm_bind error path
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zack.rusin@broadcom.com, krzysztof.kozlowski@linaro.org, 
	namcao@linutronix.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sat, Sep 6, 2025 at 8:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Sep 04, 2025 at 07:46:13PM +0800, Kuen-Han Tsai wrote:
> > When an ncm_bind/unbind cycle occurs, the ncm->notify_req pointer is
> > left pointing to a stale address. If a subsequent call to ncm_bind()
> > fails to allocate the endpoints, the function jumps to the unified erro=
r
> > label. The cleanup code sees the stale ncm->notify_req pointer and call=
s
> > usb_ep_free_request().
> >
> > This results in a NPE because it attempts to access the free_request
> > function through the endpoint's operations table (ep->ops), which is
> > NULL.
> >
> > Refactor the error path to use cascading goto labels, ensuring that
> > resources are freed in reverse order of allocation. Besides, explicitly
> > set pointers to NULL after freeing them.
>
> Why must the pointers be set to NULL?  What is checking and requiring
> that?

I set them to null as a standard safety measure to prevent potential
use-after-free issues. I can remove it if you prefer.

>
> And this unwinding is tailor-made for the guard() type of logic, why not
> convert this code to do that instead, which will fix all of these bugs
> automatically, right?

The __free() cleanup mechanism is unfortunately infeasible in this
case. The usb_ep_free_request(ep, req) requires two parameters, but
the automatic cleanup mechanism only needs one: the resource being
freed.

Since the struct usb_request doesn't contain the pointer to its
associated endpoint, the @free function cannot retrieve the ep pointer
it needs for the cleanup call.  We would need to add an endpoint
pointer to usb_request to make it work. However, this will be a
significant change and we might also need to refactor drivers that use
the usb_ep_free_request(ep, req), usb_ep_queue(ep, req) and
usb_ep_dequeue(ep, req) as the endpoint parameter is no longer needed.

I also want to point out that this bug isn't specific to the f_ncm
driver. The f_acm, f_rndis and f_ecm are also vulnerable because their
bind paths have the same flaw. We have already observed this issue in
both f_ncm and f_acm on Android devices.

My plan was to merge this fix for f_ncm first and then apply the same
pattern to the other affected drivers. However, I am happy to have a
more thorough design discussion if you feel using __free()/guard()
automatic cleanup is the better path forward.

Regards,
Kuen-Han

