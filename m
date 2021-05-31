Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDBA3957E7
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 11:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhEaJPU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 05:15:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:51144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhEaJPT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 05:15:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E37611CA;
        Mon, 31 May 2021 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622452420;
        bh=A32nT1Z3+JXZsbh1lWvxB8q/b08R1Iy/4IbiBTGaDQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CFQO2TaRTMNuvCIU7xFCPPjl9rvbg3coaI8VuXIZrQORJgcPPapBsAL5bsJbakjEo
         yFddGQwFCdINpunjKwMHRYO7KB4Gmm6ZjojNFF5oGxFdx9les84XIpa6+UjfcbHjrU
         vT/fD2V7UTDtBMZ+kvriT3Yzny3fWwWq4rM4iGltLpl5Ko4wFSgtcM3za+JjNiphCZ
         ObQKdOx+79DHwfv+WluN/qF2fFAECII/pDESl7WYAEdRAsBR9eHuu/zztFN7BUPv7U
         H4f8f09ghIP9R5IgrxrWwuwVZZ4jT4qzBQiXgLgDnwvXZQTnc95rW99+pguf65+xUn
         wjrLVBzPAWwKg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lndzK-000263-TS; Mon, 31 May 2021 11:13:35 +0200
Date:   Mon, 31 May 2021 11:13:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Antti Palosaari <crope@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLSovrmj3AgwUUGm@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
 <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
 <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
 <YLShgrnPV35aXz84@hovoldconsulting.com>
 <CAHS3B0H8zeDgbP6k+9TMeG07di6dO7FxH-WowN9NJ=8Gt+ZZeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS3B0H8zeDgbP6k+9TMeG07di6dO7FxH-WowN9NJ=8Gt+ZZeg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 12:08:20PM +0300, Eero Lehtinen wrote:
> On Mon, May 31, 2021 at 11:42 AM Johan Hovold <johan@kernel.org> wrote:

> > Ok, the driver just wants to know if the i2c-read vendor request exists,
> > and actually reading the register will not work since the register may
> > not even exist (e.g. depending on the demodulator).
> >
> > So it seems we need to keep this zero-length read request and only
> > update the pipe argument to suppress the new WARN() in
> > usb_submit_urb().
> >
> > Eero, could you try applying the below on top of -next and confirm that
> > it suppresses the warning without messing up the type detection?

> > From 2cec8fa000152bcb997dd7aeeb0917ebf744a7bd Mon Sep 17 00:00:00 2001
> > From: Johan Hovold <johan@kernel.org>
> > Date: Mon, 24 May 2021 10:55:19 +0200
> > Subject: [PATCH v2] media: rtl28xxu: fix zero-length control request
> >
> > The direction of the pipe argument must match the request-type direction
> > bit or control requests may fail depending on the host-controller-driver
> > implementation.
> >
> > Control transfers without a data stage are treated as OUT requests by
> > the USB stack and should be using usb_sndctrlpipe(). Failing to do so
> > will now trigger a warning.
> >
> > The driver uses a zero-length i2c-read request for type detection so
> > update the control-request code to use usb_sndctrlpipe() in this case.
> >
> > Note that actually trying to read the i2c register in question does not
> > work as the register might not exist (e.g. depending on the demodulator)
> > as reported by Eero Lehtinen <debiangamer2@gmail.com>.
> >
> > Reported-by: syzbot+faf11bbadc5a372564da@syzkaller.appspotmail.com
> > Reported-by: Eero Lehtinen <debiangamer2@gmail.com>
> > Fixes: d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip type")
> > Cc: stable@vger.kernel.org      # 4.0
> > Cc: Antti Palosaari <crope@iki.fi>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > index 97ed17a141bb..a6124472cb06 100644
> > --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> > @@ -37,7 +37,16 @@ static int rtl28xxu_ctrl_msg(struct dvb_usb_device *d, struct rtl28xxu_req *req)
> >         } else {
> >                 /* read */
> >                 requesttype = (USB_TYPE_VENDOR | USB_DIR_IN);
> > -               pipe = usb_rcvctrlpipe(d->udev, 0);
> > +
> > +               /*
> > +                * Zero-length transfers must use usb_sndctrlpipe() and
> > +                * rtl28xxu_identify_state() uses a zero-length i2c read
> > +                * command to determine the chip type.
> > +                */
> > +               if (req->size)
> > +                       pipe = usb_rcvctrlpipe(d->udev, 0);
> > +               else
> > +                       pipe = usb_sndctrlpipe(d->udev, 0);
> >         }
> >
> >         ret = usb_control_msg(d->udev, pipe, 0, requesttype, req->value,
> > --
> > 2.31.1

> I confirm that it suppresses the warning without messing up the type
> detection.

Thanks for confirming. Is it ok if I add also a tested-by tag for you to
the commit message when I send this to the media people?

Johan
