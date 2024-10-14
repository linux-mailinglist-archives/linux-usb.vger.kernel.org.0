Return-Path: <linux-usb+bounces-16189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52099D441
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 18:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE63F288675
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 16:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEB01AD3E5;
	Mon, 14 Oct 2024 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ji55lI6M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378B4B5AE
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922064; cv=none; b=OqmV9e+uUEXUagpInSqu6+k81B2Hx1Jx9QVfo4JXS4Q02wWVN9EsIoDVYJ1HWkTdRQ7m6fRbYRgz2TbBV71n5nTQFbaUlY7z9/zyxwNCITBmiVpygSh3Sggc3R8I1gKr14TuVCrXP87FuCvv1aHsu1cz4RmxkSXeQjHSQdO4wuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922064; c=relaxed/simple;
	bh=BYifE8JxyBKOLbFALDqoWHDRg0K+ay2tqOMQErURcE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9/WcZjSFCTT6jqm+wO44lEkoktN4U0xY7Iw3EF71GL5+CiLsuETlk3TO2a5gsYSG28RLowV+2S8uVvlkDPXVci+5fV7J4nUj8IWJci+qm1Gj1cEdSnh6eWsh25K7czdA++xSZTdJ6VZWsDR7TeTnfz35lv7yYztOd/KpBzZda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ji55lI6M; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e66ba398so26098e87.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728922061; x=1729526861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXl9x5b/7ZXtmscq03EV87+XcyavrL+O9z+zSTKy7kc=;
        b=ji55lI6MGmCPekou4LMTLJH4HdfKdQxXO2nXxlxoGCWEdt5YmFiZt0m0Q/pzvnHLEl
         pSxcvTbk4l++iTfJrTsC0Io7F1QO1F6cci/BtSadJwJmxbHsfmoZp86zSR29OUEoFCW8
         aiCjXsJDdl6tDTIOIEGq3Acgp6p6wqPgRZuGwxV47yyue1ZuA7quFWAl20kKJd06A7Ea
         XaQwyfDUtPEZG0tzpT6WagHvuPCUvxgA8DqJxnu6tGG56vK0JaSWJvh9BetZqBY6PxYv
         zHkSWAQU5jKtqKKYHmZvUJGzLN8k1XYnc64Ya7/wFl63Wq8V+Hzqnfc8hG1v9TxgwJYI
         bo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728922061; x=1729526861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXl9x5b/7ZXtmscq03EV87+XcyavrL+O9z+zSTKy7kc=;
        b=AMiuPSS4RodC8eol3Tq/ySUNnMA4kmuxzfFpyzqq/ZrhBREQxP/bqidFmj+y4pS9kl
         4/E3p8xHVnOSynMt+061/fd0xwwJiFJl0mR9LxGhSBLCTKw9BliB0ER11JVjA2VfdmEQ
         2mua463SL/q5Pjww+JCFo6Xbc3ZrIIg7oEe8JStpeCqsaZA4gwtYOD5SF9asfKuuLbVp
         3sUKvDzZvh1YWLT1FtLOeuSvfKEomgq+4AahSQW45IzgZOhEEPfvywVLbBdR7VRvy2Sp
         9fdRFF0G6BE99m0k1xBUpp35AlmoJXhoKpN5ylfpx3zUYP4cvY7NAsx83uc/d8QzqH0B
         4Qjg==
X-Forwarded-Encrypted: i=1; AJvYcCUNpE3yWwD+NTFFoL/dPlY2yu/5a5xHnsKGU+0CpvaC7LV3VOPWTNQafEvQFSg6ZIe+nOuSUcbEAVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEzQaNzxXYZgrJhu+vYXPfi6/LFmyx1JvtLVHkQKBG/p8arYy
	EfFHm/ART2GoilFz8bHaA+/jsQCHSsElNm3io7XbmopJtSgbfuJXqKWLDt2MEwGqNlUYbPb1FSL
	IAZHCXgsXIRiY+Z8UEn1gc0EgaHhIKK8yK4tG
