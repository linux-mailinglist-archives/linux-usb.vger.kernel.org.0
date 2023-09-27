Return-Path: <linux-usb+bounces-653-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF57B083F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 17:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id EAFB4281C89
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 15:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E0E450EB;
	Wed, 27 Sep 2023 15:29:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE638F9E
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 15:28:59 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB03126
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:28:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31ff985e292so10941619f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695828535; x=1696433335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVgwDObXb6UAmjjtbbeBb3r9BHG4gpzxjTumkUEWtbQ=;
        b=gJK/HOcpHhhcjeNBpdbMZ6qg3XQgcRq6oAmQG9kk+gfHEDzuiLzZseU1RhHazb7ZGL
         IZHbMNMguEMmji//91HLp6QadDEXnz84/CWdm/7CKwDyW36SCkWJTZYIuA50KUgbC1B4
         krtpPr5R9Unjiju3L4fiNrREC+rr5CzJ684QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695828535; x=1696433335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVgwDObXb6UAmjjtbbeBb3r9BHG4gpzxjTumkUEWtbQ=;
        b=hC4j/Uppw8ydzIcJDaQdz+RDjdmSbtteH0yvZ1cQWpdXrUQ/aIUj+fd3xGAWUw6Bvf
         hi2FxdrgW75x0jmgDQii795zYdBWzXZobt8NEbUkKoYRdc7pdIzyZDq8G11dv8/A455z
         3RPdRGKzwo9Wko9dtFS9Fsl1iE11Gls7Ea9HODSHxfxoZQo0aSnyw3+qIgKJ5FL5ddYs
         dYnv1wqTaTkxgFaFu278KRjfSRqeAtrAW4u1iJowTr5qUdKsKbJ/jt9zY4zvMg/G4oAB
         MVs+N68KHWoHJ7S2EmuCBgxJy1nkHUgwRK5bq831ntHo5MKODIEYcxXOGgiEki4J04D9
         s4dQ==
X-Gm-Message-State: AOJu0YxutwF9ZsdipFnK/WFSbsGvS4nFGb3+hnBcYKc8tvLBEn/PE1c8
	jQS009DffI1dQfzv7617wcBlJoDw5e+im9uPoeH0e0Nc
X-Google-Smtp-Source: AGHT+IE3kzqLPbQkB14+cNa2u84YxxzL8+OuLiRsUZMc1G93alN1GPsQG6RuUlvdI4j8K9KNKTYC3g==
X-Received: by 2002:adf:e943:0:b0:319:67ac:4191 with SMTP id m3-20020adfe943000000b0031967ac4191mr2026509wrn.37.1695828534184;
        Wed, 27 Sep 2023 08:28:54 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id j19-20020a170906051300b009937e7c4e54sm9511869eja.39.2023.09.27.08.28.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 08:28:53 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so22454a12.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:28:53 -0700 (PDT)
X-Received: by 2002:a50:d61c:0:b0:51e:16c5:2004 with SMTP id
 x28-20020a50d61c000000b0051e16c52004mr288987edi.6.1695828533058; Wed, 27 Sep
 2023 08:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230926212824.1512665-1-dianders@chromium.org>
 <20230926142724.2.I65ea4ac938a55877dc99fdf5b3883ad92d8abce2@changeid> <62fec09e-c881-498e-9ac0-d0a6de665f16@rowland.harvard.edu>
In-Reply-To: <62fec09e-c881-498e-9ac0-d0a6de665f16@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Sep 2023 08:28:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4R9TAGH+cCG=YBgCFO5F9hniPV-ycZjk5=z5mSjFQ7A@mail.gmail.com>
Message-ID: <CAD=FV=V4R9TAGH+cCG=YBgCFO5F9hniPV-ycZjk5=z5mSjFQ7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] r8152: Retry register reads/writes
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-usb@vger.kernel.org, 
	Grant Grundler <grundler@chromium.org>, Edward Hill <ecgh@chromium.org>, andre.przywara@arm.com, 
	bjorn@mork.no, edumazet@google.com, gaul@gaul.org, horms@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Wed, Sep 27, 2023 at 6:43=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Sep 26, 2023 at 02:27:27PM -0700, Douglas Anderson wrote:
> > +
> > +static
> > +int r8152_control_msg(struct usb_device *udev, unsigned int pipe, __u8=
 request,
> > +                   __u8 requesttype, __u16 value, __u16 index, void *d=
ata,
> > +                   __u16 size, const char *msg_tag)
> > +{
> > +     int i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < REGISTER_ACCESS_TRIES; i++) {
> > +             ret =3D usb_control_msg(udev, pipe, request, requesttype,
> > +                                   value, index, data, size,
> > +                                   USB_CTRL_GET_TIMEOUT);
> > +
> > +             /* No need to retry or spam errors if the USB device got
> > +              * unplugged; just return immediately.
> > +              */
> > +             if (udev->state =3D=3D USB_STATE_NOTATTACHED)
> > +                     return ret;
>
> Rather than testing udev->state, it would be better to check whether
> ret =3D=3D -ENODEV.  udev->state is meant primarily for use by the USB co=
re
> and it's subject to races.

Thanks for looking my patch over!

Happy to change this to -ENODEV. In my early drafts of this patch I
looked at -ENODEV but I noticed that other places in the driver were
checking `udev->state =3D=3D USB_STATE_NOTATTACHED` so I changed it. In
reality I think for this code path it doesn't matter a whole lot. The
only thing it's doing is avoiding a few extra retries and avoiding a
log message. :-)

I'll wait a few more days to see if there is any other feedback on
this series and then send a new version with that addressed. If
someone needs me to send a new version sooner then please yell.

-Doug

