Return-Path: <linux-usb+bounces-16424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C19A423D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 17:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19BD72821F1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 15:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F1D2022D1;
	Fri, 18 Oct 2024 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cu4VQ6Nv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D06200C8E
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264981; cv=none; b=miofuEgTc7BudrAf9aBZpc6Ehn68U08iH2DZ+XO0aMnBGXy0c0pYOBO5mnfNHGpLjKO62ArWyn7UfU+KpV8DbTDBlxfdqVgh9IDpiazodwRt2+yiFr8Q5OB7336EIeZv0+3gLa5oWLNTOJX4+xYmfWvVkeEGE8YiGKWuzveygkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264981; c=relaxed/simple;
	bh=ppghXajr7mhEOYXY5xWy2NDJw6Rv7mCbsa8gnAaqBBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZC2emWN9mtilNsu4aktaKs5G+f25tlAp9Y2aKH+oJjny/dmP8ZvIYlJNNSb5D1orswNYX7CgRaEPSLcjpstKhvQxv5HVjigSmkvQNs6SPXtsdW3uHxby8GhYr35kfRxnboKTU672akNP6SdrQ0Gf9xTUt9wv2/UGgJgXtT0lU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cu4VQ6Nv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2275750e87.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729264975; x=1729869775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvYOf2b92tGv/0UJsbZFFQLBbdVKWDuRIravkxYfymw=;
        b=Cu4VQ6NvhbAf8HyWYTlyfSvlMwmlw9R6xCMAsjFH872atCuofLN7hvkYPdl8R3JeKX
         kbpt0kBt83il7ZWkD1B+kLgzBQVcxavaaTYC+9bWjOhY/lTVX1nzoKbk1rjNC3v4zB8/
         mnhwl8xPlVgZyXm870E2zoR75ND3kIDw5k65I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729264975; x=1729869775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvYOf2b92tGv/0UJsbZFFQLBbdVKWDuRIravkxYfymw=;
        b=Xsq2B01nYrgPBuORxaLuVLHrf62p1s8Z8CkghDiUFBdKDSmh4oLUnQLRlaXMR2jQxn
         PYkBqLBkeuPvM/g7C6TtFsr+3D+8ghA3EXNEwbK5wI86R4YMjjEDZTBPV8hEx6456i2g
         VKScw+Vo2IcYWD5wOeb58iRyVt2X06QmDILqotGqqyt5saKS/3Xl2gjiugPRZFZ2qQJK
         n3+qW+Xz7H3GqiLoFltKtDVopIFadIoBD+fnJTmWTRykh7sHpuE18SqfDI3U7DbY9NMV
         PmndzySM91ECWzwtRT+duReJBLNNeZ171aXAQ8Iim2IiQf416M4DC13MaFBhLLt9uAD4
         ONJw==
X-Forwarded-Encrypted: i=1; AJvYcCUeUAQxI7bVwii/rkdOcE5OIGJ+n2s3c40SQpuqFqYIJcn/ieASjPxaQhmqg/5kfnumEBRJa23ljF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BVO4a/pRS4p9hhkbOjEH7YzTLCg4WFsbYUdUgiLZIQT1tOZV
	snEl62FaE/RRvZWHbLE4i4CaPTjH0mZNEb26qfpYk5o5BLnB/J0Uhs9DEN6DcxtXPOPJilFLQgZ
	o6y9w
X-Google-Smtp-Source: AGHT+IE+89mK6IKekUStDqyIUN4+s2vQNqzjbX/b8kl/2zf2BswUNYlq7DCzok1+8Y7KAp4uyNBLzg==
X-Received: by 2002:a05:6512:308a:b0:53a:38:7b70 with SMTP id 2adb3069b0e04-53a0c6ad49cmr2577711e87.8.1729264974605;
        Fri, 18 Oct 2024 08:22:54 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15204359sm244351e87.215.2024.10.18.08.22.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 08:22:54 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539fe02c386so3371874e87.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 08:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2qd0vQu3+cBBK1ClC3SPQlvZ6lznxKt7CtycPNcPFm/4cZtmd9ddNMgSCwRL1ZQxYByOGZ+bKi30=@vger.kernel.org
X-Received: by 2002:a05:6512:39cd:b0:539:ea33:c01b with SMTP id
 2adb3069b0e04-53a158456e9mr874666e87.9.1729264972196; Fri, 18 Oct 2024
 08:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018141337.316807-1-danielgeorgem@chromium.org>
