Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26E1B72D3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 13:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgDXLNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 07:13:00 -0400
Received: from cable.insite.cz ([84.242.75.189]:49564 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbgDXLNA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Apr 2020 07:13:00 -0400
X-Greylist: delayed 433 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Apr 2020 07:12:59 EDT
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E263EA1F2BCB4;
        Fri, 24 Apr 2020 13:05:41 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TQAVCiLHIiVu; Fri, 24 Apr 2020 13:05:36 +0200 (CEST)
Received: from [192.168.105.191] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 7BE96A1F2B0B3;
        Fri, 24 Apr 2020 13:05:36 +0200 (CEST)
Subject: Re: Re: [PATCH] usb: gadget: f_uac2: EP OUT adaptive instead of async
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux USB <linux-usb@vger.kernel.org>
References: <2bd4ac94-f7c3-41d6-27a7-352f3319bda7@ivitera.com>
 <CAB=otbTiTLDPv8TbjFkoXLj=i3pb0rueoADbRMZVMETX_UsqZA@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <cb434374-9684-77b0-1dc2-366d18c4eb78@ivitera.com>
Date:   Fri, 24 Apr 2020 13:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAB=otbTiTLDPv8TbjFkoXLj=i3pb0rueoADbRMZVMETX_UsqZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 11. 02. 20 v 17:16 Ruslan Bilovol napsal(a):
> On Fri, Feb 7, 2020 at 6:55 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>> The existing UAC2 implementation presents its EP OUT as
>> USB_ENDPOINT_SYNC_ASYNC.
>>
>> However:
>> 1) f_uac2 does not define any feedback endpoint
>>
>> 2) IMO in reality it is adaptive - the USB host is the one which sets
>> the pace of data.
>>
>> Changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE for the FS
>> and HS output endpoints corrects the config to reflect real functionality.
> 
> That's a good idea but ADAPTIVE endpoint still requires feedback endpoint for
> source (USB IN) case so the host can synchronize with such endpoint
> (see 3.16.2.2 of
> UAC2 spec "For adaptive audio source endpoints and asynchronous audio sink
> endpoints, an explicit synchronization mechanism is needed to maintain
> synchronization
> during transfers").

I apologize for missing this message. Please can we resume the discussion?

The tested combination is (not-changed) async IN and (changed) adaptive
OUT, which is what most USB-adaptive soundcards use. Such combination
does not require any feedback endpoint.

> 
>>
>> Also, the change makes the UAC2 gadget recognized and working
>> in MS Windows.
> 
> Does it recognizes well with both IN and OUT (e.g. capture+playback enabled)
> adaptive endpoints?

Only OUT is adaptive, IN stays async.

Thanks a lot,

Pavel.


> 
> Thanks,
> Ruslan
> 
>>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>  drivers/usb/gadget/function/f_uac2.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c
>> b/drivers/usb/gadget/function/f_uac2.c
>> index db2d498..e8c9dd1 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -273,7 +273,7 @@ enum {
>>         .bDescriptorType = USB_DT_ENDPOINT,
>>
>>         .bEndpointAddress = USB_DIR_OUT,
>> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
>> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
>>         .wMaxPacketSize = cpu_to_le16(1023),
>>         .bInterval = 1,
>>  };
>> @@ -282,7 +282,7 @@ enum {
>>         .bLength = USB_DT_ENDPOINT_SIZE,
>>         .bDescriptorType = USB_DT_ENDPOINT,
>>
>> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
>> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE,
>>         .wMaxPacketSize = cpu_to_le16(1024),
>>         .bInterval = 4,
>>  };
>> --
>> 1.9.1
> 
