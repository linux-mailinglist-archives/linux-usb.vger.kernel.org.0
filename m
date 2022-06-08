Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AFE543A21
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 19:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiFHRU0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 13:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbiFHRUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 13:20:17 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B157044B978
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 10:08:15 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p8so18862138pfh.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jun 2022 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WF0RJla2oohMUn0MJv8rKYykIuR4lAmipthSFfnmiVU=;
        b=ljLJW0sL8NMXgQOt9f+zRCmJO50/PXowFcD4/QA46kqBPGof6uWEKlImxcs74TyV6z
         ugR7xf1sjKW23f+3OUb+SNoGJLZb/n2XEgdiJ85CN9nWx+EbNzqFJv7V+jBeIY5drPjC
         DOQsGx5dB3xTghvaIYzNBgRb/ogigexSYAx34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WF0RJla2oohMUn0MJv8rKYykIuR4lAmipthSFfnmiVU=;
        b=1cG3BSCVmhAV1xHFLhreDG+PorGomJ2Bn/7HTEzw/BKLWPQSTLS5y3ECtQmvZS4lex
         U1r6jvmBOKolv7rm+5b6OJUh4eytcuBcIhCjX5N85KxDjiK/hNYxy63a3H7H7UGtNKBs
         Z/hfFEOC23dUNitmVnmwl/5n4ovMVuB0oymQaIg3ZoNP2+LapRGIKE4VV82t1N5B9MAw
         Dvmm3/cbErZkG+CVijfAIpqg7+N+CfKfg/e4ssulvSO5kZNuv/4i9CdNSDipkpSxQ6+/
         +whKVG+Eo3CYVj/fOA3EaxjlDSl2rLX/OR7+gp+LSydh+HhfCspsT2X1RqBZpolQNPbH
         fN6g==
X-Gm-Message-State: AOAM532letoHPkskon7ykK4ACd8bgzsc4c4YziGvTN4qYnYcY0lrJFEB
        wK5Bc2hCZR8XsMNWglTWrB32yw==
X-Google-Smtp-Source: ABdhPJy/e3J9zrHD59CzKJz+zzlVENMog9HQc2BMCmxEhETwD0FomiEyVUlscJH5sJcpsdfkzRRVfw==
X-Received: by 2002:a63:f14a:0:b0:3fd:d2aa:6b30 with SMTP id o10-20020a63f14a000000b003fdd2aa6b30mr12839836pgk.348.1654708095078;
        Wed, 08 Jun 2022 10:08:15 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d2-20020a630e02000000b003fa95b940bdsm15361474pgl.88.2022.06.08.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:08:14 -0700 (PDT)
Date:   Wed, 8 Jun 2022 17:08:12 +0000
From:   Prashant Malani <pmalani@chromium.org>
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
        =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Message-ID: <YqDXfGa9bugnLFGH@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
 <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

Thank you for looking at the patch.

On Jun 08 11:24, Krzysztof Kozlowski wrote:
> On 07/06/2022 21:00, Prashant Malani wrote:
> > Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> > alternate mode lane traffic between 2 Type-C ports.
> > 
> > Update the binding to accommodate this usage by introducing a switch
> > property.
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 35a48515836e..7e1f655ddfcc 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -105,6 +105,26 @@ properties:
> >        - port@0
> >        - port@1
> >  
> > +  switches:
> > +    type: object
> > +    description: Set of switches controlling DisplayPort traffic on
> > +      outgoing RX/TX lanes to Type C ports.
> > +
> > +    properties:
> > +      switch:
> 
> You allow only one switch with such schema, so no need for "switches"...

See below comment (summary: we'd like to allow 1 or 2 switches).
> 
> > +        $ref: /schemas/usb/typec-switch.yaml#
> > +        maxItems: 2
> 
> Are you sure this works? what are you limiting here with maxItems? I
> think you wanted patternProperties...

Yeah, I might not have used the DT syntax correctly here.
What I'm aiming for is:
"switches" should can contain 1 or 2 "switch" nodes.
2 is the maximum (limitation of the hardware).

> 
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - switch@0
> 
> This does not match the property.
> 
> You also need unevaluatedProperties:false

Ack, will update this in the next version.

> 
> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -167,5 +187,41 @@ examples:
> >                      };
> >                  };
> >              };
> > +            switches {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                switch@0 {
> > +                    compatible = "typec-switch";
> > +                    reg = <0>;
> > +                    mode-switch;
> > +
> > +                    ports {
> > +                        #address-cells = <1>;
> > +                        #size-cells = <0>;
> > +                        port@0 {
> > +                            reg = <0>;
> > +                            anx_typec0: endpoint {
> > +                              remote-endpoint = <&typec_port0>;
> 
> Messed up indentation. Your previous patch should also switch to 4-space
> as recommended by schema coding style.

Sorry about that, will fix up the indentation in the next version.

> 
> > +                            };
> > +                        };
> > +                    };
> > +                };
> > +                switch@1 {
> > +                    compatible = "typec-switch";
> > +                    reg = <1>;
> > +                    mode-switch;
> > +
> > +                    ports {
> > +                        #address-cells = <1>;
> > +                        #size-cells = <0>;
> > +                        port@0 {
> > +                            reg = <0>;
> > +                            anx_typec1: endpoint {
> > +                              remote-endpoint = <&typec_port1>;
> 
> Ditto.
> 
> > +                            };
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> 
> 
> Best regards,
> Krzysztof
