Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34281BDB8A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 14:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgD2MMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726741AbgD2MMi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 08:12:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF8BC035493
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 05:12:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f11so2371057ljp.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vmsu/fwPs4oBXZNMxWYLe7MCK2oXBROz7k2oW8iuVU=;
        b=zwlAAJ9nJlMD2a5IChrfCW2OFWh0NNBeo2TJZRkCy2uyh37eWiMVFQ72IPC7DcpMxx
         fQRcjYZJ5JKxaU8fs/knzvbTgYG0HoF02FuSesWF09CKEwzf14V+pyXM5eCxyLv3anxY
         crZSju5V3kzYc0GRbRYi1qiyuQsAWQzWRlTo34hgoCWWxVhBrUFMRVcKHsuapJABo4T4
         xIZ2EeNzKCB6GucCqqcPeNVhHwtCx8SA93ToNo19jWk/BnOmKuwq/sw2FBlvsQNcZASw
         O5IK8Ldupd2KxPbf8XLp7bV72eGzyjxKqRPaSuN/8adAJuqQj6KEb3bs31YGhRgRgZx+
         tfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vmsu/fwPs4oBXZNMxWYLe7MCK2oXBROz7k2oW8iuVU=;
        b=eqa5Um4TTKR1OOBdlGH9kpSxUJmYIfxNrMgcZ9PvX/lMveU4VXba5+pb8nNPwDEHyy
         EOsCKHP4pSR6RzpFYKaZXNO0wL0O9tlW/2hLMxYex1PjXkDd9Np70MoDGyQsQXg7TNwq
         Sg5cdBl/WxxQLi7cZIGre24AogYaVQjbML2qHLsoH1A6NrwV7kwhbKAEAZVEV5bay18F
         PliD9Hmy/LCb7lX7io1HwZSWXWbC8NubPV7sQnM3DHMGmJ+DHTMgiOAYU3K+OE1bwxWX
         SxpOPTof0fJDSRyA6sE56JrPN0HibDkGzFrRfJjNlnwDRyvOylJK5Ncq1lgBGc1yIgxn
         ZKAw==
X-Gm-Message-State: AGi0PuaqNHHpy0WN7V+Vvwcl6Ap2L+YfDokMhh8vrnyRA+sDdV3LUTXU
        IZPDU5Asy/NcBT89swnGmqWmY036ZBSkzToxKPbyLA==
X-Google-Smtp-Source: APiQypJadb433yUV+3CvSyHkcenoW49EI2HbqVsg3NYeo//Kqhy39vGkteTUQQYPvvWVEtHeYRVPW0nafRpsIBBtHdU=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr20911578ljp.277.1588162356793;
 Wed, 29 Apr 2020 05:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428195651.6793-1-mani@kernel.org> <20200428195651.6793-3-mani@kernel.org>
In-Reply-To: <20200428195651.6793-3-mani@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:12:24 +0200
Message-ID: <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
To:     mani@kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 9:57 PM <mani@kernel.org> wrote:

> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

That's a nice and clean GPIO driver.

I would change this:

   port_priv->gc.label = "xr_gpios";

to something that is device-unique, like "xr-gpios-<serial number>"
which makes it easy to locate the GPIOs on a specific serial converter
for lab use. However the USB serial maintainers know better what
to use here. Whatever makes a USB-to-serial unique from a TTY
point of view is probably fine with me too.

My idea is that people might want to know which USB cable
this is sitting on, so I have this USB cable and from this label
I can always figure out which GPIO device it is.

Either way, it is not a super-big issue so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this a off-the-shelf product that can be bought or is it mainly
integrated on boards?

I'm asking because I'm looking for a neat USB-to-serial adapter
with some GPIOs (2 is enough) that can be used for reset and
power cycling of lab boards using one simple piece of equipment.

Yours,
Linus Walleij
