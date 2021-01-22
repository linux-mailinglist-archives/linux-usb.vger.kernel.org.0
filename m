Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47A53001D9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 12:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbhAVLpm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 06:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727396AbhAVLpg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 06:45:36 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B206EC0613D6
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 03:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oadEiLge0L1iF2OcAePbpuhPJcdF8BtVLNcRRdOfwE4=; b=dIXcwY1xSMKB8vebVdLsK7S3g7
        u0pANiZiv+zCKWS6sMrm5ukp2YamEGcifiy11JWiRPOe+UHrJ3DrkzdlELqv3eL8fPSVeR4LFh9iV
        hDgP+ujF0sSQTonKo3PgDxmRxUvFOAzLSho+kfaw8qvb13E2GwY3RA1NDPL5NyKjk4Jb/Df8DDgZ/
        EznJHEeQKhp9GhC28V9BqX8Yy6Uq5SYMYgUQpniVfnq4LAuMxSFhTwmwIkT2sSOIyrklSMHHZc3oP
        wNWIFyDp4cPHDBy+1Kqpnljo8noXI4gHXnxNp7VVFRF289oQak3Xf7w+OjAxLay+YOEbgFzyNd0wk
        DeOmLzvQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60527 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1l2urL-0000g7-5m; Fri, 22 Jan 2021 12:44:11 +0100
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Sam Ravnborg <sam@ravnborg.org>,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        peter@stuge.se
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>
Date:   Fri, 22 Jan 2021 12:44:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 22.01.2021 08.54, skrev Thomas Zimmermann:
> Hi
> 
> Am 21.01.21 um 19:07 schrieb Noralf Trønnes:
>>
>>
>> Den 21.01.2021 11.01, skrev Thomas Zimmermann:
>>> Hi
>>>
>>> Am 21.01.21 um 09:27 schrieb Daniel Vetter:
>>>> On Thu, Jan 21, 2021 at 8:45 AM Thomas Zimmermann
>>>> <tzimmermann@suse.de> wrote:
>>>>>
>>>>> Hi Noralf,
>>>>>
>>>>> glad to hear from you! Welcome back!
>>
>> Thanks Thomas!
>>
>>>>>
>>>>> Am 20.01.21 um 18:42 schrieb Daniel Vetter:
>>>>>> On Wed, Jan 20, 2021 at 6:10 PM Noralf Trønnes <noralf@tronnes.org>
>>>>>> wrote:
>>>>>>>
>>>>>>> Add a connector type for USB connected display panels.
>>>>>>>
>>>>>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>>>>>> ---
>>
>> I have forgotten to update drm_connector_enum_list which maps type to
>> name.
>>
>>>>>>>     include/uapi/drm/drm_mode.h | 1 +
>>>>>>>     1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/include/uapi/drm/drm_mode.h
>>>>>>> b/include/uapi/drm/drm_mode.h
>>>>>>> index fed66a03c7ae..33024cc5d26e 100644
>>>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>>>> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
>>>>>>>     #define DRM_MODE_CONNECTOR_DPI         17
>>>>>>>     #define DRM_MODE_CONNECTOR_WRITEBACK   18
>>>>>>>     #define DRM_MODE_CONNECTOR_SPI         19
>>>>>>> +#define DRM_MODE_CONNECTOR_USB         20
>>>>>
>>>>> I would not call it USB. I could imagine that at some point a generic
>>>>> USB protocol could serve simple displays (i.e. in the sense of USB HID
>>>>> or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB
>>>>> should be reserved for this case.
>>>>
>>>> We end up calling those DisplayPort, since that's what's being
>>>> transported over thunderbolt or usb-C. So the usb connector would be
>>>> called usb-C. I think the reason we don't do fancy connector names is
>>>> that adding them is a bit a pain. Plus drm/i915 specifically has some
>>>> very quirky connector enumerating that doesn't match much with reality
>>>> unfortunately anyway :-/
>>>
>>> In the case of the other USB drivers, IIRC we use the connector type
>>> that is at the output (i.e., HDMI in the case of udl). I think we should
>>> do the same here. Or use 'Unknown'.
>>>
>>
>> There are 2 DRM USB drivers and they use:
>> - udl: DRM_MODE_CONNECTOR_DVII
> 
> Mine has plain old VGA.

Ok, maybe the Displaylink protocol doesn't provide info about the
connector type or if it does the driver doesn't know about it.

> Maybe we should change generally this to Unknown.
> 
>> - gm12u320: DRM_MODE_CONNECTOR_VGA
>>
>> gm12u320 is a mini projector so it doesn't actually have a VGA
>> connector. I have never seen a udl device but I assume it has a DVII
>> connector?
>>
>> For display adapters it makes sense to use the connector on the adapter
>> as the reported connector, but for display panels that don't have any
>> connector except for the cable that is connected to the hosts USB
>> connector, why can't it be called a USB connector? That's the connector
>> the user sees.
> 
> It's not the relevant connector for the display output. USB is the bus
> system. (Making your argument in terms of discrete GPUs, the connector
> would always be PCI then.)
> 

Yes strictly speaking USB is the bus and the connectors have other
names: USB (type)-A, USB-C etc., but I don't understand the problem
here. Why does it matter that it is a bus?

And wrt PCI it wouldn't be a PCI connector if the card has some other
connector for the display, but if it was possible to connect a display
directly to the PCI connector, then yes I would call that a PCI connector.

This begs the question: Why does the kernel provide info to userspace
about the connector type?

My take is that it is so the user can know which display is connected to
which port on the computer.

What's your opinion?

>>
>> Ofc as Daniel mentions it's a downside that userspace doesn't know about
>> the connector type, and who knows when it will updated (if I don't do
>> it).
>> Weston will name it: "UNNAMED-%d"
>> Mutter: "Unknown%d-%d"
>> X: "Unknown%d-%d"
>>
>> Sam and Laurent has discussed adding a PANEL connector type instead of
>> adding more connector types for panel connectors. I think that would
>> have been a better choice instead of the SPI connector type that I added
>> in 2019. But I think PANEL was meant for panels connected to an internal
>> connector.
>>
>> Here's my protocol connector types and how it's mapped to DRM:
>>
>> #define GUD_CONNECTOR_TYPE_PANEL        0
>> #define GUD_CONNECTOR_TYPE_VGA            1
>> #define GUD_CONNECTOR_TYPE_COMPOSITE        2
>> #define GUD_CONNECTOR_TYPE_SVIDEO        3
>> #define GUD_CONNECTOR_TYPE_COMPONENT        4
>> #define GUD_CONNECTOR_TYPE_DVI            5
>> #define GUD_CONNECTOR_TYPE_DISPLAYPORT        6
>> #define GUD_CONNECTOR_TYPE_HDMI            7
>>
>> static int gud_gadget_ctrl_get_connector(struct gud_gadget *gdg,
>> unsigned int index,
>>                      struct gud_connector_descriptor_req *desc)
>> {
>> ...
>>     gconn = &gdg->connectors[index];
>>
>>     switch (gconn->connector->connector_type) {
>>     case DRM_MODE_CONNECTOR_VGA:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_VGA;
>>         break;
>>     case DRM_MODE_CONNECTOR_DVII:
>>         fallthrough;
>>     case DRM_MODE_CONNECTOR_DVID:
>>         fallthrough;
>>     case DRM_MODE_CONNECTOR_DVIA:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_DVI;
>>         break;
>>     case DRM_MODE_CONNECTOR_Composite:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_COMPOSITE;
>>         break;
>>     case DRM_MODE_CONNECTOR_SVIDEO:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_SVIDEO;
>>         break;
>>     case DRM_MODE_CONNECTOR_Component:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_COMPONENT;
>>         break;
>>     case DRM_MODE_CONNECTOR_DisplayPort:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_DISPLAYPORT;
>>         break;
>>     case DRM_MODE_CONNECTOR_HDMIA:
>>         fallthrough;
>>     case DRM_MODE_CONNECTOR_HDMIB:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_HDMI;
>>         break;
>>     default:
>>         desc->connector_type = GUD_CONNECTOR_TYPE_PANEL;
>>         break;
>>     };
>>
>>
>> int gud_connector_create(struct gud_device *gdrm, unsigned int index)
>> {
>> ...
>>     switch (desc.connector_type) {
>>     case GUD_CONNECTOR_TYPE_PANEL:
>>         connector_type = DRM_MODE_CONNECTOR_USB;
>>         break;
>>     case GUD_CONNECTOR_TYPE_VGA:
>>         connector_type = DRM_MODE_CONNECTOR_VGA;
>>         break;
>>     case GUD_CONNECTOR_TYPE_DVI:
>>         connector_type = DRM_MODE_CONNECTOR_DVID;
>>         break;
>>     case GUD_CONNECTOR_TYPE_COMPOSITE:
>>         connector_type = DRM_MODE_CONNECTOR_Composite;
>>         break;
>>     case GUD_CONNECTOR_TYPE_SVIDEO:
>>         connector_type = DRM_MODE_CONNECTOR_SVIDEO;
>>         break;
>>     case GUD_CONNECTOR_TYPE_COMPONENT:
>>         connector_type = DRM_MODE_CONNECTOR_Component;
>>         break;
>>     case GUD_CONNECTOR_TYPE_DISPLAYPORT:
>>         connector_type = DRM_MODE_CONNECTOR_DisplayPort;
>>         break;
>>     case GUD_CONNECTOR_TYPE_HDMI:
>>         connector_type = DRM_MODE_CONNECTOR_HDMIA;
>>         break;
>>     default: /* future types */
>>         connector_type = DRM_MODE_CONNECTOR_USB;
> 
> The more I look at it the more I think it should be 'Unknown' here.
> 

I don't understand this, how will that be better for the user?

> BTW, can I try this out somehow? I do have an RPi3. Do I need a special
> disk image?

The Pi3 doesn'have a USB device/otg connector so I haven't made an image
for that one. Only the Pi Zero, model A and Pi 4 have that.

The Pi2 and Pi3 have a USB hub on the soc's single USB port.

Noralf.

> 
> Best regards
> Thomas
> 
>>         break;
>>     };
>>
>> Noralf.
>>
>>> Best regards
>>> Thomas
>>>
>>>> -Daniel
>>>>
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>>
>>>>>> Beware, new connector types have in the past resulted in userspace
>>>>>> burning&crashing. Maybe it's become better ...
>>>>>>
>>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>
>>>>>>>     /**
>>>>>>>      * struct drm_mode_get_connector - Get connector metadata.
>>>>>>> -- 
>>>>>>> 2.23.0
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> dri-devel mailing list
>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> -- 
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH
>>>>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>>>>> (HRB 36809, AG Nürnberg)
>>>>> Geschäftsführer: Felix Imendörffer
>>>>>
>>>>
>>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 
