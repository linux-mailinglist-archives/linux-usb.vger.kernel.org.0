Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9D11E8985
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 23:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgE2VIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 17:08:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36033 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgE2VIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 17:08:21 -0400
Received: by mail-io1-f67.google.com with SMTP id y18so867893iow.3;
        Fri, 29 May 2020 14:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/SHku4mzH1ikNG4JF1qtGBkI22UvLg0U5HySgguahA4=;
        b=DuamKrQHQYus6DRaba9+UpRmftHoYu8GZjzHGosxVZ+kiKD9ZFispI1jy8GohnH7pt
         M/LVMbdLrOtsxERIlPX9IigJYxwx0D1ITKoPu1j4K6E7063gJS3sX1peOJNqiok+P/Cp
         BTk1tuzVTFdOxPZCx/HpL81HTcRWdr3iWG+p9g98ShsLgQmffeQ1n9RtLYxHoi1mv3la
         OgsuFM/HZZ5ZGVlDkhFR50+Skb//PYejB4bbtIDtBsjh91Z8AZJmwVPG2vh/0LtPwiK9
         V2VuPNtNms/UVqWjV9p4OLMpTHKdbsoicCgkOUWzLePZK3Yb7ojv2PDHhhzlfgoMgfVG
         4S0w==
X-Gm-Message-State: AOAM530txQb6yr5jO1In6OzUxuHyAYVZDfb9yikZr8oIMrsSlpy2uqrD
        x5caX7lGiiqqcEzZYYDuDQ==
X-Google-Smtp-Source: ABdhPJwT67UfxkWOvpEe8YR2Gic0ttFB9T+wozbaaqN3B+BECF6UaLH8BdYSY5aFSNhLXghMjGl7Iw==
X-Received: by 2002:a05:6638:11c6:: with SMTP id g6mr8914496jas.134.1590786499871;
        Fri, 29 May 2020 14:08:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l21sm5577407ili.8.2020.05.29.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 14:08:18 -0700 (PDT)
Received: (nullmailer pid 2958331 invoked by uid 1000);
        Fri, 29 May 2020 21:08:16 -0000
Date:   Fri, 29 May 2020 15:08:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb/phy-generic: Add support for OTG VBUS supply
 control
Message-ID: <20200529210816.GA2952126@bogus>
References: <20200529060045.25556-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529060045.25556-1-mike.looijmans@topic.nl>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 29, 2020 at 08:00:45AM +0200, Mike Looijmans wrote:
> This enables support for VBUS on boards where the power is supplied
> by a regulator. The regulator is enabled when the USB port enters
> HOST mode.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Added missing "return 0;" in set_vbus method
> 
>  .../devicetree/bindings/usb/usb-nop-xceiv.txt |  3 ++
>  drivers/usb/phy/phy-generic.c                 | 46 ++++++++++++++++++-
>  drivers/usb/phy/phy-generic.h                 |  2 +
>  3 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> index 4dc6a8ee3071..775a19fdb613 100644
> --- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
> @@ -16,6 +16,9 @@ Optional properties:
>  
>  - vcc-supply: phandle to the regulator that provides power to the PHY.
>  
> +- vbus-supply: phandle to the regulator that provides the VBUS power for when
> +  the device is in HOST mode.
> +

I'm going to say no to expanding this binding...

First, there sure are a lot of controls on a NOP tranceiver.

Second, unless Vbus is supplying the PHY, then this belongs in a 
connector node for which this is already supported.

>  - reset-gpios: Should specify the GPIO for reset.
>  
>  - vbus-detect-gpio: should specify the GPIO detecting a VBus insertion
