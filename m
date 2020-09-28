Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFD627B7EA
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 01:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgI1XTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 19:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgI1XSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 19:18:42 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2092FC0613D9
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 15:03:36 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id q13so1716847vsj.13
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJlpmrh8OP9v0KTQkMQU6yIsVKTQuYoG8z8keojXztQ=;
        b=Vflgwwag9X4yOLPhhM2gvRcixXXKtiiaUTh8P9UdA1q+McrRkD5M9A6mp8BpicLlS5
         JeLZRhNAXdBLERWJZJKnALk/ckJcLEw3iTyjQAkgsW6VyUBQvXO0CLmPmbSbo/cCKDEP
         wjcLwR9/smkXKmnw6XknUpw3yucE6k3ugl2t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJlpmrh8OP9v0KTQkMQU6yIsVKTQuYoG8z8keojXztQ=;
        b=TuIwu6NwGAtUc9uex2mujGxLGeMorViYUgBWdeFkmxoskEkL3f79uOjFWrEYhi7mqk
         QwdGUF22Xr1xyjr2j8EOBc/3Ucl80nNbtjSyCgj3OjDHK+Qd0uvrTzkX+7iaPJRWpA/S
         pShVMRPc1+1JdeQFF6knO5n9lIJA9+z8Z2puIRO30BLpCmJD2lUITsZnv5At9yqqn28E
         YEgTWZVIH8Lzic1n05L030PYRKDuxWjFV0ZCGUJf2qQ64HZFZmnQHRMmq9VR/bYzkRNa
         gLJ6AZjZDjZ8K0IsVxA3JxPlLzGyIQ+r0DGJG8X4TSM87oBv5hy8GJ8wRS2Dpy5SnM2q
         oqew==
X-Gm-Message-State: AOAM530VJtBh5++YZJHUKVdagdgy7jOciESy7JiDVUpYDR6TkAYlqaEO
        Gzx2GcJSWdbh86akXQDfSmQWfKNtaVjnJQ==
X-Google-Smtp-Source: ABdhPJw4rsnWUkLmKfdB1lULzXc9jjiHsb6chrBTcfU7cVn+XZcxRs53QCZQo3XSq0njki+upq7RMg==
X-Received: by 2002:a67:778f:: with SMTP id s137mr1317043vsc.32.1601330614445;
        Mon, 28 Sep 2020 15:03:34 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 103sm242256uau.13.2020.09.28.15.03.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 15:03:33 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id q13so1953137vkd.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 15:03:32 -0700 (PDT)
X-Received: by 2002:ac5:cced:: with SMTP id k13mr1126032vkn.7.1601330612418;
 Mon, 28 Sep 2020 15:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200928101326.v4.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20200928101326.v4.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Sep 2020 15:03:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+jnBkjT-heZ1h10pQPHsbuoY5+or0Kx7Oa4dAGTNW2w@mail.gmail.com>
Message-ID: <CAD=FV=V+jnBkjT-heZ1h10pQPHsbuoY5+or0Kx7Oa4dAGTNW2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] USB: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hovold <johan@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Sep 28, 2020 at 10:14 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> +static ssize_t power_off_in_suspend_show(struct device *dev, struct device_attribute *attr,
> +                          char *buf)
> +{
> +       struct onboard_hub *hub = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%d\n", hub->power_off_in_suspend);
> +}
> +
> +static ssize_t power_off_in_suspend_store(struct device *dev, struct device_attribute *attr,
> +                           const char *buf, size_t count)
> +{
> +       struct onboard_hub *hub = dev_get_drvdata(dev);
> +       bool val;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &val);
> +       if (ret < 0)
> +               return ret;
> +
> +       hub->power_off_in_suspend = val;
> +
> +       return count;
> +}
> +static DEVICE_ATTR_RW(power_off_in_suspend);

I wish there was a short name that meant "try to power off in suspend
unless there's an active wakeup source underneath you".  The name here
is a bit misleading since we might keep this powered if there's an
active wakeup source even if "power_off_in_suspend" is true...  I
wonder if it's easier to describe the opposite, like
"always_power_in_suspend".  Then, if that's false, it'll be in
"automatic" mode and if it's true it'll always keep powered.

I guess you can also argue about what the default should be.  I guess
if you just left it as zero-initted then we'd (by default) power off
in suspend.  To me that seems like a saner default, but I'm probably
biased.


> +static int onboard_hub_remove(struct platform_device *pdev)
> +{
> +       struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
> +       struct udev_node *node;
> +       struct usb_device *udev;
> +
> +       hub->going_away = true;
> +
> +       mutex_lock(&hub->lock);
> +
> +       /* unbind the USB devices to avoid dangling references to this device */
> +       while (!list_empty(&hub->udev_list)) {
> +               node = list_first_entry(&hub->udev_list, struct udev_node, list);
> +               udev = node->udev;
> +
> +               /*
> +                * Unbinding the driver will call onboard_hub_remove_usbdev(),
> +                * which acquires hub->lock.  We must release the lock first.
> +                */
> +               get_device(&udev->dev);
> +               mutex_unlock(&hub->lock);
> +               device_release_driver(&udev->dev);
> +               put_device(&udev->dev);
> +               mutex_lock(&hub->lock);

I didn't try to grok all the removal corner cases since it seems like
you and Alan have been going over that.  If you feel like this needs
extra attention then yell and I'll look closer.


> +static const struct of_device_id onboard_hub_match[] = {
> +       { .compatible = "onboard-usb-hub" },
> +       { .compatible = "realtek,rts5411" },

You only need "onboard-usb-hub" here.  The bindings still have
"realtek,rts5411" in them in case we later have to do something
different/special on that device, but the whole idea of including the
generic is that we don't need to add every specific instance to this
table.

The above is pretty much nits, though, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
