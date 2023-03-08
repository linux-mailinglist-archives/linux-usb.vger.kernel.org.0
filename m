Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BCB6B11CE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 20:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjCHTLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 14:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjCHTK5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 14:10:57 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A4BC64B;
        Wed,  8 Mar 2023 11:10:48 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id l15-20020a9d7a8f000000b0069447f0db6fso9551408otn.4;
        Wed, 08 Mar 2023 11:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302648;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGJj9GNVJjh3xT8hYIWQaGUY94B0QhZ47j+wp0OAw/M=;
        b=BYQoU6CHbmCjr/Id9jf4xkmyxTwIargrYqV9NOUZkyNIb5FU7TsE71wiDyMgP10lKw
         tRfEkj4S3ip2xCcdG7kHq9Sg1ltLBTikq68Ixr+tq3PRy8TSAhCOlryw3Uy2RXjIdyGg
         pmXsONe2yG9Ds6YNLQCppmBkpb0hU9nkcRMJ5t25RsBakeDYR+AL/jRBGaB6r6/hvJNu
         FMPOXv0kLhDgTUDVO72H2ujVQRyYCFZMXADjTOpwgNU8oEr6YJuqB1i2AzAChUeGYpNm
         qMQNIoy7W7buQKCmAoQYLVJkoqQSRDZSgaTJm3lWwMTzzxeJVWxywO4qP+kvCY1Wrvu1
         4ADg==
X-Gm-Message-State: AO0yUKUbsM74mp+cMgnRi3nzR0jnQrBIzN0ZRwApqPbxlZkalaaSHSLT
        q48JSoANViORllWUOxmBng==
X-Google-Smtp-Source: AK7set/PLnOyJ76Ic+ObQ9oInhGehJJN/e6IAIIEpRHf1XA4DjRyUGk+VUPoeCwGM9GpdLLi9VUiEA==
X-Received: by 2002:a9d:5a90:0:b0:68b:cd6a:4117 with SMTP id w16-20020a9d5a90000000b0068bcd6a4117mr8402228oth.5.1678302648125;
        Wed, 08 Mar 2023 11:10:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f9-20020a9d0389000000b0068bd6cf405dsm6760032otf.1.2023.03.08.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:10:47 -0800 (PST)
Received: (nullmailer pid 3615488 invoked by uid 1000);
        Wed, 08 Mar 2023 19:10:47 -0000
Date:   Wed, 8 Mar 2023 13:10:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: usb-device: make "compatible" optional
Message-ID: <167830264651.3615428.14884534514744407366.robh@kernel.org>
References: <20230228182909.1011-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228182909.1011-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue, 28 Feb 2023 19:29:09 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This binding was originally meant to describe hard-wired USB devices but
> in some situations we need to describe USB ports. That is needed e.g. if
> USB port is meant to be used as a trigger source but it can have any
> device plugged. It's a common case for home routers which have USB ports
> (with no hard-wired devices) and USB LEDs to indicate ports state.
> 
> There is no point (and no easy way) to add separate binding covering
> just USB ports. Adjust existing devices binding to allow describing
> ports.
> 
> This fixes:
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: port@1: 'compatible' is a required property
>         From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: port@2: 'compatible' is a required property
>         From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@21000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'port@1', 'port@2' were unexpected)
>         From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: port@1: 'compatible' is a required property
>         From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: port@2: 'compatible' is a required property
>         From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'port@1', 'port@2' were unexpected)
>         From schema: Documentation/devicetree/bindings/usb/generic-ohci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@23000: port@1: 'compatible' is a required property
>         From schema: Documentation/devicetree/bindings/usb/generic-xhci.yaml
> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'phy-names', 'phys', 'port@1' were unexpected)
>         From schema: Documentation/devicetree/bindings/usb/generic-xhci.yaml
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> I tried to add USB port binding but it didn't work because of $nodename.
> Rob suggested to just make "compatible" optional:
> [PATCH robh next] dt-bindings: usb: add USB controller port
> https://www.spinics.net/lists/linux-usb/msg209553.html
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