X-Google-Smtp-Source: AGHT+IETrIb2tXEaskj0LH6fOnIOJNS13d8yGZkVyD5egGgmUOFTb/LjhL4fGTAsi+y+f8AwqLFnUqbFdlYRU+wJeK4=
X-Received: by 2002:a05:6512:6c4:b0:539:e436:f1d1 with SMTP id
 2adb3069b0e04-539e68826a1mr511516e87.1.1728922061155; Mon, 14 Oct 2024
 09:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <2024101432-dollar-untrue-d366@gregkh>
In-Reply-To: <2024101432-dollar-untrue-d366@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 15 Oct 2024 00:06:00 +0800
Message-ID: <CAOuDEK0YqPbHc=X5Y=HG73LhpU-0JPmLjY6XJCJSnGgnB4JiyA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system sleep
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, yajun.deng@linux.dev, sumit.garg@linaro.org, 
	kekrby@gmail.com, oneukum@suse.com, dianders@chromium.org, perex@perex.cz, 
	tiwai@suse.com, niko.mauno@vaisala.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, tj@kernel.org, stanley_chang@realtek.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 5:21=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
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
> What prevents the check from changing state right after you call this?
>

Maybe we should hold a lock before doing the check, and release the
lock after the entire system suspend period to ensure no sideband will
access the USB device after it has been suspended. However, I'm not
very confident about holding a lock over the entire suspend period.
Should we do so or use a boolean flag instead? I'm not sure if holding
a lock will prevent the system from entering low-power state or not.

> > +
> >       unbind_no_pm_drivers_interfaces(udev);
> >
> >       /* From now on we are sure all drivers support suspend/resume
> > @@ -1619,6 +1624,11 @@ int usb_resume(struct device *dev, pm_message_t =
msg)
> >       struct usb_device       *udev =3D to_usb_device(dev);
> >       int                     status;
> >
> > +     if (msg.event =3D=3D PM_EVENT_RESUME && usb_sideband_check(udev))=
 {
> > +             dev_dbg(dev, "device accessed via sideband\n");
> > +             return 0;
> > +     }
>
> Same here, what's keeping the state from changing?
>
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 2fdafbcbe44c..18c743ce5ac5 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2550,8 +2550,15 @@ static int dwc3_runtime_idle(struct device *dev)
> >  static int dwc3_suspend(struct device *dev)
> >  {
> >       struct dwc3     *dwc =3D dev_get_drvdata(dev);
> > +     struct platform_device *xhci =3D dwc->xhci;
> >       int             ret;
> >
> > +     if (xhci && xhci_sideband_check(xhci->dev.driver_data)) {
>
> What could go wrong with poking into a random device structure's private
> data that you don't know the type of?  :(
>

We did observe that the driver_data was set to struct usb_hcd in the
"platform:xhci-hcd" module, which was the default linux xhci host
controller platform glue driver. Should we rewrite as "struct usb_hcd
*hcd =3D dev_get_drvdata(dev);" and then operate with hcd? Or even with
this kind of statement the idea is still unacceptable?



> > +             dev_dbg(dev, "device accessed via sideband\n");
> > +             return 0;
>
> I predict, that if this all does get implemented, we're going to have a
> lot of confusion of "why will my devices not go into suspend?"
> questions, right?
>

This feature should not influence anyone not using xhci sideband
framework. For those who use xhci sideband framework, the current
design seems to not support USB transfer during system suspend. I
think the goal for this patch is to enable system suspend while
holding necessary devices active to enable USB transfer via sideband,
and suspend all devices if we don't have USB transfers on it. The USB
devices are active only when there are USB transfers happening on it.
Based on this, I think users will have less concern on why the USB
devices are still active.

> How does userspace know if a device is controlled by a sideband path or
> not?  Is there some sysfs link somewhere, and does any tool show it
> anyway?
>
> thanks,
>
> greg k-h

I don't recall there's a mechanism to show sideband activity to
userspace. Is this need solely related to enabling USB transfer via
sideband during system suspend? Or is it related to generic sideband
functionality? If the latter is the case, maybe we should propose a
patch in series "Introduce QC USB SND audio offloading support" to
support this mechanism.

Regards,
Guan-Yu

