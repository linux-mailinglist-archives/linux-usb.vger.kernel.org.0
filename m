Return-Path: <linux-usb+bounces-31313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D667CAF0F1
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3E1E3034A39
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD0626F295;
	Tue,  9 Dec 2025 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kCHMoK82"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E126E17F
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765262520; cv=none; b=QqvHzURGl4ng0SaK3of+DG+d3Acq7nFXCVxkhNTz0ITgH7zVzdL/thbTC1pge0FjdIsSPUKIC7htlNr8CYcTAxdvl6kNOSK8q85mPBiTvJ3vBP5OgxUiF0UiCrlmPsWw0eksOiwDmE4INATEWLn1dTObUstm/vhhB2y3oBcZJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765262520; c=relaxed/simple;
	bh=lJU4xMyw0Ics4R7iF/dtEFW5XPTHjrAML86unhjdaw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ4oK29gJW34PLy+cNYgysZo5C8Z2P3fxVFO/k7U8uTATNmsEQjcfqo0oK072ukSTDUzJu37SiLNTxt5c/KwBKGBZVdV7O+JvH2Wl9WViLAJA7wBgl6e+B+PlDLpaHIqoKi0MUT2xzij9xAB9ILExR7Iwf7aRTi7yxtM+sfdKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kCHMoK82; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5958931c9c7so6512885e87.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 22:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765262516; x=1765867316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0V9C2N/EaSoH4hcssL4pcExp5whRbaljeVrNMKSIqrs=;
        b=kCHMoK82lyt2xPNNwlLL54xJxAdt+t9jGIDM5J4b09cx53EEtLsnYH5OasDAK6Sb8L
         /f0No1ROU08AYFYL5+s2IoN86wex3ADln+6iQS95XmqCwUYGFFVfUbK4LRkaZkD9xuo0
         PH9Ysjfmo4gDibhR5t3g7+RaPqW917pVEwFtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765262516; x=1765867316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V9C2N/EaSoH4hcssL4pcExp5whRbaljeVrNMKSIqrs=;
        b=dzgIa0Cus8ekZtHfSr4dsEow49yfl7zwE0uCYLg2BAuvmzskoLvMYnYzxjL93no1bM
         56hRUJ+NNVAikIP5jFivzh93ggo6+QpHdpYL1aJjGUCEduMuj+9WzEKIc5sFSOAa9lHd
         7kymZcJn9nQhReeUZHreG9Xb/G5S5+uEXx2V6XEjDHZ9qpVs5BCiEIjTWJpLTEVhEN57
         3mi0Tzdd+yuUgx0xqg7/+Up+Vm3Lknh264PZksL0M9TxN8VZ5C+hgz+A6om3ifmyqNFp
         wRW4bpexvc3WXPD7Y8APVuP1DqDF8xBBm+HAWUPbyj2EeKyyAPFSuCefLdlfMkUNbENM
         1E2A==
X-Forwarded-Encrypted: i=1; AJvYcCVE+7dT8iuMMUq9r2lSL1OtoiVEhTeuPjTSBGj/mvLEnIaLNlhhC3qTLSy69cdrD0vzqZ55wU0TYtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwlxfTU1R6CKJOuZvT8VagAX+0GlEXiqgU+Zurg6rsmpXKug6w
	Sg/n3YbK+pDcoCDk6t85jMGP9hBNEI2Gs4N7hh8qyvdWtE5rm7p3ZznO47/gUawcu8X5AH6fRgj
	zA/Hvxw==
X-Gm-Gg: ASbGncsI8ShqLM55XrT6Vl7cuTIazhIp04iNApXJ3qTEcZi6JnVhqJiCN8rqKRWwd4M
	PKYlXVVXi38cEg8mGsW4cnMxZyFJ3wXDYMN9u0o9oo2NjIC8XRqGUB9w2mlYxSnGbtUkGIgD0OA
	OEa4By0q5XzS6v6d/i39ttKqElJHxAerxpd/QEGi7ju1tEXvO1UIEJwFoUS8LCbIjHsgGmss1Lt
	K64mzHpPB2NtBxJUmHANOSN93KC2lkICqzAnFwt0dyAMFOfcvRCRFqXv8e1481+LWyNy/WqhQja
	a1r6WtwX3kUcuchQ6js7RYljt5OrjF/Bw/Ih14BRIkZlxkKD/w7mi9LIzfG64quXdwFjoGfeWUq
	FCD7hzQNGbwml79ZJfWnIFbrZ/uxf5siV2R+N8ACKy1Ay87UnwQ7x+jGa9nK06mvAwOaPiuHIO9
	w8lRqngOsu/H8R3CBnk3rkSlBsg9bmwvN4oBk5JebGHS6vDF11o3NV
