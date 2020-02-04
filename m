Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86152151684
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 08:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgBDHj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 02:39:28 -0500
Received: from mta-out1.inet.fi ([62.71.2.202]:43708 "EHLO julia1.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgBDHj2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Feb 2020 02:39:28 -0500
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrgeekgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefnrghurhhiucflrghkkhhuuceolhgruhhrihdrjhgrkhhkuhesphhprdhinhgvthdrfhhiqeenucffohhmrghinhepmhgrnhhjrghrohdrohhrghenucfkphepkeegrddvgeekrdeftddrudelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedruddrudefgegnpdhinhgvthepkeegrddvgeekrdeftddrudelhedpmhgrihhlfhhrohhmpeeolhgruhhjrghkqdefsehmsghogidrihhnvghtrdhfihequceuqfffjgepkeeukffvoffkoffgpdhrtghpthhtohepoehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgheqpdhrtghpthhtohepoehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgqe
Received: from [192.168.1.134] (84.248.30.195) by julia1.inet.fi (9.0.019.26-1) (authenticated as laujak-3)
        id 5E37D3E200041D4E; Tue, 4 Feb 2020 09:39:24 +0200
Subject: Re: USB: HID: random timeout failures fix proposal
From:   Lauri Jakku <lauri.jakku@pp.inet.fi>
To:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <4bc1c5da-172a-af15-0f2c-d447efeb48d1@pp.inet.fi>
 <20200204072002.GC966981@kroah.com>
 <3de3f2e8-5ab0-92f7-bdeb-09351042e630@pp.inet.fi>
Message-ID: <a723e00b-cb50-0f43-43c7-01d6a10b8e65@pp.inet.fi>
Date:   Tue, 4 Feb 2020 09:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <3de3f2e8-5ab0-92f7-bdeb-09351042e630@pp.inet.fi>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi everyone,

Inline commented.

On 4.2.2020 9.29, Lauri Jakku wrote:
> On 4.2.2020 9.20, Greg KH wrote:
>> On Tue, Feb 04, 2020 at 05:44:45AM +0200, Lauri Jakku wrote:
>>> Hi,
>>>
>>>
>>> I made a patch that does to tackle the USB HID device random behavior by
>>>
>>> re-trying to send command 400ms, 20ms sleep per try.
>> WHat random behavior are you referring to?
> for example Manjaro has issues (I got my self randomly working usb mouse)
>
>
> https://forum.manjaro.org/t/usb-devices-mice-stop-working-randomly/113154/18
>
>
>
>>> ---------------------------------------------------------------------------------------
>>>
>>> >From d4214685de329ebe07dfd2298bce46dfae5f80bf Mon Sep 17 00:00:00 2001
>>> From: Lauri Jakku <lja@iki.fi>
>>> Date: Tue, 4 Feb 2020 04:52:01 +0200
>>> Subject: [PATCH] USB HID random timeout failures fixed by trying 20 times
>>>  send, 20ms apart, control messages, if error is timeout.
>> The subject line of the patch is a bit too big, and you have no
>> changelog text in the body of the message, making this patch not able to
>> be applied.
>>
>> Also, no need to insert it like this, just use git send-email to submit
>> it.
>>
>>
>>> Signed-off-by: Lauri Jakku <lja@iki.fi>
>>> ---
>>>  drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
>>>  1 file changed, 25 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
>>> index 5adf489428aa..5d615b2f92d8 100644
>>> --- a/drivers/usb/core/message.c
>>> +++ b/drivers/usb/core/message.c
>>> @@ -20,6 +20,7 @@
>>>  #include <linux/usb/hcd.h>     /* for usbcore internals */
>>>  #include <linux/usb/of.h>
>>>  #include <asm/byteorder.h>
>>> +#include <linux/errno.h>
>> Are you sure this is needed?
> The ETIMEDOUT definition is there, so yeah.
>>>  
>>>  #include "usb.h"
>>>  
>>> @@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>>>                     __u16 size, int timeout)
>>>  {
>>>         struct usb_ctrlrequest *dr;
>>> -       int ret;
>>> +       int ret = -ETIMEDOUT;
>>> +
>>> +       /* retry_cnt * 10ms, max retry time set to 400ms */
>>> +       int retry_cnt = 20;
>>>  
>>>         dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
>>>         if (!dr)
>>> @@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>>>         dr->wIndex = cpu_to_le16(index);
>>>         dr->wLength = cpu_to_le16(size);
>>>  
>>> -       ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
>>> +       do {
>>> +               ret = usb_internal_control_msg(dev,
>>> +                                       pipe,
>>> +                                       dr,
>>> +                                       data,
>>> +                                       size,
>>> +                                       timeout);
>>> +
>>> +               /*
>>> +                * Linger a bit, prior to the next control message
>>> +                * or if return value is timeout, but do try few
>>> +                * times (max 200ms) before quitting.
>>> +                */
>>> +               if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
>>> +                       msleep(200);
>>> +               else if (ret == -ETIMEDOUT)
>>> +                       msleep(20);
>>> +
>>> +               /* Loop while timeout, max retry_cnt times. */
>>> +       } while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));
>> Why are we looping always if something went wrong?
>>
>> And don't we already have a "timeout"?  Why not rely on that?
> I tried with 5 times setting, and my mouse works quite well now, i thing that
>
> the 20 times (Max sleep time of 400ms) is good. It does report timeout, when
>
> 20 times tried to communicate with HW, so if device is fine etc. there is no
>
> sleeping at all done.
>
>
>> thanks,
>>
>> greg k-h

-- 
Br,
Lauri J.

