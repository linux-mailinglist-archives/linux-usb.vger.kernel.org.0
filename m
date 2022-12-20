Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8903065292E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 23:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiLTWu3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 17:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiLTWu2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 17:50:28 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F451A801
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:50:27 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id 3so7169489iou.12
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6AJ1/d+70DmuUJEgzES3n4ITU5GCSDoCeNI/61cz8fw=;
        b=V2vPBvfqDV/kbEO2zmYO4DTY9f+yj3Pw6U+7s7iuzFD6fpPHDx0/j7CT0PcQmQ3KzR
         RoowOqF48QDMZ8pUHWcjZW00AzlowaKAjjX04zIKPNs8TWqu/IVD6OUokKiru4lz8EkV
         yk6m3+b8J0QddFPmLRdUEOaeBBWa0orfk1BVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AJ1/d+70DmuUJEgzES3n4ITU5GCSDoCeNI/61cz8fw=;
        b=Vtp97E6rypJRdaQDqMky5qABUhr0bT8REBGUeinxHX8KwAcTN/wuj4qcad1ZvmLv5X
         SFMz+nGHiH4pd+gU5nVTH1xaKkIwSCs3Bveb6U08XtfESKugOiK3tsZy1KdMpQguNtu3
         qesXyGrwi6kOTXZ0gzByhFwOqvZqHuuBo7jZUyDn0wThbFrXdhpOd3CE8uFAhf4hnbE4
         QM3egMHM4l9JTVilC0r0k8QNN3GkaRGR6DKgb3ZWGHeHLy968o2W+OFEQKu1J7/Jj9/j
         HOpuFU8NL8GLaS7yWxUKNH6kNVQWrUZ9jI1H3a1vZpotDnM9EG+nuLjmvSg0knaLUN3Z
         96Kw==
X-Gm-Message-State: ANoB5plB17IKDoTBZHR/UzlXWxhVuF+9Prr1ozE13+/IyvfQ4yd1dR1T
        yAy+fS5M4od15x9DrJU0XWVqHg==
X-Google-Smtp-Source: AA0mqf5W3KRMEc2XwPx2VUN7l3lDcQ9jeTim49bEFUU1qgOWc02ys+esBSQmSTTFDUy/8y8x5T9K7w==
X-Received: by 2002:a6b:e703:0:b0:6e3:1cfe:4914 with SMTP id b3-20020a6be703000000b006e31cfe4914mr19032467ioh.21.1671576626404;
        Tue, 20 Dec 2022 14:50:26 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id bo20-20020a056638439400b00374cd28d842sm3918371jab.104.2022.12.20.14.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 14:50:25 -0800 (PST)
Date:   Tue, 20 Dec 2022 22:50:23 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, regressions@lists.linux.dev,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Message-ID: <Y6I8L45rDhqBMfUZ@google.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
 <Y6Ci7wWvbBRRQkR6@google.com>
 <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com>
 <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 05:19:34PM +0100, Stefan Wahren wrote:
> Hi Matthias,
> 
> Am 20.12.22 um 01:30 schrieb Matthias Kaehlcke:
> > On Mon, Dec 19, 2022 at 11:32:58PM +0100, Stefan Wahren wrote:
> > > Hi Matthias,
> > > 
> > > Am 19.12.22 um 18:44 schrieb Matthias Kaehlcke:
> > > > Hi Stefan,
> > > > 
> > > > Sorry for the regression.
> > > > 
> > > > What seems to happen is this:
> > > > 
> > > > arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi specifies device nodes for the
> > > > two (nested) USB hubs (which is done rarely since USB devices (including
> > > > hubs) are autodetected). The DT nodes were most likely only added to be
> > > > able to configure the LED modes of the USB to Ethernet adapter. With
> > > > 43993626de00 ("usb: misc: onboard-hub: add support for Microchip USB2514B
> > > > USB 2.0 hub") the onboard_usb_hub driver gained support for the hubs on
> > > > the RPi3. The onboard_usb_hub driver expects a regulator ("vdd") in the DT
> > > > node of the USB hub, which isn't present for the RPi3 (this isn't an error
> > > > per se). Without the regulator the onboard_hub platform driver fails to
> > > > probe, when the USB driver of the hub is probed (onboard_hub_usbdev_probe())
> > > > it doesn't find the corresponding platform driver instance
> > > > (_find_onboard_hub()) and defers probing. When the deferred probe runs it
> > > > encounters the same situation, rinse and repeat.
> > > I forgot to mention that in error case /sys/kernel/debug/devices_deferred
> > > was empty.
> > > > One possible fix would be to specify the 'missing' "vdd" property, however
> > > > that wouln't fix the issue for other boards with a similar configurations.
> > > > Instead the driver could check if "vdd" exists in the DT node of the hub,
> > > > and not defer probing if it doesn't.
> > > > 
> > > > Could you please try if the below patch fixes the issue on the Rpi 3?
> > > Yes, this prevents probing of onboard-usb-hub and the issue.
> > Thanks for the confirmation, I'll send out a proper patch to get this fixed
> > upstream.
> 
> sorry, i accidentally disabled this driver during testing of the patch. So i
> erroneously assumed the patch is working, but it's not. I seems that the
> change is never reached (add dev_info around your change).

Ah, good you caught it before a 'fix' was landed :)

> The following worked on my Raspberry Pi 3 B+
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c
> b/drivers/usb/misc/onboard_usb_hub.c
> index de3627af3c84..570e9f3d2d89 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -227,6 +227,9 @@ static int onboard_hub_probe(struct platform_device
> *pdev)
>      if (!hub)
>          return -ENOMEM;
> 
> +    if (!of_get_property(dev->of_node, "vdd", NULL))
> +        return -ENODEV;
> +
>      hub->vdd = devm_regulator_get(dev, "vdd");
>      if (IS_ERR(hub->vdd))
>          return PTR_ERR(hub->vdd);

Today I learned that regulator_get() doesn't return an error when the regulator
isn't specified, but the 'dummy regulator'. With that the platform driver is
instantiated, which is not intended. The proper fix is probably to skip the
creation of the 'raw' platform device in onboard_hub_create_pdevs() when the
'vdd-supply' does not exist.

I tried to repro the Rpi 3 case by adjusting sc7280-herobrine.dtsi to look
somewhat similar to the Rpi 3 hub config, but so far I wasn't 'successful'
with breaking USB by deleting 'vdd-supply' (and 'peer-hub'). So I don't fully
understand your scenario, but I'm relatively confident that not creating the
platform devices should fix it.

I'll try to send out a v2 of the fix before disappearing over the holidays
after tomorrow.
