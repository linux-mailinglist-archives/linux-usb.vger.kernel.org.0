Return-Path: <linux-usb+bounces-13522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331B953B08
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 21:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07801F2635A
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 19:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193AA4AEEA;
	Thu, 15 Aug 2024 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zr3D8/nm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E56CDCC
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723751122; cv=none; b=N2JYXW9BBXfxcL3rdjaprr2Hf2PvTlQ3B0poLgDnDsyq3GIjYm0GbJjvl2GHSrihs/L3eCm2490WuQC0IZ/slDQ2g6K9hLxwHC57vISVb7QKO4HVj94g5FBdJcNhrYWE9MXp0ldJ2M9fTUC+RHZfuQsvalaL0MBxpOOSVfCNUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723751122; c=relaxed/simple;
	bh=WgHv8qIghW/XGbfA3/inME7zpGlhOrWspJ9Qn/7HUik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlxpS+0DP1Sv/B2PXey8gsqWR2zBrv/rE4ZCnf88Ul9i3tS58JlXl6fyGrLhwUwiIa/pagL/vuhZIxHLpum7ZTIvwqvq1YAG5T5BRTsegspgvuDsE7Jw1d8VPy055VTv7KtPLOtnp3O/bPlMHzFsV11y/a29/ptDeDfBq/4NNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zr3D8/nm; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6bce380eb96so888019a12.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723751120; x=1724355920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgHv8qIghW/XGbfA3/inME7zpGlhOrWspJ9Qn/7HUik=;
        b=Zr3D8/nmrZ+rpW8xdMFjeNv8vFYbPz5r08VvM1V4DAf4wWgSYKzDmcRgKCbwOt6kKp
         srDmGreauozlU896N4v4VG7Z+rWserOQlQ39uydgSaaJ9ae7uOJtqkMYCJWQcMzF3MjZ
         /KQCY5SD7SY1aTst6rWCFe1pTcZ+f4xT5qxcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723751120; x=1724355920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgHv8qIghW/XGbfA3/inME7zpGlhOrWspJ9Qn/7HUik=;
        b=IrB31DwmBPd6YceBv7w4X7UQV60YRl8f+5oKEcEwPBIrhAqx2jQjNoVQgVqbaklVUa
         fCCod84KrYDVt+dwNfZO54ux63yn2Slb8koSfSVV70kAvnm09FElv5nDPz+TTS0kwEWS
         eiLLe33ysD2nahctWVaG2W4xq39+D3HzBz8p+0+P2G0Ay/LHs/056/tZw0jF6tvBcBPd
         +p+BLbf17sJsuUsKip1TWeicp3Z+ogVeWC4DnkqE49pGvWLLFngmQJwzqa9GffDo/P19
         rpYPZ2W8UU4HnVUCKiMbYIL0Y1oSx8ue8ncA8wSE6dBdWUANnJBeeJBE0uGJP+K08VX3
         K3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWT7zppUm/z01/bdo7BiDWHlGAuet++fe74F2JwETP3ZkUSDL85Gtwq7KINJItMnDckF/UmVGIWzWxqxWtU/+z3ax5QNWJ++2iZ
X-Gm-Message-State: AOJu0YzEnkRH9Hq5MuqNMZ0MZyIcydG52M4Bg0nZpi5QYYMrDpiiLiy5
	FXg7elRN2Qv9hqCL0jDWikuY0IAnixxGzzdMIZlrWrVjj3fIQLsx4wlhsgv2eMVjrWDGMS8ucLo
	=
X-Google-Smtp-Source: AGHT+IGnWAdlXDtKT8Hde22AhyCWe0/jPFBQFMdTeG76sKjVn3SCJLmOqAMgt+wT19Id4BuDUGz9vg==
X-Received: by 2002:a05:6a20:e68d:b0:1c3:ff89:1fc6 with SMTP id adf61e73a8af0-1c9050586f7mr761584637.53.1723751119802;
        Thu, 15 Aug 2024 12:45:19 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6898sm1349840b3a.21.2024.08.15.12.45.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 12:45:19 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-201fba05363so5748585ad.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 12:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7zKt36inZh6MZJQopy6Ykp7SIsefJCyZsoUC+e/ZOrmub615sTccYMKTSjVeV5fGn6ccgfF8iVNGSrUSPadHdzCZi86T9pYBK
X-Received: by 2002:a05:6214:3186:b0:6bf:66e6:4754 with SMTP id
 6a1803df08f44-6bf7ce7c3efmr5290586d6.48.1723750663162; Thu, 15 Aug 2024
 12:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net> <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net> <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
 <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
 <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com> <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
In-Reply-To: <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Aug 2024 12:37:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Message-ID: <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Peter Robinson <pbrobinson@gmail.com>, 
	dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-list@raspberrypi.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 14, 2024 at 2:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> >> You're saying that your
> >> registers get saved _unless_ the power domain gets turned off, right?
> On BCM2835 there is no need to store the registers because there is no
> power management supported by USB core except of the power domain. So
> DWC2 don't expect a register loss.
> >> ...and the device core keeps power domains on for suspended devices if
> >> they are wakeup sources, which makes sense.
> >>
> >> So with that, your patch sounds like a plausible way to do it. I guess
> >> one other way to do it would be some sort of "canary" approach. You
> >> could _always_ save registers and then, at resume time, you could
> >> detect if some "canary" register had reset to its power-on default. If
> >> you see this then you can assume power was lost and re-init all the
> >> registers. This could be pretty much any register that you know won't
> >> be its power on default. In some ways a "canary" approach is uglier
> >> but it also might be more reliable across more configurations?
> I don't have enough knowledge about DWC2 and i also don't have the
> databook to figure out if there is a magic register which could be used
> for the canary approach. But all these different platforms, host vs
> gadget role, different low modes let me think the resulting solution
> would be also fragile and ugly.

I won't admit to having a DWC2 databook. ;-)

...but don't think it's too hard to find a good canary. What about
"GAHBCFG_GLBL_INTR_EN" ? From a quick glance it looks like the driver
seems to set that bit during driver startup and then it stays on until
driver shutdown. The databook that I definitely won't admit to having
almost certainly says that this register resets to 0 on all hardware
and it's applicable to both host and device. I think you could say
that if the register is 0 at resume time that registers must have been
lost and you can restore them.

I guess if that doesn't work then "GUSBCFG_TOUTCAL" could be used (I
think that resets to 0 but must be initted to non-0 by the driver).

Yet another register that could probably work as a canary would be
"GINTMSK". I believe that inits to all 0 (everything is masked) and
obviously to use the device we've got to unmask _some_ interrupts.

I can look for more, if need be.

-Doug

