Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C12300CD5
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 20:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbhAVTln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 14:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729067AbhAVSlG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 13:41:06 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE73C06174A
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 10:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hY24ajwmvESU+m3y7SlI5sy4Tubefuq9hzJwTl9ocP4=; b=dZRy6c3fPNVMzEaRFz5SyrCZFp
        xToUeHcaarNNub5rbJfXrJow+LET8sSfdY6YY523eZAmIbSoLGLf3rpA7ONa2l9GVaCKGq6YOc++n
        MJy3cIu1LYmt7zU6uCX7sekaw6Tlp2dUKQWPzdIC7KRNa9PWXMhfwuVsGil3T8qLx3wJoxdgswQo2
        DErkdrMekQvI0Y0GWaFfFcAu48LhmuoM81I9ZUrRm+fnOP8tDNU0O7DCJJA2JLpUdz1V+ZGHi2CY2
        gIcxCmOrVz3Ke2dJXIdLkptITbRXuDti5wqvB4Po5zYIOWgAhDSnsp3EMsyGPETtaRrfsQaid456+
        DBR1OzRQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62135 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1l31Lb-00042t-NS; Fri, 22 Jan 2021 19:39:51 +0100
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        Sam Ravnborg <sam@ravnborg.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
 <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>
 <9168c91b-f97d-5725-7d6f-8c97fb422d9a@suse.de>
 <9422f5f9-1889-f556-7297-202d6fb52433@tronnes.org>
 <d171596d-f967-ee6a-44f1-c06713cf10cb@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8e6060d4-6553-fc8c-e9d2-bc0a0989c0fd@tronnes.org>
