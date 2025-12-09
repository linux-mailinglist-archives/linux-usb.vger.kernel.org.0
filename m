Return-Path: <linux-usb+bounces-31312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74855CAF0B2
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F60B3051EAB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FA5320CA6;
	Tue,  9 Dec 2025 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NDiUBOPY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9602D948D
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261735; cv=none; b=eN37M9FpMTmDvs9jAro0rZ6lVQoCO56OlHcYOCvkQDkCYiFDkSu/g8ZCQkp3rqMItCG4wRKv4mwV9/tri2NsMLvJJ1Agf4pfnZRAhmofVRb7JR1TpaPq2GYaTbRaYZBYSRF01/wekPDW3NybIIGPsEXNgtDY1tYPnr4YjwvjXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261735; c=relaxed/simple;
	bh=o21OeCcpMSXqiy6l109fGpazt89ZHIZfzDr+2OI3mVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7i1RdykRnswDtJEvVsfy7cJAiBwZtUlNiplHO+e1oVMsSaqlqJWotBKKrUWXfAd4xraxiNAx6SXQPz5qOUMHwgp203eM0Vmh20t7ulKOmPwhaYVgLDSqEaeHtVNrT9oZzjRKzemjYkNHFE/B3/qLAz2ECdohpAGaG6NvklMZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NDiUBOPY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b95f87d64so45592971fa.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 22:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765261731; x=1765866531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rB9vH6GfGCQ5Uh4O3PvOJ7oJiIhZj5tXb1A5BcU3Lkw=;
        b=NDiUBOPYOfe01tMcidZw33IFG20NBK/jD5Bv+fyKaem3QyimPzCyBPwrBnpu+uOAE2
         zfoI71DRdkUDswP9yeRyPRqPXcwno2W1kwfPWYlG8ZwkED8FyVYMy8c/d2VNdo5GaFSW
         rcPQ5oxDBzxomTsVx1ghyT5htF78EOrt5iqPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261731; x=1765866531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rB9vH6GfGCQ5Uh4O3PvOJ7oJiIhZj5tXb1A5BcU3Lkw=;
        b=eOeWAPlen9NBYIL4eoVPeyF853zeyJo55NzZirxhcyx23zEukpcPHfL8ANwvFRfE/J
         CXbBzD1ewGytp3CYMaRp0VClvPf8ITxjg1cKoWs9xJ84mr/ARr71N1q275G0zlDDNlR3
         vsTRpBzl6KC6ui3OJFqg5WIkNYZBWV4ROpLS59FTSSzqxL4TctmOR/cZJY7ZacH0i5U1
         1y4Lj8WTIWU6JTFoxrbvwXIhR1sBOpRiHbeRH2FbH4Eb1FqbSHgCZ+yK6D9ABzF5zaiA
         l28BFfFliyyUbX9GpqDFurGQSHdi9n1pNP/9uziZAKrM0QSbJ426WBN7Zwo6P1UV1mcL
         rZqA==
X-Forwarded-Encrypted: i=1; AJvYcCXf2AArWT2ju2HUMpBxHm0wt2ClXEWVeHS6cDDVyGs7Ybx3EWJ79Vp9VQjCXrd37xOBKF5xboPBfGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJHGCXpwt0svaaNEbA1z1vm5IFQYJDrDOAf+pLe4Wqokwqjdd
	cb81PV39GuylJBLTaPrbrlsY3XxvBn45HN1eIu39W5B/vQJaPd5tkokjtSbkZr22VF4OQXyAjsJ
	IZFM=
X-Gm-Gg: ASbGnct0lLMEuqZ8MNkEfL4PMbE1qfuBf5GH0UWl4qm9sxsPzsrdV/n1dJtVm/jkeD1
	kJ0vcy1puybayD/Kztu53iksbloSe8sqaCqMWHq7UzX8FKfRUIoYAQ/J0rZkiJ6peIR3ToAP//m
	tEMBm2Tpuqu+CRqpZKHJJ0Zfy47yktTVQnN/h/YsojDepslF1TmYfpnXD4i27zkGRgIl9vVDyMb
	VTL5UATvZ9Z1iEkNabUpf2v9VXzpMRupJCJiBBvqsoJXOWTyz38awJjVH8L8qjEYmkXrEWvLYaA
	9K+gQGa0Sb2CEHBK0Cx1pfpRvIFMl6De9ti1QFnSJOe83L1f1V0+g2zO46XmiofKM/AQQqznpYS
	AJwsGpBppX9loCK0Zw9hE/UtV466DvtiSH3fWKMZHLGC2WXYBC+9lTne8QeqEo2jZ7yPP2tcQ1T
	pghfZ76HJFKE/qwhsg/B+zV62re7BmCAcnG5Ck5m84xyDVADSBTCbI
