Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694B0545412
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 20:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345390AbiFISYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 14:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiFISYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 14:24:47 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A4C13B8CA
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 11:24:46 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id x187so15616390ybe.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Om1J1P4rfNxje/5N3K/cXLZVUQSG2BHAt4SwjWydlTY=;
        b=YYPuN5NTr7iQ2zF8DXZCmRX+mvtzQ5srbyOkUnNhp/fHww6bqk9m0dTcuxyLu0GpVI
         M5eBgZeVan+AesZMoxUu7JrXFCi4lK16QSqe3YfYF5y8rwt00oakyjKHVQoaBuX+6lVL
         ehDrnRQYUKoYSJPn4G8P3gK5B0H4b3ZeCzZAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om1J1P4rfNxje/5N3K/cXLZVUQSG2BHAt4SwjWydlTY=;
        b=YZrtz+/0InoWfbh8mBi1nL6Nk3WlOWTNFCy/KX+4kCwrJxGNd6S0PXvU7r6oNsWbF3
         RiQTBQSi3HY0OiccOKeE36Ql4zhctqU31qV6TOzxNAPV8VP2SAMpVHS0sfGEV8ewFLST
         oD6IVJMHfZU9DNNEdCnK1+aBzS0hNk9hD1v7kcae8J+g8jIZsvTHUpAui0oVXa0gRP4U
         DsD6Bz1HVRO29XDwLRwX2KH6blDcoCsZS60mJSr23uw2Y9Wv3TNcIP7hJaBgAZn5dmv5
         AYSFxISh4cntBFhYbWPEtPqPhDveGQIA6MmYD4TjXhm87Qqjv8FKBaHpQ8Bk69g9Q/w4
         v+4g==
X-Gm-Message-State: AOAM53111rw+/PmVUNG6k2tEwwRQr9YhDGoA+kXyaC9TNCYE4/rCadDb
        9FvqQV7CFRhLaiaQYWKfMFeh6bjsma+0HW0MqyBmmq5IRm4=
X-Google-Smtp-Source: ABdhPJxOcF2XSzpjDlACbf3M67kUcUVbiOUYu+jZcEiQ9+pJ6bPCiNtQ+mRH+nccMcwhVJelujQ71ebD8bS9flCw6/o=
X-Received: by 2002:a25:5e87:0:b0:660:240c:784 with SMTP id
 s129-20020a255e87000000b00660240c0784mr39902806ybb.445.1654799086080; Thu, 09
 Jun 2022 11:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org> <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
 <YqDXfGa9bugnLFGH@chromium.org> <CACeCKaeHocnAuY5D-oVt1fhgRGkNT014RcK3JSe6piKoXNtKCQ@mail.gmail.com>
 <fac58827-5b82-81a2-e782-99056180c0ed@linaro.org>
In-Reply-To: <fac58827-5b82-81a2-e782-99056180c0ed@linaro.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 9 Jun 2022 11:24:35 -0700
Message-ID: <CACeCKafA=wTELAWhzHgR5bm6i+qB9swRY7SPhseNBo=fwbaowg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 8, 2022 at 11:41 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/06/2022 23:56, Prashant Malani wrote:
> > On Wed, Jun 8, 2022 at 10:08 AM Prashant Malani <pmalani@chromium.org> wrote:
> >>
> >> Hi Krzysztof,
> >>
> >> Thank you for looking at the patch.
> >>
> >> On Jun 08 11:24, Krzysztof Kozlowski wrote:
> >>> On 07/06/2022 21:00, Prashant Malani wrote:
> >>>> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> >>>> alternate mode lane traffic between 2 Type-C ports.
> >>>>
> >>>> Update the binding to accommodate this usage by introducing a switch
> >>>> property.
> >>>>
> >>>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> >>>> ---
> >>>>  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
> >>>>  1 file changed, 56 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> index 35a48515836e..7e1f655ddfcc 100644
> >>>> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> @@ -105,6 +105,26 @@ properties:
> >>>>        - port@0
> >>>>        - port@1
> >>>>
> >>>> +  switches:
> >>>> +    type: object
> >>>> +    description: Set of switches controlling DisplayPort traffic on
> >>>> +      outgoing RX/TX lanes to Type C ports.
> >>>> +
> >>>> +    properties:
> >>>> +      switch:
> >>>
> >>> You allow only one switch with such schema, so no need for "switches"...
> >>
> >> See below comment (summary: we'd like to allow 1 or 2 switches).
> >>>
> >>>> +        $ref: /schemas/usb/typec-switch.yaml#
> >>>> +        maxItems: 2
> >>>
> >>> Are you sure this works? what are you limiting here with maxItems? I
> >>> think you wanted patternProperties...
> >>
> >> Yeah, I might not have used the DT syntax correctly here.
> >> What I'm aiming for is:
> >> "switches" should can contain 1 or 2 "switch" nodes.
> >> 2 is the maximum (limitation of the hardware).
> >>
> >>>
> >>>> +
> >>>> +        properties:
> >>>> +          reg:
> >>>> +            maxItems: 1
> >>>> +
> >>>> +        required:
> >>>> +          - reg
> >>>> +
> >>>> +    required:
> >>>> +      - switch@0
> >>>
> >>> This does not match the property.
> >>>
> >>> You also need unevaluatedProperties:false
> >>
> >> Ack, will update this in the next version.
> >
> > Actually, could you kindly clarify which of the two needs this?
> > "switches" or "switch" ?
> > I interpreted "switch" as requiring it, but I thought it better to confirm.
>
> Depends what do you want to have there. If two properties called
> "switch", then "switches" is ok. However old code had only one property
> thus switches with maximum one switch is a bit weird.
>
> Looking at example you wanted to switch@[01], so you need to use
> patternProperties.

Thanks for the suggestion. I've made the change in v2.

Regards,

-Prashant
