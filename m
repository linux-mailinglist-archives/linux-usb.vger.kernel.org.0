Return-Path: <linux-usb+bounces-17170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BC9BE12A
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 09:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D551F246BE
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71E61D54D6;
	Wed,  6 Nov 2024 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j1Xm6UDU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755C7FBAC
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882338; cv=none; b=Nn1sNBfcje7Tviih6m6W+0VprlSz/AdYo/1Of23u+9beEEAxIYyRw7vK3JVLh2ovHV2kGwTEiLVKXEOy1sI9JND66Rl1tzrn9ZjKGIAAsn5v2V63b9mMZMDEErpf4Zm5WhIido0jseVNlBw4v0r5K/TFgoO5C6UoHjOiUyw1dLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882338; c=relaxed/simple;
	bh=jJaeBFIHIkLHuZkB2SPfqzxxy4446VpSvpu9ioiwLPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFxt4zpW9+d1LGCzOZGaK2woQIlANy6EkCz/8CEwKlj8dEoVwSaeALiz/DwB2KKmy2TMYJLJZNsmDdbHas6UpZeuqsQ/ZeAXrGyHzcraYuETXth9vy8otlqoJtRxoWWjbvO98E/oZ/KaisZCJ3oalpFDVEi5mlnaUdw3EgA+cvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j1Xm6UDU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so43385e9.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730882335; x=1731487135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmeeFoFOoLxB4yOuzfFJOjj34YSoSigNjNhyLeRpQgk=;
        b=j1Xm6UDUBvrLnRxezOY5Qux7NHcp6k8eHvKPwryMeJofGbUUKZYgr1if4yhXg+9um5
         z1O0ipaYVem5AcAvcsvaavogolqyTe3HaUzH15SvcxJohLz5Zg4rhdXnzJtg67FePmqw
         DAEHuzyJw9jjBgA4CRz0TAQd/1YP/T2XaoLnaUGYFnr2Iqp1aGpd4bU78GAmYoMpPj5J
         hYdp5Bpkdy/nrOLk6bNbImdXdZzN8FpiK5hFx14J5ey0SLberGcLOROZdJKmtV1Jnjf4
         KMvu5f1AaDVimfCeScyySZ6NXA7cMMf4tO8GgCenEmjs1DI9eHeaLWvowdVF/rCSSpyR
         Pc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882335; x=1731487135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmeeFoFOoLxB4yOuzfFJOjj34YSoSigNjNhyLeRpQgk=;
        b=lB7n28bQlJDNKus35Rz44/okgNwwoDeenphB9DoJ96b1lm5D2IMXwfD4AH89n43rsL
         q3GI3aUyyhUUKnDgOcQM99vIqWNkYj+gi59tJFoi7kfsrZ35ZwCK5W99sWHwB9rRFlCa
         G0dgWbsq8+tXBaiqFwZ4q3dcLSdhEaLwHevh5Ysfe5dFjxM/cKEDq5brmAZH7FauLOs+
         KgNX+B9NfFHe2OJhzYjcFXUaoWu/bEJS9sK41y20DFRCBfRRuiVyT/BbMopVK7s+QT3H
         kb3xGGUpHxovxgecIj3u7BxtAe4eE7YzHbGCw5kyEjxamP8eV8ZlioGGlYFl0rpaHR/j
         Dzww==
X-Gm-Message-State: AOJu0Yxyk/Pu/x272ldEjntJkaPKzQm4wWm3DUr5zpdINQ3O39DtCC2V
	JGjYmpdGOfVlM++/VOESSaP4ZeATlLCUpJt5Mp3sJQwzMzbc1FPZgYkC7iFTWSHBTCTb3c4iVka
	6ibEVAQ1q1c0FoIBIKwpnCDbPtFflYgGdzo8c
X-Gm-Gg: ASbGncunCBv1n3s+7tku4q2eTypILzCjmlVH5F3/woDFSKfrhMNK+uNvnmHcXfL5Wwd
	1ZmrrlmkinxXlfVpzRAMkRJrWITa3bqwtMjy7ETk27Snl04Rp7f0B2ep0
X-Google-Smtp-Source: AGHT+IFE7a8/uWdpVs+aeR5w7jYKXAaO8cfGjh6/ezR19M0yoD2tlzYRkDrPLuwTyjT1hVfrKzI5dBNM9Sqa/ASR3RM=
X-Received: by 2002:a05:600c:2188:b0:426:6edd:61a7 with SMTP id
 5b1f17b1804b1-432aa3fdbe5mr756275e9.7.1730882334733; Wed, 06 Nov 2024
 00:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106083501.408074-1-guanyulin@google.com> <20241106083501.408074-6-guanyulin@google.com>
In-Reply-To: <20241106083501.408074-6-guanyulin@google.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 6 Nov 2024 16:38:43 +0800
Message-ID: <CAOuDEK1r+2f-nXBRO-i0NZ7oriM93kyQzgKMpw+ocqgmWBBpoA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] usb: host: enable sideband transfer during system sleep
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@linaro.org, 
	dianders@chromium.org, kekrby@gmail.com, oneukum@suse.com, 
	yajun.deng@linux.dev, niko.mauno@vaisala.com, christophe.jaillet@wanadoo.fr, 
	tj@kernel.org, stanley_chang@realtek.com, andreyknvl@gmail.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 4:35=E2=80=AFPM Guan-Yu Lin <guanyulin@google.com> w=
rote:
>
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index e53cb4c267b3..e5bb26e6c71a 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t m=
sg)
>         struct usb_device       *udev =3D to_usb_device(dev);
>         int r;
>
> +       if (msg.event =3D=3D PM_EVENT_SUSPEND && usb_sideband_check(udev)=
) {
> +               dev_dbg(dev, "device accessed via sideband\n");
> +               return 0;
> +       }
> +
>         unbind_no_pm_drivers_interfaces(udev);
>
>         /* From now on we are sure all drivers support suspend/resume
> @@ -1619,6 +1624,11 @@ int usb_resume(struct device *dev, pm_message_t ms=
g)
>         struct usb_device       *udev =3D to_usb_device(dev);
>         int                     status;
>
> +       if (msg.event =3D=3D PM_EVENT_RESUME && usb_sideband_check(udev))=
 {
> +               dev_dbg(dev, "device accessed via sideband\n");
> +               return 0;
> +       }
> +
>         /* For all calls, take the device back to full power and
>          * tell the PM core in case it was autosuspended previously.
>          * Unbind the interfaces that will need rebinding later,

In v5, Greg points out the race window between checking sideband
activity and handling power management of usb devices. We should
consider a lock mechanism to address the race window. Given that the
design hasn't locked down and the race window might change from time
to time. I'll address this after the discussion of suspending USB
devices/interfaces has converged.

In addition, Alan suggests to only keep USB devices active but suspend
the USB interfaces. However, hub events and key events require active
USB interfaces to function. In the sideband model, the sideband driver
only handles USB transfers on specific endpoints, leaving other
functionalities like connection changes and key events to the Linux
USB kernel drivers. Therefore, a potential design modification is to
shift the sideband model's focus from voting for USB devices to voting
for USB interfaces. This way, the driver could selectively hold
necessary interfaces active during system suspend. This adjustment
accommodates use cases where specific interfaces must remain active to
support overall USB functionality when partial interfaces are
offloaded to a sideband.