Date:   Fri, 22 Jan 2021 19:39:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d171596d-f967-ee6a-44f1-c06713cf10cb@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 22.01.2021 15.55, skrev Thomas Zimmermann:
> Hi
> 
> Am 22.01.21 um 15:35 schrieb Noralf Trønnes:
>>
>>
>> Den 22.01.2021 13.47, skrev Thomas Zimmermann:
>>> Hi
>>>
>>> Am 22.01.21 um 12:44 schrieb Noralf Trønnes:
>>>>
>>>> And wrt PCI it wouldn't be a PCI connector if the card has some other
>>>> connector for the display, but if it was possible to connect a display
>>>> directly to the PCI connector, then yes I would call that a PCI
>>>> connector.
>>>
>>> You're not connecting a display to the computer. You're connecting an
>>> RPi and then connect the display to the RPi. The RPi acts like an
>>> external graphics card.
>>>
>>>> This begs the question: Why does the kernel provide info to userspace
>>>> about the connector type?
>>>>
>>>> My take is that it is so the user can know which display is
>>>> connected to
>>>> which port on the computer.
>>>
>>> This exactly illustrates the problem with the current naming. For a
>>> single output the distinction between bus and connector might be fuzzy.
>>> As soon as a connected SoC contains multiple connectors. The user then
>>> sees names such as card1-USB-0 and card1-USB-1, which makes no sense.
>>>
>>
>> If you look at the code I pasted in, you'll see that the SoC connector
>> types are passed through to the host driver as-is unless they are panel
>> connectors like DSI/DPI, which will be interpreted as USB (the protocol
>> does support multiple connectors, but only one can be used at a time).
>>
>> So for the Pi4 as a display adapter, the host will see card1-HDMI-0 and
>> card1-HDMI-1, the same is true for the composite output (if enabled) it
>> shows up as card1-Composite-0 (can't be enabled together with HDMI).
>>
>> If the Pi4 is used together with a DSI connected touchscreen, it makes
>> sense to disable the SoC HDMI outputs and the host only will see the
>> board as card1-USB-0 (I haven't done this exercise yet since there's
>> problems with getting the official Pi touchscreen to work with vc4 on
>> Pi4).
> 
> I saw that. I can even get your point about using USB for panel (still
> don't agree). But you're also using USB as default case.
> 

In the host driver the default case is to catch future additions to the
protocol. In this case the driver doesn't know the connector type, but
by using USB at least the user knows where to look.

On the gadget side these are the current types that will hit the default
case:

These are panels:
DRM_MODE_CONNECTOR_LVDS
DRM_MODE_CONNECTOR_eDP
DRM_MODE_CONNECTOR_DSI
DRM_MODE_CONNECTOR_DPI
DRM_MODE_CONNECTOR_SPI

This also seems to be used primarily by panels:
DRM_MODE_CONNECTOR_Unknown

Only used by i915, amd, radeon, very unlikely on a gadget:
DRM_MODE_CONNECTOR_9PinDIN

This one I should probably map to GUD_CONNECTOR_TYPE_COMPOSITE:
DRM_MODE_CONNECTOR_TV

Very unlikely on a gadget:
DRM_MODE_CONNECTOR_VIRTUAL

Future connector types will also be reported in the protocol as
GUD_CONNECTOR_TYPE_PANEL and thus on the host as DRM_MODE_CONNECTOR_USB.
The gadget driver will ofc be updated when new non-panel connector types
show up.

And this makes sense to me :-)

Giving the user a connector named "Unknown-1" does not make sense to me.

Noralf.


> Best regards
> Thomas
> 
>>
>> The USB connector type is most important for tiny displays that is
>> microcontroller based without Linux running. There are lots of tiny SPI
>> displays and I expect this market to shift towards USB because it much
>> easier to connect and the display will be useable on a desktop/server
>> computer as status displays perhaps. But embedded will also benefit from
>> having these displays USB interfaced.
>>
>> Another use case I see is repurposing old Android tablets as USB
>> displays that can be connected to any computer and become a touchscreen.
>> In this case I also want the connector to be called card1-USB-0 (I
>> haven't done any work in this area, old Android is fbdev so some work is
>> needed for this to happen).
>>
>> Noralf.
>>
>>>>
>>>> What's your opinion?
>>>>
>>>>>>
>>>>>> Ofc as Daniel mentions it's a downside that userspace doesn't know
>>>>>> about
>>>>>> the connector type, and who knows when it will updated (if I don't do
>>>>>> it).
>>>>>> Weston will name it: "UNNAMED-%d"
>>>>>> Mutter: "Unknown%d-%d"
>>>>>> X: "Unknown%d-%d"
>>>>>>
>>>>>> Sam and Laurent has discussed adding a PANEL connector type
>>>>>> instead of
>>>>>> adding more connector types for panel connectors. I think that would
>>>>>> have been a better choice instead of the SPI connector type that I
>>>>>> added
>>>>>> in 2019. But I think PANEL was meant for panels connected to an
>>>>>> internal
>>>>>> connector.
>>>>>>
>>>>>> Here's my protocol connector types and how it's mapped to DRM:
>>>>>>
>>>>>> #define GUD_CONNECTOR_TYPE_PANEL        0
>>>>>> #define GUD_CONNECTOR_TYPE_VGA            1
>>>>>> #define GUD_CONNECTOR_TYPE_COMPOSITE        2
>>>>>> #define GUD_CONNECTOR_TYPE_SVIDEO        3
>>>>>> #define GUD_CONNECTOR_TYPE_COMPONENT        4
>>>>>> #define GUD_CONNECTOR_TYPE_DVI            5
>>>>>> #define GUD_CONNECTOR_TYPE_DISPLAYPORT        6
>>>>>> #define GUD_CONNECTOR_TYPE_HDMI            7
>>>>>>
>>>>>> static int gud_gadget_ctrl_get_connector(struct gud_gadget *gdg,
>>>>>> unsigned int index,
>>>>>>                        struct gud_connector_descriptor_req *desc)
>>>>>> {
>>>>>> ...
>>>>>>       gconn = &gdg->connectors[index];
>>>>>>
>>>>>>       switch (gconn->connector->connector_type) {
>>>>>>       case DRM_MODE_CONNECTOR_VGA:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_VGA;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_DVII:
>>>>>>           fallthrough;
>>>>>>       case DRM_MODE_CONNECTOR_DVID:
>>>>>>           fallthrough;
>>>>>>       case DRM_MODE_CONNECTOR_DVIA:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_DVI;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_Composite:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_COMPOSITE;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_SVIDEO:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_SVIDEO;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_Component:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_COMPONENT;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_DisplayPort:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_DISPLAYPORT;
>>>>>>           break;
>>>>>>       case DRM_MODE_CONNECTOR_HDMIA:
>>>>>>           fallthrough;
>>>>>>       case DRM_MODE_CONNECTOR_HDMIB:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_HDMI;
>>>>>>           break;
>>>>>>       default:
>>>>>>           desc->connector_type = GUD_CONNECTOR_TYPE_PANEL;
>>>>>>           break;
>>>>>>       };
>>>>>>
>>>>>>
>>>>>> int gud_connector_create(struct gud_device *gdrm, unsigned int index)
>>>>>> {
>>>>>> ...
>>>>>>       switch (desc.connector_type) {
>>>>>>       case GUD_CONNECTOR_TYPE_PANEL:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_USB;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_VGA:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_VGA;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_DVI:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_DVID;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_COMPOSITE:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_Composite;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_SVIDEO:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_SVIDEO;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_COMPONENT:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_Component;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_DISPLAYPORT:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_DisplayPort;
>>>>>>           break;
>>>>>>       case GUD_CONNECTOR_TYPE_HDMI:
>>>>>>           connector_type = DRM_MODE_CONNECTOR_HDMIA;
>>>>>>           break;
>>>>>>       default: /* future types */
>>>>>>           connector_type = DRM_MODE_CONNECTOR_USB;
>>>>>
>>>>> The more I look at it the more I think it should be 'Unknown' here.
>>>>>
>>>>
>>>> I don't understand this, how will that be better for the user?
>>>
>>> As I said before, the display is not connected via USB. The RPi (i.e.,
>>> graphics card) is. The naming would be off.
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>>> BTW, can I try this out somehow? I do have an RPi3. Do I need a
>>>>> special
>>>>> disk image?
>>>>
>>>> The Pi3 doesn'have a USB device/otg connector so I haven't made an
>>>> image
>>>> for that one. Only the Pi Zero, model A and Pi 4 have that.
>>>>
>>>> The Pi2 and Pi3 have a USB hub on the soc's single USB port.
>>>>
>>>> Noralf.
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>>           break;
>>>>>>       };
>>>>>>
>>>>>> Noralf.
>>>>>>
>>>>>>> Best regards
>>>>>>> Thomas
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Best regards
>>>>>>>>> Thomas
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Beware, new connector types have in the past resulted in
>>>>>>>>>> userspace
>>>>>>>>>> burning&crashing. Maybe it's become better ...
>>>>>>>>>>
>>>>>>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>>>>>
>>>>>>>>>>>       /**
>>>>>>>>>>>        * struct drm_mode_get_connector - Get connector metadata.
>>>>>>>>>>> -- 
>>>>>>>>>>> 2.23.0
>>>>>>>>>>>
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> -- 
>>>>>>>>> Thomas Zimmermann
>>>>>>>>> Graphics Driver Developer
>>>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>>>>>>>> (HRB 36809, AG Nürnberg)
>>>>>>>>> Geschäftsführer: Felix Imendörffer
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>
>>>>>
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 
