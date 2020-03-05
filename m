Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40145179E01
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 03:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgCECxE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 21:53:04 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35912 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgCECxE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 21:53:04 -0500
Received: by mail-pf1-f195.google.com with SMTP id i13so2024760pfe.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2020 18:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jjwmb8rIi6EoAXJ38sPdxaJN/i5o0m2lXv7D1kz/D9Q=;
        b=WQ6nwTNL4CiEYcVKckruhYa+ZzD2UUw3GVum/LAFBP/nPXXWvw1tPNVpaoh5uhB1Y2
         IJlVOfCaSSvZQluAYB0nB6CULQV9D61ZaMp1ACRY40rGvfimeUILaxdxNe4aQyyt382f
         a6658pb28Sj2tZW1oFOtgUhnrDqEITlOyaXG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jjwmb8rIi6EoAXJ38sPdxaJN/i5o0m2lXv7D1kz/D9Q=;
        b=kaQf9wzpiQuftVKxkp75Z0WbvtoCiF4LbSWmVawDplWS5wEKAGC0xSNjeBWBVOLXsQ
         zVJUjuOOSB5mfSlxljq3Mzlk9pPUjjSUE/t0iuf3kvqTWtDbHbIybuqAdGa/5E6aFosv
         o4luX/XMDiZSAjKBM+ETX3x091nznuavLPi5jog5p5Zmmx0OX4HbfqNzTFb11dAjoMkN
         KaG+lljrU8LL+4tLX+bOfg30eMdnwuHSzQ9XXh/on0Ww0qooij5TE50l8h4q5k4aeBs9
         ZmFa/Gu2gTJQ60YjwvEpIggA808RBZxzyOnaSZfhOL5X8R1cqVJTfVMgGBdmhuVyRruP
         DTYA==
X-Gm-Message-State: ANhLgQ1gvAHZo9czocRyYB7mdE4Zq00lz/3X9P1wkN8cXYVZ/ofL6Qmh
        Dy7jkp0OYGXSSvBwezP2eoQ94w==
X-Google-Smtp-Source: ADFU+vvXmzH80fSBqafat8nXXlFBnFrCmJf3Im5yW1dfexKgEbPZb8MfZQ7Sf4zlsq7YzQnbl9o1qQ==
X-Received: by 2002:a63:514f:: with SMTP id r15mr5130669pgl.432.1583376781520;
        Wed, 04 Mar 2020 18:53:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id m12sm4035349pjf.25.2020.03.04.18.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 18:53:00 -0800 (PST)
Date:   Wed, 4 Mar 2020 18:52:59 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Convert usb-connector to YAML format.
Message-ID: <20200305025259.GA142502@google.com>
References: <20200304174942.124070-1-pmalani@chromium.org>
 <CAL_JsqJ5d5GmMFi1A3JN33PfD37auCLL-gSPh1NgEoNMAS0uAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ5d5GmMFi1A3JN33PfD37auCLL-gSPh1NgEoNMAS0uAg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

Thanks a lot for reviewing the patch.

