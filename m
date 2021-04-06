Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84445355648
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 16:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344989AbhDFOQU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 10:16:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43966 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344990AbhDFOQR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Apr 2021 10:16:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id D45FB1F44CC7
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
        narmstrong@baylibre.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
        airlied@linux.ie, daniel@ffwll.ch, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, drinkcat@chromium.org, hsinyi@chromium.org,
        kernel@collabora.com, dafna3@gmail.com, robh+dt@kernel.org,
        megous@megous.com
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
 <YEJL+T7IaW8Asq1Q@pendragon.ideasonboard.com>
 <7729b82c-ff87-8d05-366c-4c0a6b85a8f2@collabora.com>
 <1b1352be-fd6d-6cdd-1745-dbca4378fcfa@collabora.com>
 <YGTeTv42zDyGtc9F@pendragon.ideasonboard.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <e869d4ef-1660-4ac2-8607-ae8d4bbd8bd4@collabora.com>
Date:   Tue, 6 Apr 2021 16:16:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGTeTv42zDyGtc9F@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent and Dafna,

On 31/3/21 22:40, Laurent Pinchart wrote:
> On Tue, Mar 30, 2021 at 05:14:44PM +0200, Enric Balletbo i Serra wrote:
>> On 30/3/21 15:35, Dafna Hirschfeld wrote:
>>> On 05.03.21 16:19, Laurent Pinchart wrote:
>>>> On Fri, Mar 05, 2021 at 04:14:03PM +0100, Dafna Hirschfeld wrote:
>>>>> On 05.03.21 15:34, Laurent Pinchart wrote:
>>>>>> On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
>>>>>>> ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>>>>>>> DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>>>>>>> The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
>>>>>>> along with the DisplayPort Alternate Mode signaling over USB Type-C.
>>>>>>> Additionally, an on-chip microcontroller (OCM) is available to manage the
>>>>>>> signal switching, Channel Configuration (CC) detection, USB Power
>>>>>>> Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
>>>>>>> functions as defined in the USB TypeC and USB Power Delivery
>>>>>>> specifications.
>>>>>>>
>>>>>>> ANX7688 is found on Acer Chromebook R13 (elm) and on
>>>>>>> Pine64 PinePhone.
>>>>>>>
>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>> ---
>>>>>>>    .../bindings/usb/analogix,anx7688.yaml        | 177 ++++++++++++++++++
>>>>>>>    1 file changed, 177 insertions(+)
>>>>>>>    create mode 100644
>>>>>>> Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>>>>> b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..6c4dd6b4b28b
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>>>>> @@ -0,0 +1,177 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/usb/analogix,anx7688.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Analogix ANX7688 Type-C Port Controller with HDMI to DP conversion
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Nicolas Boichat <drinkcat@chromium.org>
>>>>>>> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>>>>>>> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>>>>>>> +  The integrated crosspoint switch (the MUX) supports USB 3.1 data
>>>>>>> transfer along with
>>>>>>> +  the DisplayPort Alternate Mode signaling over USB Type-C. Additionally,
>>>>>>> +  an on-chip microcontroller (OCM) is available to manage the signal
>>>>>>> switching,
>>>>>>> +  Channel Configuration (CC) detection, USB Power Delivery (USB-PD), Vendor
>>>>>>> +  Defined Message (VDM) protocol support and other functions as defined in
>>>>>>> the
>>>>>>> +  USB TypeC and USB Power Delivery specifications.
>>>>>>> +
>>>>>>> +
>>>>>>
>>>>>> Extra blank line ?
>>>>>>
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: analogix,anx7688
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  avdd33-supply:
>>>>>>> +    description: 3.3V Analog core supply voltage.
>>>>>>> +
>>>>>>> +  dvdd18-supply:
>>>>>>> +    description: 1.8V Digital I/O supply voltage.
>>>>>>> +
>>>>>>> +  avdd18-supply:
>>>>>>> +    description: 1.8V Analog core power supply voltage.
>>>>>>> +
>>>>>>> +  avdd10-supply:
>>>>>>> +    description: 1.0V Analog core power supply voltage.
>>>>>>> +
>>>>>>> +  dvdd10-supply:
>>>>>>> +    description: 1.0V Digital core supply voltage.
>>>>>>> +
>>>>>>
>>>>>> That's lots of supplies. If there's a reasonable chance that some of
>>>>>> them will always be driven by the same regulator (especially if the
>>>>>> ANX7688 documentation requires that), then they could be grouped. For
>>>>>> instance dvdd18-supply and avdd18-supply could be grouped into
>>>>>> vdd18-supply. It would still allow us to extend the bindings in a
>>>>>> backward compatible way later if a system uses different regulators. You
>>>>>> have more information about the hardware than I do, so it's your call.
>>>
>>> Can you explain what do you mean by 'grouped' ?
>>> Do you mean that instead of having two properties dvdd18-supply and avdd18-supply
>>> I have only one property vdd18-supply?
>>
>> You can simplify all this with vdd33, vdd18 vdd10. For the Chromebook case all
>> the analogic and digital part are the same regulator just filtered. That's a
>> common configuration and if there is some hardware that needs it we can extend
>> later.
> 
> That's the idea, yes. If in a typical use case multiple supplies are
> provided by a single regulator (for some devices that datasheet strongly
> recommends that, or event mandates it), then it makes sense to group
> those supplies in a single DT supply property. It can always be extended
> later indeed, without any backward compatibility issue.
> 
>>>>>>> +  hdmi5v-supply:
>>>>>>> +    description: 5V power supply for the HDMI.
>>>>>>> +
>>>>>>> +  hdmi_vt-supply:
>>>>>>> +    description: Termination voltage for HDMI input.
>>>>>>
>>>>>> Maybe hdmi-vt-supply ?
>>>>>>
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    description: The input clock specifier.
>>>>>>> +    maxItems: 1
>>>>>>
>>>>>> How about
>>>>>>
>>>>>>       items:
>>>>>>         - description: The input clock specifier.
>>>>>>
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: xtal
>>>>>>> +
>>>>>>> +  hpd-gpios:
>>>>>>> +    description: |
>>>>>>> +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
>>>>>>> +      applications, DP_HPD is used as DP hot-plug.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  enable-gpios:
>>>>>>> +    description: Chip power down control. No internal pull-down or pull-up
>>>>>>> resistor.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  reset-gpios:
>>>>>>> +    description: Reset input signal. Active low.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  vbus-det-gpios:
>>>>>>> +    description: |
>>>>>>> +      An input gpio for VBUS detection and high voltage detection,
>>>>>>> +      external resistance divide VBUS voltage to 1/8.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  interrupts:
>>>>>>> +    description: |
>>>>>>> +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int,
>>>>>>> DP int, HDMI int.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  cabledet-gpios:
>>>>>>> +    description: An output gpio, indicates by the device that a cable is
>>>>>>> plugged.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  vbus-ctrl-gpios:
>>>>>>> +    description:
>>>>>>> +      External VBUS power path. Enable VBUS source and disable VBUS sink
>>>>>>> or vice versa.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  vconn-en1-gpios:
>>>>>>> +    description: Controls the VCONN switch on the CC1 pin.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  vconn-en2-gpios:
>>>>>>> +    description: Controls the VCONN switch on the CC2 pin.
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  ports:
>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>> +
>>>>>>> +    properties:
>>>>>>> +      port@0:
>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>> +        description: Video port for HDMI input.
>>>>>>> +
>>>>>>> +      port@1:
>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>> +        description: USB port for the USB3 input.
>>>>>>> +
>>>>>>> +      port@2:
>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>> +        description: USB Type-c connector, see connector/usb-connector.yaml.
>>>>>>> +
>>>>>>> +    required:
>>>>>>> +      - port@0
>>>>>>
>>>>>> As all the ports exist at the hardware level, should they always be
>>>>>> present ? The endpoints are optional of course, in case a port isn't
>>>>>> connected on a particular system.
>>>>>>
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>
>>>>>> Shouldn't clocks and regulators be also required ?
>>>>>
>>>>> hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
>>>>> the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
>>>>> needs to read few registers from that device for the drm bridge driver.
>>>>> (also mentioned that in the cover letter).
>>
>> I think that for the Chromebook you can assume that these supplies are a
>> fixed-regulator that are always on.
>>
>>>> This may not be a popular opinion, but if the ANX7688 is fully
>>>> controlled by the EC, I wonder if we shouldn't have an "EC DRM bridge"
>>>> driver that would interrogate the EC instead :-)
>>
>> We can do this, and tbh will be more easy for us, but we were already asked to
>> do it generic, so ...
> 
> It's hardly generic if the "generic" driver assumes that there's an EC
> controlling the device, isn't it ?
> 
>>> But the driver in patch 2/2 do access the anx7688 device with I2C.
>>> It does interrogate the EC.
>>>
>>>> Is there a risk of bus conflicts if the EC and the main SoC try to
>>>> access the ANX7688 over I2C at the same time ?
>>
>> No, there is a kind of i2c tunnel but you don't talk directly with the ANX7688.
>> The EC exposes the anx bus control to the AP.
> 
> Maybe an additional reason to talk to the EC directly instead ? Won't
> upstreaming an ANX7688 driver that hardcodes assumptions about an EC
> being present cause issues in the future, when someone will want to
> extend the driver for a standalone ANX7688 ? The driver will start
> programming the ANX7688, and the EC won't like it. We would have to add
> a "this is a real ANX7688" DT property later, which would really not be
> nice.
> 

