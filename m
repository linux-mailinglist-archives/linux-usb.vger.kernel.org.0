Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90ADA32EE1E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 16:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhCEPOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 10:14:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39238 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhCEPOI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 10:14:08 -0500
Received: from [IPv6:2003:c7:cf38:3800:8df:3f9b:2ff1:d151] (p200300c7cf38380008df3f9b2ff1d151.dip0.t-ipconnect.de [IPv6:2003:c7:cf38:3800:8df:3f9b:2ff1:d151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9B8981F46B91;
        Fri,  5 Mar 2021 15:14:06 +0000 (GMT)
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
        chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
        enric.balletbo@collabora.com, drinkcat@chromium.org,
        hsinyi@chromium.org, kernel@collabora.com, dafna3@gmail.com,
        robh+dt@kernel.org, megous@megous.com
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
Date:   Fri, 5 Mar 2021 16:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 05.03.21 15:34, Laurent Pinchart wrote:
> Hi Dafna,
> 
> Thank you for the patch.
> 
> On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
>> ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>> DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>> The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
>> along with the DisplayPort Alternate Mode signaling over USB Type-C.
>> Additionally, an on-chip microcontroller (OCM) is available to manage the
>> signal switching, Channel Configuration (CC) detection, USB Power
>> Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
>> functions as defined in the USB TypeC and USB Power Delivery
>> specifications.
>>
>> ANX7688 is found on Acer Chromebook R13 (elm) and on
>> Pine64 PinePhone.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   .../bindings/usb/analogix,anx7688.yaml        | 177 ++++++++++++++++++
>>   1 file changed, 177 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>> new file mode 100644
>> index 000000000000..6c4dd6b4b28b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>> @@ -0,0 +1,177 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/analogix,anx7688.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analogix ANX7688 Type-C Port Controller with HDMI to DP conversion
>> +
>> +maintainers:
>> +  - Nicolas Boichat <drinkcat@chromium.org>
>> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> +
>> +description: |
>> +  ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>> +  The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer along with
>> +  the DisplayPort Alternate Mode signaling over USB Type-C. Additionally,
>> +  an on-chip microcontroller (OCM) is available to manage the signal switching,
>> +  Channel Configuration (CC) detection, USB Power Delivery (USB-PD), Vendor
>> +  Defined Message (VDM) protocol support and other functions as defined in the
>> +  USB TypeC and USB Power Delivery specifications.
>> +
>> +
> 
> Extra blank line ?
> 
>> +properties:
>> +  compatible:
>> +    const: analogix,anx7688
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  avdd33-supply:
>> +    description: 3.3V Analog core supply voltage.
>> +
>> +  dvdd18-supply:
>> +    description: 1.8V Digital I/O supply voltage.
>> +
>> +  avdd18-supply:
>> +    description: 1.8V Analog core power supply voltage.
>> +
>> +  avdd10-supply:
>> +    description: 1.0V Analog core power supply voltage.
>> +
>> +  dvdd10-supply:
>> +    description: 1.0V Digital core supply voltage.
>> +
> 
> That's lots of supplies. If there's a reasonable chance that some of
> them will always be driven by the same regulator (especially if the
> ANX7688 documentation requires that), then they could be grouped. For
> instance dvdd18-supply and avdd18-supply could be grouped into
> vdd18-supply. It would still allow us to extend the bindings in a
> backward compatible way later if a system uses different regulators. You
> have more information about the hardware than I do, so it's your call.
> 
>> +  hdmi5v-supply:
>> +    description: 5V power supply for the HDMI.
>> +
>> +  hdmi_vt-supply:
>> +    description: Termination voltage for HDMI input.
> 
> Maybe hdmi-vt-supply ?
> 
>> +
>> +  clocks:
>> +    description: The input clock specifier.
>> +    maxItems: 1
> 
> How about
> 
>      items:
>        - description: The input clock specifier.
> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal
>> +
>> +  hpd-gpios:
>> +    description: |
>> +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
>> +      applications, DP_HPD is used as DP hot-plug.
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    description: Chip power down control. No internal pull-down or pull-up resistor.
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: Reset input signal. Active low.
>> +    maxItems: 1
>> +
>> +  vbus-det-gpios:
>> +    description: |
>> +      An input gpio for VBUS detection and high voltage detection,
>> +      external resistance divide VBUS voltage to 1/8.
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    description: |
>> +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int, DP int, HDMI int.
>> +    maxItems: 1
>> +
>> +  cabledet-gpios:
>> +    description: An output gpio, indicates by the device that a cable is plugged.
>> +    maxItems: 1
>> +
>> +  vbus-ctrl-gpios:
>> +    description:
>> +      External VBUS power path. Enable VBUS source and disable VBUS sink or vice versa.
>> +    maxItems: 1
>> +
>> +  vconn-en1-gpios:
>> +    description: Controls the VCONN switch on the CC1 pin.
>> +    maxItems: 1
>> +
>> +  vconn-en2-gpios:
>> +    description: Controls the VCONN switch on the CC2 pin.
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Video port for HDMI input.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: USB port for the USB3 input.
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: USB Type-c connector, see connector/usb-connector.yaml.
>> +
>> +    required:
>> +      - port@0
> 
> As all the ports exist at the hardware level, should they always be
> present ? The endpoints are optional of course, in case a port isn't
> connected on a particular system.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Shouldn't clocks and regulators be also required ?

hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
needs to read few registers from that device for the drm bridge driver.
(also mentioned that in the cover letter).

Thanks,
Dafna

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        anx7688: anx7688@2c {
>> +            compatible = "analogix,anx7688";
>> +            reg = <0x2c>;
>> +            avdd33-supply = <&reg_dcdc1>;
>> +            dvdd18-supply = <&reg_ldo_io1>;
>> +            avdd18-supply = <&reg_ldo_io1>;
>> +            avdd10-supply = <&reg_anx1v0>;
>> +            dvdd10-supply = <&reg_anx1v0>;
>> +            hdmi_vt-supply = <&reg_dldo1>;
>> +            enable-gpios = <&pio 3 10 GPIO_ACTIVE_LOW>; /* PD10 */
>> +            reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>> +            interrupt-parent = <&r_pio>;
>> +            interrupts = <0 11 IRQ_TYPE_EDGE_FALLING>; /* PL11 */
>> +            cabledet-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
>> +            vconn-en1-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>> +            vconn-en2-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    anx7688_in0: endpoint {
>> +                        remote-endpoint = <&hdmi0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    anx7688_in1: endpoint {
>> +                        remote-endpoint = <&usbdrd_phy_ss>;
>> +                    };
>> +                };
>> +                port@2 {
>> +                    reg = <2>;
>> +                    anx7688_out: endpoint {
>> +                        remote-endpoint = <&typec_connector>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
> 
