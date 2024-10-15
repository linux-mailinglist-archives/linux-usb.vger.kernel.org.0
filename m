Return-Path: <linux-usb+bounces-16206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5199DD0F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 05:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5E81F23D74
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 03:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F70170828;
	Tue, 15 Oct 2024 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4HznoaE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC7170826
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 03:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728964684; cv=none; b=awyFHMaUPzOsrdHJ/VdlMcztOz6/P1q2lmZpjZB/tJ2ofgepX9Okgz//CKVuwAu4CEmxLFfCzNGpbDFcvkoG7iHuvBT01xM8LZYJLLLGHKUwcRtv6GBk7QMzTBmajqYmHP125DqEYDDQpbxQxpwFgHCNANfRh98PsB6oUR8gy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728964684; c=relaxed/simple;
	bh=N40ZSNWwPk28dZ+LQrxhSO5jACT0zCPufmoUUaRuVJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyfxHjw5UJMaL21TCSukxjtkWfmBdrGCJFSCkqw7TnNbAFA4MHB9WpI8wWMMNfzIGc1wZB2DfIRO3sCX04nyuB6dd/9llem6OnyPifm/oU5opVETjxJl5PdmiInNE5EX6kCk+G/TRaL98UYu3AZK4i088lY/agUQbkXh07C6Pg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4HznoaE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso32389a12.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 20:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728964681; x=1729569481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9QWKZtDdFz4L73hcRjBFd+xD0iZq8pzY5qOSjjFSZc=;
        b=R4HznoaEDlNPDF6EM7qoHkybgoUZcuH9su7oJQBvY0oqXKrBxJHr/8cCndMM+uLrAh
         8ersWRigFXsZ0/Vi4gpvK9eUrKIDCcNarKZxA/VDQTGxgmh3r3csUFuUJ+LCGKzaGLe4
         8YxjzI7xba9K+TWqNpvkbitMVq6FkGOcX7tihNMsqd0T3zRlOkQbXZReDgAp6kxMoQvQ
         Vj6zA22p/6fymGOR8wINgR9vShNrGpjf9SJCLr8cdyol5/cKtgWWb8L5Pa1/UXG/lrRg
         CZdFbEAh6mmGOg209D8Sab4Ol2RJqj4CeeKZSr9z4x6MT6K9fsxIOTA2vLQpDrukssE+
         AF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728964681; x=1729569481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9QWKZtDdFz4L73hcRjBFd+xD0iZq8pzY5qOSjjFSZc=;
        b=Ug71F5rLS8sC/4tuoXJUrOmAh4XxIdbTe5lkvjnw1vyjT4Q8ZBQGabyMcYdfI9u7Uh
         lJF6VvpYB67Jus63s66NdJPbmr7JmdFqWwEHSVbPo4iGgImwlwSLl963aQMq5ElfHSPX
         8ED24mENei6TuKGxtGxc5JdbAgcOOCBatduCEmoRwTEZnkymqgNeSR1g0EZPdaB4yvGg
         ynSLYXuq+bu9YNjS4ZxeyLE9tSmZrZDLQ+sV8IrAqH2z9s9YCZWU7giu5HcLIfo3RKCU
         Rd30DRJq5z0wKF5T7c3/Z0FIbMCfQXJAN7uFyZ1NbpPZ5zd/uYHkMErTuFbyWJYOdvQo
         S25Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbtnsAylHbBV8bv3X2wuBzn93XBvYNFsOAOaTnNuMig3kag3agxrjBpiDWGS80HEPh9nnEJqwxyoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNfWQiy9YdPOWY2Ilag2ieVB4jUeI/TrDA4vY6kTmluaJ9RT3/
	qhqwJCd8P5JzJJ+ZPKncYHQSUUjr4mt/BVy+jfluP1ZBMEnGL9u4H3r7LULNzZxJYGuxDZmOmpu
	UudldClVAs0qSyDAhAInFPM0y44fgQRk9fLTS
X-Google-Smtp-Source: AGHT+IE/Mbk48UdN6n+R06D0061d9x0T4HYynAxMG9ehl5kqxUTk/rg+uyWs8G1J3z3EpkLDqsneJzTbxqupOe4TGro=
X-Received: by 2002:a05:6402:26c1:b0:5c2:5641:af79 with SMTP id
 4fb4d7f45d1cf-5c95b0bd39amr641707a12.0.1728964680865; Mon, 14 Oct 2024
 20:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
In-Reply-To: <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 15 Oct 2024 11:56:00 +0800
Message-ID: <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, yajun.deng@linux.dev, sumit.garg@linaro.org, 
	kekrby@gmail.com, oneukum@suse.com, dianders@chromium.org, perex@perex.cz, 
	tiwai@suse.com, niko.mauno@vaisala.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, tj@kernel.org, stanley_chang@realtek.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Mon, Oct 14, 2024 at 08:50:29AM +0000, Guan-Yu Lin wrote:
> >
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index e713cf9b3dd2..eb85cbb1a2ff 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t=
 msg)
> >       struct usb_device       *udev =3D to_usb_device(dev);
> >       int r;
> >
> > +     if (msg.event =3D=3D PM_EVENT_SUSPEND && usb_sideband_check(udev)=
) {
> > +             dev_dbg(dev, "device accessed via sideband\n");
> > +             return 0;
> > +     }
>
> I'm not so sure about this.  By returning early, you prevent the drivers
> bound to this device from suspending.  But they can't operate properly
> when the system is in a low-power mode.  Won't that cause problems?
>
> Maybe this really belongs in usb_suspend_device(), and its counterpart
> belongs in usb_resume_device().
>

To my understanding, after the system is suspended, the USB driver
will do nothing as the main processor has been suspended. May I check
what forms of low power mode and operation we are discussing here?

usb_suspend_device() did close the required port/bus to maintain usb
transfer. However, there are additional usb_hcd_flush_endpoint() calls
aside from usb_suspend_device(). Maybe we should consider not doing
those also since some of the endpoints are now handled by the
sideband.

> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index 1ff7d901fede..9876b3940281 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2593,6 +2593,7 @@ struct usb_hcd *__usb_create_hcd(const struct hc_=
driver *driver,
> >       timer_setup(&hcd->rh_timer, rh_timer_func, 0);
> >  #ifdef CONFIG_PM
> >       INIT_WORK(&hcd->wakeup_work, hcd_resume_work);
> > +     refcount_set(&hcd->sb_usage_count, 0);
>
> Did I miss something?  I didn't notice this field in any of the earlier
> patches.  Was it already created by the prerequisite series?  If so, why
> didn't that series do this initialization?
>
> >  #endif
> >
> >       INIT_WORK(&hcd->died_work, hcd_died_work);
> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > index 0b4685aad2d5..d315d066a56b 100644
> > --- a/drivers/usb/core/usb.c
> > +++ b/drivers/usb/core/usb.c
> > @@ -671,6 +671,7 @@ struct usb_device *usb_alloc_dev(struct usb_device =
*parent,
> >       dev->state =3D USB_STATE_ATTACHED;
> >       dev->lpm_disable_count =3D 1;
> >       atomic_set(&dev->urbnum, 0);
> > +     refcount_set(&dev->sb_usage_count, 0);
>
> And doesn't this belong in the 3/5 patch, the one that creates the
> sb_usage_count field?
>
> Alan Stern

Thanks for the suggestion, I'll move this, as well as the
initialization of hcd->sb_usage_count, to corresponding earlier
patches.

Regards,
Guan-Yu

