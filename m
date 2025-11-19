Return-Path: <linux-usb+bounces-30750-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E47C71391
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 23:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 5D3FD2976E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 22:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8597D30B53F;
	Wed, 19 Nov 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uk9k8Cik"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9D4CB5B
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763590205; cv=none; b=mSV5cRjeqOBglU945zhYsT2oivfgB0zO+YcWvJzeeBhCV00M+Ys6aSMVB2uI6gXeeJStqPnbJlgvauron372YTbgKSmlLaTytKl2BY6Fg58fOcebSTz24EEQzSI2WAlzmdofRZ+elAYeklIN6t3ooqb/9fc3vS8Z5KyyuYA3L0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763590205; c=relaxed/simple;
	bh=mcFfVE057zIZBUkpMJV51i3s++9WCB2V3lpwWA8SDOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORTBQirCQmtQo9++PphzQRpv1vPgeEkoO2ZGl/G92uluf83mSUkqnRT52V7Axo4ptsV6tJoHTpjCJW5GdkKiEuZnQzauEIq7bWM4FEniiil7cPSvzeeyNZ3TBXnx6w9Dj6PgZV9TBUHBWpWMZooFZOPNF7SKOUTqwJr15WAWBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uk9k8Cik; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59447ca49afso225848e87.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763590201; x=1764195001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L8urkfLCwfQfy0bbN91cMP+HPc/CQewamX66N3nMm0c=;
        b=Uk9k8CikXj0xop0MdrzKZPdV41YhUn+Mxsxm/YId14BLBrs2+PbScu6QAviB98Bt2u
         v/ZCbk1mO/Xd2eKl7HOj95dnQWPRxl8I1jgwPmkXwtiOIngX/y43q01BOUEy0tWNT8jB
         Jn+Xyj0s6WsFtd9wF1sRP5AhfrvzN1pmZ3d0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763590201; x=1764195001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8urkfLCwfQfy0bbN91cMP+HPc/CQewamX66N3nMm0c=;
        b=jsFU1J4xJxHIGM7X+Bx+TRdqRTJPPOn16TreW38FKz4MeviXU4leA2zosNRbjuflSP
         tEB4mMXNJKMQnk5VPsELEy2N9AqmNgEbSyN1XAhd7ymH2lspwrHjsiO9gbuE2TJfDqnt
         DnhQK3iyRvMmUvm58MU2GL810umguQlNqP9oABn03tU4ErHjJP2z2k/18cLJZ/NPKWF7
         rXcMkKUcm0S+ha3HUM14LnBJf74XhSsR7YP1pcShyhP3RfpHyosJFj5R0JQUTRxvgByf
         qMTKGKZHfb6uX+/aRFHIA4fJ9OnmG/qVyT5wyYC14TyjYlxAnOc3ekXaUNJu/K32N76B
         8sDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcpSQQIAEZ3FebVLlAbauEQyKW4It88R8jCyW0h5mg4o0h8tcYS698klJQlXMkD2YDUNC56joONIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYNsf8ScrcBI58WXA4SZUbT8KRagqjUfKt8B8a7sum4Oca24G
	66HpnMwj/tDgKYIMiPm73X4TU2TINMb9PB+Ef9cjeUEXNOif3AhrL6r8/tOnHJRBa/oDb3ZNNv9
	6B7QneA==
X-Gm-Gg: ASbGncuG5PEwUhwWljfSGRfycyLdAVhVyYYgBRxEl5gtGEBdvUjbWRgZwciSd7H0hmM
	dy9WnUVPbPeDiS2M92amWDGSfWMoc/Jb/ajhxrB7ILTFoTva0mOb2jOQ8Cka0ITwxoKJG7hbLdi
	Zs9SdqUInmfWTKOu5eyg2zUnBiuy93bH5lq0dYaltE3E8q28RVkhaFbjA0q+tu5SVQvB/ZGSyD2
	r3OPOmhg5KRKwxAzMRKEhBDI7FzpgAzdO/dAkdyFoKmRqWYbFJz8Q17gJSmsra1rlLdASqnDNqN
	pxAGSSokkEM1c3wfbWJnpPlbaVGebGz5aKVXVLN7MIPdUk30zX212e+2duw+9Kat8ITsQkA4usI
	ypKOBHlOqr6XJ0R6y4AFmjtg51t9qT5bcFk6SLLcn++426l4Nom4MqgNOKBsd2UXnuvi2XBGQhE
	oSayyCo3GXAv1kbIr+G/wLDey4jiTOiQSX1adCpNqSWH603AAg
X-Google-Smtp-Source: AGHT+IF8vy1FtTTbrt3yRtYRAgR0zLyimUexMj8290rAt0HJg6IIQiiuOkObC1Z5qEHudmoKSQNEIA==
X-Received: by 2002:a05:6512:3192:b0:594:4ebf:e6df with SMTP id 2adb3069b0e04-5969e2da864mr158461e87.15.1763590200870;
        Wed, 19 Nov 2025 14:10:00 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5970sm146808e87.76.2025.11.19.14.10.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 14:10:00 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59447ca49afso225823e87.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:10:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTzmEJRuYdh5QbvIW11VAEXY1/3yvQZGeONaVfsuXPyNCbarnR2IisCTaZC2Vf7GS10Fv/1aazR/g=@vger.kernel.org
