Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A534555A2C7
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 22:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbiFXUdo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 16:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiFXUdn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 16:33:43 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F9A3057E
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:41 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u15so6916612ejc.10
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FKj5ILhZahDV8g/Lut3oLM8+DsVW+fpPjZNGs2Euucg=;
        b=afsOnPACkNSZDgVS+pIbxolTcSijCuyb7htJeGVKjAnSPbba2GUTQklfN5+p5N8nDK
         rDBOOOGDB6aLTM6hsycJi2/UavX/B5Pe+kGFLd5YcvrTNW1qe6JBBB7Kfq66XCrN+X6V
         M5UoHzam3sQXoxWgoOY3gDxJKhff4C2aFnTfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FKj5ILhZahDV8g/Lut3oLM8+DsVW+fpPjZNGs2Euucg=;
        b=TKih1iSwsqB62lMAd5QMMLjD32XUii9qbe5zugJzOpwY9hc+ndnGVkyzPxyZOQMpjT
         DlaRcLMwWuatvGkWxRiMcziHL4qQ+arW4N6fA5lUVGjf4qkigzj8pFJ1biXzXSA/6l6D
         3CZc9q21amIKbY5m+b/JDsLpo5RDAnOS3aGm9MSkvD1nVm+zGtarSTdD07dmOIcF+lL5
         mLLYVikvlGQEuy71LKVNHS2FVo/viztDDkN4xoUSfXez2ivJr7KPP9NPkNqp0nLYSHL8
         S9rWraFGbF6pd2K8AfbxsxJBnU/vAeF2ni+hYMWyk9yidBTFiFe50Oz9qGpqYZytGjX9
         2P1A==
X-Gm-Message-State: AJIora8MvjfQYSOmS33Gy4UHJftB6fWb5xDoD+zMX/5u5gD+fHSSeulb
        AbhLq+ZZNC+cJu0aVwzNFHfJ9zhh0O4ocLJW
X-Google-Smtp-Source: AGRyM1uk47GHAPh25gn1X1BrtYGdleelnOPKP+VXtOt5aIgYQP51EnZenQ/sFt1p/j/I8tPT5iCapg==
X-Received: by 2002:a17:907:8692:b0:711:d49f:994d with SMTP id qa18-20020a170907869200b00711d49f994dmr796385ejc.578.1656102820233;
        Fri, 24 Jun 2022 13:33:40 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id op23-20020a170906bcf700b0070aaad0a173sm1636529ejb.192.2022.06.24.13.33.38
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 13:33:38 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so2143613wml.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:38 -0700 (PDT)
X-Received: by 2002:a05:600c:34d0:b0:3a0:2c07:73ac with SMTP id
 d16-20020a05600c34d000b003a02c0773acmr5870508wmq.85.1656102817852; Fri, 24
 Jun 2022 13:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220622214931.1914770-1-mka@chromium.org> <20220622144857.v23.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20220622144857.v23.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jun 2022 13:33:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHnRNQQo8i95ROiZPOGqAD_=FfU0uzy83Vigb+Xsr4XQ@mail.gmail.com>
Message-ID: <CAD=FV=XHnRNQQo8i95ROiZPOGqAD_=FfU0uzy83Vigb+Xsr4XQ@mail.gmail.com>
Subject: Re: [PATCH v23 2/3] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jun 22, 2022 at 2:49 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> index 4c5ddbd75b7e..7fd40183a395 100644
> --- a/drivers/usb/misc/Kconfig
> +++ b/drivers/usb/misc/Kconfig
> @@ -295,3 +295,19 @@ config BRCM_USB_PINMAP
>           This option enables support for remapping some USB external
>           signals, which are typically on dedicated pins on the chip,
>           to any gpio.
> +
> +config USB_ONBOARD_HUB
> +       bool "Onboard USB hub support"

The above needs to be "tristate", not bool.

Weirdly the way you have it if you set "CONFIG_USB=m" and
"CONFIG_USB_ONBOARD_HUB=y" you don't get any compile errors, but also
the onboard usb hub doesn't even get compiled (!). Once you switch to
tristate then setting "CONFIG_USB=m" will force the onboard hub to be
a module too (since it's underneath the "if" in the Kconfig).

...ugh, but once you do that then you start getting compile errors if
you have "CONFIG_USB=y" and "CONFIG_USB_ONBOARD_HUB=m". I guess that
can be fixed with something like this

-usbcore-$(CONFIG_USB_ONBOARD_HUB)      += ../misc/onboard_usb_hub_pdevs.o
+ifdef CONFIG_USB_ONBOARD_HUB
+usbcore-y                      += ../misc/onboard_usb_hub_pdevs.o
+endif

Given the problems we've had in the past, please make sure you test
with all combinations of "=y" and "=m" for CONFIG_USB and
CONFIG_USB_ONBOARD_HUB. Note that on sc7180-trogdor devices if you
want CONFIG_USB to be a module don't forget to also set
CONFIG_USB_DWC3=m or DWC3 will force you to gadget mode...


> +/**
> + * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
> + * @parent_hub : parent hub to scan for connected onboard hubs
> + * @pdev_list  : list of onboard hub platform devices owned by the parent hub
> + *
> + * Creates a platform device for each supported onboard hub that is connected to
> + * the given parent hub. The platform device is in charge of initializing the
> + * hub (enable regulators, take the hub out of reset, ...) and can optionally
> + * control whether the hub remains powered during system suspend or not.
> +
> + * To keep track of the platform devices they are added to
> + * a list that is owned by the parent hub.

super nitty, but the above two lines of comment could be word-wrapped better.


> + */
> +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> +{
> +       int i;
> +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);

As per my response on v22, would you be willing to rename that to
"parent_hcd"? I'll probably still confuse myself next time I read this
function, but at least maybe this will help me recognize more quickly
that this isn't necessarily the child's hcd in the case of the root
hub.

-Doug
