Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283EF45392E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Nov 2021 19:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239328AbhKPSKZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 13:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbhKPSKP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Nov 2021 13:10:15 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0822FC061570
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 10:07:18 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 136so13695091pgc.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJLPLJIkQPjO7UzbeQTBcB7R7AACxPrWxl+uljB+ks4=;
        b=MuEc9myys8soSc9S5p/9ZYxQFINzZE+kAA+k/U3FM52jlU+6MJ1sN342xuvi42MyiM
         ZMBjLooJ7voz/onZnJrPlWcorIIuLCoKkgjvfuvaYADaSZoZDmAMeW84d3xwQVEbocct
         qdT5YRu1/seNagLz3qhmq16768PfXRj60IRok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJLPLJIkQPjO7UzbeQTBcB7R7AACxPrWxl+uljB+ks4=;
        b=1UqHHpEsdLFYxJtYWRyTykW2x9ViTnJtJlMjR4d5R6OGGuLrm+bwZdjM4ON6PDmtqy
         g8PSnQJ5U1n/8T0MOqsdh5bJStpndPwkUecgjY3TigtACZmCiVDRrYYhRLhu6XtLoLQk
         4hTwoDH4swYoAfTxoVUuSx+G4DiYe+07qzBv+1RVMOekSQ5nVnw1wjnQ7tiexKJk3XCB
         FLwICOS4SBVGkLki2xVKT5X+Zk3/TfpfVl7UVd+AW8ELknXCPwZ7KBOPGwLfCe0rXj4V
         d4p4xW0uYhEXUkM3CskWeGGZAqIl0cIGdUhDCiS1BWABizGHVTZUYB/IxTlJ8hEoSQTU
         0Tjg==
X-Gm-Message-State: AOAM533evzfS0UzbrvGhvYPt/HUdhjMCG5loPc6fAuf6xKWT0Pp5OI4U
        8OBUJLZmOHyltcN+DHm0LTRGvl0LkxzHFg==
X-Google-Smtp-Source: ABdhPJwhmpm1yvMfuJzR2UucqZRo6IvMajPPkE5cdkExWK4ezhfJ19WuO6fjzPR4AH6ILz/jpNvTTw==
X-Received: by 2002:a63:c61:: with SMTP id 33mr552897pgm.415.1637086037631;
        Tue, 16 Nov 2021 10:07:17 -0800 (PST)
Received: from localhost ([2620:15c:202:201:54aa:73ab:b480:41e2])
        by smtp.gmail.com with UTF8SMTPSA id e7sm2315303pgj.11.2021.11.16.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 10:07:16 -0800 (PST)
Date:   Tue, 16 Nov 2021 10:07:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
Message-ID: <YZPzUmwWuuiwqJ2b@google.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
 <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 11, 2021 at 03:48:06PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Aug 13, 2021 at 12:52 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> >  config USB_DWC3
> >         tristate "DesignWare USB3 DRD Core Support"
> > -       depends on (USB || USB_GADGET) && HAS_DMA
> > -       select USB_XHCI_PLATFORM if USB_XHCI_HCD
> > +       depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA
> 
> Technically you don't need the "USB &&", right? Since
> USB_XHCI_PLATFORM is defined in 'usb/host/Kconfig' and that's only
> even included if USB is defined. So it can be just:
> 
> depends on (USB_XHCI_PLATFORM || USB_GADGET) && HAS_DMA

True, the dependency on USB isn't strictly needed.

> That's not terribly important, though, so:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