On Wed, Mar 04, 2020 at 01:55:22PM -0600, Rob Herring wrote:
> On Wed, Mar 4, 2020 at 11:50 AM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > Convert the usb-connector.txt bindings file to YAML format. This allows
> > it to be used in dt_bindings_check verification. This patch was
> > born out of a patch series for the addition of a Type C connector
> > class port driver[1].
> >
> > An attempt has been made to maintain the same documentation text and
> > example structure as was in the .txt file, but wherever needed
> > modifications have been made to satisfy dt_bindings_check.
> >
> > Also, update all references to usb-connector.txt to now use
> > usb-connector.yaml.
> >
> > [1]: https://lkml.org/lkml/2020/2/19/1232
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >  .../connector/samsung,usb-connector-11pin.txt |   2 +-
> >  .../bindings/connector/usb-connector.txt      | 135 ------------
> >  .../bindings/connector/usb-connector.yaml     | 193 ++++++++++++++++++
> >  .../devicetree/bindings/usb/fcs,fusb302.txt   |   2 +-
> >  .../devicetree/bindings/usb/generic.txt       |   2 +-
> >  .../devicetree/bindings/usb/mediatek,mtu3.txt |   2 +-
> >  .../devicetree/bindings/usb/mediatek,musb.txt |   2 +-
> >  .../bindings/usb/richtek,rt1711h.txt          |   2 +-
> >  .../devicetree/bindings/usb/ti,hd3ss3220.txt  |   2 +-
> >  .../devicetree/bindings/usb/typec-tcpci.txt   |   2 +-
> >  .../devicetree/bindings/usb/usb-conn-gpio.txt |   4 +-
> >  11 files changed, 203 insertions(+), 145 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt b/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> > index 22256e295a7a1..3dd8961154abf 100644
> > --- a/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> > +++ b/Documentation/devicetree/bindings/connector/samsung,usb-connector-11pin.txt
> > @@ -19,7 +19,7 @@ Required nodes:
> >      0: High Speed (HS),
> >      3: Mobile High-Definition Link (MHL), specific to 11-pin Samsung micro-USB.
> >
> > -[1]: bindings/connector/usb-connector.txt
> > +[1]: bindings/connector/usb-connector.yaml
> >
> >  Example
> >  -------
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > deleted file mode 100644
> > index 88578ac1a8a76..0000000000000
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > +++ /dev/null
> > @@ -1,135 +0,0 @@
> > -USB Connector
> > -=============
> > -
> > -A USB connector node represents a physical USB connector. It should be
> > -a child of a USB interface controller.
> > -
> > -Required properties:
> > -- compatible: describes type of the connector, must be one of:
> > -    "usb-a-connector",
> > -    "usb-b-connector",
> > -    "usb-c-connector".
> > -
> > -Optional properties:
> > -- label: symbolic name for the connector,
> > -- type: size of the connector, should be specified in case of USB-A, USB-B
> > -  non-fullsize connectors: "mini", "micro".
> > -- self-powered: Set this property if the usb device that has its own power
> > -  source.
> > -
> > -Optional properties for usb-b-connector:
> > -- id-gpios: an input gpio for USB ID pin.
> > -- vbus-gpios: an input gpio for USB VBUS pin, used to detect presence of
> > -  VBUS 5V.
> > -  see gpio/gpio.txt.
> > -- vbus-supply: a phandle to the regulator for USB VBUS if needed when host
> > -  mode or dual role mode is supported.
> > -  Particularly, if use an output GPIO to control a VBUS regulator, should
> > -  model it as a regulator.
> > -  see regulator/fixed-regulator.yaml
> > -- pinctrl-names : a pinctrl state named "default" is optional
> > -- pinctrl-0 : pin control group
> > -  see pinctrl/pinctrl-bindings.txt
> > -
> > -Optional properties for usb-c-connector:
> > -- power-role: should be one of "source", "sink" or "dual"(DRP) if typec
> > -  connector has power support.
> > -- try-power-role: preferred power role if "dual"(DRP) can support Try.SNK
> > -  or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
> > -- data-role: should be one of "host", "device", "dual"(DRD) if typec
> > -  connector supports USB data.
> > -
> > -Required properties for usb-c-connector with power delivery support:
> > -- source-pdos: An array of u32 with each entry providing supported power
> > -  source data object(PDO), the detailed bit definitions of PDO can be found
> > -  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
> > -  Source_Capabilities Message, the order of each entry(PDO) should follow
> > -  the PD spec chapter 6.4.1. Required for power source and power dual role.
> > -  User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
> > -  defined in dt-bindings/usb/pd.h.
> > -- sink-pdos: An array of u32 with each entry providing supported power
> > -  sink data object(PDO), the detailed bit definitions of PDO can be found
> > -  in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
> > -  Sink Capabilities Message, the order of each entry(PDO) should follow
> > -  the PD spec chapter 6.4.1. Required for power sink and power dual role.
> > -  User can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
> > -  in dt-bindings/usb/pd.h.
> > -- op-sink-microwatt: Sink required operating power in microwatt, if source
> > -  can't offer the power, Capability Mismatch is set. Required for power
> > -  sink and power dual role.
> > -
> > -Required nodes:
> > -- any data bus to the connector should be modeled using the OF graph bindings
> > -  specified in bindings/graph.txt, unless the bus is between parent node and
> > -  the connector. Since single connector can have multiple data buses every bus
> > -  has assigned OF graph port number as follows:
> > -    0: High Speed (HS), present in all connectors,
> > -    1: Super Speed (SS), present in SS capable connectors,
> > -    2: Sideband use (SBU), present in USB-C.
> > -
> > -Examples
> > ---------
> > -
> > -1. Micro-USB connector with HS lines routed via controller (MUIC):
> > -
> > -muic-max77843@66 {
> > -       ...
> > -       usb_con: connector {
> > -               compatible = "usb-b-connector";
> > -               label = "micro-USB";
> > -               type = "micro";
> > -       };
> > -};
> > -
> > -2. USB-C connector attached to CC controller (s2mm005), HS lines routed
> > -to companion PMIC (max77865), SS lines to USB3 PHY and SBU to DisplayPort.
> > -DisplayPort video lines are routed to the connector via SS mux in USB3 PHY.
> > -
> > -ccic: s2mm005@33 {
> > -       ...
> > -       usb_con: connector {
> > -               compatible = "usb-c-connector";
> > -               label = "USB-C";
> > -
> > -               ports {
> > -                       #address-cells = <1>;
> > -                       #size-cells = <0>;
> > -
> > -                       port@0 {
> > -                               reg = <0>;
> > -                               usb_con_hs: endpoint {
> > -                                       remote-endpoint = <&max77865_usbc_hs>;
> > -                               };
> > -                       };
> > -                       port@1 {
> > -                               reg = <1>;
> > -                               usb_con_ss: endpoint {
> > -                                       remote-endpoint = <&usbdrd_phy_ss>;
> > -                               };
> > -                       };
> > -                       port@2 {
> > -                               reg = <2>;
> > -                               usb_con_sbu: endpoint {
> > -                                       remote-endpoint = <&dp_aux>;
> > -                               };
> > -                       };
> > -               };
> > -       };
> > -};
> > -
> > -3. USB-C connector attached to a typec port controller(ptn5110), which has
> > -power delivery support and enables drp.
> > -
> > -typec: ptn5110@50 {
> > -       ...
> > -       usb_con: connector {
> > -               compatible = "usb-c-connector";
> > -               label = "USB-C";
> > -               power-role = "dual";
> > -               try-power-role = "sink";
> > -               source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> > -               sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
> > -                            PDO_VAR(5000, 12000, 2000)>;
> > -               op-sink-microwatt = <10000000>;
> > -       };
> > -};
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > new file mode 100644
> > index 0000000000000..f0fac9bd63364
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -0,0 +1,193 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Connector
> > +
> > +maintainers:
> > +  - linux-usb@vger.kernel.org
> > +
> > +description:
> > +  A USB connector node represents a physical USB connector. It should be a child
> > +  of a USB interface controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb-a-connector
> > +      - usb-b-connector
> > +      - usb-c-connector
> > +
> > +  label:
> > +    description: Symbolic name for the connector.
> > +
> > +  type:
> > +    description: Size of the connector, should be specified in case of USB-A,
> > +      USB-B non-fullsize connectors.
> > +    enum:
> > +      - mini
> > +      - micro
> 
> Needs a type reference.
> 
Done.
> > +
> > +  self-powered:
> > +    description: Set this property if the USB device has its own power source.
> 
> type: boolean
> 
Done.
> > +
> > +  # The following are optional properties for "usb-b-connector".
> > +  id-gpios:
> > +    description: An input gpio for USB ID pin.
> 
> maxItems: 1
> 
Done.
> > +
> > +  vbus-gpios:
> > +    description: An input gpio for USB VBus pin, used to detect presence of
> > +      VBUS 5V. See gpio/gpio.txt.
> 
> maxItems: 1
> 
Done.
> > +
> > +  vbus-supply:
> > +    description: A phandle to the regulator for USB VBUS if needed when host
> > +      mode or dual role mode is supported.
> > +      Particularly, if use an output GPIO to control a VBUS regulator, should
> > +      model it as a regulator. See regulator/fixed-regulator.yaml
> > +
> > +  pinctrl-names:
> > +    description: A pinctrl state named "default" is optional.
> > +
> > +  pinctrl-0:
> > +    description: Pin control group. See pinctrl/pinctrl-bindings.txt
> 
> pinctrl properties get added automatically, so you can drop these 2.
> 
Done.
> > +
> > +  # The following are optional properties for "usb-c-connector".
> > +  power-role:
> > +    description: Determines the power role that the Type C connector will
> > +      support.
> > +    contains:
> > +      source:
> > +        description: Connector is a power source.
> > +      sink:
> > +        description: Connector is a power sink.
> > +      dual:
> > +        description: Connector is a Dual Role Port (DRP).
> 
> Not valid json-schema. Should be like this:
> 
> power-role:
>   allOf:
>     - $ref: /schemas/types.yaml#definitions/string
>   enum:
>     - source
>     - sink
>     - dual
> 
Done.
> > +
> > +  try-power-role:
> > +    description: Preferred power role.
> > +    contains:
> > +      sink:
> > +        description: Try.SNK is preferred power role.
> > +      source:
> > +        description: Try.SRC is preferred power role.
> > +      dual:
> > +        description: DRP can support Try.SNK or Try.SRC.
> 
> Same here.
> 
Done.
> > +
> > +  data-role:
> > +    description: Data role if Type C connector supports USB data.
> > +    contains:
> > +      host:
> > +        description: Connector is a host.
> > +      device:
> > +        description: Connector is a device.
> > +      dual:
> > +        description: Connector is Dual Role Device (DRD).
> 
> Similar here.
> 
Done.
> > +
> > +  # The following are optional properties for "usb-c-connector" with power
> > +  # delivery support.
> > +  source-pdos:
> > +    description: An array of u32 with each entry providing supported power
> > +      source data object(PDO), the detailed bit definitions of PDO can be found
> > +      in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
> > +      Source_Capabilities Message, the order of each entry(PDO) should follow
> > +      the PD spec chapter 6.4.1. Required for power source and power dual role.
> > +      User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
> > +      defined in dt-bindings/usb/pd.h.
> > +    minItems: 1
> > +    maxItems: 7
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +
> > +  sink-pdos:
> > +    description: An array of u32 with each entry providing supported power sink
> > +      data object(PDO), the detailed bit definitions of PDO can be found in
> > +      "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
> > +      Sink Capabilities Message, the order of each entry(PDO) should follow the
> > +      PD spec chapter 6.4.1. Required for power sink and power dual role. User
> > +      can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
> > +      in dt-bindings/usb/pd.h.
> > +    minItems: 1
> > +    maxItems: 7
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  op-sink-microwatt:
> > +    description: Sink required operating power in microwatt, if source can't
> > +      offer the power, Capability Mismatch is set. Required for power sink and
> > +      power dual role.
> > +
> > +# Any data bus to the connector should be modeled using the OF graph bindings
> > +# specified in bindings/graph.txt, unless the bus is between parent node and
> > +# the connector. Since single connector can have multiple data buses every bus
> > +# has assigned OF graph port number as follows:
> > +# 0: High Speed (HS), present in all connectors,
> > +# 1: Super Speed (SS), present in SS capable connectors,
> > +# 2: Sideband use (SBU), present in USB-C.
> 
> You need something like this:
> 
> ports:
>   type: object
>   properties:
>     port@0:
>       type: object
>       description: High Speed (HS), present in all connectors
>     ...
>   required:
>     - port@0
Done.
> 

