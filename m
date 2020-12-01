Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738E32CA5DD
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 15:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391393AbgLAOih (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 09:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388116AbgLAOig (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 09:38:36 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EC1C0613CF
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 06:37:50 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id s9so3231271ljo.11
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5JqANZHI6IE63msBOtqjTP9Lnlr40urg8p0rQpF1os=;
        b=nUmBR6Rhr6RwUm/ExCSsIEelcOzUu2enLaU+tVqRNw1b+hIMOq/A0syBqJtsjqD+3g
         Kd1BAoJb5/eLkNWsJqmg22QoTwO6YToOWFgeeiNYGFlpkWRk+98Nf645tUA3/MNJgt1c
         abVbnUZjsTExWTHKhFugK/cEwEUNb5zLcDV0TtyPh6BA70LFaeUbMf4sUvyztf37CMAZ
         BpKBUUViwXZ9dKUDl7iOXPANg5+qlBpGAHFKrOxnnIRtyyPj4Y/BxSdIhsD4crpG30sW
         TfBkcBwOYxIfxbAEtL/mGIq1GFVn6xtsN6I+qAA+WDGagBAEEBYyaN26mHWrHWx8l2sW
         yUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5JqANZHI6IE63msBOtqjTP9Lnlr40urg8p0rQpF1os=;
        b=cEypDoZGKQMXL2esuZoZzygJ+68XOsIoD/C3ODZT5yTYt5CXpFLspieLU05qBygt5A
         Ke/HcCSUaX9fnNyqNBBEmfHkD9x7R689i8iBvWxH4biluvG5COM0d6gHgShskA8jk5nG
         hpLonfxAcpS3/dJ1/HU/eCg/NlT2aj/QCtVArZRO6elmdW81+xlrTTu/rxMonn9I6T+v
         cgmy+inE6mmOw8a2KG0vSFyGg5VokRNpjiohXeefEa0E4OaaSO3qFHJR4o8oWQOaJIFR
         IUFwOY0YVkcj/JVQJWpz/GLRdEsglsiAN/8QHkQdtfU96xVM7uH0OazSzZTPd+ManycK
         xBPQ==
X-Gm-Message-State: AOAM531WZVVGf1JIFLfRAwZv5jvjhNDo7c+n6abiJudzvEvAogvlmqav
        9zFeVFu2w/O0C6nQ1Xb5PVnklm22NawP2vVEgAoeYw==
X-Google-Smtp-Source: ABdhPJwI3mG+5vEbQWTkRy2ZlcHAebtOPhoj2FgTlzifmIeWuXJt4guAi8I8k1kqlc9IN+GThnSimPG/riS27TdNJnY=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr1447882ljb.286.1606833469260;
 Tue, 01 Dec 2020 06:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
In-Reply-To: <20201122170822.21715-3-mani@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 15:37:38 +0100
Message-ID: <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        angelo.dureghello@timesys.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:

> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
>
> Inspired from cp210x usb to serial converter driver.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

This looks good to me overall, provided that it plays well with the
serial port.

One minor notice:

> +enum gpio_pins {
> +       GPIO_RI = 0,
> +       GPIO_CD,
> +       GPIO_DSR,
> +       GPIO_DTR,
> +       GPIO_CTS,
> +       GPIO_RTS,
> +       GPIO_MAX,
> +};

You know the names of the pins...

> +       port_priv->gc.ngpio = 6;
> +       port_priv->gc.label = "xr_gpios";
> +       port_priv->gc.request = xr_gpio_request;
> +       port_priv->gc.free = xr_gpio_free;
> +       port_priv->gc.get_direction = xr_gpio_direction_get;
> +       port_priv->gc.direction_input = xr_gpio_direction_input;
> +       port_priv->gc.direction_output = xr_gpio_direction_output;
> +       port_priv->gc.get = xr_gpio_get;
> +       port_priv->gc.set = xr_gpio_set;
> +       port_priv->gc.owner = THIS_MODULE;
> +       port_priv->gc.parent = &port->dev;
> +       port_priv->gc.base = -1;
> +       port_priv->gc.can_sleep = true;

So assign port_priv->gc.names here as well with an array
of strings with the names ("RI", "CD", ... etc).
This makes it look really nice in userspace if you do
e.g. "lsgpio".

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