X-Google-Smtp-Source: AGHT+IEP+vihaAW3PCfhXnPea4/lM3VnyWBoq1ecpcKlyqyQa32BKoP2s0IWZ3d5+ZmQ0+BvVjMCPw==
X-Received: by 2002:a05:651c:19a9:b0:37a:2dfa:c76a with SMTP id 38308e7fff4ca-37ed2058ed1mr29706301fa.28.1765261731477;
        Mon, 08 Dec 2025 22:28:51 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feba575sm42905671fa.21.2025.12.08.22.28.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:28:50 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b95f87d64so45592741fa.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 22:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWT4LlPaw2D9uprg6ot5yS3tQrZEavCuT8A4RT+W2yB5VX0nR3NYcj1yLrmRRbo+Sl7npTmX5XwErw=@vger.kernel.org
X-Received: by 2002:a05:651c:254e:20b0:37b:a664:acde with SMTP id
 38308e7fff4ca-37ed206e751mr23810241fa.32.1765261729502; Mon, 08 Dec 2025
 22:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org> <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
 <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
In-Reply-To: <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 9 Dec 2025 07:28:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
X-Gm-Features: AQt7F2oTMXSxrVxWaTdwxjdV3eXQ1UCAZ0KTGK0XH1r0FfGiriIuKbyKFP5Wx-Y
Message-ID: <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Import standard controls from uvcdynctrl
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Manav Gautama <bandwidthcrunch@gmail.com>, 
	Martin Rubli <martin_rubli@logitech.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans


On Mon, 8 Dec 2025 at 20:12, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 8-Dec-25 12:02 PM, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > Thank you very much for doing this, this has been on my own TODO list for
> > a long time, so it is great to finally see this happen.
> >
> > On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> >> The uvcdynctrl tool from libwebcam:
> >> https://sourceforge.net/projects/libwebcam/
> >> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
> >> ioctl.
> >>
> >> The tool has not been updated for 10+ years now, and there is no reason
> >> for the UVC driver to not do the mapping by itself.
> >>
> >> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
> >> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.
> >
> > ...
> >
> > Question what happens if uvcdynctrl is run after applying this patch ?
>
> Answering my own question here, we will hit:
>
> drivers/media/usb/uvc/uvc_ctrl.c: 3166:
>
>         list_for_each_entry(map, &ctrl->info.mappings, list) {
>                 if (mapping->id == map->id) {
>                         uvc_dbg(dev, CONTROL,
>                                 "Can't add mapping '%s', control id 0x%08x already exists\n",
>                                 uvc_map_get_name(mapping), mapping->id);
>                         ret = -EEXIST;
>                         goto done;
>                 }
>         }
>
> So uvcdynctrl will see an EEXIST error. I think we need to add an -EEXIST check
> to uvc_ctrl_add_mapping() )or uvc_ioctl_xu_ctrl_map() which is the only caller of
> uvc_ctrl_add_mapping()) and if -EEXIST is returned do a uvc_warn_once() that duplicate
> mappings are being ignored and return 0 instead of -EEXIST to avoid breaking existing

uvcdynctrl seems to handle this kind of error ok:

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1215

while(node_mapping) {
  CResult ret = process_mapping(node_mapping, ctx);
  if(ctx->info) {
    if(ret)
      ctx->info->stats.mappings.successful++;
    else
      ctx->info->stats.mappings.failed++;
  }
  node_mapping = xml_get_next_sibling_by_name(node_mapping, "mapping");
}

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1199
if(v4l2_ret != 0
#ifdef DYNCTRL_IGNORE_EEXIST_AFTER_PASS1
&& (ctx->pass == 1 || errno != EEXIST)
#endif
)

https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/libwebcam.h#l69
/// Ignore EEXIST errors for the UVCIOC_CTRL_ADD and UVCIOC_CTRL_MAP ioctls for
/// all but the first device. This is required if the driver uses
global controls
/// instead of per-device controls.
#define DYNCTRL_IGNORE_EEXIST_AFTER_PASS1


(BTW, I think the last comment ^^^ is wrong, it should be. Ignore
EEXIST errors, or errors for second passes.
But I might need a coffee :P)


Looking at the debian codesearch:
https://codesearch.debian.net/search?q=UVCIOC_CTRL_MAP+-path%3Aioctl.rs+-path%3Auvc_v4l2.c+-file%3Auvcvideo.rst+-file%3Auvc_ctrl.c+-file%3Auvcvideo.h&literal=1

the only occurrence that I am no sure if it will properly handle -EEXIST is:
https://sources.debian.org/src/chromium/143.0.7499.40-1/chrome/browser/ash/chromebox_for_meetings/xu_camera/xu_camera_service.cc?hl=400#L400
But that is ash-> ChromeOS browser. I can ask the code owner to fix it
if needed.


I'd rather not add the quirk that you are proposing if possible. I
would expect that any/all the userspace handles -EEXIST because the
uvc control state outlives the userspace.


Let me know what you think.


> userspace.
>
> Regards,
>
> Hans
>
>



--
Ricardo Ribalda

