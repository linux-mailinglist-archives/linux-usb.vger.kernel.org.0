Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C8F395294
	for <lists+linux-usb@lfdr.de>; Sun, 30 May 2021 20:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhE3TAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 15:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhE3TAT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 15:00:19 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9536AC061574
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 11:58:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x38so13398335lfa.10
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 11:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57M/pteyw4/Q9RkiGzuesiD6ALYPFvYk7HXjb25V0uM=;
        b=QDx8thuT89GiF/qxX++O6jVRMdc7UYlfFJQ4fE0oSA3vFgU1TWkVC4xd0A3NhMzGhn
         IKJmwaGf0DN+cbVpXpGNWpVq+sO5ckaJl2fgszgIx1GQmyx9QDQuiywr4Jp0qDEtjp8/
         tPBNwBF5/5Xa4F2DY6xdZCdDKJUxIoeJZyYi2/vyw5DqnLig2UllE5lGZOJwGkS8RgaZ
         U3vvzJ3wFFv6b+jwR0J874DP67dQP6fchP6EB+oBQqCaGe/kUBH8PhechBija9Kll5X8
         mh5o6aS56205luISd4FANqiPK8tw5CL4mKrN3c2tFPkTPAj58oh6Hllbegq5IyKSGAWM
         5JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57M/pteyw4/Q9RkiGzuesiD6ALYPFvYk7HXjb25V0uM=;
        b=cTJUfjDvhJseqNlselVT46/430/NYVrdgBC2jqsVZpiDKe4tsoQOgJf8T0GG8XsMnJ
         4Uk2KylGaksA4jdgKnL7AzM+zUaiqlcZpdfjX374rtLXzpmL4/E7xYL5iFuJ54stIE5P
         Fv2+pyclg3G2bG+VJWsjFqwMldHp+NYOSUuLEl5MooGZCwtlYTpnygoVuP1RxoEA8PSi
         iJ77Jlwyb79L82Bj9BCYufnfvvIjg7RKDsbN8Y48DuraPybru5OCMaI97xCjBXYpNaW3
         zoUmlYrF+s3ar7fJMfJOR6AoDiKpINIfX7NF8wlgNkH17AVZ8LjOROkqNstwmvXTcURA
         yBQQ==
X-Gm-Message-State: AOAM530vyib1OeeseeiGaFH2Nedus+1drltB98GIxKvwuANtA18qniTV
        pLaxKbOCstN79AAouSai23xmAUA7aueC8X/N+Pn/N3dpBFY=
X-Google-Smtp-Source: ABdhPJzkjoyvtSDzWGMNAw3+wip2E6q45i5ntoLWvar2w8HjBhpxtGXL0b6J5wy+rp3iCbng6u+hP0GNloZOvgN0cLs=
X-Received: by 2002:ac2:5a0d:: with SMTP id q13mr12307856lfn.399.1622401117746;
 Sun, 30 May 2021 11:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com> <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
In-Reply-To: <YLPTJ3HIos630Btb@hovoldconsulting.com>
From:   Eero Lehtinen <debiangamer2@gmail.com>
Date:   Sun, 30 May 2021 21:58:26 +0300
Message-ID: <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I used dev_dbg instead of dev_info and got:
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:648
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:630
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret2 = %d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:627
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret1 = %d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:620
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "\012"

dev_info does not show up with dmesg or dynamic debug. Should the
kernel use the CXD2837ER driver and not the mxl5005s driver like it
does with this patch.

On Sun, May 30, 2021 at 9:02 PM Johan Hovold <johan@kernel.org> wrote:
>
> [ Please avoid top-posting; instead reply in-line as I do below. ]
>
> On Sun, May 30, 2021 at 06:57:12PM +0300, Eero Lehtinen wrote:
> > cat /sys/kernel/debug/dynamic_debug/control | grep rtl28xxu.c
>
> > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
> > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"
>
> The dev_info() added by the instrumentation patch (included again below)
> should show up in dmesg if you applied it and rebuilt and installed the
> driver correctly.
>
> You can enable dynamic debugging as well to determine if the chip type
> is detected differently (with and without the zero-length control
> transfer patch), for example:
>
>         echo module dvb_usb_rtl28xxu +p > /sys/kernel/debug/dynamic_debug/control
>
> but it won't log the return value from the i2c read in question.
>
> > On Sun, May 30, 2021 at 4:54 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Sun, May 30, 2021 at 03:23:36PM +0300, Eero Lehtinen wrote:
> > > > Hi,
> > > >
> > > > I tested Johans latest patch and my dvb-t stick can find the channel
> > > > list but not to tune to them. It uses the mxl5005s driver again with
> > > > repeating mxl5005s I2C write failed messages:
> > > >
> > > > [   23.276076] mxl5005s I2C reset failed
>
> > > It was just an instrumentation patch to gather more information. Can you
> > > post the logs from when probing/using the device with that patch in
> > > place?
> > >
> > > Specifically, look for the "rtl28xxu_identify_state" entries, but please
> > > include the full log in case there are more hints in there.
> > >
> > > Also, please keep me and Alan on CC (along with the list) so that we get
> > > your replies directly. The list can be a bit slow at forwarding at
> > > times.
>
> Johan
>
>
> From eda5deca4cbdebe21718bb13f76b8eed0673f9be Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Mon, 24 May 2021 10:55:19 +0200
> Subject: [PATCH] media: rtl28xxu: add type-detection instrumentation
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> index 97ed17a141bb..21e565603108 100644
> --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
> @@ -612,8 +612,10 @@ static int rtl28xxu_read_config(struct dvb_usb_device *d)
>  static int rtl28xxu_identify_state(struct dvb_usb_device *d, const char **name)
>  {
>         struct rtl28xxu_dev *dev = d_to_priv(d);
> +       u8 buf[1];
>         int ret;
>         struct rtl28xxu_req req_demod_i2c = {0x0020, CMD_I2C_DA_RD, 0, NULL};
> +       struct rtl28xxu_req req_demod_i2c2 = {0x0020, CMD_I2C_DA_RD, 1, buf};
>
>         dev_dbg(&d->intf->dev, "\n");
>
> @@ -622,6 +624,11 @@ static int rtl28xxu_identify_state(struct dvb_usb_device *d, const char **name)
>          * by old RTL2831U.
>          */
>         ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c);
> +       dev_info(&d->intf->dev, "%s - ret1 = %d\n", __func__, ret);
> +
> +       ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c2);
> +       dev_info(&d->intf->dev, "%s - ret2 = %d\n", __func__, ret);
> +
>         if (ret == -EPIPE) {
>                 dev->chip_id = CHIP_ID_RTL2831U;
>         } else if (ret == 0) {
> --
> 2.31.1
>