Well, we try to not assume that there is an EC controlling the device, but I
agree that is difficult for us create a "generic" driver when our test setup is
not generic at all.

The ANX7688 has two typical applications, one is only a HDMI to DisplayPort
bridge, which might be compatible with our setup. And another one, is a
Full-Featured USB-C device. Our thought was that, if the DT (see the binding)
had only the port0 the "generic" driver should act as a bridge only driver, if
port1 and port2 is also defined, the "generic" driver should act a bridge+type-c
controller.

Unfortunately we don't have the setup to test the driver as a full-featured
USB-C device, so I agree that it could be easy to make assumptions that might be
wrong in the future (not very nice, right).

I'd propose then, go with the original idea and do a cros_ec_anx7688 specific
driver that assumes is behind and EC. And if at some point someone with a full
setup sends a "generic" driver for the anx7688 we can check if we can make it
work with our setup or not.

Thanks,
  Enric


>>> The SoC access the anx7688 though something called 'i2c-tunnel' (see
>>> google,cros-ec-i2c-tunnel.yaml)
>>> So the I2C tunnels though the EC (I don't know how this is really implemented to
>>> be honest).
>>>
>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>
>>>>>>> +
>>>>>>> +additionalProperties: false
>>>>>>> +
>>>>>>> +examples:
>>>>>>> +  - |
>>>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>>>> +
>>>>>>> +    i2c0 {
>>>>>>> +        #address-cells = <1>;
>>>>>>> +        #size-cells = <0>;
>>>>>>> +
>>>>>>> +        anx7688: anx7688@2c {
>>>>>>> +            compatible = "analogix,anx7688";
>>>>>>> +            reg = <0x2c>;
>>>>>>> +            avdd33-supply = <&reg_dcdc1>;
>>>>>>> +            dvdd18-supply = <&reg_ldo_io1>;
>>>>>>> +            avdd18-supply = <&reg_ldo_io1>;
>>>>>>> +            avdd10-supply = <&reg_anx1v0>;
>>>>>>> +            dvdd10-supply = <&reg_anx1v0>;
>>>>>>> +            hdmi_vt-supply = <&reg_dldo1>;
>>>>>>> +            enable-gpios = <&pio 3 10 GPIO_ACTIVE_LOW>; /* PD10 */
>>>>>>> +            reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>>>>>>> +            interrupt-parent = <&r_pio>;
>>>>>>> +            interrupts = <0 11 IRQ_TYPE_EDGE_FALLING>; /* PL11 */
>>>>>>> +            cabledet-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
>>>>>>> +            vconn-en1-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>>>>>>> +            vconn-en2-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>>>>>>> +            ports {
>>>>>>> +                #address-cells = <1>;
>>>>>>> +                #size-cells = <0>;
>>>>>>> +
>>>>>>> +                port@0 {
>>>>>>> +                    reg = <0>;
>>>>>>> +                    anx7688_in0: endpoint {
>>>>>>> +                        remote-endpoint = <&hdmi0_out>;
>>>>>>> +                    };
>>>>>>> +                };
>>>>>>> +
>>>>>>> +                port@1 {
>>>>>>> +                    reg = <1>;
>>>>>>> +                    anx7688_in1: endpoint {
>>>>>>> +                        remote-endpoint = <&usbdrd_phy_ss>;
>>>>>>> +                    };
>>>>>>> +                };
>>>>>>> +                port@2 {
>>>>>>> +                    reg = <2>;
>>>>>>> +                    anx7688_out: endpoint {
>>>>>>> +                        remote-endpoint = <&typec_connector>;
>>>>>>> +                    };
>>>>>>> +                };
>>>>>>> +            };
>>>>>>> +        };
>>>>>>> +    };
> 