X-Google-Smtp-Source: AGHT+IFfNWtc9b04xJej00a5Ok7rnumGZyqU8zhcZGn+/7qCuJe+ixNT2Qb83U68Z1JSqZmapJYlQg==
X-Received: by 2002:a05:6512:b0f:b0:593:ffa:6988 with SMTP id 2adb3069b0e04-5987e8cb684mr3778536e87.21.1765262516245;
        Mon, 08 Dec 2025 22:41:56 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24719sm4792215e87.24.2025.12.08.22.41.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:41:55 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a33b06028so47765641fa.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 22:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbqJ22u+x+FV1Rtl/yZkWPdhxf4vhmfFyGTMFvj2r7CZEE64LiMC9TZsGjKz5A29baZWaaWiCfLf8=@vger.kernel.org
X-Received: by 2002:a05:6512:2312:b0:594:522d:68f4 with SMTP id
 2adb3069b0e04-598853bc5fcmr2669981e87.28.1765262514587; Mon, 08 Dec 2025
 22:41:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org> <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
In-Reply-To: <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 9 Dec 2025 07:41:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
X-Gm-Features: AQt7F2oN1rLCiK5YAJ9rb0hF0CEMsaJ2yvHl5AqU5ZukcLwFi80je33jOhwtgDM
Message-ID: <CANiDSCvr7VRw91-AuJ8JTuhsuJNcg5XqLVvgjJycmqOKMcf3fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans


On Mon, 8 Dec 2025 at 20:17, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> > The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
> > control.
> >
> > This mapping is usually created by the uvcdynctrl userspace utility. We
> > would like to get the mappings into the driver instead.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
> >  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
> > --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > @@ -109,6 +109,8 @@ IOCTL reference
> >  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > +**This IOCTL is deprecated and will be eventually removed**
> > +
> >  Argument: struct uvc_xu_control_mapping
> >
> >  **Description**:
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
> >       switch (cmd) {
> >       /* Dynamic controls. */
> >       case UVCIOC_CTRL_MAP:
> > +             pr_warn_once("uvcvideo: " DEPRECATED
> > +                          "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
> >               return uvc_ioctl_xu_ctrl_map(chain, arg);
> >
> >       case UVCIOC_CTRL_QUERY:
>
> Deprecating and then removing this is going to be a long slow process.
>
> I was thinking that rather then remove it we would keep accepting the ioctl but instead
> of calling uvc_ioctl_xu_ctrl_map() we would simply return 0. E.g. change the above to:
>
>         case UVCIOC_CTRL_MAP:
>                 pr_warn_once("uvcvideo: " DEPRECATED
>                              "UVCIOC_CTRL_MAP ioctl will eventually be ignored.\n");
>                 return uvc_ioctl_xu_ctrl_map(chain, arg);
>
> And then say in one year after a kernel with the above is released change it to:
>
>         case UVCIOC_CTRL_MAP:
>                 pr_warn_once("uvcvideo: " DEPRECATED
>                              "UVCIOC_CTRL_MAP ioctls are ignored.\n");
>                 return 0;
>
>
> I think removing it in 1 year is too soon, but ignoring it is ok. This does mean
> that people will lose the custom v4l2-ctrls for which patch 2/6 is not adding
> mappings into the driver in 1 year after a kernel with the warning is released...
>
> I'm not 100% sure about this plan, so please let me know what you think. For
> outright deprecation warning + full removal I think we need to wait at least
> 2 years after shipping a kernel with the deprecation warning.

Let me rephrase what you have written:

today:
pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl will be
eventually ignored.\n");
return uvc_ioctl_xu_ctrl_map(chain, arg);

in 1 year:
pr_warn_once("uvcvideo: " DEPRECATED "UVCIOC_CTRL_MAP ioctl is ignored.\n");
return 0;

in  2 years:
return -ENOIOCTLCMD;


Normally I would prefer not to lie to userspace (saying that the
mapping was done, but not doing it).

But in this case, UVCIOC_CTRL_MAP does not seem to be very widely used
(check previous email), so I do not think it really matters if we skip
the "1 year step" and just return -ENOIOCTLCMD in 2 years.

I leave it up to you to decide the deprecation steps.

Best regards!

>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

