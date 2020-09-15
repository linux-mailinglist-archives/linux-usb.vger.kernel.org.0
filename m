Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EA2269DA8
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 07:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgIOFCN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 01:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgIOFCM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 01:02:12 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A82C06178A
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2020 22:02:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u9so704012plk.4
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2020 22:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+rJl/SN8VzlsuUk4obnAMb9I4I9Qt/aMpgHDEq3gB1M=;
        b=gtDU1fvGqkOJfvyOKMx+x/wtHT8ERcOW738rREoDVGyNeJfLN2yXBdwfHvNeNIFA08
         PvjDjU6WaxYUkjB6+1I5fuEfhJhFfrqhiV1XALUJV/avTSeZuXt7RmVK3k2C/XTgqUML
         rstxXBqaxTn5nCKcQr6xPOQWRVLQcRWJJW6/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+rJl/SN8VzlsuUk4obnAMb9I4I9Qt/aMpgHDEq3gB1M=;
        b=bWJxaczbu00bsBQ9hdI+jwO/ybvNpHjwXQXscNso/vhnmNx4e9ETG6DPxQQBF+HE/w
         lG8QJYxiB/IyrqIh2owvpDrD/DVNLdVrab1dK0ulzHgL7EXYzXx7Jp4nnJSPorMRPRqV
         7puMsS2Ze9nrfe2giwUoyTxEdFIDes0hW+WTYeQyyOfLmVS7IxA3jBKo0GYPVmPxjZql
         LbPhsk9LDroXKBnPXU2An6s3kNADtj0iGQM0zP80Z29v3q9WYrStP4pz7grEf69akf08
         GOCyHWezwwuuX6cnznAJLXd0bmv3C366Md/YjF2d8YmYh6x/u8fh9GEDlFaaOl4ZoWkm
         6n9A==
X-Gm-Message-State: AOAM533tTVJMxngTdH1B+LkUAjChclKt1IAIxGLUUObgjw/+kVnDyVkL
        WEdKFzx9RzLHRjDFv7NY+HK6Kg==
X-Google-Smtp-Source: ABdhPJz6u4Q4o2XlOKbqIveLz5RbJqD2/bPya4po/sIJUgFm4LGMHmFEpKDyUa8AiZbh0y6LRzkz2Q==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr2329578pjr.223.1600146130093;
        Mon, 14 Sep 2020 22:02:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id j4sm12594305pfd.101.2020.09.14.22.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 22:02:09 -0700 (PDT)
Date:   Mon, 14 Sep 2020 22:02:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] USB: misc: Add onboard_usb_hub driver
Message-ID: <20200915050207.GF2022397@google.com>
References: <20200914112716.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200914112716.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200915025426.GA17450@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915025426.GA17450@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

thanks for your comments!

On Tue, Sep 15, 2020 at 02:55:06AM +0000, Peter Chen wrote:
> On 20-09-14 11:27:49, Matthias Kaehlcke wrote:
> > The main issue this driver addresses is that a USB hub needs to be
> > powered before it can be discovered. For onboard hubs this is often
> > solved by supplying the hub with an 'always-on' regulator, which is
> > kind of a hack. Some onboard hubs may require further initialization
> > steps, like changing the state of a GPIO or enabling a clock, which
> > requires further hacks. This driver creates a platform device
> > representing the hub which performs the necessary initialization.
> > Currently it only supports switching on a single regulator, support
> > for multiple regulators or other actions can be added as needed.
> > Different initialization sequences can be supported based on the
> > compatible string.
> > 
> > Besides performing the initialization the driver can be configured
> > to power the hub off during system suspend. This can help to extend
> > battery life on battery powered devices, which have no requirements
> > to keep the hub powered during suspend. The driver can also be
> > configured to leave the hub powered when a wakeup capable USB device
> > is connected when suspending, and keeping it powered otherwise.
> > 
> > Technically the driver consists of two drivers, the platform driver
> > described above and a very thin USB driver that subclasses the
> > generic hub driver. The purpose of this driver is to provide the
> > platform driver with the USB devices corresponding to the hub(s)
> > (a hub controller may provide multiple 'logical' hubs, e.g. one
> > to support USB 2.0 and another for USB 3.x).
> 
> I agree with Alan, you may change this driver to apply for generic
> onboard USB devices.

I interpreted that Alan only corrected my terminology and didn't
suggest to extend the driver to generic onboard devices. Actually I
like that we now have a abstraction for a specific physical 'device',
rather than the initial usb_hub_pwr/usb_hub_psupply split, which seemed
a bit contrived (thanks Doug!).

> > +static int onboard_hub_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct onboard_hub *hub;
> > +
> > +	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
> > +	if (!hub)
> > +		return -ENOMEM;
> > +
> > +	hub->vdd = devm_regulator_get(dev, "vdd");
> > +	if (IS_ERR(hub->vdd))
> > +		return PTR_ERR(hub->vdd);
> > +
> > +	hub->dev = dev;
> > +	mutex_init(&hub->lock);
> > +	INIT_LIST_HEAD(&hub->udev_list);
> > +
> > +	hub->cfg.power_off_in_suspend = of_property_read_bool(dev->of_node, "power-off-in-suspend");
> > +	hub->cfg.wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
> 
> Do you really need these two properties? If the device (and its children
> if existed) has wakeup enabled, you keep power in suspend, otherwise,
> you could close it, any exceptions?

That would work for my use case, but I'm not sure it's a universally
good configuration.

I don't have a specific USB device in mind, but you could have a device
that shouldn't lose it's context during suspend or keep operating
autonomously (e.g. a sensor with a large buffer collecting samples). Not
sure if something like this exists in the real though.

I'm not an expert, but it seems there are USB controllers with wakeup
support which is always enabled. A board with such a controller then
couldn't have a policy to power down the hub regardless of wakeup
capable devices being connected.

Thanks

Matthias