Best regards,
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  # Micro-USB connector with HS lines routed via controller (MUIC).
> > +  - |+
> > +    muic-max77843@66 {
> > +      usb_con1: connector {
> > +        compatible = "usb-b-connector";
> > +        label = "micro-USB";
> > +        type = "micro";
> > +      };
> > +    };
> > +
> > +  # USB-C connector attached to CC controller (s2mm005), HS lines routed
> > +  # to companion PMIC (max77865), SS lines to USB3 PHY and SBU to DisplayPort.
> > +  # DisplayPort video lines are routed to the connector via SS mux in USB3 PHY.
> > +  - |+
> > +    ccic: s2mm005@33 {
> > +      usb_con2: connector {
> > +        compatible = "usb-c-connector";
> > +        label = "USB-C";
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +            usb_con_hs: endpoint {
> > +              remote-endpoint = <&max77865_usbc_hs>;
> > +            };
> > +          };
> > +          port@1 {
> > +            reg = <1>;
> > +            usb_con_ss: endpoint {
> > +            remote-endpoint = <&usbdrd_phy_ss>;
> > +            };
> > +          };
> > +          port@2 {
> > +            reg = <2>;
> > +            usb_con_sbu: endpoint {
> > +            remote-endpoint = <&dp_aux>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +  # USB-C connector attached to a typec port controller(ptn5110), which has
> > +  # power delivery support and enables drp.
> > +  - |+
> > +    #include <dt-bindings/usb/pd.h>
> > +    typec: ptn5110@50 {
> > +      usb_con3: connector {
> > +        compatible = "usb-c-connector";
> > +        label = "USB-C";
> > +        power-role = "dual";
> > +        try-power-role = "sink";
> > +        source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> > +        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
> > +                     PDO_VAR(5000, 12000, 2000)>;
> > +        op-sink-microwatt = <10000000>;
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> > index ba2e32d500c02..60e4654297af7 100644
> > --- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> > +++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
> > @@ -9,7 +9,7 @@ Required sub-node:
> >  - connector : The "usb-c-connector" attached to the FUSB302 IC. The bindings
> >    of the connector node are specified in:
> >
> > -       Documentation/devicetree/bindings/connector/usb-connector.txt
> > +       Documentation/devicetree/bindings/connector/usb-connector.yaml
> >
> >
> >  Example:
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index e6790d2a4da9b..474e74c06522d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -34,7 +34,7 @@ Optional properties:
> >   - usb-role-switch: boolean, indicates that the device is capable of assigning
> >                         the USB data role (USB host or USB device) for a given
> >                         USB connector, such as Type-C, Type-B(micro).
> > -                       see connector/usb-connector.txt.
> > +                       see connector/usb-connector.yaml.
> >
> >  This is an attribute to a USB controller such as:
> >
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > index e0ae6096f7ac8..a82ca438aec1f 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
> > @@ -34,7 +34,7 @@ Optional properties:
> >         dual-role mode.
> >         it's considered valid for compatibility reasons, not allowed for
> >         new bindings, and put into a usb-connector node.
> > -       see connector/usb-connector.txt.
> > +       see connector/usb-connector.yaml.
> >   - pinctrl-names : a pinctrl state named "default" is optional, and need be
> >         defined if auto drd switch is enabled, that means the property dr_mode
> >         is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > index 2b8a87c90d9ea..5eedb02965622 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > @@ -23,7 +23,7 @@ Optional properties:
> >                       MTCMOS
> >
> >  Required child nodes:
> > - usb connector node as defined in bindings/connector/usb-connector.txt
> > + usb connector node as defined in bindings/connector/usb-connector.yaml
> >  Optional properties:
> >   - id-gpios        : input GPIO for USB ID pin.
> >   - vbus-gpios      : input GPIO for USB VBUS pin.
> > diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> > index e3fc57e605ed6..6f8115db2ea9b 100644
> > --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> > +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
> > @@ -9,7 +9,7 @@ Required properties:
> >  Required sub-node:
> >  - connector: The "usb-c-connector" attached to the tcpci chip, the bindings
> >    of connector node are specified in
> > -  Documentation/devicetree/bindings/connector/usb-connector.txt
> > +  Documentation/devicetree/bindings/connector/usb-connector.yaml
> >
> >  Example :
> >  rt1711h@4e {
> > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > index 25780e945b154..2bd21b22ce95b 100644
> > --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > @@ -9,7 +9,7 @@ Required sub-node:
> >   - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> >     bindings of the connector node are specified in:
> >
> > -       Documentation/devicetree/bindings/connector/usb-connector.txt
> > +       Documentation/devicetree/bindings/connector/usb-connector.yaml
> >
> >  Example:
> >  hd3ss3220@47 {
> > diff --git a/Documentation/devicetree/bindings/usb/typec-tcpci.txt b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> > index 0dd1469e73180..2082522b1c326 100644
> > --- a/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> > +++ b/Documentation/devicetree/bindings/usb/typec-tcpci.txt
> > @@ -13,7 +13,7 @@ Required properties:
> >  Required sub-node:
> >  - connector: The "usb-c-connector" attached to the tcpci chip, the bindings
> >    of connector node are specified in
> > -  Documentation/devicetree/bindings/connector/usb-connector.txt
> > +  Documentation/devicetree/bindings/connector/usb-connector.yaml
> >
> >  Example:
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > index 3d05ae56cb0dc..ec80641208a53 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > @@ -8,11 +8,11 @@ Required properties:
> >  - compatible : should include "gpio-usb-b-connector" and "usb-b-connector".
> >  - id-gpios, vbus-gpios : input gpios, either one of them must be present,
> >         and both can be present as well.
> > -       see connector/usb-connector.txt
> > +       see connector/usb-connector.yaml
> >
> >  Optional properties:
> >  - vbus-supply : can be present if needed when supports dual role mode.
> > -       see connector/usb-connector.txt
> > +       see connector/usb-connector.yaml
> >
> >  - Sub-nodes:
> >         - port : can be present.
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
