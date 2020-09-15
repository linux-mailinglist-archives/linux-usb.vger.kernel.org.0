Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EDC26B386
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 01:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbgIOXER (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 19:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgIOXDr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 19:03:47 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87888C06174A
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 16:03:47 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so555418pjh.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 16:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Szj4HEGLJCAo0focZEdIAz4HSdQqUNWGrF8lTpz41tg=;
        b=Al/ywHXkCLn66C3fB4LS0wK1RSE8K1XgfVUSsuH9bvAtw0RLdo2wBFXwerM1pAgULA
         /VBg8L6Xm1vtYDF0bYsOMv2/j+akKykQ4U9gd6R66+jRn7mUdHj7ddSOoJ7JnzEd7qsH
         ladfCPczQpkBnRc+aFmReIhIhDepPYqdxSZO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Szj4HEGLJCAo0focZEdIAz4HSdQqUNWGrF8lTpz41tg=;
        b=DoktLPVXRpd6h5NS4rkfUAVkMPR5SSa54qcRg/N8ykc0uqt9f4AY/XoACmjT4NtcOv
         EREB+c2KPg9ol2WRN39kCSfbKdFsGNjtZuudn0eJHecrP7Y4Rl6d11Zi/m/yM/WNuV2c
         md9NpcgBIUGscY/30tDSmQOQwCRHl/f5V0OmK/BQ96TjdJCkgto8cfMbUT0hdLikfpdq
         0+suTgwAWhteOWQBsZ/Xe/DoMA3/78zs0nydY/jW7YTUvBzBfdAcaB6oDSEZOPrg8aib
         k+YI+tCkkhK8IEn9NvBumz2i6u4AapBVqmb9Ox7eDzm0J7mg+uLlN1TMG/yBPfw3OetT
         tAOw==
X-Gm-Message-State: AOAM530yCgLeTlkxr6k+uhpDjYYJydev4N+qL7voeSvmooUqkOpjMWJh
        1f2soAMHgo6zoluUaVvlPb7mwQ==
X-Google-Smtp-Source: ABdhPJyN0uXuwQlv65uva/TdZOuxlc4iCI9S6l1Qqb7sv1C+xG4CJpZX6gyS9Wkm+edENuYvypjqmQ==
X-Received: by 2002:a17:90a:b702:: with SMTP id l2mr1476282pjr.82.1600211027113;
        Tue, 15 Sep 2020 16:03:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a20sm14251840pfa.59.2020.09.15.16.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 16:03:46 -0700 (PDT)
Date:   Tue, 15 Sep 2020 16:03:45 -0700
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
Message-ID: <20200915230345.GF2771744@google.com>
References: <20200914112716.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20200914112716.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200915025426.GA17450@b29397-desktop>
 <20200915050207.GF2022397@google.com>
 <AM7PR04MB715735A8A102F3EC9041EA328B200@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM7PR04MB715735A8A102F3EC9041EA328B200@AM7PR04MB7157.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, Sep 15, 2020 at 07:05:38AM +0000, Peter Chen wrote:
>   
> > > > +	hub->cfg.power_off_in_suspend =
> > of_property_read_bool(dev->of_node, "power-off-in-suspend");
> > > > +	hub->cfg.wakeup_source = of_property_read_bool(dev->of_node,
> > > > +"wakeup-source");
> > >
> > > Do you really need these two properties? If the device (and its
> > > children if existed) has wakeup enabled, you keep power in suspend,
> > > otherwise, you could close it, any exceptions?
> > 
> > That would work for my use case, but I'm not sure it's a universally good
> > configuration.
> > 
> > I don't have a specific USB device in mind, but you could have a device that
> > shouldn't lose it's context during suspend or keep operating autonomously (e.g.
> > a sensor with a large buffer collecting samples). Not sure if something like this
> > exists in the real though.
> > 
> > I'm not an expert, but it seems there are USB controllers with wakeup support
> > which is always enabled. A board with such a controller then couldn't have a
> > policy to power down the hub regardless of wakeup capable devices being
> > connected.
> > 
> 
> Whether or not it is a wakeup_source, it could get through its or its children's
> /sys/../power/wakeup value, you have already used usb_wakeup_enabled_descendants
> to know it.

I conceptually agree, but in practice there are some conflicting details:

wakeup for the hubs on my system is by default disabled, yet USB wakeup works
regardless, so the flag doesn't really provide useful information. I guess we
could still use it if there is no better way, but it doesn't seem ideal.

Similar for udev->bus->controller, according to sysfs it doesn't even have wakeup
support. Please let me know if there is a reliable way to check if wakeup is
enabled on the controller of a device.

> If the onboard HUB needs to reflect wakeup signal, it should not power off its regulator.
> 
> For another property power-off-in-suspend, I think it is also a user option,
> but not a hardware feature.

Ok, I think you are suggesting a sysfs attribute instead of a DT property, that
sounds good to me.
