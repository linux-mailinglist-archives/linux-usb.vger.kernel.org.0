Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107E954DC0B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 09:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359379AbiFPHmF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 03:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiFPHmE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 03:42:04 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B4B5D19A
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 00:42:02 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v143so933610oie.13
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K1qaur0XpbMxeFbDS5W87YOBUiUaAflQIADLDQn7Ujs=;
        b=m8Gps9LsbxAYdtCBGKNo2enla/9DKTViETZQMmsW8myE1vng5QgQ/gHEUDoqu8pINF
         j2znEdpDVeJjQTBmg7n+22gbjzHnPGB1tBxwont1Np8/Kmk1GuKWEEa3Af/ha8PXADZm
         iz95PcviZ/d4/dOo3iDtd3YbIXumoCuMr4XFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K1qaur0XpbMxeFbDS5W87YOBUiUaAflQIADLDQn7Ujs=;
        b=s6jK5kA/n/4Qt8dyriIZV5jNbZwiGqiQyvYNBQMXkOiGu02dWKFAZZDEaEXOG5ysML
         pG8S25T0rrVPqWUMQgCSEkGqRxDc5QQIIfDdnoFW60Avr9Iuaj2sM4+vUt35wjaCpTm8
         6s34bfwHpf4+y2pTY6RJyXJvyCkxcItuT6gY9TvDlnK79HMehBOlJay+17L5w3xsf6H+
         qaIpRpmEP9eNbqZWG9DA0OPx1qYH+BHa/8imkRmG+bjm8Hi6ZmJFomWX+V4qVTl/8FMB
         oq5X/jWo6IOaltRw5n0UxPCa0KvQ/H2DZJdgcjSjnzut+76XxqNw+aUPPAL1JcZjlDz+
         h/XA==
X-Gm-Message-State: AJIora9fT+hh1+Ylv/YVybWGwTXWNAw/7gMU0DiQ12oFgnzkOmgw8bAB
        15yDpOzyLxa0FiQC3ULuSav9laX9+Z82VTsixwbvDg==
X-Google-Smtp-Source: AGRyM1s9MtjEOO5rLMeoWiFwOBdRlYnoeT78XqlzfIUIJenUnulANnCxO4vINozshjIORVaM6OXEEOonvijl0t9yjF8=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr1789833oil.193.1655365322078; Thu, 16
 Jun 2022 00:42:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 00:42:01 -0700
MIME-Version: 1.0
In-Reply-To: <20220615172129.1314056-5-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org> <20220615172129.1314056-5-pmalani@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 00:42:01 -0700
Message-ID: <CAE-0n53ub30HXB325wPoMB4C3n4j_9FWnNu5AmtYgU3PBvs8mQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prashant Malani (2022-06-15 10:20:20)
>
>  .../display/bridge/analogix,anx7625.yaml      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)

Can this file get a link to the product brief[1]? It helps to quickly
find the block diagram.

>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 35a48515836e..bc6f7644db31 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -105,6 +105,34 @@ properties:
>        - port@0
>        - port@1
>
> +  switches:
> +    type: object
> +    description: Set of switches controlling DisplayPort traffic on
> +      outgoing RX/TX lanes to Type C ports.
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^switch@[01]$':
> +        $ref: /schemas/usb/typec-switch.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - switch@0
> +
>  required:
>    - compatible
>    - reg
> @@ -167,5 +195,41 @@ examples:
>                      };
>                  };
>              };
> +            switches {

Is "switches" a bus?

> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                switch@0 {
> +                    compatible = "typec-switch";

Is this compatible matched against a driver that's populated on this
"switches" bus?

> +                    reg = <0>;
> +                    mode-switch;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            anx_typec0: endpoint {
> +                                remote-endpoint = <&typec_port0>;
> +                            };
> +                        };
> +                    };

I was expecting to see these simply be more ports in the existing graph
binding of this device, and then have the 'mode-switch' or
'orientation-switch' properties be at the same level as the compatible
string "analogix,anx7625". Here's the reasoning, based on looking at the
product brief and the existing binding/implementation.

Looking at the only existing implementation of this binding upstream in
mt8183-kukui-jacuzzi.dtsi it looks like one of these typec ports is
actually the same physically as the 'anx7625_out' endpoint (reg address
of 1) that is already defined in the binding. It seems that MIPI DSI/DPI
comes in and is output through 2 lanes, SSRX2 and SSTX2 according to the
product brief[1], and that is connected to some eDP panel
("auo,b116xw03"). Presumably that is the same as anx_typec1 in this
patch? I suspect the USB3.1 input is not connected on this board, and
thus the crosspoint switch is never used, nor the SSRX1/SSTX1 pins.

The existing binding defines the MIPI DSI/DPI input as port0 and two of
the four lanes of output that is probably by default connected to the
"DisplayPort Transmitter" as port1 because that's how the crosspoint
switch comes out of reset. That leaves the USB3.1 input possibly needing
a port in the ports binding, and the other two lanes of output needing a
port in the ports binding to describe their connection to the downstream
device. And finally information about if the crosspoint switch needs to
be registered with the typec framework to do typec things, which can be
achieved by the presence of the 'mode-switch' property.

On a board like kukui-jacuzzi these new properties and ports wouldn't be
specified, because what is there is already sufficient. If this chip is
connected to a usb-c-connector then I'd expect to see a connection from
the output ports in the graph binding to the connector node's ports.
There aren't any ports in the usb-c-connector binding though from what I
see.

I believe there's also one more use case here where USB3.1 or MIPI
DSI/DPI is connected on the input side and this device is used to steer
USB3.1 or DP through the crosspoint switch to either of the two output
pairs. This last scenario means that we have to describe both output
pairs, SSRX1/SSTX1 and SSRX2/SSTX2, as different ports in the binding so
they can be connected to different usb-c-connectors if the hardware
engineer wired the output pins that way.

TL;DR: Can we add 'mode-switch' as an optional property and two more
ports at address 2 and 3 for the USB3.1 input and the SSRX1/SSTX1 pair
respectively to the existing graph part of this binding?

> +                };
> +                switch@1 {
> +                    compatible = "typec-switch";
> +                    reg = <1>;
> +                    mode-switch;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            anx_typec1: endpoint {
> +                                remote-endpoint = <&typec_port1>;
> +                            };
> +                        };
> +                    };
> +                };
> +            };
>          };

[1] https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
