Return-Path: <linux-usb+bounces-34696-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oByPDr72smmLRAAAu9opvQ
	(envelope-from <linux-usb+bounces-34696-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:24:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C927686F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E26073026DA1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A5E3F7AA6;
	Thu, 12 Mar 2026 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FH2nfdSy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F03539BFF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336243; cv=pass; b=FKGjRmRXERyO2TPQTIbBZQw/3K2h3X604zwp98JdYO1dDm1ygltaR6L3nusd/eEvy2GYnmFqwOmjnUXxeD58Tfc52FXWC9YwPcqluPk9bdFPo///rt/2Jd3uveypL7qlr1Jn2+5zemt/ZpDA2LnYRIWCAZfiCZu5Hg20Zw6McIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336243; c=relaxed/simple;
	bh=cs9NydnZlUj2ytjzvPGe3kpN6J9plhpBN0pmEXhJkR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoDU+tsoNSIZojzkK0Fy15vqIYoXFKOFunpYSWqQPtfO6MWTzKXSpXU9Q8g9rwfjrDtJq3rAJ2V4ry8qHtrp9wFyRhu3Yg60hx2YE2dU2REds8EgoKaJQBqNRDBjRoSoFq4tDBmXMD9sKrVIQ2SYtbiwuxe+vK5GWPTp18jyps8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FH2nfdSy; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50906a98ffeso35311cf.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 10:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773336241; cv=none;
        d=google.com; s=arc-20240605;
        b=PeCVe/TnmncYNb4fDhECttqoHgC9FequG/efnfi7SvKo8bgoqZ8DQQPHZlZKFCY1Uh
         2VxMqtZq49z191Yl6Ubcc695QHDdraHQ7q5YG4hl48MQ0Y7CCIONDkTc336x0Mr5MMhZ
         YA25/SzSIRAAu26njeqyznqRjUuedWkUNpWueo3LYWSScKbk0Uret9SVSnXXQIYfAtcb
         1xH1dXTJOjzTK1Vb+VA3+/sv8+4GPkVJ7CmmqcDQ/bzoGjzg+v4HivLo6dWxC3nLfY4t
         nn7EoleU5JUhCXuET5Y9PSG8gNQTy51ftp/p3suBEdl09pmaurwyv55t8KIGyvJ3NAeS
         6o0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        fh=IwmR9vW/jOSq4DgjJyzIU/OVaCaGcC1WYTCZZJcE0Pg=;
        b=D24HKOacapEqBV+EZu9SZTKHZUVrYNVBa5I9y7GJIQy4h7cQm2M7baXUP1zzQcoQui
         QPzNJtzf+N5f8byfQTxCejATfII92MNEZrXNP78EnZxsGRJIzrsjUDCy1oyoz3vPRhJv
         vD9c4s1j6moCRgeltbbnkrzmoD8b9+SXZ8xN8BClBgKydxq8joRBmfoSnNZqPyG9E1ie
         mb+vVy+PF7JfCoN9oRZcHuBiFcfN8ETdWVaHem8osLjPT7yiyOrpCTA3WS21eQo/rlri
         6KpJqRJAnxeFwj5daRG9rIkyzRyOu3uDkoeTgzU2Hvkld04mdHFJA/B+j/eT29Au0noH
         hUCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773336241; x=1773941041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        b=FH2nfdSyarhBgZpBIcrAgIjZPxkpFYnowuFIBR2Vo/ZXdwrtgktBIYSOvOPdgfyXPM
         4zk+RWK0I/4s/m4hCtD5K+s4XSzM0ZYKGOfrLSj30JYlgQhUuYI+szwNZymUXpRLgS3i
         oPsspWJuSMdF2186ypaj/kzEbabt9Rva7iyV+9m9ZwdUEIH7ecZyOkXP0a1LYU8E19HH
         YxzzuQJJ+ma3fRIOJCHWcXi/hD+IC/jvSw8OUB6iQULlr7PfRHKhNqFRA7ft7K8VF/4t
         rxeHd98Bi3H0IuZncj3EVYx4zzG+XSmGTRpZrbJLUiR6IWncGymTFkvdJMsN31oz+KxN
         dr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336241; x=1773941041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=drMga890hBoz1tXxKNjKqbtUxogSlXx8qnX/9lqYuDg=;
        b=oVsR9wc6qGVKSssXpcBQcymmupBfdQyf6JninormPgZNuGOb0f1apaPrPXup7l9yOu
         5Js8eznm4frknlm1uvnZmAXeeGMKcFA4B3gD0ish4ew9IqZNoS1lyr+EZQOD76bJM37/
         +Y5yMXpkmobhi34R6Hygi2+IPSs/HfOM+/7D6Rs4eOk/IAALLu+E4dne5+AEtowPmxNP
         l7giy6vQ+t2CUWEAEYWUJnQCDENZ6CB47DDtVD7zazyKSFJpp4aBRMBHBeOvBsRQjkoh
         tG/czvzUwD/2E+XVBh+3lJCLV1sWi3E4TwZUYl/TWj7kN+QQh1qJd1RSF4ixSbkMspCL
         KKDw==
X-Forwarded-Encrypted: i=1; AJvYcCUc8QKzrkI051TM5RgyfGgH3FZ6wLiPTHCruXddgBoBQa8yrTurJejB7qh6s6ktNpqdP0v/v2OEGeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33z2N5y+eHrqA0yfz+YH9OhTXE1speeWe+ryBSzN98s3+ujKQ
	N0w23kj3EK94HbfnDQYU8O62YqG0uabVp/T5FFaHb1qtUcfcb0+/ss9rB2BJGd5XYunkJ1mNUuc
	5T/SxIyQxLBEdnZJWAMzisA7JoxbTxSUeels6BH7N
X-Gm-Gg: ATEYQzxr/c00fmtyCpLWtMjGV9lCUx8PQFKsNgNY5FOuwdRgrP3shAvknR/6Q5Szy4T
	ygjOMaHHyc4ZB3pTuH1vZ+AgjivV33IYsS5M4axsu7LNL/J7I2QvEs2IrVBtHssj8Pt4pboxzxo
	RhexJzx9/d/UPrAdeoWSR/fKaqGvy7QL+QwYrjL5MbFHgzzOtpftZeeCpI2XnkMQWbMlU9rgnIH
	rF50nWimkIN0otJdpFa7TTHUnuvzJPym/trC42s3d+H7kogk3qFVRt0vSBpFUDSItbTv6sGvEqB
	OC5i481p
X-Received: by 2002:a05:622a:354:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-509585b04d0mr230561cf.1.1773336240812; Thu, 12 Mar 2026
 10:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-2-guanyulin@google.com>
 <2026031134-uncover-siamese-cdf9@gregkh>
In-Reply-To: <2026031134-uncover-siamese-cdf9@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 12 Mar 2026 10:23:48 -0700
X-Gm-Features: AaiRm506FY_oJhi6wIWrihwWospchNxvGjcFGure-VJM-x4nJE6EzoeYpJH_Y7A
Message-ID: <CAOuDEK2jBncFtBFmn0h6fg519ErDC1tvLjpsUua2iWean9h4RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in offload.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org, Hailong Liu <hailong.liu@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34696-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn,oss.qualcomm.com,vger.kernel.org,oppo.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3C9C927686F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 5:26=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Mar 09, 2026 at 02:22:04AM +0000, Guan-Yu Lin wrote:
> > Update usb_offload_get() and usb_offload_put() to require that the
> > caller holds the USB device lock. Remove the internal call to
> > usb_lock_device() and add device_lock_assert() to ensure synchronizatio=
n
> > is handled by the caller. These functions continue to manage the
> > device's power state via autoresume/autosuspend and update the
> > offload_usage counter.
> >
> > Additionally, decouple the xHCI sideband interrupter lifecycle from the
> > offload usage counter by removing the calls to usb_offload_get() and
> > usb_offload_put() from the interrupter creation and removal paths. This
> > allows interrupters to be managed independently of the device's offload
> > activity status.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ef82a4803aab ("xhci: sideband: add api to trace sideband usage")
> > Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> > Tested-by: Hailong Liu <hailong.liu@oppo.com>
> > ---
> >  drivers/usb/core/offload.c       | 34 +++++++++++---------------------
> >  drivers/usb/host/xhci-sideband.c | 14 +------------
> >  2 files changed, 13 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/usb/core/offload.c b/drivers/usb/core/offload.c
> > index 7c699f1b8d2b..e13a4c21d61b 100644
> > --- a/drivers/usb/core/offload.c
> > +++ b/drivers/usb/core/offload.c
> > @@ -20,6 +20,7 @@
> >   * enabled on this usb_device; that is, another entity is actively han=
dling USB
> >   * transfers. This information allows the USB driver to adjust its pow=
er
> >   * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
>
> Ok, but:
>
> >   *
> >   * Return: 0 on success. A negative error code otherwise.
> >   */
> > @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
>
> Why are you not using the __must_hold() definition here?
>

Thanks for the suggestion, __must_hold() will be added in the next version.

> >  {
> >       int ret;
> >
> > -     usb_lock_device(udev);
> > -     if (udev->state =3D=3D USB_STATE_NOTATTACHED) {
> > -             usb_unlock_device(udev);
> > +     device_lock_assert(&udev->dev);
>
> That's going to splat at runtime, not compile time, which is when you
> really want to check for this, right?
>
> And I thought all of the locking was messy before, and you cleaned it up
> to be nicer here, why go back to the "old" way?  Having a caller be
> forced to have a lock held is ripe for problems...
>

The challenge is that the USB stack automatically holds the lock
during the hardware/software USB connection change. But USB locks are
not held when we create/remove xhci sideband interrupters. Hence, we
need to manipulate the locks by ourselves to distinguish between these
2 usecases. What's your suggestion on this sceneario? Do you have
other options in mind?

> You also are not changing any callers to usb_offload_get() in this
> patch, so does this leave the kernel tree in a broken state?  If not,
> why not?  If so, that's not ok :(
>

The current upstream implementation triggers deadlocks in some cases.
This patch simply disassociates the offload counter manipulation from
sideband interrupt creation to address the deadlock. After applying
the patch, the offload counter won't update until the next patch in
this series is applied. Is this considered a broken state? Should I
squash the two commits into one, or keep them as they were?

>
> > +
> > +     if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> >               return -ENODEV;
> > -     }
> >
> >       if (udev->state =3D=3D USB_STATE_SUSPENDED ||
> > -                udev->offload_at_suspend) {
> > -             usb_unlock_device(udev);
> > +         udev->offload_at_suspend)
>
> Can't that really all be on one line?
>

Sure, Let me change it to one line.

> >               return -EBUSY;
> > -     }
> >
> >       /*
> >        * offload_usage could only be modified when the device is active=
, since
> >        * it will alter the suspend flow of the device.
> >        */
> >       ret =3D usb_autoresume_device(udev);
> > -     if (ret < 0) {
> > -             usb_unlock_device(udev);
> > +     if (ret < 0)
> >               return ret;
> > -     }
> >
> >       udev->offload_usage++;
> >       usb_autosuspend_device(udev);
> > -     usb_unlock_device(udev);
> >
> >       return ret;
> >  }
> > @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
> >   * The inverse operation of usb_offload_get, which drops the offload_u=
sage of
> >   * a USB device. This information allows the USB driver to adjust its =
power
> >   * management policy based on offload activity.
> > + * The caller must hold @udev's device lock.
> >   *
> >   * Return: 0 on success. A negative error code otherwise.
> >   */
> > @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
>
> Again, use __must_hold() here, to catch build time issues.
>
> And again, I don't see any code changes to reflect this new requirement
> :(
>
> thanks,
>
> greg k-h

Thanks for the suggestion, The __must_hold() macro will be adaped in
the next version.

Regards,
Guan-Yu

