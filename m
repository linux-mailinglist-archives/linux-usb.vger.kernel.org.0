Return-Path: <linux-usb+bounces-31357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A7CB21A3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 07:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15D99302B30E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 06:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABF4271468;
	Wed, 10 Dec 2025 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jmr0BeA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46071F428C
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348870; cv=none; b=BNmFTek9YtPHIg1lHX7CbEA2f9kx6ho2S1QyGRD/pbUJnhuE/Lm1e0wQYzl9KD2HYofxAavhpfavLuSPLyhU/X0RD1JuiWxXp58AkL3lBBCJhoxasBSt2Lg+TgyQOcraArKRT9fHd6DNHJvyuhaOelyDsxtgbZ10yU9LXsm83/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348870; c=relaxed/simple;
	bh=l0y1EtpDQDcSRi7FywXxflPf4vaeqK2pwN4wBxYg2Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+9NhWqYfSHL2DxZ4fhiI2Rm0oizy58pLwTI9UsqMLPT3FiSkRdwZwdUGshsmbWLK62mzPq42PzE5KY2hg/cKKCds4pHCxzr7XADjyN+h8BBMNRDQkzwrQR0xnFJuPwiKBd9bDLzFMvTBuYffwjikdg6K7/KfHXAfwlwj6htJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jmr0BeA8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5959187c5a9so5029897e87.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 22:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765348866; x=1765953666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RlkNBsTMw0ANtnYwsyyj4mRPTKKhKH2KSoBXwAsQME0=;
        b=jmr0BeA8dX9qeuCURvckJPh/ffjjQSqruq3qeX/JmYFAs55EN9sjb0ZjCdBG50Q0bd
         zLcZAYwTDBlILWiesQA8z19vBJRM+214IgUsTkN3A+TaYuro05rdQjB4KpiEz6OHHvHi
         Tf3o1ZfX0KGsmMsdKlxB0WSgbtFzoMjIKX/Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348866; x=1765953666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlkNBsTMw0ANtnYwsyyj4mRPTKKhKH2KSoBXwAsQME0=;
        b=EefFZYelV31pZH1dU5G7uHxLWJJj8chJlXOwA6R0sH3aJVMozJU0dAk0HWgzH+RgF0
         ICK+nUYYbcuBy/y0iQuVn4auDWcsi7ijbSyWmSZvz5Rr19Y5tfyZFgfAeg5jyCiE2mRt
         +xGQWVelXPL40uWr5yiZMOOKiyXm6cFRmC+3xGII5fLuJwQxY6kENRyH96ErF4qujyJu
         JaPGpsbuFbfGGCE3PA8XdJG/DIcLacFHbWnUpuaMiSl/giCdp8BheBA6jD7wjJecTdaE
         dQ2RvBUL6o7DzMLNsKXgdJHvk5COcG8EXoajgYPEpnD6TI3y9a+ff8jC6+eHF5FXjx4Y
         1avQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPMs34JcEQZixI+d/zg3snMKNv3ChzlZuaoYJvDa8cEvv1cKfLZtl+IWXCuDbF7hbSlnOzPQubBoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkJUna8tGRcnf7iq0T/lHINsxAkZCB/B7fftrOraotFrBCz+M
	pFGF5KnlAHFZ5RsLyqdIl9l7Ivkk46KPuGUP5a7So4WBGuc5txsaYFBUE5bVNZSy5jlWUIuXOtM
	9BXMflQ==
X-Gm-Gg: AY/fxX7iqlgOtrrNJ00plzwPbTzw00L70hXYAsTkJjnLrD+qO3m4ej0RGKXTjyd3Gve
	URGrgawdXljxQT+vaStjKHdHDBO1tjKx/kzGHCsL/4lEKUM/WLp5pbs61lezXm141fVxnRyeIKH
	Md8QD3Uo/NiVoyETozRSYtcL/lj1U3+SPUjYLqLSF26xGcMe1TXW94KnH5q67+Q8YXG3A96Gsln
	RmLLBSe5rYBadYG2tLnJ/a70TkeDZMlZpYG5dqeZoOj1JrwzXMyahh9yGPTK77I1fcK4d+d8Gzw
	h15FKeg9MyE+tNGmw+YgzBd8YTiaqLMd2CM+2UgQ/C4BC0LiM507t9I1CpciiOxLwogNSpGziZ3
	4KOF811wANPMsjGtWex0iloi9YYGbiqbLWnUdHtFY6RWpDKqkmDMSZX4op9wNFzQStLFDlp0SWD
	0Q2Uh0aLWjZOuMeRidktz2K+XWJllkqMiwK68shgBkcN4K0XAX
