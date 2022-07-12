Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE48A5728A1
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbiGLV2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiGLV2h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:28:37 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C83B624C
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:28:35 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id s21so9239478pjq.4
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i8J/fhbRE7qiLfHDO9LGewFbcKtoPvdVzEjfJIiNs0w=;
        b=Bl8ADIA1jLP7CzeljAw+3ZiSpD+hPDuPTnquIsNiB64rtrG1JWyK7B+hZC5ivMYO4a
         1dApsHk+euB4VucQDeQy9ycQPRx/Ozm7gWi+hSQqifb7fU/nnZHoc9Ij6nmVuLA2SAya
         zfv2DeJ49xSkzSHDnyQVdmxzR2Ut6WG/6vDI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i8J/fhbRE7qiLfHDO9LGewFbcKtoPvdVzEjfJIiNs0w=;
        b=kVwOZPPvznaptlnTrHLtD7EYIsyqIW3beJL2XFkdvMP0Zv8Sp6yeOuaEh6UyDVJEm8
         ecU2bC8UrzJmUol9xkUi2mvbhu4+PNOLjicfCh4dWO5dJ7GYsFrkraVZ/Fdk7XN4cMeI
         7i5gJ99sigwgP0UFosTpp35ke228shv6nQvHu1HdoRIJiDogMqaUh3b+vZfr9Pp2PQDp
         cf+YBeRnuwsmJXhgSX5ZBDMv6ZKpUfZsgLK1EY33XyTseVNIHrPchW7AkF3qijzMS4+P
         mzmRt0ITiDOLT5KXrCCvYeTbneU1JCL2kmMapQUkywnXqbnjU9W1Yg4KDiKh0TmIMtsC
         3dRA==
X-Gm-Message-State: AJIora97pUB7q4ZKu/X/0N7197UdBvD/YTwdyUpYYHvEiXtL9U1pEdWJ
        34QNlf9j6bt9mBjTc0pSU+XeuZJlURMakw==
X-Google-Smtp-Source: AGRyM1vGyxpY88O+KxuSbFu43rsfJVuDFPWdMAyuY33p3bwgZosgD9ALrQF4B01n5rGRuE9X5bOSrg==
X-Received: by 2002:a17:90a:5d05:b0:1ef:91ab:de15 with SMTP id s5-20020a17090a5d0500b001ef91abde15mr174572pji.85.1657661314681;
        Tue, 12 Jul 2022 14:28:34 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e036:8c0d:9cf:7a45])
        by smtp.gmail.com with UTF8SMTPSA id o11-20020aa7978b000000b005289fbef7c4sm7512533pfp.140.2022.07.12.14.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:28:34 -0700 (PDT)
Date:   Tue, 12 Jul 2022 14:28:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Message-ID: <Ys3ngK0b4QtWbQKv@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 11:16:21PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2022 17:06, Alexander Stein wrote:
> > The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> > 
> > This initial version of the binding only describes USB related aspects
> > of the USB8041, it does not cover the option of connecting the controller
> > as an i2c slave.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Well, this is essentially a ripoff of
> > Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> > replaced, reset-gpio added and example adjusted.
> > IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> > to rename bindings files? I guess a common onboard-usb-hub.yaml matching
> > the driver seens reasonable. Any recommendations how to proceed?
> > 
> >  .../devicetree/bindings/usb/ti,usb8041.yaml   | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > new file mode 100644
> > index 000000000000..9a49d60527b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binding for the TI USB8041 USB 3.0 hub controller
> > +
> > +maintainers:
> > +  - Matthias Kaehlcke <mka@chromium.org>
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> 
> No items. It's just one item.
> 
> > +      - enum:
> > +          - usb451,8140
> > +          - usb451,8142
> > +
> > +  reg: true
> > +
> > +  reset-gpio:
> 
> reset-gpios
> 
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for GSRT# pin.
> 
> Combine maxItems and above into:
> items:
>  - description: GPIO specifier for GSRT# pin.
> 
> > +
> > +  vdd-supply:
> > +    description:
> > +      phandle to the regulator that provides power to the hub.
> 
> s/phandle to the regulator that provides//
> and create some nice sentence from left-over, like "VDD power supply to
> the hub"
> 
> 
> > +
> > +  peer-hub:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> 
> No quotes.
> 
> > +    description:
> > +      phandle to the peer hub on the controller.
> > +
> > +required:
> > +  - peer-hub
> > +  - compatible
> > +  - reg
> 
> Messed order. Use same as they appear in properties, so
> compatible+reg+peer-hub.
> 
> But another question - why "peer-hub"? I remember some discussion about
> naming, so was peer preferred over companion?

Yes, Alan Stern pointed out that 'companion' can be confusing in the context
of USB:

  What do you mean by "companion hub"?  I think you are using the wrong
  word here.  If you're talking about the relation between the two logical
  hubs (one attached to the SuperSpeed bus and one attached to the
  Low/Full/High-speed bus) within a physical USB-3 hub, the correct term
  for this is "peer".  See the existing usages in hub.h, hub.c, and
  port.c.

  "Companion" refers to something completely different (i.e., the UHCI or
  OHCI controllers that handle Low/Full-speed connections on behalf of a
  High-speed EHCI controller).

https://patchwork.kernel.org/comment/24912563/
