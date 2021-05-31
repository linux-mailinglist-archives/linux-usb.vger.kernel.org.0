Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AA63957DB
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 11:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhEaJKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 05:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEaJKO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 May 2021 05:10:14 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D97C061574
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 02:08:33 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s25so14079941ljo.11
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wauq54g+YmoDGCeoLlJhonLmiBQuVj791qA6D9CfObU=;
        b=lgV6w59L7V6uq56gV4J4CgNeoxHn7agDpQ++AChBbFDXrjAygg9eFaAOcaqMjDRFn5
         fdMhMiIpBKgWYTXMWpw/0RfSdYPOsD18ddDY8Hn/Li8+qxLOfB1pOF9y2MHV7JIwA/RJ
         cHH+nXftyrgh951VglyTSFS0DbWoI0lCGGMSasn4YdwHMfxWKIzZ+unuzoiiMcOUxilA
         wBxuVmiEip6eE0V1jfWxOoWo6CgtyYlTi0Mq7nCTqQwXkhavBV+5cEcFxU/OeiSTASMZ
         E4ptljOvAQgTxNOfmWhqvyIv9uyswrNcAXkoB8bJ9Xkm9+1bZenLG6EiYWU09D3KK9yT
         5Hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wauq54g+YmoDGCeoLlJhonLmiBQuVj791qA6D9CfObU=;
        b=Y9MllyboQdT+0Tyyq7Ep7zTZpZ7lwLknufA8GUAsfQO0UZPRNSlSTZ3pcIIxsQ9Y9j
         ZDzbRIyJRXypQB/WTfvzevMCu/F8tKmiRRQCqzEADHRyealzBH2FeoyLItObCu8RjioN
         H7GQYfWcOISWx0awRRPphQYoAYFaNzKMPeLXfF3TxASEFsSLkCUvrWih400F3DN/vPI+
         taV5N5k45UbfVKvbVSmr7I1iKPok3zivt90zCmslee5nJLakRgKNujElX9eFWEePbQrY
         Z1bgEobt2raOwwuBZIqTsO+CxcY+rCKxwZz5dtUqqrOAbNma0fPee+D+0jxevMZ74Co3
         j95Q==
X-Gm-Message-State: AOAM533+AoJAsUmK+WWBeljjhbscD1m5GQa/PB5tNCCpE8yWVvQ/Zvit
        LzczOHKB2EBLz+C5v1SLj7TXegtZcP0A/Sf12+I=
X-Google-Smtp-Source: ABdhPJy6uvBei9oU+qT7BMDEEWBGpbke16dOVMNNtno2aQ0MPODW+U+3y0hwQGSCk+ey9ILSTfiCbZD1/25tj3Vtl9A=
X-Received: by 2002:a2e:8e86:: with SMTP id z6mr15540062ljk.302.1622452111938;
 Mon, 31 May 2021 02:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com> <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com> <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com> <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
 <YLSVsrhMZ2oOL1vM@hovoldconsulting.com> <YLShgrnPV35aXz84@hovoldconsulting.com>
In-Reply-To: <YLShgrnPV35aXz84@hovoldconsulting.com>
From:   Eero Lehtinen <debiangamer2@gmail.com>
Date:   Mon, 31 May 2021 12:08:20 +0300
Message-ID: <CAHS3B0H8zeDgbP6k+9TMeG07di6dO7FxH-WowN9NJ=8Gt+ZZeg@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
To:     Johan Hovold <johan@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Antti Palosaari <crope@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 11:42 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, May 31, 2021 at 09:52:18AM +0200, Johan Hovold wrote:
>
> > On Mon, May 31, 2021 at 09:58:09AM +0300, Eero Lehtinen wrote:
> > > Hi,
> > >
> > > I found dev_info messages from /var/log/messages.
> > >
> > > May 30 18:41:19 optipc kernel: [    3.143433] dvb_usb_rtl28xxu
> > > 1-1:1.0: rtl28xxu_identify_state - ret1 = 0
> > > May 30 18:41:19 optipc kernel: [    3.147688] dvb_usb_rtl28xxu
> > > 1-1:1.0: rtl28xxu_identify_state - ret2 = -32
> >
> > Ok, thanks. So this explains how things go wrong.
> >
> >       ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c);
> >       if (ret == -EPIPE) {
> >               dev->chip_id = CHIP_ID_RTL2831U;
> >       } else if (ret == 0) {
> >               dev->chip_id = CHIP_ID_RTL2832U;
> >
> > The chip used to be identified as RTL2832U but after my change it is
> > now detected as RTL2831U and the driver uses a separate implementation
> > with different hardcoded defaults.
> >
> > Commit d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip
> > type") added this code and claimed that the i2c register in question
> > would only be found on newer RTL2832U models. Yet, actually reading the
> > register returns an error in your setup.
> >
> > So, something is fishy here. Has anyone verified that the chip-type
> > detection works as expected for older RTL2831U?
>
> Ok, the driver just wants to know if the i2c-read vendor request exists,
> and actually reading the register will not work since the register may
> not even exist (e.g. depending on the demodulator).
>
> So it seems we need to keep this zero-length read request and only
> update the pipe argument to suppress the new WARN() in
> usb_submit_urb().
>
> Eero, could you try applying the below on top of -next and confirm that
> it suppresses the warning without messing up the type detection?
>
> Johan
>
>
> From 2cec8fa000152bcb997dd7aeeb0917ebf744a7bd Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Mon, 24 May 2021 10:55:19 +0200
> Subject: [PATCH v2] media: rtl28xxu: fix zero-length control request
>
> The direction of the pipe argument must match the request-type direction
> bit or control requests may fail depending on the host-controller-driver
> implementation.
>
> Control transfers without a data stage are treated as OUT requests by
> the USB stack and should be using usb_sndctrlpipe(). Failing to do so
> will now trigger a warning.
>
> The driver uses a zero-length i2c-read request for type detection so
> update the control-request code to use usb_sndctrlpipe() in this case.
>
> Note that actually trying to read the i2c register in question does not
> work as the register might not exist (e.g. depending on the demodulator)
> as reported by Eero Lehtinen <debiangamer2@gmail.com>.
>
> Reported-by: syzbot+faf11bbadc5a372564da@syzkaller.appspotmail.com
> Reported-by: Eero Lehtinen <debiangamer2@gmail.com>
> Fixes: d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip type")
> Cc: stable@vger.kernel.org      # 4.0
> Cc: Antti Palosaari <crope@iki.fi>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> index 97ed17a141bb..a6124472cb06 100644
> --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> @@ -37,7 +37,16 @@ static int rtl28xxu_ctrl_msg(struct dvb_usb_device *d, struct rtl28xxu_req *req)
>         } else {
>                 /* read */
>                 requesttype = (USB_TYPE_VENDOR | USB_DIR_IN);
> -               pipe = usb_rcvctrlpipe(d->udev, 0);
> +
> +               /*
> +                * Zero-length transfers must use usb_sndctrlpipe() and
> +                * rtl28xxu_identify_state() uses a zero-length i2c read
> +                * command to determine the chip type.
> +                */
> +               if (req->size)
> +                       pipe = usb_rcvctrlpipe(d->udev, 0);
> +               else
> +                       pipe = usb_sndctrlpipe(d->udev, 0);
>         }
>
>         ret = usb_control_msg(d->udev, pipe, 0, requesttype, req->value,
> --
> 2.31.1
>
Hi,

I confirm that it suppresses the warning without messing up the type detection.
