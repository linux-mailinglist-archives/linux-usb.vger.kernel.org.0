Return-Path: <linux-usb+bounces-36091-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN4hMHdg12keNQgAu9opvQ
	(envelope-from <linux-usb+bounces-36091-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:16:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E813C79E8
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00C61308357D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 08:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3747D396B6F;
	Thu,  9 Apr 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="ph39ttqx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A0138D00C
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722369; cv=pass; b=CuIHyylBe+2M1dcSqvHzuiRgRfCm4eD6AwPgHITdx81PJ+JCbueYeOqLq6bg42XfgogPiaETAT/3Jk6HP3jxvxZq5LSl2s7OUlAZOaTxcpUqJM00kVyAizWErX6mSMGMzpm+UhwVUWydjVr3DkBhWlkPrvmKHvQWQsxJh1O/RAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722369; c=relaxed/simple;
	bh=zoxUDL/qAxsCJiz4aFeQJrqOxFYUx9bQNxNKoGNuXFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2IxenrChmpYy+5Aj7722WFsKH2yo2oD1+4L/lYGov/NEdP08kvsu9XcJfaAJTa75iyZ8NYieEHGCubnWNPUifZ0p5H48UCZ/Qr/G43+63MofJI+EqlvyWZwzmbK4LtXmTbt0XVmd8S6y0ej4KPZKwiyC90vacJV4jJDiRf0CoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=ph39ttqx; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6505ef94043so623046d50.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 01:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722367; cv=none;
        d=google.com; s=arc-20240605;
        b=VuQTJ/TkWqiljVqyZKln6FahaEsc7lThv7bdgeVJvlyF9e2pBs70STJ67Ddi0iuLIP
         S9rFGRZnLCiOsP3Luz4+MnBwRG6U1F8srzivHfWZ9CbKQHqJcJBPAxgcT1fczoiCaAJU
         6zvmrGYjk80hdONDqurfH+ykKVS6HuLhqJ9xT2J1Ya1TufcwKrgiDzP4MGb08pqv7tc9
         aj4u0EJ/qD3rwfWjWsXm7uQZW5hGEEtelVGJKWG90hSF778g26jgwqYRseLnajLTk8qx
         1FamZHV2ReYtjO47Eou0de9Tm0krEua7jaljdtOQC42hkchbAhBLTU/90LqCYekLKeeS
         Ac2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        fh=ZdBL4bQl515HYf18bzzxAv39+kiyI9dOo77238msALc=;
        b=BSzxrPsh9Wbuo9TbUfiAJBscqc0CnvBJuHQBXBKfFP1R3cj90jQh4nXtlQVsy44oAH
         yGfjv5sQoBcRyBvkE01OQ22OdYYJxsY/dIcFE9GP3ZMBoD2/seRBN4Audgo/SEQdNnTN
         efkz4Ea4AXQbVeow+k1xSDhHZRmeeW5zRl39HN2I1Ch2RrvMYYRC0fhxmDsi5wqkSgIB
         SrUnUZu3o65rAgzB5k8v0dxm9BzZCX50jWzWH8wzc1KMeNhyFahP1HVB94toYKF+RBtE
         F0g2IIZW6lmr9ZjL27TnhB1Jz4Uvbb39gSuAAaNWx8jV0hj8gsTt1G5NbfeRE+/04Jgz
         h4kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722367; x=1776327167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        b=ph39ttqxeXcTgTAjjkB6S3Y9NMoCDvBKIVrURAV7IIzr0Ub21hCvpv2SH2+4E5B1u+
         xZJ17Z/gOsl260sjX2HLstNbpmjDmC0tau2GWUBaEsjSW7qDMp/LfD3yKK7Ln8i6TLsg
         pwWc4m2yymNc7pKgcFe9KHp1Y23WEnMtaOMAW8ioeRq4YPVI/WGmLWbgYEuVEHYilYo9
         DCrhKR9iokOvlGVQJ3V0nEurQv3xaJVxdOAhOlpx0Ri1QF4Gv5mCXkQgnA2AuknE2qQl
         spHTvrhVwmVEo9QudBGf35YVVLglobJ7+wViKKKK6tu1zoXN9aBsdEaaycTnfqPulCPC
         ZKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722367; x=1776327167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        b=cFxV0cEZoTqxUzHC2EMdK6XiA9XkMQo2JH/xIDDhCemZRFqbE+aoEJl6AmOieArXPQ
         3gk5sA55Uj9/r/ZecHoVa9WLSEouxyrjesGrVGUmLAHcJajHaO9SyLx/ItQjFXW7y2pT
         dbjBpeXlvs54shZg2fUugxYtDgYZdm/sL7ZnrTfBl0+4Y8Sz7jl2T/TZ5c1kP7/+gV/H
         lW8FpjqpLGh9MtcGDBzaZX01bif0bxOrdNSXHQ8eD1f1v3y/H3UH3LvXjMAso/hOvVVT
         a2QOqAQU+rWXHkvQ92uIy2PzjgF/y7I/1bs8s03Tp1QIjFN/zgiNHxxJ3tPmuafNKFru
         liHw==
X-Forwarded-Encrypted: i=1; AJvYcCXvcC+4pwWcx/M/biPlXaq+wuhDPUbLDxUKh0lk/EI4Ky/oJlqMCnCcRnifrEQ+8yXYWESG2siogkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzr+e5jaWkCe0bm15m71vsdqni17DyqDn91s7OiD9quHjpD8x
	EO2GR3tjR/sSFw7GCScaHfQ2U9ZDeA8uy6ZODMY4oprZQGHxqwt56XXyZKSmXraaGRUCGso/V1R
	aLLDJ82Ea5Akbr9qPfpTRnycvCPYHESuyIDQTam1K8iKxvRitNBvZSw==
X-Gm-Gg: AeBDiet2w2fAMyhxYQdQVzU40EMA54OsoizMqphqc6kKaZW1rAYQeoMYdmOPtaqow2/
	PDeK0VdNO5U7xQBaZEQZbA7ElQ7rN6rj3kRlArtdtsDYNPkhxxDPIEEtcYLuENhlpGsnfwgTzDk
	6yHzoS4xQaNFXXdTznrRQNkvQkD1VpIJ0KuALvokxC5wM80NCY5KTMtDogbyEbXzDs9HQsACEHS
	sqZPgX+FhwJIyLhQM6g1kDEzWzaKiuglP/+xYgYJrUewj3x2M5+ZXiq369eEDf1n+LWFLzePzj2
	wmcp
X-Received: by 2002:a05:690e:440d:b0:650:12eb:16db with SMTP id
 956f58d0204a3-6504887cb9bmr15515722d50.50.1775722367308; Thu, 09 Apr 2026
 01:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-2-jp@jphein.com> <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
In-Reply-To: <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:12:35 -0700
X-Gm-Features: AQROBzCwzQ7ycElepf9PBapl3c7uBo9xilIRFgRQoulJ62oC_O-o8mkGeVIs1f0
Message-ID: <CAD5VvzDx3GeNndtAOZjaZYntEh2-+08KP2OT0Sq3rd4u243BFg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile USB firmware
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36091-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: 15E813C79E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Agreed -- the error-code query goes through __uvc_query_ctrl() now,
so it gets the 50ms throttle automatically. Dropped in v7.

Thanks,
JP



On Thu, Apr 9, 2026 at 12:57=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
> >
> > Some UVC devices have firmware that locks up under sustained rapid
> > USB control transfers, crashing the xHCI host controller and taking
> > all USB devices on the bus with it.
> >
> > The Razer Kiyo Pro (1532:0e05) is the first known example: approximatel=
y
> > 25 rapid consecutive control transfers cause the firmware to stall an
> > endpoint. The kernel's standard UVC error recovery (GET_CUR on
> > UVC_VC_REQUEST_ERROR_CODE_CONTROL) then sends a second transfer to the
> > already-stalling device, amplifying the failure into complete firmware
> > lockup and xHCI controller death.
> >
> > Add UVC_QUIRK_CTRL_THROTTLE which:
> >   - Rate-limits all USB control transfers to 50ms intervals in
> >     __uvc_query_ctrl(), the lowest-level UVC control transfer function,
> >     ensuring all callers are throttled including uvc_set_video_ctrl()
> >     which bypasses uvc_query_ctrl()
> >   - Skips the error-code query after EPIPE to avoid amplifying stalls
> >
> > The 50ms interval was determined experimentally: the device is stable
> > at this rate under sustained operation, while shorter intervals
> > eventually trigger the firmware bug.
> >
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 30 ++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  |  3 +++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index a5013a7..cee93ac 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -36,6 +36,26 @@ static int __uvc_query_ctrl(struct uvc_device *dev, =
u8 query, u8 unit,
> >         u8 type =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE;
> >         unsigned int pipe;
> >
> > +       /*
> > +        * Rate-limit control transfers for devices with fragile firmwa=
re.
> > +        * The Razer Kiyo Pro locks up under sustained rapid control
> > +        * transfers (hundreds without delay), crashing the xHCI contro=
ller.
> > +        * Throttle in this low-level function to cover all callers,
> > +        * including uvc_set_video_ctrl() which bypasses uvc_query_ctrl=
().
> > +        */
> > +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE) {
> > +               unsigned long min_interval =3D msecs_to_jiffies(50);
> > +
> > +               if (dev->last_ctrl_jiffies &&
> > +                   time_before(jiffies,
> > +                               dev->last_ctrl_jiffies + min_interval))=
 {
> > +                       unsigned long wait =3D dev->last_ctrl_jiffies +
> > +                                            min_interval - jiffies;
> > +                       msleep(jiffies_to_msecs(wait));
> > +               }
> > +               dev->last_ctrl_jiffies =3D jiffies;
> > +       }
> > +
> >         pipe =3D (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
> >                               : usb_sndctrlpipe(dev->udev, 0);
> >         type |=3D (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
> > @@ -108,6 +128,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 quer=
y, u8 unit,
> >                 return ret < 0 ? ret : -EPIPE;
> >         }
> >
> > +       /*
> > +        * Skip the error code query for devices that crash under load.
> > +        * The standard error-code query (GET_CUR on
> > +        * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transf=
er to
> > +        * a device that is already stalling, which can amplify the fai=
lure
> > +        * into a full firmware lockup and xHCI controller death.
> > +        */
> > +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
> > +               return -EPIPE;
>
> I do not believe this is needed anymore now that the check is in the
> inner funcion
>
> > +
> >         /* Reuse data[0] to request the error code. */
> >         tmp =3D *(u8 *)data;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 757254f..31f2af5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -78,6 +78,7 @@
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
> >  #define UVC_QUIRK_MSXU_META            0x00040000
> > +#define UVC_QUIRK_CTRL_THROTTLE                0x00080000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> > @@ -583,6 +584,8 @@ struct uvc_device {
> >         struct usb_interface *intf;
> >         unsigned long warnings;
> >         u32 quirks;
> > +       /* UVC control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
> > +       unsigned long last_ctrl_jiffies;
> >         int intfnum;
> >         char name[32];
> >
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda

