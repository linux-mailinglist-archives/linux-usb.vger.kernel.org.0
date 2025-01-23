Return-Path: <linux-usb+bounces-19684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAAA1A79B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 17:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D72B316A0D1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A77C13F42A;
	Thu, 23 Jan 2025 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqaNUaUQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E73DBB6;
	Thu, 23 Jan 2025 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648684; cv=none; b=kU8QeCz+sWhdH5xe2qIv17r0LeaU+6QaGt77QnklqgR6eMIwVojL6el+9KRsztxIFAgToJU4tDdkpqKowSDQHb2eg7mkmuwETCss+t/quETtdfG2S+dI11IXCAGeJ7ytfWbD3x07vh0VnJ+ipNnBA6IfQKPspvler1C5pJrzunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648684; c=relaxed/simple;
	bh=RMj8ruJLj0lD+rpDk2nZBEkGIdj8vfoDKz7cV6t/ySo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcR0alB3emc4/Jx0nUYMLgUyF8b+5GQM/X8/mGYEA9x6bvy/dWZyOfPZS5BmE1dXwD09gLAzLZ2iT5oBFbsYvBLjopHpHHH9xpdJWJe8HCRm5Qd7oUSQTqZ4dVlfgq3D9p1hh+O0HnRJShPZJbjghJ2/zzjpMAtlLq3AJT9Sl+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqaNUaUQ; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51873e55d27so661992e0c.1;
        Thu, 23 Jan 2025 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737648682; x=1738253482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPF/bGIJezUwbhpHYASuTmT0A6OO/gCBrGFRVNUGozs=;
        b=LqaNUaUQM7rTWR+k3TwwASWxQX1Nnw8cNnQDjt+XF/zs3TjXiGHWarFd0MCR+LXNE4
         hMnRJrmNJOyvQkNpwMc5SboQdHstrr0rtRxgOvnW9PtUTw94s8GvKDHR9xM8nfKKpUXs
         b2TJmNyzSapVtMt6212syzAq+8etXTAuxzDF1TTodhDW95Tf+snrXnZXTNHekabQVe1Y
         WNM6ovn8VAfbnhFUdEGMPCgshJrLWGPQmBKq5bvKCkzqpz4Q8fpaNcnBgH19vxDgrYfI
         8Z3Jw3uyek7p8s/Rh64tbVCfbgaV1aHEDzbr4NtyJmy/dikGowz2vPTNc1LGBnsptQ/F
         q/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648682; x=1738253482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPF/bGIJezUwbhpHYASuTmT0A6OO/gCBrGFRVNUGozs=;
        b=J/jm3smsmhHG5MJOJIuaS3L6uAQtXLrrPOxwORPBiwvjCfk4+U4jL+pvbkhoYMo+mi
         3bQvFi2RLV6Ep3ukEOjx1hsTpdEOr2OZf2KNEJLlBLrlCz30NbDEnKZU05+ieL4Uf2cT
         yTKuqNZT6jhKfrSqs/OvCpiYZS8S+V81vvV1GcZEe1jE0dSqBzGKYWhZbHTs5KzeZJCV
         3xmi08KFxExA7nqUzXzxnPN7JGNjfoYKxuZUKUhOgteFhvMS6veGAP0tz94AI3H+/2mO
         oYkIO7YjhIK9Kh36PEJv/PmJWcX0pFKFWRGpTqo4MFFGO2h3HN6akkAbhkvZiRomXmv7
         FjkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxM2XfXzWzCbZ9s1bqFjuj/gUKJqTdcy53dtW3+FiDAkocsFCEz2kzrAEyoJPmjjAQ7skgvjvVuoTTbOI=@vger.kernel.org, AJvYcCXUsaVpgFqtWfssRV4b79lVia6wRh+BlnZmKOVR1iNOEdrq3rHs9U1QQP+HL8QUeQ2ao1qAXJPhMGkD@vger.kernel.org
