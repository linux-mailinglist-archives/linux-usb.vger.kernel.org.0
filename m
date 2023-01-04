Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9ED65E098
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 00:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbjADWze (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 17:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjADWzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 17:55:31 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A1547312
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 14:55:30 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id c20so16438803ilj.10
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 14:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UwnDpjFiSkciFHKVlrI1mG8DDOq+XOpoX/kfVjvrTro=;
        b=Zcz3xPJ+1JFsN8TkUpizVFMI3/3KbankwidfAEogRsElmMaK7fKz7Gq5l82fJhhTWp
         nB6LS4NAlqkpmgijPXGKXC6KL+ZwtpCktOKYqdB0CGGssEGxt+0Fth/Adsi9CUroO1iI
         u3E7/ezg/9S8ZhQgSxWaHVYTuE0hLNoTHavbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwnDpjFiSkciFHKVlrI1mG8DDOq+XOpoX/kfVjvrTro=;
        b=HK3Xq6tEp81g6AhnQgv6jXe/CsRkTUPjjKV9+NEfqamdqUenBaVAhNp1iDiO3b4BRp
         6tBu65nMgh3YIdCF5XI+HAHicedii47EuCzo1FH3Ncoe8G97TYq0LhNBIs/AOGxiMx8B
         Mo8aHx1vfAOmDeVq7v9qAtcdpAFJK878jyH6B4R2I5/Lz2cwepnfv4/S+zSII8V4X3Ts
         3trgjZqJeFNTw3rIyL6QI4LjcV328LIb73djnfKnFcI2i2Qe+C0PrbuOczSelE5fDgZl
         8XcPTDFUzWcRhUaFijIYPPS9bb7i5H+lzbUtGomDu4gtfrxyr+FKXuxEADUtkXO5yjoW
         rRnw==
X-Gm-Message-State: AFqh2kqbixVpMypKcIuc+DnozMvGrgv1iWq13nno09tLIDupyKDj7ujI
        KhYRkt7xqIliIoJjrq6eCLPr/A==
X-Google-Smtp-Source: AMrXdXu92yHSOjcz9PLrUap2yhJ+HjiU6C1sRlFdjYt9OrM5u4rTiXeZerbXc6KEKzKjKg1Rgn4rYw==
X-Received: by 2002:a05:6e02:10d3:b0:30d:7cf4:5d5d with SMTP id s19-20020a056e0210d300b0030d7cf45d5dmr274387ilj.22.1672872898038;
        Wed, 04 Jan 2023 14:54:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id f1-20020a056e0212a100b0030c52450a58sm2658938ilr.64.2023.01.04.14.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:54:57 -0800 (PST)
Date:   Wed, 4 Jan 2023 22:54:56 +0000
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
Message-ID: <Y7YDwJX6aqa8vbQK@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
 <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 28, 2022 at 03:59:17PM +0530, Anand Moon wrote:
> Hi Icenowy,
> 
> Thanks for the review comments
> 
> On Wed, 28 Dec 2022 at 15:38, Icenowy Zheng <uwu@icenowy.me> wrote:
> >
> > 在 2022-12-28星期三的 10:03 +0000，Anand Moon写道：
> > > Add usb hub device id for Genesys Logic, Inc. GL852G-OHG Hub USB 2.0
> > > root hub and Genesys Logic, Inc. GL3523-QFN76 USB 3.1 root hub.

nit: QFN 76 is one of the package options of the GL3523, I expect this
binding to be applicable as well for other GL3523 variants, so I'd suggest
to drop the suffix. Not sure what 'OHG' stands for, the Genesys website
only lists a GL852G hub with different package types (none of them 'OHG'),
so I'd say drop the suffix unless it is known that 'OHG' variant uses
a different product id than other GL852G variants

> > >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > index a9f831448cca..db009f3ef438 100644
> > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > @@ -16,6 +16,8 @@ properties:
> > >    compatible:
> > >      enum:
> > >        - usb5e3,608
> > > +      - genesys,usb5e3,610
> > > +      - genesys,usb5e3,620
> >
> > I don't think genesys, is needed here because usb5e3 means USB VID
> > 0x05e3, which is already linked to Genesys Logic.
> >
> 
> Ok, I added this as genesys, is it part of the manufacturer or vendor name
> which is most commonly used for adding vendor-specific compatible strings.

That doesn't follow the generic USB binding, please drop 'genesys,'.

> > In addition, the control logic of these two hubs are needed to be
> > verified.
> 
> We were using gpio-hog to reset the USB hub, so now switch to USB onboard hub
> 
> >
> > And what's the status of the companion hub of the USB3 hub? Is it
> > really a USB3-only hub, or is its USB2 part just equal to another USB3
> > hub?
> >
> usb5e3,610 is USB 2.0 port hub present on Odroid C1 and Odroid C2 board
> 
> usb5e3,620 is USB 3.1 port hub present on Odroid N2.

Like Icenowy I would expect the GL3523 to provide also a 2.0 hub.

What is the output of 'lsusb' on the Odroid N2?
