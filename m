Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5959827BA92
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 03:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbgI2B7y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 21:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgI2B7y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 21:59:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D09C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 18:59:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x22so2967303pfo.12
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 18:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WhT95g7YAtzbIyqI6THWYJwO/6uBiBP4C3UcEuIo1CQ=;
        b=brsQhYryGAnvihYoHEddEhtL1o19bBQiYE0uTXBb6FCePWeFLvCHkpr4Sq/xqziFPi
         xdBfxu4sB/Haxa+v+TPfZndFjylz6G6Bvc2YTnDTAZBLWzJy5/tnehrfmrgK8no50NFd
         OoGp/npEWFW9ug2wI7Wj/C1J4ELG/LU6/Yyiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WhT95g7YAtzbIyqI6THWYJwO/6uBiBP4C3UcEuIo1CQ=;
        b=Rm3Vnkt+eTbTWRApwxmiWhdZozURTN1bHT2xODeieSFCC5S5qjHxg1l1hDKNrEYaGa
         YZ7BgH9yxMQnVXaeok4rEwvBpKKOhMz8KNYRhjIutT6MWQoGs2r/ar0+5FYl2g/am8w2
         Fft1/XiiH1vMETQqIHemOGrclRYE+w8SteNFr2ck8QI0FXSb42acEDK/ZQquigSsCpgh
         U40fLxyMJxeYf4EEpJiBYdc3UjdMEox/qhs5YcIL6NDNqKoNn6pO9Dgr40tH5vsZ/jPJ
         EqT11gp2ZJKp+0mcFG0NzfZCvS68+S3G3/epL3KcVuUn7gukY96QIGPWLj2vThbcmGmr
         0TGQ==
X-Gm-Message-State: AOAM530NAe6VgigzGPRlGX0YWmtksUjtEIjeL/1lPmxhZ5Y86UE7DVez
        2/MFRc8asLX0Ejg2au71MvzTMA==
X-Google-Smtp-Source: ABdhPJw5Iitufx3uByceiF28y3PFvGfDGCeQ0L6/LXQTqgGh0p6j1nvkzjlCrDTvhnods3yvYOmiwA==
X-Received: by 2002:a62:924c:0:b029:151:c014:691e with SMTP id o73-20020a62924c0000b0290151c014691emr2035006pfd.41.1601344793474;
        Mon, 28 Sep 2020 18:59:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o4sm3093126pfh.39.2020.09.28.18.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 18:59:53 -0700 (PDT)
Date:   Mon, 28 Sep 2020 18:59:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [PATCH v4 2/2] USB: misc: Add onboard_usb_hub driver
Message-ID: <20200929015951.GB1099144@google.com>
References: <20200928101326.v4.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200928101326.v4.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=V+jnBkjT-heZ1h10pQPHsbuoY5+or0Kx7Oa4dAGTNW2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=V+jnBkjT-heZ1h10pQPHsbuoY5+or0Kx7Oa4dAGTNW2w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Doug,

On Mon, Sep 28, 2020 at 03:03:20PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 28, 2020 at 10:14 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > +static ssize_t power_off_in_suspend_show(struct device *dev, struct device_attribute *attr,
> > +                          char *buf)
> > +{
> > +       struct onboard_hub *hub = dev_get_drvdata(dev);
> > +
> > +       return sprintf(buf, "%d\n", hub->power_off_in_suspend);
> > +}
> > +
> > +static ssize_t power_off_in_suspend_store(struct device *dev, struct device_attribute *attr,
> > +                           const char *buf, size_t count)
> > +{
> > +       struct onboard_hub *hub = dev_get_drvdata(dev);
> > +       bool val;
> > +       int ret;
> > +
> > +       ret = kstrtobool(buf, &val);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       hub->power_off_in_suspend = val;
> > +
> > +       return count;
> > +}
> > +static DEVICE_ATTR_RW(power_off_in_suspend);
> 
> I wish there was a short name that meant "try to power off in suspend
> unless there's an active wakeup source underneath you".  The name here
> is a bit misleading since we might keep this powered if there's an
> active wakeup source even if "power_off_in_suspend" is true...  I
> wonder if it's easier to describe the opposite, like
> "always_power_in_suspend".  Then, if that's false, it'll be in
> "automatic" mode and if it's true it'll always keep powered.

I agree that the name is somewhat misleading and it's hard find something
concise. 'always_power_in_suspend' would certainly be more correct, it
would make it slightly harder to configure the 'always power off' case
though, since you would have to make sure that USB wakeup is disabled. IIUC
this should be the default though (unless explicitly enabled), so probably
it's not so bad. I'm somewhat undecided between 'always_power_in_suspend'
and 'keep_powered_in_suspend'.

> I guess you can also argue about what the default should be.  I guess
> if you just left it as zero-initted then we'd (by default) power off
> in suspend.  To me that seems like a saner default, but I'm probably
> biased.

I tend to agree, though yes, you could make a valid argument for either
value.

> > +static int onboard_hub_remove(struct platform_device *pdev)
> > +{
> > +       struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
> > +       struct udev_node *node;
> > +       struct usb_device *udev;
> > +
> > +       hub->going_away = true;
> > +
> > +       mutex_lock(&hub->lock);
> > +
> > +       /* unbind the USB devices to avoid dangling references to this device */
> > +       while (!list_empty(&hub->udev_list)) {
> > +               node = list_first_entry(&hub->udev_list, struct udev_node, list);
> > +               udev = node->udev;
> > +
> > +               /*
> > +                * Unbinding the driver will call onboard_hub_remove_usbdev(),
> > +                * which acquires hub->lock.  We must release the lock first.
> > +                */
> > +               get_device(&udev->dev);
> > +               mutex_unlock(&hub->lock);
> > +               device_release_driver(&udev->dev);
> > +               put_device(&udev->dev);
> > +               mutex_lock(&hub->lock);
> 
> I didn't try to grok all the removal corner cases since it seems like
> you and Alan have been going over that.  If you feel like this needs
> extra attention then yell and I'll look closer.

Thanks, I think we are good, especially after the additional testing
I did today.

> > +static const struct of_device_id onboard_hub_match[] = {
> > +       { .compatible = "onboard-usb-hub" },
> > +       { .compatible = "realtek,rts5411" },
> 
> You only need "onboard-usb-hub" here.  The bindings still have
> "realtek,rts5411" in them in case we later have to do something
> different/special on that device, but the whole idea of including the
> generic is that we don't need to add every specific instance to this
> table.

right, I'll remove the realtek string in the next version.

> The above is pretty much nits, though, so:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