X-Gm-Message-State: AOJu0YyPX69GoCuJRFhdS9ckig5V8wC/L2smC2CMoBOVfmc0rutyBW6a
	+W7AxDcW0+3Jobj0xFouQ8sShlw8OtjXTIumZ+hEEbOPo2W/RK8MG8Z4DQdY9LPFjMFmInE/jgv
	ZSysuO+W/rSU6kdemWEKfXFA/Z3g=
X-Gm-Gg: ASbGnctBwa+eDveT8WCSiEPaIPYASbten26qDzREj2lMVd71zb3UJokZ3rbEesb307b
	jgRPULu2XiIDSC9qjM/VdRkwTpGvaopKo41eMCkIinAHzBSvVNBaS0UDDWRp0Gg==
X-Google-Smtp-Source: AGHT+IE0rEA4f4ncmhPOdi8aBgwJuL5noC5o1zFw3bxOir1+bbXq6DzF4ZcSF9YIg5rhQuFCkE/3fj8jD0Gs2iY8ubE=
X-Received: by 2002:a05:6122:354b:b0:518:8915:89ec with SMTP id
 71dfb90a1353d-51e3dda72cdmr3666414e0c.1.1737648681906; Thu, 23 Jan 2025
 08:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <20250123151335.15878-1-usmanakinyemi202@gmail.com> <2025012309-catfight-tightly-32f9@gregkh>
 <CAPSxiM8wejNRNU04MN6y78aR519GuYrSHe2gV_R-Eim7y7VeqA@mail.gmail.com> <2025012332-bogus-fried-b840@gregkh>
In-Reply-To: <2025012332-bogus-fried-b840@gregkh>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Thu, 23 Jan 2025 21:41:10 +0530
X-Gm-Features: AWEUYZka-30sR6847BZHwvPfPrguKbdicsCMFO57P9c27rVPbkOEPvtRrkJPTaM
Message-ID: <CAPSxiM9+NJeiphNBBFT4j6WGdLWVN1fKojwbDDB8zQzQRKHXXg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: Fix documentation warning for sg member
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 9:28=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jan 23, 2025 at 09:22:01PM +0530, Usman Akinyemi wrote:
> > On Thu, Jan 23, 2025 at 9:08=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 08:43:35PM +0530, Usman Akinyemi wrote:
> > > > The 'sg' member in struct dwc3_request was undocumented, causing a
> > > > documentation warning when building the kernel docs.
> > > >
> > > > This patch adds a description for the 'sg' field, resolving the war=
ning.
> > > >
> > > > Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
> > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> > > > ---
> > > >  drivers/usb/dwc3/core.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > > > index ee73789326bc..0c417a12e6f4 100644
> > > > --- a/drivers/usb/dwc3/core.h
> > > > +++ b/drivers/usb/dwc3/core.h
> > > > @@ -941,6 +941,7 @@ struct dwc3_hwparams {
> > > >   * @request: struct usb_request to be transferred
> > > >   * @list: a list_head used for request queueing
> > > >   * @dep: struct dwc3_ep owning this request
> > > > + * @sg: pointer to a scatterlist for DMA operations
> > > >   * @start_sg: pointer to the sg which should be queued next
> > > >   * @num_pending_sgs: counter to pending sgs
> > > >   * @remaining: amount of data remaining
> > > > --
> > > > 2.48.0
> > >
> > > Wait, what kernel is this based on?  This structure does not have the
> > > @sg field in it anymore in linux-next, so why is this warning still
> > > showing up?
> > >
> > > confused,
> > Ohh, sorry, this is the 6.13.0 version, right from Linus fork on Git.
> >
> > Maybe, it is already being fixed and I did not have the latest update
> > as I have some new commits.
>
> Please always work off of linux-next when doing development so that you
> don't end up duplicating the work others have already done.
Noted and thanks. Sorry for the noise.
>
> thanks,
>
> greg k-h

