Return-Path: <linux-usb+bounces-35130-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKNbHrfKu2leoQIAu9opvQ
	(envelope-from <linux-usb+bounces-35130-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:06:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0392C93AA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0839329217E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26373AA4E9;
	Thu, 19 Mar 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hQ7o2rmR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D95386C23
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914243; cv=none; b=pWtjiRiBXrXkkwgRDmxBRMcRNjhtaOWP1fPQyh+ii8nJD8/jdeiCIAzPhiE/4r1D6X+pbdha7jpJNHTpFns8tEz0qTYAIqFh++TitJm06VMBcpv6wldAMhUb4LCWX7KpnFSXP86egL9upXh98SFPfjY/gBQoKPshUaRC1bheVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914243; c=relaxed/simple;
	bh=8V1U2yHquHjLMhQY21Dsi5RU6DPFKswfiQM7HLk83UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvQ9LnPQbLU/OcDU0D0JTanjNRlXuROEhP+TlomYFLRgT95gmQMen6xcY6hu/btVvK9+ysv/v6tmZf6A66FmvV8SfuTR2lbMJrEjQfAWU2m9TOmPbcRHTOgSYD3VRk6g3aLAa+Tbtcn4Hg0YeZ4Bg2c5cO4LLDq5QxhV4nBLgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hQ7o2rmR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so765908a12.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773914234; x=1774519034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=42kcHim1m1kLe6enJpDUsxV3kWm1Hbl04yW9V6WrLu8=;
        b=hQ7o2rmR62aBW0SpbdnxzXkv8t2h8e0b2k62B5JcVLapAaZUhHyfegNjSDf4586Oes
         JvJilImBxygM3HFN6hWt5NaWf/0h8IKIvge1D8qO9j8OWQJH4GVkfEdONKbaU5a870F9
         Fu1x8cARfyV984iWLH1PSpivMW2uYhiw2mLmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773914234; x=1774519034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42kcHim1m1kLe6enJpDUsxV3kWm1Hbl04yW9V6WrLu8=;
        b=LEozHwjSLqUK/vUA6xZHmt49Zeac/Fo69Tywy4dSYuTTmz+IWqUBiRMU7b04BVEj0j
         7FCmzXx+8vva7KFnWA6bz6urfBB9Ux3zbdf9hAAGHXE/l9wlMTvLRKcV6v8npijQG1j9
         lOJ6XTTibccOBvOiGhARa6noT7FBGLNH3hCt7nR8Jq/Bx455Ul9FvwFSpuJ8/HxDMOXe
         S1hfeJ+I3YEMAYHuBOec2NI7Z0evlhul1vAP3KLYs3/4AFTZuMKUB1iRkqCM+WBb1UMm
         a3+1ZtJmLWAtrLShTSaj+ZVZaeZnr851RUlMXGmj1yVGs+jIHBDUrsP58HkVxmwOr4dw
         AzTw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+AA3yZ2r7AIbmlKDLgtMVZqp5ZOv/NUpzjfq+aEKLOxvWRGlNAcdJaE0vLgDref5sKNKvhY6xLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJwDjaM1ctgVoOP5GhUayyyGt3pu7pA/lJnRw7U1D/Fgq4mN1
	2GWFyhvykWBAY084KTr3kQetqzEUDMhlfYjg+6PnrjD5eGGjojaZTM3NbDH7AyCWv+xmRKqGS4f
	Jpg6m6lyy
X-Gm-Gg: ATEYQzwJgf7f47erNMZ2Wk8wGMmCTzMlLkFpPqDFcvS8hUbvU9vkfTqd4HQnpEm4r2O
	4+mYZp03kEILrdg5YRHeCTq3+cV+F+ZVWwmdWSSU6XZtX35n7xMRqYKXNGQ7NiPW2wqQbftIKzi
	CBtQCeuYywEdn6DFmY6wow1CUm8L46z4JWAJd+inDEnLqLpSsZHGZvnDCUjJg6au/JI3pLu0OcW
	3I0OnUAvrWrp7wZqyaYRkVPt5i97zClmdO0Bjps/83lXrY0WgiuOJLdPG3z/XVyaKWkPcZgQzTo
	F6H7a4SmwW3vvuAu98pgwbOT0MzSnCZx+1Th7O3XOzDRhOdVa4Nd6M4teyuq3yGjQFTYvPqnciY
	4VaC45USwLapm24CEWIUqV1UgKaAO1cfrsXMJRIEFgQomycSvwXfO6H42mjUAxu3qCKD17kbrDN
	VrVPOpfE2RLZ09ZjwaxRcYz7lJifOVfemXUkjsQzK83DuILja42zSCnmWDueU2
X-Received: by 2002:a05:6402:458c:b0:668:57f8:cb86 with SMTP id 4fb4d7f45d1cf-66857f8ccd8mr1246469a12.22.1773914234171;
        Thu, 19 Mar 2026 02:57:14 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b14976f1sm3501467a12.31.2026.03.19.02.57.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:57:12 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97a06d7629so60140066b.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUog0jbaTZtinSYhwdbez5UhshQCubbsw7NvQQxwUxbJQ/DsDWmpw1/pDFC9dBp8HyrgvSZ2MldEvY=@vger.kernel.org
X-Received: by 2002:a17:907:3f13:b0:b98:e38:559e with SMTP id
 a640c23a62f3a-b980e386168mr190482466b.54.1773914231511; Thu, 19 Mar 2026
 02:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org> <20260319013657.155efeb0.michal.pecio@gmail.com>
In-Reply-To: <20260319013657.155efeb0.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Mar 2026 10:56:59 +0100
X-Gmail-Original-Message-ID: <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
X-Gm-Features: AaiRm5192DSsBGH08gPtl1ojGHVdXtgV6ffP6UH8PASivTgmPU2I0YYLsTu9Xmg
Message-ID: <CANiDSCsBjgZL0MGFgkDzbTaJ03hE0gZbV3tu3fKo7k6KaAcMZw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35130-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DA0392C93AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal

On Thu, 19 Mar 2026 at 01:37, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Mon, 16 Mar 2026 13:34:46 +0000, Ricardo Ribalda wrote:
> > Some camera modules have XU controls that can configure the behaviour of
> > the privacy LED.
> >
> > Block mapping of those controls, unless the module is configured with
> > a new parameter: allow_privacy_override.
> >
> > This is just an interim solution. Based on the users feedback, we will
> > either put the privacy controls behind a CONFIG option, or completely
> > block them.
>
> What feedback do you expect to get?

I want to identify the valid usecases for overriding the privacy LEDs.

>
> Users will one day see their setup broken.
> They will curse you and jump through the hoops you set up.
> Next year they will see their setup broken completely.
> They will curse again and wish you all pain, but *after* the fact.

The goal of the deprecation period is exactly this: to trigger a
conversation before a permanent block. If a user relies on this, they
can report it now. We can then decide if we need a specialized API for
their use case or a Kconfig option, rather than leaving the current
"anyone can turn off the privacy LED" status quo.


>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  include/linux/usb/uvc.h            |  4 ++++
> >  5 files changed, 71 insertions(+)
>
> This doesn't seem to cover libusb, VM guests and such.

For libusb and VM guests to work you need to unbind the uvc driver.
Only privileged users can do that.
Today, any user with camera access can disable the privacy LED.

>
> What's even the attack vector? It has to be full remote code execution.
> And it's just an LED, when you see it turn on somebody already has your
> mugshot, if you notice at all. And the mugshot isn't your worst worry.

The attack vector is that an app with camera access, like your
browser, can record you when you don't want to be recorded.
The LED will be a signal that something is happening.

Imagine that you install a Flatpak for live streaming. Assuming the
Flatpak is properly sandboxed, remote code execution is less worrisome
than the app spying on you.

>
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b6e020b41671..3ca108b83f1d 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3001,6 +3001,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >       return ret;
> >  }
> >
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> > +{
> > +     /*
> > +      * This list is not exhaustive, it is a best effort to block access to
> > +      * non documented controls that can affect user's privacy.
> > +      */
>
> So it's not removal of some controversial feature, but 3KB of extra
> code in everybody's kernel (I just applied this patch) and a forever
> game of whack-a-mole with HW vendors? They will win...

Maybe I meassured it wrong. But I can only account for 1.3 KiB

$ size drivers/media/usb/uvc/uvcvideo-without.ko
   text    data     bss     dec     hex filename
 115974    3748      88  119810   1d402 drivers/media/usb/uvc/uvcvideo.ko

$ size drivers/media/usb/uvc/uvcvideo-with.ko
   text    data     bss     dec     hex filename
 117315    3767      88  121170   1d952 drivers/media/usb/uvc/uvcvideo.ko

I see no need for vendors to hide these features, they simply added
them because an OEM thought it was a nice feature to have, or because
they left them as hardware debug features.

>
> You will blacklist features found by legitimate users and shared on
> public forums, while hackers will keep their findings to themselves.
> Assuming that there are any who even care.

If a legitimate user needs a feature, this patch gives them a way to
keep using it (allow_privacy_override) while notifying us. This allows
the community to find a better, safer way to support that specific
need without leaving the door wide open for everyone else.

>
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
> > @@ -3045,6 +3074,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >               return -ENOENT;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
> > +             uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> > +                     entity->guid, xqry->selector);
> > +             return -EACCES;
> > +     }
> > +
> >       if (mutex_lock_interruptible(&chain->ctrl_mutex))
> >               return -ERESTARTSYS;
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index b0ca81d924b6..74c9dea29d36 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -36,6 +36,7 @@ unsigned int uvc_no_drop_param = 1;
> >  static unsigned int uvc_quirks_param = -1;
> >  unsigned int uvc_dbg_param;
> >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> > +bool uvc_allow_privacy_override_param;
> >
> >  static struct usb_driver uvc_driver;
> >
> > @@ -2505,6 +2506,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
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
> > index f9049e9c0d3a..6d4f027c8402 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
> > +             return -EACCES;
> > +     }
> > +
> >       map = kzalloc_obj(*map);
> >       if (map == NULL)
> >               return -ENOMEM;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 8480d65ecb85..362110d58ca3 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -664,6 +664,7 @@ extern unsigned int uvc_no_drop_param;
> >  extern unsigned int uvc_dbg_param;
> >  extern unsigned int uvc_timeout_param;
> >  extern unsigned int uvc_hw_timestamps_param;
> > +extern bool uvc_allow_privacy_override_param;
> >
> >  #define uvc_dbg(_dev, flag, fmt, ...)                                        \
> >  do {                                                                 \
> > @@ -794,6 +795,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
> >
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index dea23aabbad4..70c2a7d25236 100644
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
> > --
> > 2.53.0.851.ga537e3e6e9-goog
> >



--
Ricardo Ribalda

