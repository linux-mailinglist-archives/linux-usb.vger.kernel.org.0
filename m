Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBC435054D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Mar 2021 19:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbhCaRQx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Mar 2021 13:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaRQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Mar 2021 13:16:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08473C061574;
        Wed, 31 Mar 2021 10:16:46 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:d880:b6f8:f93d:245e] (unknown [IPv6:2a02:810a:880:f54:d880:b6f8:f93d:245e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 220C01F45FA4;
        Wed, 31 Mar 2021 18:16:44 +0100 (BST)
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
To:     =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
        narmstrong@baylibre.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
        airlied@linux.ie, daniel@ffwll.ch, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, enric.balletbo@collabora.com,
        drinkcat@chromium.org, hsinyi@chromium.org, kernel@collabora.com,
        dafna3@gmail.com, robh+dt@kernel.org
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
 <20210305172437.meu45ol7d4c3w2lr@core.my.home>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f90401b1-471b-c936-6661-d3d9c52abb2e@collabora.com>
Date:   Wed, 31 Mar 2021 19:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305172437.meu45ol7d4c3w2lr@core.my.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 05.03.21 18:24, Ondřej Jirman wrote:
> Hello Dafna,
> 
> On Fri, Mar 05, 2021 at 04:14:03PM +0100, Dafna Hirschfeld wrote:
>> Hi
>>
>> On 05.03.21 15:34, Laurent Pinchart wrote:
>>> Hi Dafna,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
>>>> ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>>>> DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>>>> The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
>>>> along with the DisplayPort Alternate Mode signaling over USB Type-C.
>>>> Additionally, an on-chip microcontroller (OCM) is available to manage the
>>>> signal switching, Channel Configuration (CC) detection, USB Power
>>>> Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
>>>> functions as defined in the USB TypeC and USB Power Delivery
>>>> specifications.
>>>>
>>>> ANX7688 is found on Acer Chromebook R13 (elm) and on
>>>> Pine64 PinePhone.
> 
> Thanks for your work on the bindings. :) It would be great to find something
> acceptable for mainlining.
> 
> A few comments based on my experience implementing the USB-PD part for PinePhone
> are bellow.
> 
>>>> +properties:
>>>> +  compatible:
>>>> +    const: analogix,anx7688
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  avdd33-supply:
>>>> +    description: 3.3V Analog core supply voltage.
>>>> +
>>>> +  dvdd18-supply:
>>>> +    description: 1.8V Digital I/O supply voltage.
>>>> +
>>>> +  avdd18-supply:
>>>> +    description: 1.8V Analog core power supply voltage.
>>>> +
>>>> +  avdd10-supply:
>>>> +    description: 1.0V Analog core power supply voltage.
>>>> +
>>>> +  dvdd10-supply:
>>>> +    description: 1.0V Digital core supply voltage.
>>>> +
>>>
>>> That's lots of supplies. If there's a reasonable chance that some of
>>> them will always be driven by the same regulator (especially if the
>>> ANX7688 documentation requires that), then they could be grouped. For
>>> instance dvdd18-supply and avdd18-supply could be grouped into
>>> vdd18-supply. It would still allow us to extend the bindings in a
>>> backward compatible way later if a system uses different regulators. You
>>> have more information about the hardware than I do, so it's your call.
> 
> On PinePhone, AVDD and DVDD for 1.0V are just separately fitlered outputs
> from the same regulator. So it would work there to just use vdd18 and
> vdd10. The same is true for reference design, so it's probably safe
> to assume this can be simplified.
> 
>>>> +  hdmi5v-supply:
>>>> +    description: 5V power supply for the HDMI.
>>>> +
>>>> +  hdmi_vt-supply:
>>>> +    description: Termination voltage for HDMI input.
>>>
>>> Maybe hdmi-vt-supply ?
>>>
>>>> +
>>>> +  clocks:
>>>> +    description: The input clock specifier.
>>>> +    maxItems: 1
>>>
>>> How about
>>>
>>>       items:
>>>         - description: The input clock specifier.
>>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: xtal
>>>> +
>>>> +  hpd-gpios:
>>>> +    description: |
>>>> +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
>>>> +      applications, DP_HPD is used as DP hot-plug.
>>>> +    maxItems: 1
> 
> On PinePhone this is wired to a HDMI port on the SoC, and HPD is handled by the
> sun4i HDMI DRM driver. Seems like HPD will be handled by HDMI controller on
> many/all? other platforms too. Why have it here?

Right, I didn't have the full picture when listing all the pins of the anx7688.
I was not sure what should be listed.
I will remove that.

> 
>>>> +  enable-gpios:
>>>> +    description: Chip power down control. No internal pull-down or pull-up resistor.
>>>> +    maxItems: 1
>>>> +
>>>> +  reset-gpios:
>>>> +    description: Reset input signal. Active low.
>>>> +    maxItems: 1
>>>> +
>>>> +  vbus-det-gpios:
>>>> +    description: |
>>>> +      An input gpio for VBUS detection and high voltage detection,
>>>> +      external resistance divide VBUS voltage to 1/8.
>>>> +    maxItems: 1
> 
> Why have this in the bindings? It seems that this is handled internally by the
> ANX7688 via OCM firmware. And it's not really gpio either, it's an analog input
> with AD converter hooked to it internally.

I will remove that.

> 
>>>> +  interrupts:
>>>> +    description: |
>>>> +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int, DP int, HDMI int.
>>>> +    maxItems: 1
>>>> +
>>>> +  cabledet-gpios:
>>>> +    description: An output gpio, indicates by the device that a cable is plugged.
>>>> +    maxItems: 1
>>>> +
>>>> +  vbus-ctrl-gpios:
>>>> +    description:
>>>> +      External VBUS power path. Enable VBUS source and disable VBUS sink or vice versa.
>>>> +    maxItems: 1
> 
> VBUS control seems to be already modelled by the usb-connector bindings. Why
> have this here?

dito
> 
>>>> +  vconn-en1-gpios:
>>>> +    description: Controls the VCONN switch on the CC1 pin.
>>>> +    maxItems: 1
>>>> +
>>>> +  vconn-en2-gpios:
>>>> +    description: Controls the VCONN switch on the CC2 pin.
>>>> +    maxItems: 1
> 
> VCONN is a voltage regulator that can be enabled either on CC1 or CC2
> pin, or disabled completely. This control is *partially* performed in reference
> design directly by the OCM. OCM only decides which CC pin to switch
> the VCONN regulator to, and informs the SoC when the base VCONN regulator
> for the switches needs to be enabled.
> 
> So vconn-en1/2 gpios are irrelevant to the driver, but the driver needs
> to control VCONN power supply somehow and defer control over it to the OCM.
> 
> I don't know how to express it in the bindings. Maybe a vconn-supply here
> on the anx7688 node?
> 
> It may also be part of the usb-connector binding, but this is really when it
> comes to anx7688 a parent regulator for the switches, and switches are not
> controlled by this driver, just their parent regulator is.
> 
> Any ideas?

Looking at the diagram in the schematics, I see that both vbus-supply and vconn-supply
come directly from the PMIC so similarly to the vbus-supply, the vconn-supply
can be part of the usb-connector. Then a driver can access the vconn-supply from the remote usb
connector. Is there a problem with that?

Thanks a lot for the review, I am not very familiar with usb and type-c, so your review helps a lot.
I will send v6 soon.

Thanks,
Dafna

> 
> kind regards,
> 	o.
> 
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: Video port for HDMI input.
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: USB port for the USB3 input.
>>>> +
>>>> +      port@2:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: USB Type-c connector, see connector/usb-connector.yaml.
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>
>>> As all the ports exist at the hardware level, should they always be
>>> present ? The endpoints are optional of course, in case a port isn't
>>> connected on a particular system.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>
>>> Shouldn't clocks and regulators be also required ?
>>
>> hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
>> the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
>> needs to read few registers from that device for the drm bridge driver.
>> (also mentioned that in the cover letter).
>>
>> Thanks,
>> Dafna
