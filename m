Return-Path: <linux-usb+bounces-34504-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMJ3GaSWsGkukgIAu9opvQ
	(envelope-from <linux-usb+bounces-34504-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:09:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E5258B8F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 23:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE1D73193E7B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49393CFF7D;
	Tue, 10 Mar 2026 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EtvotgDf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDACF3B19B8
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180510; cv=none; b=KhPUyGzfKDkHKB9d361OFqgjQmxIH5CDLgI8My3aHjnsUtP7fZrw7f21diA5NtCbA/gj6qCuk8fsm+A1yrAELGRbOV+tRg4gHN6DPBpM3iDXeckABoBho749aIYPo6J5+Gj2Mtrw4h7w4zOzWh14PDvUDB5wwCC1YJ/WAkgXpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180510; c=relaxed/simple;
	bh=EkT3jVK1vb20RIv1qVCCL85jx8kkGbuMtERBRD038OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKGrzLQvYT/6/sORMAbLmCZWlqKD0kbqditrBKswCVh65CtTE4LzKUglfgH2i31FEqNTp+3Ac9oI2ZXPfGNbjBC4p8uzv+y68qvVIaPDwH7uxRyOMAkluS3H9qU3/vJt50tB0LBILdHRjizjaV56Js0/eCuGsEqjFS9u4sZ6JxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EtvotgDf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6630858b4ceso516070a12.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773180507; x=1773785307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7T57TbUh1a9gPuEhl9gX+JZqR5FWHQ6K3iwhXdSBh1Y=;
        b=EtvotgDfEkRNVUDvQFZ1KnBnuWl9bV9ApZ5oSgYJE6S1RoY9boauLx5vpKxlZwhwn+
         0f6R1bkJGjimOwWOPlkzfUbHcNygR53g29nhAMmIH1uDYhTQxsmz+9Xee7nFC/voIlcC
         JDJWrhLzIDkaOBc364z9UDgnB78Oolqk475UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180507; x=1773785307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T57TbUh1a9gPuEhl9gX+JZqR5FWHQ6K3iwhXdSBh1Y=;
        b=eHdCLjXfhgzYsLp3N/rKfJQfCwxkttWS7ZNqhXh/OfTuTEMFFlhSgOj/fLsa9/TQfN
         qlOwX/PMb6CDicYHtgGTF0L6difJYdW9nOwHmEjdjsJHyUPRtqJEzqKv7pAJQ6nZShTY
         +z+eC/wfdg+aYC5L8TJs6YYmAIHav+c1bE7vaf5/FDkNiSMVkP9Y4s9pE0/UeolMwulw
         yMedzL+lskL5dXoAOBqrU9fKK8CNuH3v53UEA4NsdCA9wjrFVxsmsxP0xkr6tIYmN/Fq
         T1jb73oRQ1UNtmiocAWDKIVkt3w1/MD/N+rUiGhHWKDt8IZR8PkmlPt13ykdP1C7E95B
         tVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz3VpGoZbYODy45dnvkSLTAg6IS0ZeVldIlKl6/+fCHAC8PkiLQgx28rv2jTyH81E0JsQa5cpddBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywEJ2z3saJJEHZNqiuLyTxN6uB6wsGgHKm7jU0YcKbTDhEPPBU
	U0tjtmxkGICQLMcwb6J7z5X7bjjI9ifWCR/mcuO73ToNbLeKpu1/ChjD0RdG1e2QqoturTWoETG
	rIj4g7ll4
X-Gm-Gg: ATEYQzxB+a2AYet6XjYwNLLOIf/haKkhdIUVr/Rncc69HlQoXZVkWHCXpjIm7iSB/YY
	iB7pI3bghh4On6D0JD+apc71UsKPJJvxJpU7eA5RHNf5m1x+9Q/ACMETMBJ7LBIKpbJKGdow7Vy
	TmwFhc6EWtm9FOV1SSoxK2PQGJkUR6xT7Vjg9seHfqzun/R4OHULVDAxq4ICujmS81D1tXSSimr
	gDLm33TGAO3gAVQhHGJi6+TZjyTvUykphFm3gBUIcZ5ppqoe78XZsVmc4NnPzl6Tpqi3hG1uX3A
	miLZd0/G/XIXsR97Jrbhepg1/nJ/TAQo+0m2Y7xIKSotTC38+ztQcwXBVGcGpuhFUFuI9rzY4SK
	L5LN7o76bWOL1k7wFn8Q39+0jYdYyqbmXLSAAkyFCevODs3VJPXIiWjsjeWJsZRXl7/xLS2guRT
	MGZ0y1NPlGKOkVMQwvUa+QIoW0/mmn0Xp6xNeN22aM24VOXVTc6lb7bqi7vNG4
X-Received: by 2002:a17:907:7ba4:b0:b87:d255:39ff with SMTP id a640c23a62f3a-b972e50894cmr8125566b.32.1773180506538;
        Tue, 10 Mar 2026 15:08:26 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14aa2esm5245466b.38.2026.03.10.15.08.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 15:08:25 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b941762394aso660417266b.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 15:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYNO4kP4BcNR33zGgsFvsNFc+v3WllSS4MQiCWtoOe+9rdl3aJtZqm+gAQUayyM1JGXpSzJWgNYUw=@vger.kernel.org
X-Received: by 2002:a17:906:fe05:b0:b93:6bb6:cb3d with SMTP id
 a640c23a62f3a-b972e5db7damr7346366b.58.1773180504840; Tue, 10 Mar 2026
 15:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
 <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev> <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
 <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
In-Reply-To: <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Mar 2026 23:08:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
X-Gm-Features: AaiRm50XOVm87K1Q-vDN0LsYBCOyd5MoJTfNKT6h6Cl9SSOIuVJLMmVYf5OnOJE
Message-ID: <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C37E5258B8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34504-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Action: no action

Hi Sean

On Tue, 10 Mar 2026 at 22:23, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> On 3/10/26 16:56, Ricardo Ribalda wrote:
> > Hi Sean
> >
> > Thanks for the report.
> >
> > I have not been able to repro with qv4l2 on my computer :(.
> >
> > Could you try if this patch works for you? Not saying that it is
> > beautiful patch, or the way to do it.... but it will let me know if I
> > am looking in the right place.
> >
> >
> > diff --git a/drivers/media/usb/uvc/uvc_status.c
> > b/drivers/media/usb/uvc/uvc_status.c
> > index 231cfee8e7c2..cca2aed162c3 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
> >          * Cancel any pending asynchronous work. If any status event was queued,
> >          * process it synchronously.
> >          */
> > -       if (cancel_work_sync(&w->work))
> > +       if (&w->work == current_work())
> > +               cancel_work(&w->work);
> > +       else if (cancel_work_sync(&w->work))
> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> >
> >         /* Kill the urb. */
> > @@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
> >          * cancelled before returning or it could then race with a future
> >          * uvc_status_start() call.
> >          */
> > -       if (cancel_work_sync(&w->work))
> > +       if (&w->work != current_work() && cancel_work_sync(&w->work))
> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> >
> >         /*
>
> I don't think this works since the urb will be rescheduled as flush_status
> is set to false again. However, the following patch works for me:

It does not work, in the sense that the urb is re submited... but if
would have confirmed the rootcause of the lockdep. But you have
already proven that with your patch, which I think is correct :).
Thanks for that

Can you resend it as a proper patch?

You probably want to add:
Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")

I will try to review with extra care and a big cup of tea tomorrow morning.

Thanks!

>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2c..2a23606c7f4c6 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>         if (!dev->int_urb)
>                 return 0;
>
> +       /*
> +        * If the work called uvc_status_stop it may still be running. Wait for
> +        * it to finish before we submit the urb.
> +        */
> +       cancel_work_sync(&dev->async_ctrl.work);
> +
> +       /* Clear the flush status if we were previously stopped */
> +       smp_store_release(&dev->flush_status, false);
>         return usb_submit_urb(dev->int_urb, flags);
>  }
>
> @@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
>          */
>         smp_store_release(&dev->flush_status, true);
>
> +       /*
> +        * We will deadlock if we are currently in the work function.
> +        * Fortunately, we know that the URB is already dead and that no
> +        * further work can be queued, so there's nothing left for us to do.
> +        */
> +       if (current_work() == &w->work)
> +               return;
> +
>         /*
>          * Cancel any pending asynchronous work. If any status event was queued,
>          * process it synchronously.
> @@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>          */
>         if (cancel_work_sync(&w->work))
>                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> -
> -       /*
> -        * From this point, there are no events on the queue and the status URB
> -        * is dead. No events will be queued until uvc_status_start() is called.
> -        * The barrier is needed to make sure that flush_status is visible to
> -        * uvc_ctrl_status_event_work() when uvc_status_start() will be called
> -        * again.
> -        */
> -       smp_store_release(&dev->flush_status, false);
>  }
>
>  int uvc_status_resume(struct uvc_device *dev)
> --
>
> The first cancel_work_sync also seems superfluous to me, since we have to cancel
> again anyway.

It has been a while since we did this, but I believe that since we did
not use locks, the only way to guarantee the event queue was flushed
and the URB was killed was to have the double cancel_work() in that
order.

>
> --Sean



-- 
Ricardo Ribalda

