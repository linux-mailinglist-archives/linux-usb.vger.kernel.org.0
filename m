Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AAC662B33
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 17:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbjAIQ3X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 11:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234203AbjAIQ3K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 11:29:10 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11A112089
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 08:29:07 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id d123so4761377iof.6
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 08:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JL+xfPFDnGNKkrm/hubQpHGy0imJ1B9l3Ypqp6ZRadw=;
        b=IzBN2Aa5JriGDuRbHEouaLt6DAEoETbGfA0b26eDZIMGVAO7Q8ZA0Y42bRuk626b6k
         3P30J5kbreBZUXD6pyaRq5CLFosWwww7N1ba5hw9jWS3ntfm5c9pFKWxc2l6KJXsvKzL
         FZ5USJVCVyy6gHw4XeC1kpMV1jLSGhvR/yF60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL+xfPFDnGNKkrm/hubQpHGy0imJ1B9l3Ypqp6ZRadw=;
        b=YlDdGr+fEXKskVUH138/Gk9VmOjv8CR0x4lWfpZSOYxuUxC+/kfreHLVdyv4U100z2
         91og1Whupqy83Kycy0UvKmngyUGzA992kOT2or2QaFLrAb3naIkpOVMoZhm28XW/AgKL
         rb65/UAx7xcRI1Ytk60ZCDpuDAlILuiuF3zqnKrQZp0dOOyu5C6kz0rxc5jFZMoCzfRg
         JxzPNQ3kJM49BZTd51/Sq/x1MAcYVWNOHXIiVgyzUzJBMQsKNpVDgUkx4DmECtgDz7YI
         9Y1UpSs+zmLOyPE2wq7/ywQRvA+YWzv1sS2MVkgwIW/VHNv/nmPdL9Jxn0h6lSNzX/7k
         v6zg==
X-Gm-Message-State: AFqh2kqsNw6lhfVNZF5sypRTvd3hyp77jnhM9k2+pl3SNuuyEeCn0Knz
        l/r9bgMBjLKRAO6rgukt/Q+84Q==
X-Google-Smtp-Source: AMrXdXt9PFZ9mMVfWJFGUaGpTPudCsDmQkZEa9P+xgmWWs3bsEeuNXrk/uJ9pMkjdqHWeVx7twwD2w==
X-Received: by 2002:a05:6602:2e91:b0:6df:df5b:f86 with SMTP id m17-20020a0566022e9100b006dfdf5b0f86mr65662694iow.8.1673281747269;
        Mon, 09 Jan 2023 08:29:07 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r8-20020a92ac08000000b0030c68d38255sm2748135ilh.38.2023.01.09.08.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 08:29:06 -0800 (PST)
Date:   Mon, 9 Jan 2023 16:29:06 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
Message-ID: <Y7xA0nO53cBRetz4@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
 <Y7YDwJX6aqa8vbQK@google.com>
 <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgTVnQXGoOfuxmwT7zCMJMY0Hw+uyQx126kNPL2WKGR8Hg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 07, 2023 at 08:31:23PM +0530, Anand Moon wrote:
> Hi Matthias,
> 
> Thanks for the review comments
> 
> On Thu, 5 Jan 2023 at 04:25, Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On Wed, Dec 28, 2022 at 03:59:17PM +0530, Anand Moon wrote:
> > > Hi Icenowy,
> > >
> > > Thanks for the review comments
> > >
> > > On Wed, 28 Dec 2022 at 15:38, Icenowy Zheng <uwu@icenowy.me> wrote:
> > > >
> > > > 在 2022-12-28星期三的 10:03 +0000，Anand Moon写道：
> > > > > Add usb hub device id for Genesys Logic, Inc. GL852G-OHG Hub USB 2.0
> > > > > root hub and Genesys Logic, Inc. GL3523-QFN76 USB 3.1 root hub.
> >
> > nit: QFN 76 is one of the package options of the GL3523, I expect this
> > binding to be applicable as well for other GL3523 variants, so I'd suggest
> > to drop the suffix. Not sure what 'OHG' stands for, the Genesys website
> > only lists a GL852G hub with different package types (none of them 'OHG'),
> > so I'd say drop the suffix unless it is known that 'OHG' variant uses
> > a different product id than other GL852G variants
> >
> 
> Yes, I will be sure to do this reference, I just picked these from the
> board schematics.
> 
> > > > >
> > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > > b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > > index a9f831448cca..db009f3ef438 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > > > @@ -16,6 +16,8 @@ properties:
> > > > >    compatible:
> > > > >      enum:
> > > > >        - usb5e3,608
> > > > > +      - genesys,usb5e3,610
> > > > > +      - genesys,usb5e3,620
> > > >
> > > > I don't think genesys, is needed here because usb5e3 means USB VID
> > > > 0x05e3, which is already linked to Genesys Logic.
> > > >
> > >
> > > Ok, I added this as genesys, is it part of the manufacturer or vendor name
> > > which is most commonly used for adding vendor-specific compatible strings.
> >
> > That doesn't follow the generic USB binding, please drop 'genesys,'.
> >
> 
> Yes, I will drop this in the next version.
> 
> > > > In addition, the control logic of these two hubs are needed to be
> > > > verified.
> > >
> > > We were using gpio-hog to reset the USB hub, so now switch to USB onboard hub
> > >
> > > >
> > > > And what's the status of the companion hub of the USB3 hub? Is it
> > > > really a USB3-only hub, or is its USB2 part just equal to another USB3
> > > > hub?
> > > >
> > > usb5e3,610 is USB 2.0 port hub present on Odroid C1 and Odroid C2 board
> > >
> > > usb5e3,620 is USB 3.1 port hub present on Odroid N2.
> >
> > Like Icenowy I would expect the GL3523 to provide also a 2.0 hub.
> >
> > What is the output of 'lsusb' on the Odroid N2?
> 
> alarm@odroid-n2:~$ lsusb -tv
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>         ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         ID 05e3:0610 Genesys Logic, Inc. Hub

Thanks. So it looks like 0x0610 is the product id of the USB 2.0 portion
of the GL3523. From this patch it seems the GL852G uses the same product
id?