In-Reply-To: <20241018141337.316807-1-danielgeorgem@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Oct 2024 08:22:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNTgzccjkQOnuTcYtaUK+ZRU1DbqYdnNOOD+TrVGn9xA@mail.gmail.com>
Message-ID: <CAD=FV=XNTgzccjkQOnuTcYtaUK+ZRU1DbqYdnNOOD+TrVGn9xA@mail.gmail.com>
Subject: Re: [PATCH] r8152: fix deadlock in usb reset during resume
To: George-Daniel Matei <danielgeorgem@chromium.org>
Cc: "David S. Miller" <davem@davemloft.net>, Hayes Wang <hayeswang@realtek.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 18, 2024 at 7:13=E2=80=AFAM George-Daniel Matei
<danielgeorgem@chromium.org> wrote:
>
> rtl8152_system_resume() issues a synchronous usb reset if the device is
> inaccessible. __rtl8152_set_mac_address() is called via
> rtl8152_post_reset() and it tries to take the same mutex that was already
> taken in rtl8152_resume().

Thanks for the fix! I'm 99% certain I tested the original code, but I
guess somehow I ran a different code path. I just put my old hacky
test patch [1] back on and re-tested this to see what happened. OK, I
see. In my case dev_set_mac_address() gets called at resume time but
then the address hasn't changed so "ops->ndo_set_mac_address()" (which
points to rtl8152_set_mac_address()) never gets called and I don't end
up in the deadlock. I wonder why the MAC address changed for you. In
any case, the deadlock is real and I agree that this should be fixed.

BTW: it would be handy to include the call stack of the deadlock in
your commit message.

[1] https://crrev.com/c/5543125

> Move the call to reset usb in rtl8152_resume()
> outside mutex protection.
>
> Signed-off-by: George-Daniel Matei <danielgeorgem@chromium.org>

Before your Signed-off-by you should have:

Fixes: 4933b066fefb ("r8152: If inaccessible at resume time, issue a reset"=
)


> ---
>  drivers/net/usb/r8152.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index a5612c799f5e..69d66ce7a5c5 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -8564,19 +8564,6 @@ static int rtl8152_system_resume(struct r8152 *tp)
>                 usb_submit_urb(tp->intr_urb, GFP_NOIO);
>         }
>
> -       /* If the device is RTL8152_INACCESSIBLE here then we should do a
> -        * reset. This is important because the usb_lock_device_for_reset=
()
> -        * that happens as a result of usb_queue_reset_device() will sile=
ntly
> -        * fail if the device was suspended or if too much time passed.
> -        *
> -        * NOTE: The device is locked here so we can directly do the rese=
t.
> -        * We don't need usb_lock_device_for_reset() because that's just =
a
> -        * wrapper over device_lock() and device_resume() (which calls us=
)
> -        * does that for us.
> -        */
> -       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> -               usb_reset_device(tp->udev);
> -
>         return 0;
>  }
>
> @@ -8681,6 +8668,19 @@ static int rtl8152_suspend(struct usb_interface *i=
ntf, pm_message_t message)
>
>         mutex_unlock(&tp->control);
>
> +       /* If the device is RTL8152_INACCESSIBLE here then we should do a
> +        * reset. This is important because the usb_lock_device_for_reset=
()
> +        * that happens as a result of usb_queue_reset_device() will sile=
ntly
> +        * fail if the device was suspended or if too much time passed.
> +        *
> +        * NOTE: The device is locked here so we can directly do the rese=
t.
> +        * We don't need usb_lock_device_for_reset() because that's just =
a
> +        * wrapper over device_lock() and device_resume() (which calls us=
)
> +        * does that for us.
> +        */
> +       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +               usb_reset_device(tp->udev);

You seem to have moved this to the wrong function. It should be in
rtl8152_resume() but you've moved it to rtl8152_suspend(). As you have
it here you'll avoid the deadlock but I fear you may end up missing a
reset. Maybe you didn't notice this because commit 8c1d92a740c0
("r8152: Wake up the system if the we need a reset") woke us up
quickly enough and the previous reset hadn't expired yet?

In any case, please move it to the rtl8152_resume() function, re-test,
and post a new version.

-Doug