X-Received: by 2002:a05:6512:33cc:b0:595:9dbc:2ed7 with SMTP id
 2adb3069b0e04-5969e320d2emr161355e87.43.1763590199881; Wed, 19 Nov 2025
 14:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org> <c42795b2ea0ddd9af13380acff8212841f81d48f.camel@irl.hu>
In-Reply-To: <c42795b2ea0ddd9af13380acff8212841f81d48f.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 23:09:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCtyMvbSMod3afjwR0aP+ZaG2tLugLTiC5q8tQyHL1k9pw@mail.gmail.com>
X-Gm-Features: AWmQ_bk8ViQMOGSoa7xeoiHzcTix9I9pB6xN4wR2eEfHaZKAUuE1XNfLGS6AUL8
Message-ID: <CANiDSCtyMvbSMod3afjwR0aP+ZaG2tLugLTiC5q8tQyHL1k9pw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Introduce allow_privacy_override param
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

Thanks for the review (and the discussion :) )

On Wed, 19 Nov 2025 at 22:54, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Wed, 2025-11-19 at 19:37 +0000, Ricardo Ribalda wrote:
> > Some camera modules have XU controls that can configure the behaviour of
> > the privacy LED.
> >
> > Block mapping of those controls, unless the module is configured with
> > a new parameter: allow_privacy_override.
> >
> > This is just an interim solution. Based on the users feedback, we will
> > either put the privacy controls behind a CONFIG option, or completely
> > block them.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  include/linux/usb/uvc.h            |  4 ++++
> >  5 files changed, 71 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 57ce486f22bbc404a1f127539eb2d12373431631..d9cbb942f798dc7138608982a5d3e3ef9f8141f6 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2951,6 +2951,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >       return ret;
> >  }
> >
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> > +{
> > +     /*
> > +      * This list is not exhaustive, it is a best effort to block access to
> > +      * non documented controls that can affect user's privacy.
> > +      */
> > +     struct privacy_control {
> > +             u8 entity[16];
> > +             u8 selector;
> > +     } privacy_control[] = {
> > +             {
> > +                     .entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
> > +                     .selector = 1,
> > +             },
> > +             {
> > +                     .entity = UVC_GUID_LOGITECH_PERIPHERAL,
> > +                     .selector = 9,
> > +             },
> > +     };
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
> > +             if (!memcmp(entity, privacy_control[i].entity, 16) &&
> > +                 selector == privacy_control[i].selector)
> > +                     return true;
> > +
> > +     return false;
> > +}
> > +
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >       struct uvc_xu_control_query *xqry)
> >  {
> > @@ -2995,6 +3024,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >               return -ENOENT;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be accessed if param allow_privacy_override is true\n");
> > +             uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> > +                     entity->guid, xqry->selector);
> > +             return -EACCES;
> > +     }
> > +
>
> What if this only applied to UVC_SET_CUR?
>
> >       if (mutex_lock_interruptible(&chain->ctrl_mutex))
> >               return -ERESTARTSYS;
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..c292bf8b6f57e9fdacee726285f5b46e638fd317 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
> >  static unsigned int uvc_quirks_param = -1;
> >  unsigned int uvc_dbg_param;
> >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> > +bool uvc_allow_privacy_override_param;
> >
> >  static struct usb_driver uvc_driver;
> >
> > @@ -2474,6 +2475,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
> >  module_param_named(timeout, uvc_timeout_param, uint, 0644);
> >  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> >
> > +static int param_set_privacy(const char *val, const struct kernel_param *kp)
> > +{
> > +     pr_warn_once("uvcvideo: " DEPRECATED
> > +                  "allow_privacy_override parameter will be eventually removed.\n");
> > +     return param_set_bool(val, kp);
> > +}
> > +
> > +static const struct kernel_param_ops param_ops_privacy = {
> > +     .set = param_set_privacy,
> > +     .get = param_get_bool,
> > +};
> > +
> > +param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
> > +module_param_cb(allow_privacy_override, &param_ops_privacy,
> > +             &uvc_allow_privacy_override_param, 0644);
> > +__MODULE_PARM_TYPE(allow_privacy_override, "bool");
> > +MODULE_PARM_DESC(allow_privacy_override,
> > +              "Allow access to privacy related controls");
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver initialization and cleanup
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 03c64b5698bf4331fed8437fa6e9c726a07450bd..510cf47c86a62ba7fe3c7fa51be82c996cf37f9f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be mapped if param allow_privacy_override is true\n");
> > +             return -EACCES;
> > +     }
> > +
>
> Would a better solution be to be able to map and query, but not set?

IMO it is less confusing if the controls are fully disabled.

Maybe it is worth it to land the patches that we do not have any
disagreement with (1-4) . And then make a new patchset thread with 5
and have a proper discussion there about usecases, mechanism to bypass
block and future plans.


Best regards

>
>
> Regards,
> Gergo



-- 
Ricardo Ribalda