X-Google-Smtp-Source: AGHT+IHOmicuTJES9ewBDfXeunLCJ77WFEgorfo46Qkuwts+PSCkxLSkx4dKm0nQP+D4FquyYAV+fw==
X-Received: by 2002:a05:6512:3b1e:b0:594:27fb:e7f5 with SMTP id 2adb3069b0e04-598ee543ccemr499731e87.42.1765348866422;
        Tue, 09 Dec 2025 22:41:06 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b244e1sm5926225e87.23.2025.12.09.22.41.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:41:04 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959187c5a9so5029855e87.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 22:41:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzm/2CzwqKbrgJ/NWzATHiMV8ZMOYJYZrlTk4Uz3dcwu2XFSfK1QYuEPNlf++T6vnrhskI/YIwbT0=@vger.kernel.org
X-Received: by 2002:a05:6512:b88:b0:594:248d:afa7 with SMTP id
 2adb3069b0e04-598ee4e62f6mr513448e87.13.1765348863446; Tue, 09 Dec 2025
 22:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org> <448fb5ce-f369-4796-b29b-ae03c1314b3a@kernel.org>
In-Reply-To: <448fb5ce-f369-4796-b29b-ae03c1314b3a@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 15:40:50 +0900
X-Gmail-Original-Message-ID: <CANiDSCsAY+UAvE77esA65e-b3aWrrv63wQ9KwtPBF_aH_MAcjA@mail.gmail.com>
X-Gm-Features: AQt7F2p9B9ulZdO8Xxd7IHjTKVCFFmfzPdQROCwZvniqGysPX_fW6p1uze9cyX4
Message-ID: <CANiDSCsAY+UAvE77esA65e-b3aWrrv63wQ9KwtPBF_aH_MAcjA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Introduce allow_privacy_override param
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 20:58, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
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
>
> I would do /s/param/module parameter/ in the message here. I know it makes the message a bit
> long but I'm not sure all users will understand what kind of parameter is intended otherwise.

Ack

>
> > +             uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> > +                     entity->guid, xqry->selector);
> > +             return -EACCES;
> > +     }
> > +
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
>
> Same comment on the msg.
>
> > +             return -EACCES;
>
> Did you test this with uvcdynctrl? will it log the error and continue with other controls,
> or will it abort mapping controls when it hits this ?

I tested with the logitech camera and virtme-ng:
https://patchwork.linuxtv.org/project/linux-media/cover/20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org/

It is the first time that I use virtme for uvc... and it works like a charm!

Also looking at uvcdynctrl it seems to log the errors and continue.

If you have a specific test in mind I can try it next week.

>
> I agree with the change and with the -EACCES error return I'm just wondering how
> known userspace consumers of the API will react to this change.
>
> I've been thinking a bit about this and although not ideal I agree that this approach
> is likely the best way to deal with the Logitech custom privacy LED controls.
+1
>
> Regards,
>
> Hans
>
>
> > +     }
> > +
> >       map = kzalloc(sizeof(*map), GFP_KERNEL);
> >       if (map == NULL)
> >               return -ENOMEM;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..4b1a70e3100bbf2180411a865a89952a81d0f0a4 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
> >  extern unsigned int uvc_dbg_param;
> >  extern unsigned int uvc_timeout_param;
> >  extern unsigned int uvc_hw_timestamps_param;
> > +extern bool uvc_allow_privacy_override_param;
> >
> >  #define uvc_dbg(_dev, flag, fmt, ...)                                        \
> >  do {                                                                 \
> > @@ -792,6 +793,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
> >
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index dea23aabbad48270c807463c1a7e1c0d1b79fc1f..70c2a7d2523611418aba363328f76667d379b571 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -49,6 +49,10 @@
> >  #define UVC_GUID_LOGITECH_PERIPHERAL \
> >       {0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
> >        0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
> > +#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
> > +     {0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> > +      0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
> > +
> >
> >  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
> >  #define UVC_MSXU_CONTROL_FOCUS                       0x01
> >
>


-- 
Ricardo Ribalda

