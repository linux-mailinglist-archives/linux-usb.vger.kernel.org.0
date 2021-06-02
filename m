Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE0139899F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 14:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhFBMfj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 08:35:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:59774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhFBMfh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 08:35:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89D1A613B8;
        Wed,  2 Jun 2021 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622637234;
        bh=+yRoVITm0HvDDx24fNDJ/xcU6z/dOrokBkWlIMtk8Yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCOb4w+MGvqQzcnvlIw5biGr29twNrCJdvlXUU0xIWNhHCw9NTyVHH4yU4/AzT7J+
         fb0Yoc9My8oqgAI2MbVeJrCDnM4lhNyThLNQtAw8vRYBYhH0PNaQRkhW4Ic5MNw+xr
         01KqTfxaYZOCwQP74OwUmE1rITt2MeMFPgBi80AbdPpcMtYuxdBkwe33sthJaimTCT
         D1i9734/3DSSCSxOg/5ps99cypyyep7jEfeEsHCTMEUzYhae/qVTEI9oL7AoJ4zvvU
         ZdEHr6/0y1phhGazSH9Dx/xHtv02hbV9gN5s7x3R3ZDhJqmBrL5BQxcUsBYOY8F0fV
         Pt+GGnbAUTvrQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1loQ4G-0000FS-8P; Wed, 02 Jun 2021 14:33:52 +0200
Date:   Wed, 2 Jun 2021 14:33:52 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Antti Palosaari <crope@iki.fi>
Cc:     Eero Lehtinen <debiangamer2@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLd6sFfTe2Exp0Ej@hovoldconsulting.com>
References: <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
 <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
 <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
 <YLShgrnPV35aXz84@hovoldconsulting.com>
 <CAHS3B0H8zeDgbP6k+9TMeG07di6dO7FxH-WowN9NJ=8Gt+ZZeg@mail.gmail.com>
 <YLSovrmj3AgwUUGm@hovoldconsulting.com>
 <660772b3-0597-02db-ed94-c6a9be04e8e8@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <660772b3-0597-02db-ed94-c6a9be04e8e8@iki.fi>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 02, 2021 at 02:01:02PM +0300, Antti Palosaari wrote:
> On 5/31/21 12:13 PM, Johan Hovold wrote:
> > On Mon, May 31, 2021 at 12:08:20PM +0300, Eero Lehtinen wrote:
> >> On Mon, May 31, 2021 at 11:42 AM Johan Hovold <johan@kernel.org> wrote:

> >>>  From 2cec8fa000152bcb997dd7aeeb0917ebf744a7bd Mon Sep 17 00:00:00 2001
> >>> From: Johan Hovold <johan@kernel.org>
> >>> Date: Mon, 24 May 2021 10:55:19 +0200
> >>> Subject: [PATCH v2] media: rtl28xxu: fix zero-length control request
> >>>
> >>> The direction of the pipe argument must match the request-type direction
> >>> bit or control requests may fail depending on the host-controller-driver
> >>> implementation.
> >>>
> >>> Control transfers without a data stage are treated as OUT requests by
> >>> the USB stack and should be using usb_sndctrlpipe(). Failing to do so
> >>> will now trigger a warning.
> >>>
> >>> The driver uses a zero-length i2c-read request for type detection so
> >>> update the control-request code to use usb_sndctrlpipe() in this case.
> >>>
> >>> Note that actually trying to read the i2c register in question does not
> >>> work as the register might not exist (e.g. depending on the demodulator)
> >>> as reported by Eero Lehtinen <debiangamer2@gmail.com>.
> >>>
> >>> Reported-by: syzbot+faf11bbadc5a372564da@syzkaller.appspotmail.com
> >>> Reported-by: Eero Lehtinen <debiangamer2@gmail.com>
> >>> Fixes: d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip type")
> >>> Cc: stable@vger.kernel.org      # 4.0
> >>> Cc: Antti Palosaari <crope@iki.fi>
> >>> Signed-off-by: Johan Hovold <johan@kernel.org>
> >>> ---
> >>>   drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
> >>>   1 file changed, 10 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> >>> index 97ed17a141bb..a6124472cb06 100644
> >>> --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> >>> +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> >>> @@ -37,7 +37,16 @@ static int rtl28xxu_ctrl_msg(struct dvb_usb_device *d, struct rtl28xxu_req *req)
> >>>          } else {
> >>>                  /* read */
> >>>                  requesttype = (USB_TYPE_VENDOR | USB_DIR_IN);
> >>> -               pipe = usb_rcvctrlpipe(d->udev, 0);
> >>> +
> >>> +               /*
> >>> +                * Zero-length transfers must use usb_sndctrlpipe() and
> >>> +                * rtl28xxu_identify_state() uses a zero-length i2c read
> >>> +                * command to determine the chip type.
> >>> +                */
> >>> +               if (req->size)
> >>> +                       pipe = usb_rcvctrlpipe(d->udev, 0);
> >>> +               else
> >>> +                       pipe = usb_sndctrlpipe(d->udev, 0);
> >>>          }
> >>>
> >>>          ret = usb_control_msg(d->udev, pipe, 0, requesttype, req->value,
> >>> --
> >>> 2.31.1
> > 
> >> I confirm that it suppresses the warning without messing up the type
> >> detection.
> > 
> > Thanks for confirming. Is it ok if I add also a tested-by tag for you to
> > the commit message when I send this to the media people?
> 
> I can also confirm it works for both rtl2831u and rtl2832u.

Thanks for testing, Antti.

Johan
